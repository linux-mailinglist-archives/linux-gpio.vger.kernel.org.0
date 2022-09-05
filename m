Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 355305AD5F6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237156AbiIEPQ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236825AbiIEPQ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:16:26 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3F6B4C
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:16:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 4BCB541E2F;
        Mon,  5 Sep 2022 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662390983; bh=SnH+V+R2GJ662ezyRKhqvJs4sp4YS/auEDgqtiyNbXY=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=vfVRk4l1phRl5WI5mhxMh2gc7IloxwsMuJfGw7RRIJB4AjB2TJL490OULhTi2+Llo
         sYxBS5EV0vx5Z3JJ21Hy8hERURHoayJAV52IwP5bg7SbnQt4yL7F3EoOAv+UL/MVk4
         mgcLeRIxIgQMUjOcCQJuorWGVgJcMY1z2nJ/naUV92D0R0mCtcTt3vigMyIgbDJ+nP
         +DXpei6EMEtqLNxOyT2OUimKckpIRPjBgOmrZHK3gzS+xyxkD8E4sQlmpYDssRjZJr
         Y3uW9IFIDCvwT5AUTFskMJxW1rWuLh66JzdvbfUFaVODlaaVIYOCZxOIxdHQ79gkSz
         MRH+8qyzn0VFQ==
Message-ID: <92f95d06-c02b-2173-90ad-71f7d365d56f@marcan.st>
Date:   Tue, 6 Sep 2022 00:16:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
In-Reply-To: <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/09/2022 19.05, Russell King (Oracle) wrote:
> but even that isn't _that_ nice. I'd like to hear comments from the Asahi
> folk about whether these sub-blocks of the SMC can have compatibles, so
> that the MFD layer can automatically fill in the firmware nodes on the
> struct device before the probe function gets called.

I'm fine with adding compatibles if this makes the of/fwnode handling
simpler. However, keep in mind these aren't hardware, they're
effectively software services implemented in a coprocessor. The idea
behind not having compatibles was that the SMC stuff should be
self-discovering enough that it can decide what's available and not at
runtime, and that the SMC core needs to probe before the child devices
anyway, so it's not like this can be a simple-bus. But I'm new to the
MFD subsystem, so if compatibles make life easier, sure.

Personally, I'd defer to Rob's opinon on this (CC'ed), since he has the
last word on DT bindings :).

- Hector
