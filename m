Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0F8FB0BE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 13:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfKMMrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 07:47:31 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35998 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfKMMrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 07:47:31 -0500
Received: by mail-ot1-f66.google.com with SMTP id f10so1488416oto.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 04:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hzS4SYZIt6NSpGEyuUnsFmOu8r8EHjFnb42rl1nHgcA=;
        b=xvcWvOoRVhAn4dsxU4VkYj8ICUAIK3dzZqwz4A12M1b/OSzothi1aeEN8C2VFcy3cG
         OZeLB4vaYMzrbreteBcvxV1hVxsOXLr0jeOK8wJPtIo3kV2CHdt8M2f2Ys/HXXcBRgqf
         6BCrGav8suM/KSxRuhhT9VWDu5lvxoqPoGEtKuov3vJyI1ShEeiBjsO02xWCTbfEQ518
         LeG8hqiedrAYe7QOv27SK0MgO7qUGyrfs9DpZymVAmrjbkgsF9go60tJ8VSoDKxzq4Qq
         zf3Yv/6GJfIF5GrjZn7cqcdi6BmorlsayObewnKRJ5BiSu8kyUnRFZyU1T75AaO9jOkH
         ztgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hzS4SYZIt6NSpGEyuUnsFmOu8r8EHjFnb42rl1nHgcA=;
        b=K30D52gQTt/XGxuwiPlVKARTRuhr5rWlGG6WE7T5xEqGTVJ7CGhndgO7GH6Dzqpjrw
         Wztr+fMX5ACVOGPTlbd0kTShAGBsN8NXDIJsp1BuXhJ9ar7mwNG+HCia2jCdAH7x8G4l
         NPo28WKdZIMKcrSOH46sYZCxL4wn1768F68/sAASESyviCmTFumtQUiWmFe6hhBMV312
         ueSdsygYsl2ItRpakJncRyb7ydOkqAT8XooNFeOBuvCONOC9hMSI8M7vttn+uRvhrtX6
         EoPRoVCbgr8ffmz2mk1DPvBEcyJrhMKF41eC3edve4pNEYnYnlQG1c8ieNwOxcQQKOhA
         5OEQ==
X-Gm-Message-State: APjAAAX+K5+La3DEizSEd8GIAevj9IRW1J8vDKQC9dtCetqNAXwqJ/BK
        3kx/V8GopbHx12Z4w+Npqlzb5IgWbbc/GsrE4TNdXg==
X-Google-Smtp-Source: APXvYqz489t5EwSifbd70BN2wc2Mi+1psbSHgq4dZBXQDgFewdQxLAk6JgWdnkuJm+7Ix7lh2CSmzpOuJ9BaftT5FHU=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr3084723otb.85.1573649250095;
 Wed, 13 Nov 2019 04:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20191112221026.5859-1-labbott@redhat.com>
In-Reply-To: <20191112221026.5859-1-labbott@redhat.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 13 Nov 2019 13:47:19 +0100
Message-ID: <CAMpxmJX_haxjkY+vmm+ajC6hi-aa6k6m0o+d=RmTz5xjPXuo-g@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: Correctly add make dependencies for gpio_utils
To:     Laura Abbott <labbott@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 12 lis 2019 o 23:10 Laura Abbott <labbott@redhat.com> napisa=C5=82(a):
>
>
> gpio tools fail to build correctly with make parallelization:
>
> $ make -s -j24
> ld: gpio-utils.o: file not recognized: file truncated
> make[1]: *** [/home/labbott/linux_upstream/tools/build/Makefile.build:145=
: lsgpio-in.o] Error 1
> make: *** [Makefile:43: lsgpio-in.o] Error 2
> make: *** Waiting for unfinished jobs....
>
> This is because gpio-utils.o is used across multiple targets.
> Fix this by making gpio-utios.o a proper dependency.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> I made a similar fix to iio tools
> lore.kernel.org/r/20191018172908.3761-1-labbott@redhat.com
> ---
>  tools/gpio/Build    |  1 +
>  tools/gpio/Makefile | 10 +++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tools/gpio/Build b/tools/gpio/Build
> index 620c1937d957..4141f35837db 100644
> --- a/tools/gpio/Build
> +++ b/tools/gpio/Build
> @@ -1,3 +1,4 @@
> +gpio-utils-y +=3D gpio-utils.o
>  lsgpio-y +=3D lsgpio.o gpio-utils.o
>  gpio-hammer-y +=3D gpio-hammer.o gpio-utils.o
>  gpio-event-mon-y +=3D gpio-event-mon.o gpio-utils.o
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 1178d302757e..6080de58861f 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -35,11 +35,15 @@ $(OUTPUT)include/linux/gpio.h: ../../include/uapi/lin=
ux/gpio.h
>
>  prepare: $(OUTPUT)include/linux/gpio.h
>
> +GPIO_UTILS_IN :=3D $(output)gpio-utils-in.o
> +$(GPIO_UTILS_IN): prepare FORCE
> +       $(Q)$(MAKE) $(build)=3Dgpio-utils
> +
>  #
>  # lsgpio
>  #
>  LSGPIO_IN :=3D $(OUTPUT)lsgpio-in.o
> -$(LSGPIO_IN): prepare FORCE
> +$(LSGPIO_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
>         $(Q)$(MAKE) $(build)=3Dlsgpio
>  $(OUTPUT)lsgpio: $(LSGPIO_IN)
>         $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> @@ -48,7 +52,7 @@ $(OUTPUT)lsgpio: $(LSGPIO_IN)
>  # gpio-hammer
>  #
>  GPIO_HAMMER_IN :=3D $(OUTPUT)gpio-hammer-in.o
> -$(GPIO_HAMMER_IN): prepare FORCE
> +$(GPIO_HAMMER_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
>         $(Q)$(MAKE) $(build)=3Dgpio-hammer
>  $(OUTPUT)gpio-hammer: $(GPIO_HAMMER_IN)
>         $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> @@ -57,7 +61,7 @@ $(OUTPUT)gpio-hammer: $(GPIO_HAMMER_IN)
>  # gpio-event-mon
>  #
>  GPIO_EVENT_MON_IN :=3D $(OUTPUT)gpio-event-mon-in.o
> -$(GPIO_EVENT_MON_IN): prepare FORCE
> +$(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
>         $(Q)$(MAKE) $(build)=3Dgpio-event-mon
>  $(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
>         $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> --
> 2.21.0
>

Applied for fixes, thanks!

Bartosz
