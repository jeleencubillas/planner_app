import { Controller } from "stimulus";
import Pickr from "@simonwep/pickr";
import "../stylesheets/color_picker.css";

export default class extends Controller {
  static targets = ["picker", "input"]

  initialize() {
    this.initPicker();
  }

  initPicker() {
    this.picker = Pickr.create({
      el: this.pickerTarget,
      theme: 'classic',
      default: '#FFFFFF',

      swatches: [
        '#A1FFCE',
        '#FAFFD1',
        '#BE93C5',
        '#7BC6CC',
        '#ffd89b',
        '#3fada8',
        '#fceabb',
        '#f8b500',
        '#FD746C',
        '#e96443',
        '#3a7bd5',
        '#FFC371'
    ],  

      components: {
        preview: true,
        opacity: false,
        hue: true,

        interaction: {
          hex: true,
          rgba: true,
          hsla: false,
          hsva: false,
          cmyk: false,
          input: true,
          clear: false,
          save: true,
        },
      },
    });

    this.picker.on('save', (color, _instance) => {
      this.inputTarget.value = color.toHEXA().toString();

      this.picker.hide();
    });
  }
}