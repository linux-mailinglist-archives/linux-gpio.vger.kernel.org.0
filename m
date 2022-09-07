Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 015CC5B012F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 12:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiIGKDE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 06:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiIGKCv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 06:02:51 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E89AFC2
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 03:02:35 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id m1so18906123edb.7
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2022 03:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MFgYf5i+p8HnoiZj78ub5+J+EdkgxQwFyuduhPa5CXE=;
        b=NWBRDSGoTo4Kh/kDLYYCBfh6kBK3XcY3jeUptXhD2LeP8OUt5DLBoUbsVn3lDiqR2m
         cdcuCZnbH5JeYs3XuEyVXUkn1VDoQh+LYblo47u4orckEDjn9PN41LoOV/VdI7RU+vN/
         3XZMrdlpAIIuKLBJP+YS3w7HKlEfZ0xLzy9gq2To4keduXXlu6MT/X5mBUL49sf6bomb
         h70GZSIINXBeRVa46OBD6raACPOY/fiS69JRUhS5B48t5N8HSROwe5qqeC2w07PUaGav
         KBZApMS2ed8wZDt2ts/eOlAiWVd5jdLO/dBXObZA4AAjPrYeeFjUR36exEobQaVEWDuU
         vPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MFgYf5i+p8HnoiZj78ub5+J+EdkgxQwFyuduhPa5CXE=;
        b=ejMWhVAwx/UlcfwLXLcPsa4kkSkZ5ItuEEHaLOeKtXQluPdPhgez8f/jVxT2YSevwP
         ApaGDX9Yj3YIb4Rs6MeWZCBqS+SkkUBX5aiKrjhbU0pdM92i1Sq4+J4h+JfY68mt5UNt
         XCmVfSSaOV8ctr3j1jtq1IVNkqxP1THXOta5lkT5Bpftk8N+XxJkz7T/opwhJ0TxW2cr
         0RiulQCuIg0oO61RyV1gHQZDcKZmEIbkyoWq7b8wkMjY+7swl8u5XXLd4wN89VMdOPy5
         tyPwGxm4AgLUG3iVtO+WIu3YKYcFXgYasPHpb28Z/qoQtSu57JHhXCF120gSdI5f4VaR
         Fegw==
X-Gm-Message-State: ACgBeo10ZjwbZwgi6v1ElAai8pNGzBBsVxqnPeNMjW4OXBFq2mP9BS7C
        kTh35XHTWMI+KkM/Maf5cljYbL7yvDab/8m+HOB6hA==
X-Google-Smtp-Source: AA6agR6ZLTZLfrhufuCQPkbnhVtzEViucDISa1L3We20Da0CSRHp4PvYtWUKlWfhrloyJvPt30RjLqJ6qOK2oWprULo=
X-Received: by 2002:a05:6402:354d:b0:448:1f80:e737 with SMTP id
 f13-20020a056402354d00b004481f80e737mr2509997edd.69.1662544953645; Wed, 07
 Sep 2022 03:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Sep 2022 12:02:22 +0200
Message-ID: <CAMRc=Mc7dgctBMKukH1FS2MA1qMbhN=GxEACorwJAv9Mmzjh7A@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add Apple Mac System Management Controller GPIOs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, devicetree <devicetree@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 6, 2022 at 3:18 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Hi,
>
> [Andy dropped from the Cc lists; he's taking a break.]
>
> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
>
> The first two patches add the DT binding documentation for the new
> drivers. No changes from the first posting (I think there's still
> some discussion going on about how best to handle these.)
>
> Patch 3 adds apple_rtkit_poll() and has had no changes since v1.
>
> Patch 4 is new, extending the existing FourCC format code to be able
> to print other endian FourCC codes.
>
> Patch 5 adds the SMC core and rtkit driver. Changes in v2 include
> properly limiting the data size (since it is limited to the width of
> the size fields in the mailbox messages, not the shmem size) and also
> to properly cleanup after failure to send the initialisation message.
>
> Patch 6 adds the SMC GPIO support. Changes in v2 include some of the
> issues Andy pointed out,
>
> Patch 7 is new, adding the SMC nodes to the dtsi.
>
> Patches taken from the Asahi project.
>
>  Documentation/core-api/printk-formats.rst          |  32 ++
>  .../devicetree/bindings/gpio/gpio-macsmc.yaml      |  28 ++
>  .../devicetree/bindings/mfd/apple,smc.yaml         |  65 +++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  26 ++
>  drivers/gpio/Kconfig                               |  11 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-macsmc.c                         | 242 +++++++++++
>  drivers/platform/Kconfig                           |   2 +
>  drivers/platform/Makefile                          |   1 +
>  drivers/platform/apple/Kconfig                     |  49 +++
>  drivers/platform/apple/Makefile                    |  11 +
>  drivers/platform/apple/smc.h                       |  28 ++
>  drivers/platform/apple/smc_core.c                  | 249 +++++++++++
>  drivers/platform/apple/smc_rtkit.c                 | 453 +++++++++++++++++++++
>  drivers/soc/apple/rtkit.c                          |   6 +
>  include/linux/mfd/macsmc.h                         |  86 ++++
>  include/linux/soc/apple/rtkit.h                    |  12 +
>  lib/vsprintf.c                                     |  35 +-
>  18 files changed, 1331 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
>  create mode 100644 drivers/gpio/gpio-macsmc.c
>  create mode 100644 drivers/platform/apple/Kconfig
>  create mode 100644 drivers/platform/apple/Makefile
>  create mode 100644 drivers/platform/apple/smc.h
>  create mode 100644 drivers/platform/apple/smc_core.c
>  create mode 100644 drivers/platform/apple/smc_rtkit.c
>  create mode 100644 include/linux/mfd/macsmc.h
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

For GPIO:

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
