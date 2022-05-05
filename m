Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E60951BF90
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 14:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbiEEMl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 08:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbiEEMl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 08:41:27 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E88955367
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 05:37:48 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id m20so8432799ejj.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OPYVHKHK/QqydyGes+il1kjVRLfVQ+PseEFsBbfk6rI=;
        b=S6lE85G+2jWy/N5wRkKEBsAfSl3M3n8Y3s2rZp/pP1B0Zm5s1foGPWbuQx3jXVLvg4
         p8BWH7kIzsr7HM3uxsx/tNVdDHhDhl6TYsCalGQ0UlkOgfagr+iVS+yPF+/ShphE8C7Q
         pNzwoGbQ7WQfirw5liQqnxHVRQooA/Zixut94v93eg1PVm4fxRcxTsXQK0ZdGPZ5mSjC
         WUkc5gDvYGqH15GZkHHahCrG9rYsrQQOznpMjiV+VH9NXpRae97vbsuhACRFho6d4AWK
         ArZ4VhJ+8NxvsQhDX26lYiH8Ds+6pzwKLW7MKwQ1ZeJmdVOC2H79+0Ns2PXePMtpbm+1
         FlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OPYVHKHK/QqydyGes+il1kjVRLfVQ+PseEFsBbfk6rI=;
        b=Ov0YswzgjNeukkaGpPL7J++mDmFcyQ5+7m4QockQt4ZT+uA9mUkvtWMql3YEounQcs
         9RVwMyQ3PBey/zXL40x9j+daWUZiGriIVT+conerM9Ah2Ld4avd543z3aBljKOE4dEKm
         Qg+ZYzM1cyHXzzTV31I2lNKW2UDl9urh9QD5ymTRa93gZX6L6Bx6YvBlaZeQpQ9dhxF7
         8E7japatiFQgXx+M2sm4GJvfkC7YPsiuBJUoI4ANA2j3mD5mWl8yLxG3QmG7p+msKxoe
         6/8DgSHykjdx/2K21a3oXVtBgMPjLxqXbp98OU7RUa7I30fGzN7wTDAdj4AwbHiTIn3S
         p+qA==
X-Gm-Message-State: AOAM531yOUWEWFDpqkIPgq8DaKUGMqZ5SeTf/DVipNGwg4153CQKzNmD
        8myk0xB7xiR+E7ZsKBBFo9xF1aeRJr4HGKSnc4OGEAsDh6mE7w==
X-Google-Smtp-Source: ABdhPJxztQtp7sRIcLzeU5VLJ31/GGPYy1q4xiD0DxDXxxyGntLusx7gDiQZgROMb+yhfa4PLKmiXp7NSQWVLKy0PtM=
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id
 sd4-20020a1709076e0400b006f4d6f3c72amr6692014ejc.636.1651754267025; Thu, 05
 May 2022 05:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220502170827.51396-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220502170827.51396-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:37:36 +0200
Message-ID: <CAMRc=Md6iYAzNHbHbU9vt0tgx94LibEy7pAK85MTjiorc0Cqag@mail.gmail.com>
Subject: Re: [PATCH] gpio: max732x: Drop unused support for irq and setup code
 via platform data
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 2, 2022 at 7:08 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The only user of max732x_platform_data is arch/arm/mach-pxa/littleton.c
> and it only uses .gpio_base. So drop the other members from the data stru=
ct
> and simplify the driver accordingly.
>
> The motivating side effect of this change is that the .remove() callback
> cannot return a nonzero error code any more which prepares making i2c
> remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Nice one! Applied, thanks!

Bart
