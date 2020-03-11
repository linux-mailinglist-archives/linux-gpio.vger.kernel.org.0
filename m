Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB8D18182A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 13:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgCKMgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 08:36:13 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36254 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729263AbgCKMgM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 08:36:12 -0400
Received: by mail-qk1-f193.google.com with SMTP id u25so1868655qkk.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2020 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A2JAdo/ZGdZq7oAsk87CcGhLsAyVSDl8Hklf8ueXEq0=;
        b=wgPQQuMZanHLFj2mJqcSX3W583odW+PfyBhx+oB83ccqbeyp/tn2ub5mKFECqZa0Si
         jIwq7qZlEQ5kGwLMgTSiEoqV1qUGGPH4kYRduf0BtouMitKa7Kj1+uTePCaVxPUnuyOD
         oIUtFCxLdTOjxJSZGa5TqhD4dQeFNi3D/DALvmvVtA1gGFtPp5aL2glAhsEjt1YHC05L
         C/K7TJki+AYy+AvudHg1wEF4KB9uqVNtiwyU6XsoH2oaewfvs3SdWryJqH8gCGUbTpet
         vNCon0cKrHvTCT0A9FC/ZEYORA8Z5mIw4qz28t3XSpWFEVpN1KPT6Pl2FgGen2Lrca/A
         FvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A2JAdo/ZGdZq7oAsk87CcGhLsAyVSDl8Hklf8ueXEq0=;
        b=iZmiyZFxndmnG8V7Ybi7YeogZ90q7SS5dwZmj3ReNAqhuM7ihlMGBtXYrLeIiFEHt5
         6FFXxm/DTvWtbK1t02A8fbjd5qhqnKL/DjAqPL5EclZcW+KTIt7ggsit24h4iq2N5eI8
         jKNcy4Ub1NRA1QRBPZ/W3kEQFjbAfGgIslwTtjYn1meZEGk+mdwAK6cBsy/FiJGSNSRF
         WY5BIbp9ewEq+qfHLndCcknziPlDTnpY56x23yicsIXSHmyDsDLLkCFR4OR3eTs1i8eA
         m4DPPYYp+msfsdGlfN5sHtuKC67SX1UNpG0R3z2jI+i10WJR/w/vPhOwhnzb7XqvdZ7C
         EQow==
X-Gm-Message-State: ANhLgQ3cgp7nevGD4KpRQzyWQKcheSEXsPqo/+x+X822FSut5Offgbh0
        4UO/Z/x5V0I56ZIJSTNAmToqNi/tUNc2tvOfWTPzZWjIYA4=
X-Google-Smtp-Source: ADFU+vvI3YYQBWkmn8OFmWq6mlrvnzaHNr5OEC4rlUVY6+vpzh1cGiwciVD2yz9bUxl9LcLzbaVdyHUMxZzXdYvBNls=
X-Received: by 2002:a37:3c9:: with SMTP id 192mr2595902qkd.330.1583930171453;
 Wed, 11 Mar 2020 05:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <1583587917-7032-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1583587917-7032-1-git-send-email-Anson.Huang@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Mar 2020 13:36:00 +0100
Message-ID: <CAMpxmJX6QPA-PZ=GGqp2B2prMEX3wAHCxMCijg2xdXztr9Rn=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Add COMPILE_TEST support for GPIO_MXC
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dl-linux-imx <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 7 mar 2020 o 14:38 Anson Huang <Anson.Huang@nxp.com> napisa=C5=82(a):
>
> Add COMPILE_TEST support to GPIO_MXC driver for better compile
> testing coverage.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b8013cf..b411226 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -394,7 +394,7 @@ config GPIO_MVEBU
>
>  config GPIO_MXC
>         def_bool y
> -       depends on ARCH_MXC
> +       depends on ARCH_MXC || COMPILE_TEST
>         select GPIO_GENERIC
>         select GENERIC_IRQ_CHIP
>
> --
> 2.7.4
>

Patch applied, thanks!

Bartosz
