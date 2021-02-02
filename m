Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5AF30CB9D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 20:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239829AbhBBTaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 14:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbhBBN60 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 08:58:26 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA210C061573
        for <linux-gpio@vger.kernel.org>; Tue,  2 Feb 2021 05:57:43 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id y14so11415785ljn.8
        for <linux-gpio@vger.kernel.org>; Tue, 02 Feb 2021 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NL/I/BuRrrACgurhUs3cVKRwX323hl2f+ZOCamuPdHc=;
        b=Q4MrU9ZAwKq4E1DSZLMnCoc4OEZF8kZhBb2pF0FJiU3Pi5Qclgben0NCZKzz5YtTJB
         9a4T0NrurxbKFRVHL6nRf6cayFXco1vtMTAguuMELuH9WCvLtWBfUr4o74pyHto/FpQ7
         SkCuriyomu1Wkgd7fCSuzlV8RxSFtLhU1Z9Fq4n5J0g5fBIJTV0FJ1FB9uBjVC43z07k
         iELYQJGHgpO1v5aWng7dMxzibJvi7M5nng5stkf/znfHZNjSLIThrhjx7F8V3iowvbhj
         yyGTbdZNBUCbVz/fJi4R9U4EL1R9nfq16BAxk7QsmXSvwDk22WaWUMFxetzRVfVAzlgV
         yG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NL/I/BuRrrACgurhUs3cVKRwX323hl2f+ZOCamuPdHc=;
        b=XjcuYhh0kfXE1rNszTgKRdbI1n8D+5NC2GR4T64JC7u+FYLIEu48U1g/TOCgu8cDlt
         G8AGuPc8AOPCfJ9X0nuFlML+Yr1wfEBmpTvXrST7YXe8nhYxBrzM2qD/Ln6j0fZVSfdY
         FkYyHgHQkXXwVVswkw0PHQeaVUYWiX8mX0xgOD8x+hjYLyqSJTXinbzd4zsY/i0/oQLI
         Qdhh7ZYoiom0f8gRGbKdwk1+TlmU7XrqBtnpcuOUC8eoYychgfu+Gfv36BY1f//9qvuJ
         D3fu6zQYPCdUY9k8FR3ZIokfoGoKl3k41xIgzBww6a/sxpwtRSSA+AjIa6b6YZ8xYNnk
         lkgA==
X-Gm-Message-State: AOAM531TDlg0n8kFAUu2pQzRM2xTl0UZbp6aHarJkqc3RuVzMue9+K/z
        f/cQeomVB0LCdjWPwS7WMi1AQ0229NjiExiSnYPW+A==
X-Google-Smtp-Source: ABdhPJxazmAVdgS3EL8u7mgAM/H3dEDSjolBtS+6TpYMpVKMBwB8RnDWvB3K64ZQY7Fj+MjVXFsQEzBUzuP72v9jK0I=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr12733519ljl.467.1612274262224;
 Tue, 02 Feb 2021 05:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20210128153601.153126-1-alban.bedel@aerq.com>
In-Reply-To: <20210128153601.153126-1-alban.bedel@aerq.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Feb 2021 14:57:31 +0100
Message-ID: <CACRpkdaP8-mnXuBZRKad53tvGrS0BdfTRKNezr0mhRVf8qkYig@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on PCAL6524
To:     Alban Bedel <alban.bedel@aerq.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 4:36 PM Alban Bedel <alban.bedel@aerq.com> wrote:

> From a quick glance at various datasheet the PCAL6524 seems to be the
> only chip in this familly that support setting the drive mode of
> single pins. Other chips either don't support it at all, or can only
> set the drive mode of whole banks, which doesn't map to the GPIO API.
>
> Add a new flag, PCAL6524, to mark chips that have the extra registers
> needed for this feature. Then mark the needed register banks as
> readable and writable, here we don't set OUT_CONF as writable,
> although it is, as we only need to read it. Finally add a function
> that configure the OUT_INDCONF register when the GPIO API set the
> drive mode of the pins.
>
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>

Thats's nice!

> + *     Output port configuration       0x40 + 7 * bank_size    R
> + *
> + *   - PCAL6524 with individual pin configuration
> + *     Individual pin output config    0x40 + 12 * bank_size   RW

So this will become 0x70? It's a bit hard for me this weird
register layout...

> +static int pcal6524_gpio_set_drive_mode(struct pca953x_chip *chip,
> +                                       unsigned int offset,
> +                                       unsigned long config)
> +{
> +       u8 out_conf_reg = pca953x_recalc_addr(
> +               chip, PCAL953X_OUT_CONF, 0);
> +       u8 out_indconf_reg = pca953x_recalc_addr(
> +               chip, PCAL6524_OUT_INDCONF, offset);
> +       u8 mask = BIT(offset % BANK_SZ), val;

Split to two variable declarations please, this is hard to read.

> +       unsigned int out_conf;
> +       int ret;

So we set mask to the bit index for the line we want to affect.

> +       if (config == PIN_CONFIG_DRIVE_OPEN_DRAIN)
> +               val = mask;
> +       else if (config == PIN_CONFIG_DRIVE_PUSH_PULL)
> +               val = 0;
> +       else
> +               return -EINVAL;

And this makes sense, we set it to 1 to enable open drain.

> +       /* Invert the value if ODENn is set */
> +       ret = regmap_read(chip->regmap, out_conf_reg, &out_conf);
> +       if (ret)
> +               goto exit;
> +       if (out_conf & BIT(offset / BANK_SZ))

I suppose this could be written if (out_conf & mask)?

> +               val ^= mask;

Invert? Why?

The datasheet says:

  "If the ODENx bit is set at logic 0 (push-pull), any bit set to logic 1
  in the IOCRx register will reverse the output state of that pin only
  to open-drain. When ODENx bit is set at logic 1 (open-drain), a
  logic 1 in IOCRx will set that pin to push-pull."

So your logic is accounting for the fact that someone go and set
one of the bits in ODENx to 1, but aren't they all by default set
to zero (or should be programmed by the driver to zero)
so that you can control open drain individually here by simply
setting the corresponding bit to 1 for open drain and 0 for
push-pull?

> +       /* Configure the drive mode */
> +       ret = regmap_write_bits(chip->regmap, out_indconf_reg, mask, val);

Yours,
Linus Walleij
