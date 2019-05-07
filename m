Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94A3916A01
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 20:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfEGSS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 14:18:59 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38258 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfEGSS7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 14:18:59 -0400
Received: by mail-oi1-f194.google.com with SMTP id u199so5160930oie.5;
        Tue, 07 May 2019 11:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DIIRa7p/rV4HB2as8tjEDFq+RRs+MK4VGHcsoldRJag=;
        b=ra/kAOAx2DWa1Yxmu8NuLHtcqurukNSBbe1FvM0kjVJXJak8i6fZKY0dRvjQpFoDX2
         pMdBgTLS7qZHdJ8Q0eHaFXDUWeN1g+p2WU9fGqlraeVmkb2lGW6BMm50xZDZMjNq3Q9v
         WzU2Qz98pv8n8jfwsmCDEKzJ8pTEvbHyRSd6HNT0wmA6zhFfG8CDlb58ceLzweGQvneu
         +oV7Jdn+o+Y1k8VmFLG67p+CDCB+mlQ5EVmc8OKmrpAbZ6EKD7onTrOk4uZ87kv4xAjB
         6KXVI+N4Gthna8eIeDiLH0lFRyr26dIHz9QOT7soXVLNSTxQhhhQR9kGKNq5/7dWHtkT
         aeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DIIRa7p/rV4HB2as8tjEDFq+RRs+MK4VGHcsoldRJag=;
        b=o9nsDu9UTkhyKpo95zxF2lzJWmuP4pK2E6e8WAPypew9DmIB5ad5lH2smNxnrKVvMO
         3J4IL3oIbpZEsrQOhS77O7l13oc3sc+W9zzxhnq+fadjnYhhc8DUdAtxwi+AxwfT/9jl
         zv469lRMRAMfJDF4dW0yzaC+oUxBLNSoHO6K2/aXRCnGkDh7zxG5J1vqil18jG3ijAly
         GM7A/pJ+5LIMrvZ0Cw6JxNBOtDG4zKvy6gilXDPycBgPmJqkzxP6qY0yl8kNyWxBm+hw
         HX73TF2TfLHErBRerkOpEF0XNA4C/OcqejzhMcAl9x8bNAyZQz9pM/he2XBPW1diWPJa
         Cniw==
X-Gm-Message-State: APjAAAXQo0HkwnrpoSo0vyw1SOO/P3hkxiYnNqnr5+d+RJ0JXBE33asB
        cizw3FNwUtEWi22hOOHgP5E8VDES+Ds+f/vS5/k=
X-Google-Smtp-Source: APXvYqwKfGvxV5yt/tcKqmGHxSUIsuuAeVYrF+n/PP82BHgwaxt6NE/Rtt7jU/L28u6iqYANZra1FUahagvh2ZmaR7c=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr1040051oif.140.1557253138576;
 Tue, 07 May 2019 11:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190507115726.23714-1-glaroque@baylibre.com> <20190507115726.23714-6-glaroque@baylibre.com>
In-Reply-To: <20190507115726.23714-6-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 7 May 2019 20:18:47 +0200
Message-ID: <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] pinctrl: meson: add support of drive-strength-microamp
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

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> drive-strength-microamp is a new feature needed for G12A SoC.
> the default DS setting after boot is usually 500uA and it is not enough for
> many functions. We need to be able to set the drive strength to reliably
> enable things like MMC, I2C, etc ...
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
with the comments below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 102 ++++++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.h |  18 ++++-
>  2 files changed, 119 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index a216a7537564..3da867c13f47 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -219,12 +219,56 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>         return 0;
>  }
>
> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin,
> +                                           u16 drive_strength_ua)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit;
> +       unsigned int ds_val;
you can move ds_val to the line above

[...]
> +       if (!pc->reg_ds) {
> +               dev_err(pc->dev, "drive-strength not supported\n");
I'm getting this on one of my Meson8m2 boards:
$ # cat /sys/kernel/debug/pinctrl/c1109880.pinctrl-pinctrl-meson/pinconf-pins
...
[  874.748531] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
[  874.755278] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
[  874.762086] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
Pin config settings per pin
Format: pin (name): configs
pin 0 (GPIOX_0): input bias disabled
pin 1 (GPIOX_1): input bias disabled
pin 2 (GPIOX_2): input bias disabled
...

I believe we are not supposed to complain when getting the
drive-strength when reg_ds is absent.
all pre-G12A SoCs don't have reg_ds, so we don't need to error-out in
that case (because that's perfectly valid)

[...]
> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin,
> +                                           u16 *drive_strength_ua)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit;
> +       unsigned int val;
> +       int ret;
> +
> +       if (!pc->reg_ds) {
> +               dev_err(pc->dev, "drive-strength not supported\n");
based on your previous explanation (that you want to inform the .dts
author that he's doing something wrong) I'm happy with this error if
Linus W. doesn't veto this.


Regards
Martin
