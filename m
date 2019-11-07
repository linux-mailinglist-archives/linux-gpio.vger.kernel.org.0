Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E40F3668
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 18:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbfKGR6J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 12:58:09 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46546 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730616AbfKGR6J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 12:58:09 -0500
Received: by mail-ot1-f68.google.com with SMTP id n23so2757864otr.13
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 09:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gcSBQ9bev1i6y9WBdW6EcenAXOHeP/Zl4mv72+eF84s=;
        b=dLeID+yiPx8XhimUAzbRyPaANl4eg4H7QeVu2+bmEUSrePXc5WChLPe/EbTAAAiFen
         K9/nKMGKGdMNHwvQjqCcVzW9sfxZPTUv22qH+j/D8kKDM5KaMM9cLdBJDcMHa8ARbgrr
         kTAHY/vg7GXVZVDD5KtyIOBoK15LgrwNKZShQ2cD7VwKOqQYpORfpNirVwgV6M6fm2AS
         KajAPweUrlizvVf67VvcOvigVdV8SacyMl3JZdZss7sMLATgTL4n0LCNwORjJkaRuff6
         DS33H54hbMAcopqaS5bncsoc/p3HMprRgRRSm/SusRSz2Rq8/s6ZIAj7L57tzP4bQJS9
         k2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gcSBQ9bev1i6y9WBdW6EcenAXOHeP/Zl4mv72+eF84s=;
        b=fKMmurP+Jk8N6hRvY9VFM6piYqziP65atqKWdjCVcxqxV5XhSAfcdlGuRr4xmxtbca
         HNMh9YCHzmtc4aHRnQc3HqoPfUB9nEXY80UPPa9htPE7IHVv8VZv6+5NPNja1W9ptvvo
         q8RD97hApXhk6YM1T7hU+CVc/DoL96NoCWeWNJQ8ZEJ36S7xL1wRYVfFCsSekgGZt+M5
         We9LPxxtNAGCM3BMFsAQk2k1nnGyJqjwM81JNwvolrtKI0X++6tYZ9bpvV2D0BpQcZhD
         zaewr550fx9LPRsXyGrFMHFM7QgM6Ve+eFnhu0H+kP/bKhmUplSdHF3dkHM+qg7xPjSG
         T7oQ==
X-Gm-Message-State: APjAAAU27YkPWCB9yctEOgxQLGWr5TEbgMnZcKdaYyxnNUVpegxCwlpk
        9gErULdkoCavGbSjyw0TbLgsG8Fmsv9rcoTgaFH+hA==
X-Google-Smtp-Source: APXvYqzq1CkQO9hkkRxRoGYNu/mD+8RoRZ1cxpdAfIN31jr/7kYA+MSBHBj2mx5IpTWX5wr9Th4TB0bb9D8cExWnAP0=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr4227807otb.85.1573149487135;
 Thu, 07 Nov 2019 09:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com>
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 7 Nov 2019 18:57:56 +0100
Message-ID: <CAMpxmJWtMojJ5+10Ox50SDgTZ95C0aB-wB0tY6M-v1AsVN=WsQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 5 lis 2019 o 03:04 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> The changes from v5:
>   - rebased onto Bart's gpio/for-kent branch.
>
> The changes from v4:
> Review changes:
>  - relocate restriction on applying bias to as-is from patch 2 to patch 1=
.
>  - propagate errors, other than ENOTSUPP, from gpio_set_bias. (squashed
>    into patches 3 and 4).
>  - include SET_CONFIG patch series v2 (patch 6 and 7 here).
>
> I've also fixed a few other nits I noticed along the way:
>  - rework gpio_set_bias as flags are mutually exclusive.
>  - remove input flag required to set bias restriction from
>    lineevent_create as events are implicitly assumed inputs anyway.
>  - reorder patches to group gpiolib bias patches together before the
>    gpio-mockup changes.
>
>
> This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> Gross control means enabling and disabling of bias functionality,
> not finer grained control such as setting biasing impedances.
>
> The support allows both input and output lines to have any one of the
> following biases applied as part of the line handle or event request:
>  0. As Is - bias is left alone.  This is the default for ABI compatibilit=
y.
>  1. Bias Disable - bias is explicitly disabled.
>  2. Pull Down - pull-down bias is enabled.
>  3. Pull Up - pull-up bias is enabled.
>
> The biases are set via three flags, BIAS_DISABLE, BIAS_PULL_DOWN
> and BIAS_PULL_UP.  These map directly to the similarly named
> pinctrl pin_config_param flags.
> As Is corresponds to none of the flags being set.
>
> The setting of biases on output lines may seem odd, but is to allow for
> utilisation of internal pull-up/pull-down on open drain and open source
> outputs, where supported in hardware.
>
> The series also adds the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
> The ioctl allows some of the configuration of a requested handle to be
> changed without having to release the line.
> The primary use case is the changing of direction for bi-directional
> lines.
>
> Patches are against Bart's gpio/for-kent branch[1].
>
> The patch has been successfully tested against gpio-mockup, and
> on a Raspberry Pi, in both cases using the feature/pud_set_config
> branch of my Go gpiod library[2], as well as with my feature/pud
> development branch of libgpiod[3].  Patch 7 has only been tested using
> my gpiod library as libgpiod has not yet been updated to support the
> SET_CONFIG ioctl.
>
> Patch 1 adds pull-up/pull-down support to line handle requests.
> Patch 2 adds pull-up/pull-down support to line event requests.
> Patch 3 adds support for disabling bias.
> Patch 4 adds support for setting bias on output lines.
> Patch 5 adds pull-up/down support to the gpio-mockup for uAPI testing.
> Patch 6 refactors the flag validation from linehandle_create.
> Patch 7 adds the SET_CONFIG ioctl.
>
> Drew Fustini (1):
>   gpio: expose pull-up/pull-down line flags to userspace
>
> Kent Gibson (6):
>   gpiolib: add support for pull up/down to lineevent_create
>   gpiolib: add support for disabling line bias
>   gpiolib: add support for biasing output lines
>   gpio: mockup: add set_config to support pull up/down
>   gpiolib: move validation of line handle flags into helper function
>   gpio: add new SET_CONFIG ioctl() to gpio chardev
>
>  drivers/gpio/gpio-mockup.c |  94 ++++++++++------
>  drivers/gpio/gpiolib.c     | 213 +++++++++++++++++++++++++++++++------
>  drivers/gpio/gpiolib.h     |   1 +
>  include/uapi/linux/gpio.h  |  24 +++++
>  4 files changed, 264 insertions(+), 68 deletions(-)
>
> --
> 2.23.0
>

Applied all patches to for-next. Thanks!

Bart
