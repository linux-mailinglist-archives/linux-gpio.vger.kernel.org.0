Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E599677E77
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 15:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbjAWOzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 09:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjAWOzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 09:55:31 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E792514E92
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 06:55:30 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id l125so13155723vsc.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Afo9bHXYNa1IrhYDCRcygJIlfvCyuZMstO4qBieBHQQ=;
        b=POML8wsEFnuJM1g5G+QMKnLZ4CHyBivMzCdOxQffu32Ysj/jxDZcbxoA+hSVdUikzG
         7MO0X+g0y/2HWskQD06lM73IYKTQaVzppd6BoEm5nUBj8JD/V4iwURCwtoRIk8FLDQK5
         jauSqfXML6KLrqiN3PuHPksxybASOgS88FmHirmhclgmgB8e6sJ9qUUudzkXI23Mm5DE
         1EtF4KxnowKxjXbZifHjzJOq9rlhkGp3iuH+5BXEsFGSBnEtInC3pVseb1apVB5t+i5T
         vBkzEraisd1ac4ZWtibITaPG8m7X8kRiTPLBWSBEpxqQ87vo1ZatgpWtntgikO89Rj0H
         BVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Afo9bHXYNa1IrhYDCRcygJIlfvCyuZMstO4qBieBHQQ=;
        b=Jr0ga6RhaIiPwUxfRl2XIL+VM/h4ahYIkjFDgZPLALs498cdzxfKoa3exFEd/+ufWj
         wTY9P61y2apn0KMS38ZeYRj1Mk6g4vXlCG2dZptq0KSsSQNuMH45Te3a7roLdhogpJO/
         xUay3pP+yQCDFIg7TnckEqviyYq0ON1oKACAgIEb/1Noent5CtiFd8vS8riOhJE38jQh
         eZyEJkvFE0rUzZsRtH8cCbfuGFcPjmLpsGybLKqT9AM4IRqobquMqSgEdxhx0C3IOaDY
         +TCNhwookR8AlyZgUPpOqCK7Zp98jXtmjkPx2ymXVE8D3bCnHChKd0brWGVUj/vBC2yf
         jwfQ==
X-Gm-Message-State: AFqh2kokJS12vOQPdpCgAEqsYb02kNJmEID4VtHB9FHw5rKIDsvLjpaB
        72ufYaLsat+5K/L+N0gNO+KZg4MlxzxMyeumrrOsDg==
X-Google-Smtp-Source: AMrXdXs1ZRoOWSHXaLuk1Tdpz0QHR71dXgid5Mv90p3WI9ZD5MQ8ayTlG4o+7mbxs6Vy5unTmnDx2jsJToNV4b0Y3RU=
X-Received: by 2002:a67:f2da:0:b0:3d3:d90c:5ef2 with SMTP id
 a26-20020a67f2da000000b003d3d90c5ef2mr3966890vsn.17.1674485729695; Mon, 23
 Jan 2023 06:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
In-Reply-To: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Jan 2023 15:55:18 +0100
Message-ID: <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linus.walleij@linaro.org, shawnguo@kernel.org,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi all,
>
> I stumbled over the following warning while testing the new v6.2-rc4 on
> a imx8mm-evk:
>
> [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
>
> The warning was introduced by commit [1] but at least the following
> drivers are parsing the alias for a gpiochip to use it as base:
>  - drivers/gpio/gpio-mxs.c
>  - drivers/gpio/gpio-mxc.c
>  - drivers/gpio/gpio-clps711x.c
>  - drivers/gpio/gpio-mvebu.c
>  - drivers/gpio/gpio-rockchip.c
>  - drivers/gpio/gpio-vf610.c
>  - drivers/gpio/gpio-zynq.c
>
> According commit [2] it seems valid and correct to me to use the alias
> and the user-space may rely on this.
>
> Now my question is how we can get rid of the warning without breaking
> the user-space?
>
> [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
>

The warning is there to remind you that static GPIO base numbers have
been long deprecated and only user-space programs using sysfs will
break if you remove it, everyone else - including user-space programs
using libgpiod or scripts using gpio-tools that are part of the
project - will be fine.

Any chance you can port your user-space programs to libgpiod?

The warning doesn't break compatibility so I'm not eager to remove it.

Bart
