Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B20B262421
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 02:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgIIAe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 20:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIIAe4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 20:34:56 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2711EC061573;
        Tue,  8 Sep 2020 17:34:55 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u13so776864pgh.1;
        Tue, 08 Sep 2020 17:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5uNeaE2Rby/fnh3O4xhlUXs/uwBS9UavtgyEhlwwdSg=;
        b=sPXC7IsLPz2deia5p0HcEvsDKR9Kr9crl7xYr/9eu5D8tyxWOUHPSEF22CnqKWsN9s
         y/fwUO6jW6b7YrclRXF1jvV8UKzwH0L30fJByTWmghdYjXTcc/ukXgxMDZo9rokArl4H
         L+0+iX7RI9bUg3cEDditunnR0787Sz0mQg3bHOJ8m1oUHKFnSsEx/9wvhDpCNNYy5Fu5
         RDoBSoaYhWipgzCQ7A4L9e3hagfbmofsl1Tc2qJVQ5UIYewGO5XPEcQKiKID6HRUvRMY
         lTvounISuepcxoZqvoNsm/d7RQba7VJs3BiRoCC+8r0KbId1J1cU44g/uhv6T/7XNO10
         NEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5uNeaE2Rby/fnh3O4xhlUXs/uwBS9UavtgyEhlwwdSg=;
        b=U5HhPmDE1e7vOAIJ20SIS0GJ4WjzR+VuhvPvTWkxTcZdTYbtjzoQbwvoQiRnw8pr6h
         ggKWG2iZfxIzlLWwSaM7WTwbnWHxRk/QEt/9A6e5nhL6xVkZAAf8OBafpE6ixnfBVk6W
         bgm4LWUucYG7gmGayHhGyI9QgC/fgUdad3wKrKoDXRZVusu1MJW7qNjuGrfA09NmaIGI
         EZ3gkrEVpR8NEmv+3ThEnUwH2n8erm6avV+dsu1AMG4+J/AdKeV0WWO7m35JXm+G8QEG
         SHnMT0/WC2HS9ah5C+hvdSNk3zMVSywRzWs0aZa9rScy6Ncd0XJY/MQk/hZ0iXe0oMtP
         CqRQ==
X-Gm-Message-State: AOAM533UScRs2thNj3haCNBGelpIOKvOXP8YZpGEtwII78ztYjeSvR5l
        mzeyyT7GoS/A6nNowkxrQ7w=
X-Google-Smtp-Source: ABdhPJwyvCbykwwDH6n64RR0FkjJokMm2pR13sCHSy9QE0J+66OUiBwzezq0TSZTyrQvgYntDRBeng==
X-Received: by 2002:a17:902:8a93:: with SMTP id p19mr1175793plo.101.1599611694678;
        Tue, 08 Sep 2020 17:34:54 -0700 (PDT)
Received: from zen.local (174-21-64-208.tukw.qwest.net. [174.21.64.208])
        by smtp.gmail.com with ESMTPSA id l12sm315018pjq.31.2020.09.08.17.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 17:34:54 -0700 (PDT)
From:   Trent Piepho <tpiepho@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        "bcousson@baylibre.comLinus Walleij" <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
Date:   Tue, 08 Sep 2020 17:34:53 -0700
Message-ID: <3192458.miyTKKkx7g@zen.local>
In-Reply-To: <20200701013320.130441-3-drew@beagleboard.org>
References: <20200701013320.130441-1-drew@beagleboard.org> <20200701013320.130441-3-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday, June 30, 2020 6:33:20 PM PDT Drew Fustini wrote:
> Increase #pinctrl-cells to 2 so that mux and conf be kept separate. This
> requires the AM33XX_PADCONF macro in omap.h to also be modified to keep pin
> conf and pin mux values separate.

> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -278,7 +278,7 @@ scm: scm@0 {
>  				am33xx_pinmux: pinmux@800 {
>  					compatible = "pinctrl-single";
>  					reg = <0x800 0x238>;
> -					#pinctrl-cells = <1>;
> +					#pinctrl-cells = <2>;

>  #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> -#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> +#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)

If a dts file uses am33xx_pinmux from am33xx-l4.dtsi, but does not use the
AM33XX_PADCONF() macro for all pin settings, like say it uses AM33XX_IOPAD(),
then the dtb will be totally broken as pin addresses and values will all be
off.

Similarly, using AM33XX_PADCONF() with a different pinctrl defined elsewhere
would also break.

In the latest linux-next kernel, I found one case of the former problem, in
am335x-guardian.dts.

The barebox bootloader had all the am33xx boards broken when the dts change
was imported without adding the OR-two-values special case to the pinctrl
driver.  Which I then tracked to here.


