Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A03FF56C68
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 16:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfFZOnF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 10:43:05 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39082 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfFZOnF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 10:43:05 -0400
Received: by mail-io1-f65.google.com with SMTP id r185so5598570iod.6;
        Wed, 26 Jun 2019 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndt1TjzWR+XevEvn+tnNUY4e32ffsKZO5hYnpG+MuNs=;
        b=oFtv1FLF7s7Gni0jixKhOOnsZR7FRyNgDyY/XOaD5l0+hUqVQFKtr5tigbJctWIa3d
         IU0gIzkfr2tVZibcYZOO8x6WH5wUxinhlVFWoNqOAAeRQ7TFf33zfbd1Ab5bsNuoYcth
         BWffTkdbDjIX4jcvWYWJpspb8qOZv+Ig/4qU5DMOkgGEkIhhTemdripAHbukePRwb12D
         bD0JjL9iZTCGehsuwrNhohdTSV9DuswwMYRckulmbpJngobhjbQMkzDPVSIr3xJqz5yU
         oOjpZ3Zjh1u7tZHYrym/6R5xsuMbbCiz4TYzoxDk4fzAHmCYpUUEPkptfWKGPR2FXQ/o
         0DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndt1TjzWR+XevEvn+tnNUY4e32ffsKZO5hYnpG+MuNs=;
        b=fAhF4nvHUFxAHWDrY4Ni1EHfjQqBsVw2aCTIcN97bWk5TQasApjqHUR2iYgmvMx5be
         Kx5mPI7+8t4cAuSdzS0Yu/NS5MewSkyGdluCXyQ4vBtkU3s/7HIULNEPo3NzNvxT22pZ
         lv6iU9+CbgO+HlE1XG31C1gW++jeMf1B2XlQUrnASQ0Wkk0WSIsR0dYimZSB+GVpqJhZ
         a6hEL6GK2oV4xt0OzZQCmnEEP6bBsBDThrh/2uB8NsVN/SzcgXwsAjZQrkdjaIKtOfPW
         bvhH3FYrziw7rbDRafu2DkWeZ79Ed/nuCamrZVyJEanFC8BcYhdJ2RBrzowdf/wMHO6u
         VKRw==
X-Gm-Message-State: APjAAAURXQd8j6vQvAvK6ifRn6qCSligodbAiJKjpPYdiz6Xd8VFX901
        2Cn+CQ8jiE/WPUNI8OqULDopRpOEkymKqm9l9dQ=
X-Google-Smtp-Source: APXvYqwSm6/Faqxcb6mkrK09MO1nXUiQQ5JnHgN86hMNnHi8qY0Fhdq+7cAo3cvCh7ABTFM95t/hbU0reUtLVcXb6U4=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr5039232ioa.33.1561560183327;
 Wed, 26 Jun 2019 07:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr> <20190611180516.GO4814@minitux>
 <be298c01-53b8-a954-5de0-3f302265f1cb@free.fr> <20190620184124.GB24205@tuxbook-pro>
 <57d0644d-164f-58e7-6c07-9608da4233a3@free.fr>
In-Reply-To: <57d0644d-164f-58e7-6c07-9608da4233a3@free.fr>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 26 Jun 2019 08:42:52 -0600
Message-ID: <CAOCk7Nqi6j07TzH0tp8x8NzwqX1CAG8wj55Yvxw2tVC8cXhxmQ@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: msm8998: Squash TSIF pins together
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 8:40 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> Preamble: Rename tsif1 to tsif0, tsif2 to tsif1.
> Squash tsif0 pins into a single function. Same for tsif1.
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  .../bindings/pinctrl/qcom,msm8998-pinctrl.txt | 19 ++---
>  drivers/pinctrl/qcom/pinctrl-msm8998.c        | 76 +++++--------------
>  2 files changed, 24 insertions(+), 71 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> index 00174f08ba1d..47b0f30a39e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> @@ -124,9 +124,8 @@ to specify in a pin configuration subnode:
>                     qlink_request, qua_mi2s, sd_card, sd_write, sdc40, sdc41,
>                     sdc42, sdc43, sdc4_clk, sdc4_cmd, sec_mi2s, sp_cmu,
>                     spkr_i2s, ssbi1, ssc_irq, ter_mi2s, tgu_ch0, tgu_ch1,
> -                   tsense_pwm1, tsense_pwm2, tsif1_clk, tsif1_data, tsif1_en,
> -                   tsif1_error, tsif1_sync, tsif2_clk, tsif2_data, tsif2_en,
> -                   tsif2_error, tsif2_sync, uim1_clk, uim1_data, uim1_present,
> +                   tsense_pwm1, tsense_pwm2, tsif0, tsif1,
> +                   uim1_clk, uim1_data, uim1_present,
>                     uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset,
>                     uim_batt, usb_phy, vfr_1, vsense_clkout, vsense_data0,
>                     vsense_data1, vsense_mode, wlan1_adc0, wlan1_adc1,
> @@ -179,15 +178,9 @@ Example:
>                 #interrupt-cells = <2>;
>
>                 uart_console_active: uart_console_active {
> -                       mux {
> -                               pins = "gpio4", "gpio5";
> -                               function = "blsp_uart8_a";
> -                       };
> -
> -                       config {
> -                               pins = "gpio4", "gpio5";
> -                               drive-strength = <2>;
> -                               bias-disable;
> -                       };
> +                       pins = "gpio4", "gpio5";
> +                       function = "blsp_uart8_a";
> +                       drive-strength = <2>;
> +                       bias-disable;
>                 };

Whats with these "uart" changes?  Modernizing the example?  Doesn't
seem related to the commit text...
