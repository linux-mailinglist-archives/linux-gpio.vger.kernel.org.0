Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB80D51EA37
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 22:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbiEGVCr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 17:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbiEGVCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 17:02:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FCD140CD
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 13:58:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9478760F1A
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 20:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB83C385B6
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651957138;
        bh=OIAhVsfnQx3H9cO0oMrogbZg8WQKBlD+rk30Tvq6DtU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aceJ+DjU26Z1nY1NjxZOyBnaS+dkt95M0ULfQOn83HAdBq/ZyTiHv2bRCtHZQvCkG
         Jr/HdvGycMa1R8sT26AvddfGzR7rRLHaPXLeiUhu9vPB9EzbnNs1s02RMEMnE25Izd
         GlrYaCY+UbEK+3dHqbE1EQTwAZGVW4t+KKCg+oFyDt0+RhbdaUvEn+6kCCwNfJtdzW
         Kfrdarg0rpyaI80SXktKSndsGhLwkIEgP9sw1HpIi8bcnegnVVzZdjWPIHPSnLdzwz
         XxdQWIhCHNzJPeQR/iJuJkZ4Y4Qcgh4bnIATMjNGTL3Ytt+I1VwezeoQpiKrt/aEIn
         34C7R7BQ1srYw==
Received: by mail-yb1-f179.google.com with SMTP id s30so18508237ybi.8
        for <linux-gpio@vger.kernel.org>; Sat, 07 May 2022 13:58:57 -0700 (PDT)
X-Gm-Message-State: AOAM530TQzvDumidJ4mme/3DGbFQBw9CTm7KJG4wcJXcK6prcpD2Iy9Z
        n/lSqhqo2QYbIXeNgdoD09hHinDEdtZ/S5x8mlQ=
X-Google-Smtp-Source: ABdhPJxQ7Z25cBx3UupwXCv6CKHu0Z3TeFjS5eBaYSLglxeTHoiHwySaUO7a/+MBQBg4NN5WA8EjF5DbLOCKh2xg0m4=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr6932703ybf.134.1651957136873; Sat, 07
 May 2022 13:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220507123331.170516-1-linus.walleij@linaro.org>
In-Reply-To: <20220507123331.170516-1-linus.walleij@linaro.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sat, 7 May 2022 22:58:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0yF-QzaYpWOqHVXvkbh06yWKub+7wwF2ENnRCktuVqXw@mail.gmail.com>
Message-ID: <CAK8P3a0yF-QzaYpWOqHVXvkbh06yWKub+7wwF2ENnRCktuVqXw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 7, 2022 at 2:33 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The Tosa device (Sharp SL-6000) has a mishmash driver set-up
> for the Toshiba TC6393xb MFD that includes a battery charger
> and touchscreen and has some kind of relationship to the SoC
> sound driver for the AC97 codec. Other devices define a chip
> like this but seem only half-implemented, not really handling
> battery charging etc.
>
> This patch switches the Toshiba MFD device to provide GPIO
> descriptors to the battery charger and SoC codec. As a result
> some descriptors need to be moved out of the Tosa boardfile
> and new one added: all SoC GPIO resources to these drivers
> now comes from the main boardfile, while the MFD provide
> GPIOs for its portions.
>
> As a result we can request one GPIO from our own GPIO chip
> and drop two hairy callbacks into the board file.
>
> This platform badly needs to have its drivers split up and
> converted to device tree probing to handle this quite complex
> relationship in an orderly manner. I just do my best in solving
> the GPIO descriptor part of the puzzle. Please don't ask me
> to fix everything that is wrong with these driver to todays
> standards, I am just trying to fix one aspect. I do try to
> use modern devres resource management and handle deferred
> probe using new functions where appropriate.
>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Dirk Opfer <dirk@opfer-online.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I've inserted into the right place in my series now, after making sure
that your patch does everything that mine had. This included
the simple fixup for an uninitialized variable use you left behind, and
removing two unneeded headers that would otherwise break later.

         Arnd

index 272d3ee44769..73d4aca4c386 100644
--- a/drivers/power/supply/tosa_battery.c
+++ b/drivers/power/supply/tosa_battery.c
@@ -15,7 +15,6 @@
 #include <linux/gpio/consumer.h>

 #include <asm/mach-types.h>
-#include <mach/tosa.h>

 static DEFINE_MUTEX(bat_lock); /* protects gpio pins */
 static struct work_struct bat_work;
diff --git a/sound/soc/pxa/tosa.c b/sound/soc/pxa/tosa.c
index c2b05896e284..098fffd69161 100644
--- a/sound/soc/pxa/tosa.c
+++ b/sound/soc/pxa/tosa.c
@@ -23,7 +23,6 @@
 #include <sound/soc.h>

 #include <asm/mach-types.h>
-#include <mach/tosa.h>
 #include <mach/audio.h>

 #define TOSA_HP        0
@@ -228,8 +227,6 @@ static int tosa_probe(struct platform_device *pdev)
                return dev_err_probe(&pdev->dev, PTR_ERR(tosa_mute),
                                     "failed to get L_MUTE GPIO\n");
        gpiod_set_consumer_name(tosa_mute, "Headphone Jack");
-       if (ret)
-               return ret;

        card->dev = &pdev->dev;
