Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7174E7891
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Mar 2022 17:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiCYQDi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Mar 2022 12:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376674AbiCYQDb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 12:03:31 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1442A9F38E
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 09:01:54 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id y6so5951433plg.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WVe7vUBHguusdempKlMD4/7egQrK1x0/9v7ZHHVmrak=;
        b=Lf/po27eItEtnnueu+rsj5iZzfhG3emVH+f78rfLLYt/aZ0ISYC/q75edjlGdaotpe
         yI1BW03PPh8Bflz5d0OMvcvGqjJtNc9QpMD6O2zeZjrXy8MQTE5zFphpnANZdTJRfZi8
         PyghdJN4vtxXh1xW6nmbSfjru59R1bqV5Optde56YI+DDqxjNBtp3y/gT4e5EK2QHYJG
         BJf6pXQDJ8/P9092bwVMRSYEki72vR1bb40AX6s/gGs9RGQx7ykMJtbgbRsAG2qiXWBG
         dO6Q8fTjt4PYr3lW+oVeRZQNup+Vr9RkaAj4hbYNInMtLz70fMdr138c2yJ4CqosNxoL
         /OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WVe7vUBHguusdempKlMD4/7egQrK1x0/9v7ZHHVmrak=;
        b=GHmAW2cif0aQVZKCoyKkOPKwa35Fldbcsl2acEUwrg3dWXG9Zbt0pxKURF/7KeGDTn
         fmAvEZXKOK0S6j98NJUCvYsyT+ABmobVXHETqoqzuZZyMbaVO0ldrSbc3hW2QEc87DFP
         7paMXRFOTsShZQlHVIOhqMycp7ER/3C4hx7BkekRQ3EpY4RNL2yuvpXLuE7OGKkTi/q9
         DicLfRpsup5HhlvbkXEGx1okdqdpAdG4+qxKm7aWaybe9s0xV2cG6HIScArqmT2SVEXk
         j7crtrcl0u4wmFG+tJZLUQOa7FUCsRqYHHnhUC3ECZIzmDUXnpXBuN/WQBzbx5nyYm9O
         cLkg==
X-Gm-Message-State: AOAM53268xMMDJS67UKHkWdt4/T4M1GWulOlJ8M4M+/jdN3K2c64r0t6
        +9blC3ODIy9de44Ot3n2Zo5MCmi7fKT9sQ==
X-Google-Smtp-Source: ABdhPJwflI9/HmrzxxgrsDPYrImSTUXg+s/nKcO6pbpQ4IUxCuAaFxsGfrGQFm7JOmeXF8URVmoxqw==
X-Received: by 2002:a17:90a:ba10:b0:1bf:6900:2c5d with SMTP id s16-20020a17090aba1000b001bf69002c5dmr25904940pjr.36.1648224113534;
        Fri, 25 Mar 2022 09:01:53 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id s3-20020a056a00194300b004f6da3a1a3bsm7621097pfk.8.2022.03.25.09.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 09:01:51 -0700 (PDT)
Date:   Sat, 26 Mar 2022 00:01:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Subject: Re: [libgpiod] bug: pull-up does not work
Message-ID: <20220325160146.GA49114@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 25, 2022 at 04:13:11PM +0100, Jiří Prchal wrote:
> 
> 
> On 25. 03. 22 15:57, Kent Gibson wrote:
> > On Fri, Mar 25, 2022 at 11:02:07AM +0100, Jiří Prchal wrote:
> > > Hi,
> > > since in debian is 1.6.2 and pull-up doesn't work so I cloned git, branch
> > > next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, same result.
> > > 
> > 
> > You mean it doesn't work for you on your platform.
> > 
> > The libgpiod-2.0 branch is a work in progress and should not be considered
> > the place to go to find solutions to problems with v1.6.
> > Not that I'm saying that the v2 branch doesn't work, I'm actually pretty
> > sure it does, but its purpose is to switch to the latest kernel uAPI, not
> > to provide fixes, should they be needed, for v1.6.
> Just thought api v1 doesn't support pull-ups so tried v2.

v1 does support bias since Linux v5.5, and libgpiod added support in v1.5.

> > 
> > > ~# uname -r
> > > 5.17.0-rc7_cpm9g25
> > > 
> > > floating pins should go with pull-up/down
> > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > 0 0 0 0 0 0 0 0
> > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > 1 1 0 0 0 0 0 0
> > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > 0 1 0 1 0 0 0 0
> > > 
> > > ~# gpioget -v
> > > gpioget (libgpiod) v2.0-devel
> > > 
> > > Whats wrong with it?
> > 
> > You forgot to mention which of those pins are floating.
> All of them.
> > Or what gpiochip3 is and whether it supports biasing.
> AT91SAM9G25, hw supports pull-ups.
> > 
> > So does your chip support pull-up/down?
> > The kernel can only enable it if the hardware and pinctrl driver supports it.
> Is there possibility that pinctrl doesn't support it? I think other gpios
> used in kernel are with pull-up.
> Example:
> pinctrl@fffff400 {
> 	1wire {
> 		pinctrl_1wire: 1wire-0 {
> 			atmel,pins = <AT91_PIOC 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>; /* PC0
> PIO, pull-up */
> 		};
> 	};
> };
> 

Pinctrl and device tree are outside my area, but my understanding is
that setting via DT is a separate interface, so while it may be
supported by DT it may not be via the gpiolib interface.
But I will defer to anyone else on that.
(CCing in Andy since I'm pretty sure he would know)

Not sure which pinctrl is relevant for your case.
pinctrl-at91 doesn't appear to support setting the pull-up via the gpiolib
interface, but pinctrl-at91-pio4 does, so my guess would be you are using
the pinctrl-at91.

But again, this is outside my area so you would need to confirm that
yourself or get feedback from someone else.
If you determine that you are using a pinctrl that supports setting
bias via gpiolib then we'll have to do some more digging.

Cheers,
Kent.

