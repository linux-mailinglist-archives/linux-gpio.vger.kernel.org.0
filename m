Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7C72A7E97
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgKEMbx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEMbx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:31:53 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03645C0613CF;
        Thu,  5 Nov 2020 04:31:53 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id b12so724011plr.4;
        Thu, 05 Nov 2020 04:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RM772cDSHAyaI3S6Oht4zbOquKz4eJt+u106DCGoFhM=;
        b=bnygRq/0tekVuestJ58NXP85dUydoHJKyPVveKREYhd6uhSOAo9ap+JAjyk2uSA+5m
         DnB1R7xB/IfDmJVnq6+cxbine5kKLvla2UmDMvNRT9zs4Pr7Rq0wA7GRj3mB9tEdCNP2
         4q782JLutfwanHXIQ60vDKY44FcAPBsaLhdGXMTmsvnKhHSsBkG0YzSJgDs14Edzio/U
         6s9W8iG6CEW66YG8jFu6PFB8lGgi0cH+d5IBguTC9/M6dD4qbPObBYyziIzqOHVOd5Z8
         efquoXGVm/vFhiOsS0zf3Q9f5AKwQGz8cnbAu+aHYxDJ2m4EARxdt0mAhxWHyzXdFn1M
         NsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RM772cDSHAyaI3S6Oht4zbOquKz4eJt+u106DCGoFhM=;
        b=WIYvsYjLVUBOmx3V9dSOfavzscGQ+9f5Une4hIZBF5TGh1g1M3+oYXYPqxjWgEmTID
         Oo3Dnr2TGbZahBJOgwLLRM8sZ2qWIdj8jUCpLdreHNTOSwJpnrhyzEohg2X7lxnjFcoN
         avhfoQdn8JlsRrl+aeBcNlRDF2yf6X3piOV2AmBgh7dIOQvtBburGqjaVpfgMlSKUfch
         ARlv+wphGzZBaXduTDMduAzOoLR9h36Rw21Gjw1Qw6/MUDlKoex0BWXazB3JD/nqR1pQ
         S5WfF//hm+ZOEej7/v1g+EjjebdOP0rNFiIayq3CitOhh140Uz/aHMHRhM5esVYYJHHM
         ZtMw==
X-Gm-Message-State: AOAM532QQKJAjHH2p3VWko4hsOHVqeSwfAyiskwjdWlOcKWOgH7hXrSz
        JMjWkUEybtg1Jq1Pd6JzdTjHSRhjMm+dQ9hCF04=
X-Google-Smtp-Source: ABdhPJy2A7kynh+Cjoe9pc+2nVcIvUEQex3DbleQ3c/V6f04bARBgkPT2MNTmziRExEuL6jVAz/T7qDxGwQOv1rZ5U0=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr2146556plz.21.1604579512404; Thu, 05
 Nov 2020 04:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org> <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 14:32:41 +0200
Message-ID: <CAHp75VdM9LUV2M6rEZyK=4rh_+hwFK5_2-9RB7YQTuMxHSYCMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 2:06 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Add initial pinctrl driver to support pin configuration for
> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on SM8250.

> +config PINCTRL_LPASS_LPI
> +       tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
> +       depends on GPIOLIB && OF
> +       help
> +         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +         Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +         (Low Power Island) found on the Qualcomm Technologies Inc SoCs.

> +#include <linux/of_device.h>
> +#include <linux/of.h>

...

> +       val = lpi_gpio_read(pctrl, pin, LPI_GPIO_REG_VAL_CTL);

> +       val &= ~(LPI_GPIO_REG_FUNCTION_MASK);

Redundant parentheses.

> +       val |= i << LPI_GPIO_REG_FUNCTION_SHIFT;
> +       lpi_gpio_write(pctrl, pin, LPI_GPIO_REG_VAL_CTL, val);

...

> +static unsigned int lpi_drive_to_regval(u32 arg)
> +{
> +       return (arg/2 - 1);

Ditto. On top, use spaces.

> +}

...

> +               case PIN_CONFIG_SLEW_RATE:
> +                       if (arg > LPI_SLEW_RATE_MAX) {
> +                               dev_err(pctldev->dev, "%s: invalid slew rate %u for pin: %d\n",
> +                                       __func__, arg, pin);

__func__ is not needed.

> +                               goto set_gpio;
> +                       }

...

> +                       for (i = 0; i < LPI_SLEW_BITS_SIZE; i++) {

> +                               if (arg & 0x01)
> +                                       set_bit(offset, &val);
> +                               else
> +                                       clear_bit(offset, &val);

assign_bit(, arg & BIT(i))

> +                               offset++;

> +                               arg = arg >> 1;

No need on a separate line, see above.

> +                       }

...

> +done:

Useless label.

> +       return ret;

...

> +#ifdef CONFIG_DEBUG_FS
> +#include <linux/seq_file.h>

> +#else
> +#define lpi_gpio_dbg_show NULL
> +#endif

Hmm... Doesn't pin control provide a wrapper for this?

...

> +       int ret, npins;
> +       struct clk *core_vote = NULL;
> +       struct clk *audio_vote = NULL;
> +
> +       struct lpi_pinctrl *pctrl;
> +       const struct lpi_pinctrl_variant_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;

Redundant blank line. Can you keep them in reversed xmas tree order?

...

> +       core_vote = devm_clk_get(&pdev->dev, "core");
> +       if (IS_ERR(core_vote)) {

> +               dev_dbg(&pdev->dev, "%s: clk get %s failed %d\n",
> +                       __func__, "core_vote", ret);

First of all you missed the deferred probe issue, second, __func__ is
redundant for *_dbg() calls (okay, when Dynamic Debug is enabled).
That said why not
  return dev_err_probe();
?

> +               return PTR_ERR(core_vote);
> +       }

...

> +       audio_vote = devm_clk_get(&pdev->dev, "audio");
> +       if (IS_ERR(audio_vote)) {
> +               dev_dbg(&pdev->dev, "%s: clk get %s failed %d\n",
> +                       __func__, "audio_vote", ret);
> +               return PTR_ERR(audio_vote);

Ditto/

> +       }

Why is it not a bulk?

> +       clk_prepare_enable(pctrl->core_vote);
> +       clk_prepare_enable(pctrl->audio_vote);

Either from them may return an error. Also, when you go devm_*() the
rule of thumb is either all or none. Because here you will have
ordering issue on ->remove().

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       pctrl->tlmm_base = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource()

> +       if (IS_ERR(pctrl->tlmm_base)) {
> +               ret = PTR_ERR(pctrl->tlmm_base);
> +               goto err;
> +       }
> +
> +

One blank line is enough.

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       pctrl->slew_base = devm_ioremap_resource(&pdev->dev, res);

As above.

> +       if (IS_ERR(pctrl->slew_base)) {
> +               ret = PTR_ERR(pctrl->slew_base);
> +               goto err;
> +       }

...

> +       ret = gpiochip_add_data(&pctrl->chip, pctrl);

Not devm_?

> +       if (ret) {
> +               dev_err(pctrl->dev, "can't add gpio chip\n");
> +               goto err_pinctrl;
> +       }

> +       ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(dev), 0, 0, npins);

Why not to define a proper callback?

> +       if (ret) {
> +               dev_err(dev, "failed to add pin range\n");
> +               goto err_range;
> +       }

...

> +err_range:
> +       gpiochip_remove(&pctrl->chip);
> +err_pinctrl:
> +       mutex_destroy(&pctrl->slew_access_lock);
> +err:
> +       clk_disable_unprepare(pctrl->core_vote);
> +       clk_disable_unprepare(pctrl->audio_vote);
> +
> +       return ret;

These are not needed for devm_ case.

...

> +static int lpi_pinctrl_remove(struct platform_device *pdev)
> +{
> +       struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&pctrl->chip);
> +       mutex_destroy(&pctrl->slew_access_lock);
> +       clk_disable_unprepare(pctrl->core_vote);
> +       clk_disable_unprepare(pctrl->audio_vote);

Ditto. It also has ordering issues.

> +       return 0;
> +}

...

> +static const struct of_device_id lpi_pinctrl_of_match[] = {
> +       {
> +              .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
> +              .data = &sm8250_lpi_data,
> +       },

> +       { },

Comma is not needed here.

> +};
> +

Extra blank line/

> +MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);

...

> +static struct platform_driver lpi_pinctrl_driver = {

> +};

> +

Extra blank line.

> +module_platform_driver(lpi_pinctrl_driver);

-- 
With Best Regards,
Andy Shevchenko
