Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18941699F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 19:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfEGRx6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 13:53:58 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45650 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfEGRx6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 13:53:58 -0400
Received: by mail-oi1-f193.google.com with SMTP id u3so7253544oic.12;
        Tue, 07 May 2019 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7flmOY2ATgGfQPKE9sBeHn57pA1FJ9fgxAgK5bf/VXc=;
        b=M5MayXekFPagZQ5mdyBhaKAXMoy8IaH7d9jFE8KzsTXxsbxQ+j+4u6H02CRXeL1p5J
         EzTE4z4LojpYp7Nlyn/gV+zMJm1tyEgP7BseAUmRN5bNXZbn+mB/rydOG9HvlIhkFyaO
         V7Ay9tjeHOlLKfjzLdrymd3PBPnHCI5M10i3TlkXg++ucuhiPqCFcRweLF36wgBHWu+y
         3krEQlgulpbzhOpy467IhUvTv78AUJes+Ykb5SVN0BXM58cB7ogm+1SN9Qmavd8uyhBD
         aOZQOORBm3cucV/GAcz/jWRugt2Z9BjR8sAWbT+0owqHjp9a/hqBudd3nV/HVJwhNulA
         wqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7flmOY2ATgGfQPKE9sBeHn57pA1FJ9fgxAgK5bf/VXc=;
        b=O1FGoCk4YRIUPSpaT5AcagsxW+FX66tViFTuUOJghs8/QuWVZYHoVDyYkUjbCVyWSy
         /Yv/HfeCu1g9SKK/uICGQXQYSvT6knayw0O9Nb37XCgdDqAVF7v0BPd//Wt4jbii8RXK
         hoWpIm55TlRHMnRI/h0IR5JdJCduRzQYP7xVFn9UKtW1SZikxRH/ifbe+Whqgv8JLl37
         mC2NqJctOkwJk4UfU5dQre71Q3kbFqiKr/qa7BgKR1oCKPKrsvRS2IEf6hv1+uuB+H+j
         Kt6lIZyeYBRGV2/TkiIqodh2j16C3ZmsKiixOlRn8eiCbqMPUWF2NsTvHD5G7dT2LMuy
         XOew==
X-Gm-Message-State: APjAAAWTIQpPbpU/MOlhOLyvJFAu7d5oh6d/w5YCWuw1METgsurOmXI2
        ntfbAC+DTijPNWr1ySoa4DJBwIE2aApWY/nxzmMMWLdga9A=
X-Google-Smtp-Source: APXvYqwnv2W92AwYPmHA+pZgR+UfUWyGF7yrgdcg/vKDBYgUmxUAUGXWBDjENWKrzjJVY2Wha6sDhMq72YjhPCXJxfg=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr1023295oib.129.1557251635564;
 Tue, 07 May 2019 10:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190507115726.23714-1-glaroque@baylibre.com> <20190507115726.23714-5-glaroque@baylibre.com>
In-Reply-To: <20190507115726.23714-5-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 7 May 2019 19:53:44 +0200
Message-ID: <CAFBinCBQSE7wh367Aa25zwtDphsx8Z_KGDTn8dcSCir6bLvq_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: meson: Rework enable/disable bias part
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Guillaume,

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> rework bias enable/disable part to prepare drive-strength integration
if it was my patch I would add "no functional changes" at the end to
make it explicit that this only changes the structure of the code.

>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
with the minor comments from below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 79 ++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 96a4a72708e4..a216a7537564 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -174,13 +174,57 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>         return 0;
>  }
>
> +static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
> +                                     unsigned int pin)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit = 0;
> +       int ret;
> +
> +       ret = meson_get_bank(pc, pin, &bank);
> +       if (ret)
> +               return ret;
add an empty line here to keep it consistent with the rest of the code

[...]
>  static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>                              unsigned long *configs, unsigned num_configs)
>  {
>         struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>         struct meson_bank *bank;
bank is not read anymore (it's passed to meson_get_bank to set it, but
then it's not read, which is probably why my compiler doesn't
complain)

>         enum pin_config_param param;
> -       unsigned int reg, bit;
>         int i, ret;
>
>         ret = meson_get_bank(pc, pin, &bank);
> @@ -192,44 +236,17 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>
>                 switch (param) {
>                 case PIN_CONFIG_BIAS_DISABLE:
> -                       dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
> -                                              &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), 0);
> +                       ret = meson_pinconf_disable_bias(pc, pin);
>                         if (ret)
>                                 return ret;
>                         break;
>                 case PIN_CONFIG_BIAS_PULL_UP:
> -                       dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
> -                                              &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), BIT(bit));
> -                       if (ret)
> -                               return ret;
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pull, reg,
> -                                                BIT(bit), BIT(bit));
> +                       ret = meson_pinconf_enable_bias(pc, pin, 1);
use "true" instead of "1"?

>                         if (ret)
>                                 return ret;
>                         break;
>                 case PIN_CONFIG_BIAS_PULL_DOWN:
> -                       dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
> -                                              &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), BIT(bit));
> -                       if (ret)
> -                               return ret;
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pull, reg,
> -                                                BIT(bit), 0);
> +                       ret = meson_pinconf_enable_bias(pc, pin, 0);
use "false" instead of "0"?

one overall comment: thank you for working on this!
in my opinion it's a good preparation step to ensure that
meson_pinconf_set is easy to understand even if we add more
functionality here


Regards
Martin
