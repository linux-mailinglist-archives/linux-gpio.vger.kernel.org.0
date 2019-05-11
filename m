Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0BDA1A87E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2019 18:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfEKQqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 May 2019 12:46:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42642 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfEKQqa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 May 2019 12:46:30 -0400
Received: by mail-ot1-f66.google.com with SMTP id f23so8267138otl.9;
        Sat, 11 May 2019 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=96bKsMAm9Vo8ijmk3T9jhbPo2k1zIbt2qUcMzxdEzIE=;
        b=V28RfDIEVi47GSrUnvFhAP+TUnCVNQKKG0eV1YR70qCefysFU7zSTGFzmQ2OfqTUzx
         HXHmC7eNp5UFgHdBNh5MFqKSgvvJeKhBQVVHzOIZ/MR/WOggJw2FeC0Hfrra+589QTXN
         sI6Hmgvsvgbnf4J9+q+4sAgKGlSPsDS2f0sJebunqBItN2d6Y+cXCg7FiPtaG1l3L42C
         G1+Uvzm8lWICt/I4EL+qip/FCZ5jyi+fMmd0yuLa2QeyYwVMPP+4mC6jabY6oQ9JUkmC
         z9sbR6vZUezOJSe+7CGfInn6oCBfbjytow1lVKHcy0LpLzrmCybL4rLYJbD9uEQSB3zO
         o8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=96bKsMAm9Vo8ijmk3T9jhbPo2k1zIbt2qUcMzxdEzIE=;
        b=g7a58fpjOp9kegwNAAKrvHGhlvi7QaAN1NeheoBi3TxdDAqn+X+QlmT8hNiZjlQ4nV
         +/WS6r2e4ClZ4ls2fikhyvvCprSRFWUmloA2AMlVgcT4y1P2yT0XQNS5Yvb7W6tstbiQ
         TmXkzHmO/eazBBfiq164WyYvO/ulMHofDxh2Y+FdnvhJkpoebmTnkuxFTSm/BGtMycwg
         2SuGXPbj9NZ1zJwwafiYE6ZfMGCn1EagCGArB13DrA6VPDx/2NprTaj9SjjOlpJrodNV
         IZe/aeQ7DRh91n718Pd8yQ7KNaAyO8VEmq7+7Crnp/PGtwxSdbPqHF2l8c+sv2dKh29V
         oMAg==
X-Gm-Message-State: APjAAAWRqf6A7+i9C7BM0qnSIKGn0z0MDjqyhCEhbpDaCZNUvKs3LXdO
        rtb+cJ/uFdJ185ej7SsC+MrmSVgq+hw98sR0iQ8=
X-Google-Smtp-Source: APXvYqwZ2Yawymrjhy2bfBFHnKAAPtDfzpc4uZrwzTwdpTA3nLQCVTT0MYmYZR49feLIgKD6cddI93e+R+MPKYHPHvc=
X-Received: by 2002:a9d:6759:: with SMTP id w25mr10813499otm.348.1557593189896;
 Sat, 11 May 2019 09:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190510082324.21181-1-glaroque@baylibre.com> <20190510082324.21181-6-glaroque@baylibre.com>
In-Reply-To: <20190510082324.21181-6-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 May 2019 18:46:19 +0200
Message-ID: <CAFBinCAYNvBtNwZdKJVUpObogjaiAx0W0Y-cnOL7RtARhYOW_g@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] pinctrl: meson: add support of drive-strength-microamp
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Guillaume,

On Fri, May 10, 2019 at 10:23 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> drive-strength-microamp is a new feature needed for G12A SoC.
> the default DS setting after boot is usually 500uA and it is not enough for
> many functions. We need to be able to set the drive strength to reliably
> enable things like MMC, I2C, etc ...
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

the warning messages when printing pinconf-pins (in debugfs) are gone
on my Meson8m2 board so:
Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

[...]
> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin,
> +                                           u16 drive_strength_ua)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit, ds_val;
> +       int ret;
> +
> +       if (!pc->reg_ds) {
> +               dev_err(pc->dev, "drive-strength not supported\n");
> +               return -ENOTSUPP;
> +       }
> +
> +       ret = meson_get_bank(pc, pin, &bank);
> +       if (ret)
> +               return ret;
> +
> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +       bit = bit << 1;
I was confused by this shifting (not sure why I haven't noticed this
in earlier revisions). however, it all made sense after I did the
maths for two examples:

BOOT_0 uses drive-strength register 0x0 bits [1:0] so the result
should be "bit = 0"
meson_calc_reg_and_bit returns bit = 0
0 << 1 = 0, so this seems right

BOOT_15 uses drive-strength register 0x0 bits [31:30] so the result
should be "bit = 30"
meson_calc_reg_and_bit returns bit = 15
15 << 1 = 30

so all seems fine, even though it wasn't obvious to me at first sight
that it's all good


Martin
