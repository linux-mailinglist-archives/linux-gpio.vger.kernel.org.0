Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39003416A9D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 05:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244053AbhIXDur (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 23:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244019AbhIXDuq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 23:50:46 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C689C061574;
        Thu, 23 Sep 2021 20:49:14 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id e16so5746717qts.4;
        Thu, 23 Sep 2021 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aeqPl8lRAJi/jngCXcVyekAXBb4CJKVOEfw9KCRibJE=;
        b=bL87uALhnZQ7xyPEXWDW+jMNYZp8S1nxJnEOCde4kDE2gW+iIKz1JpNCa8ITDhxB4+
         vxSC6lBz8iFjEU1lWVimNSvB70bTO+uHyq/8juHZ2lM9KnsmHh+ntXKCa9cowFJ7mciB
         gKG7YAO2bN9c2+K1TtAvImHkI6wTRX8tVt7pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aeqPl8lRAJi/jngCXcVyekAXBb4CJKVOEfw9KCRibJE=;
        b=kIpC0SBcacuOl+gwWKyYmMdt+I6ieYmCwNVv5gSDFBXAL1sIrf9xkpQr+Jo3huBKyw
         mPi8rwO2ZMWPTBvFjLy51CXF86XNI2sZgODUYqIN40nUyHWIr3aVlYJiOvfJ/9mvVxFE
         MmYIMQmnHUyo54LSv/Top9Q6OEYAlzrkIavYDIhEr/uCfWCOzXJCHRuoQ33dCfuxbiEF
         kEgtoP/ATekzUANQn3hNA4tnqJIyD/l53ogcqdUhH/1eoSQH954AUV53FcjhyM+FKxg9
         YLFvxi5jyZtZ6Op+LuRuJe4I0GQPvsDso/K6MDcEs/EQMAoL495fKOVcqB2/kdAEdXH2
         Il1g==
X-Gm-Message-State: AOAM532ouypu7V3Yno0EfGpNegMtXJawkMJkOlUJmoN0wHFgS+QVAFZ5
        mx2y7uDXHR657I7G2Al+L8k4p44IpAmWEmFVeVI=
X-Google-Smtp-Source: ABdhPJxpnTgNiXHwv0NhWyHlGgi4NFqri8IWBT5HGvaXlbmezTaEoOzlqXTHAWdP3EPM4UyatB9FeyfhDIuRLao8CAU=
X-Received: by 2002:a05:622a:45:: with SMTP id y5mr2109484qtw.145.1632455352824;
 Thu, 23 Sep 2021 20:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 24 Sep 2021 03:49:01 +0000
Message-ID: <CACPK8XdTCfXVqDnBHcmbp4Zy=UKW5pZGAi1eiiDsUwu6=_+sig@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-leds@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 Sept 2021 at 04:39, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This is a rework of a Rube Goldberg-inspired RFC I posted previously:
>
> https://lore.kernel.org/lkml/20210723075858.376378-1-andrew@aj.id.au/
>
> This time around there's a lot less Rube - the series:
>
> 1. Contains no (ab)use of pinctrl
> 2. Always exposes all pins as GPIOs
> 3. Internally tracks the active pins
>
> Without these patches the driver limits the number of pins exposed on
> the gpiochip to the number of pins specified as GPIO in the devicetree,
> but doesn't map between the GPIO and pin number spaces. The result is
> that specifying offset or interleaved GPIOs in the devicetree gives
> unexpected behaviour in userspace.
>
> By always exposing all pins as GPIOs the patches resolve the lack of
> mapping between GPIO offsets and pins on the package in the driver by
> ensuring we always have a 1-to-1 mapping.
>
> The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
> possible to not expose any pins as LEDs (and therefore make them all
> accessible as GPIOs). This has a follow-on effect of allowing the driver
> to bind to a device instantiated at runtime without requiring a
> description in the devicetree.
>
> I've tested the series under qemu to inspect the various interactions
> between LEDs vs GPIOs as well as conflicting GPIO requests.
>
> Please review!

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
