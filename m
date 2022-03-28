Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5009A4E9219
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 11:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240082AbiC1J61 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 05:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240108AbiC1J6Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 05:58:25 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1622A54BFD
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 02:56:44 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id o8so11843665pgf.9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CjQRkYh/ev1Xb4hpxT6hw8048hefmj9Fk5SPy+ddXa0=;
        b=RsNUnOoLLYodtHmr4QaYzWDCSX6QI1TAhR/GW6n1HQY72xZgkPE7wcAvQ1niwxaVNC
         S/NlXlQwVmZBJdFr4OchsDJI5p4PayX9fFvObAF1Nlju1ICwConlQblMHT1/i2q5UmBJ
         FIqRfC8ZN9lGI2kH9TdmT4vb/qMIMjyvl2e2BMHr8W7fwrvc00PLHfP4zNcLk+KCeIgm
         XA0j4X9RwkPBWA4ibrrpOkPJQRqzEOgQeJlBAg8UmiomKKBnrYm7vgC9uqmLQXEeO2iY
         xvYnIVm/zkjDaThPFWWYhUwP/cIeAxyjCKpYL0d2qK1HVa8SY0/ciBQLLg6NY1mRYG0g
         ia2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CjQRkYh/ev1Xb4hpxT6hw8048hefmj9Fk5SPy+ddXa0=;
        b=hC9IoDCAz/14rlXVQ63pAHZ7+7QQnFWzppI8HoRhpD2MK55oLfH2F9qPz8dCeHV7MP
         VauliWI5XgMEpMEolik7Z2e4EJm4eyLqq1Qh4wY62Skp9k4KxPO1kVu1syfP/H9SG14+
         KpTfROP9fgbr9bkoC3OYUPf2eMCawO7QmbtW1SpTNS4hjVy9WGjT6V0pKC/ELRV2S/cK
         +yFQmGV3beSgRhkvd+eU/BkN6Hd5PsngcBoLL1ogV+tA5/zMNheRC6m6JqJHTF+hwZe8
         VZXXJRugfwUNpjQyArJp4e+1fJQODQlsK+fFX0btaForRbp0rxR5VEq0cr+OV2fvfZAj
         dD3Q==
X-Gm-Message-State: AOAM530DUnYUBOULmt8d8ZcpoQaUhePJIdXtOj4YC5AknM0vPtHQiqvT
        d7MQhD29A29ytwjhyOSilkI=
X-Google-Smtp-Source: ABdhPJzIpoIrdTYU87lIkMtAuM3S5YRFUjlPWX3Tv1S05+1ez4i19Uf7l97RY3TVRg2dDXJoNpc5vw==
X-Received: by 2002:a05:6a00:4007:b0:4fa:9505:8ac0 with SMTP id by7-20020a056a00400700b004fa95058ac0mr22790071pfb.67.1648461403499;
        Mon, 28 Mar 2022 02:56:43 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id p28-20020aa79e9c000000b004fafa48f430sm13544835pfq.92.2022.03.28.02.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:56:42 -0700 (PDT)
Date:   Mon, 28 Mar 2022 17:56:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Subject: Re: [libgpiod] bug: pull-up does not work
Message-ID: <20220328095638.GA21834@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <0fe30371-3daa-6ab0-e9fb-baadf97c9aae@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fe30371-3daa-6ab0-e9fb-baadf97c9aae@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 10:58:20AM +0200, Jiří Prchal wrote:
> 
> 
> On 28. 03. 22 10:08, Kent Gibson wrote:
> > On Mon, Mar 28, 2022 at 09:12:16AM +0200, Jiří Prchal wrote:
> > > 
> > > 
> > > On 25. 03. 22 17:01, Kent Gibson wrote:
> > > > On Fri, Mar 25, 2022 at 04:13:11PM +0100, Jiří Prchal wrote:
> > > > > 
> > > > > 
> > > > > On 25. 03. 22 15:57, Kent Gibson wrote:
> > > > > > On Fri, Mar 25, 2022 at 11:02:07AM +0100, Jiří Prchal wrote:
> > > > > > > Hi,
> > > > > > > since in debian is 1.6.2 and pull-up doesn't work so I cloned git, branch
> > > > > > > next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, same result.
> > > > > > > 
> > > > > > 
> > > > > > You mean it doesn't work for you on your platform.
> > > > > > 
> > > > > > The libgpiod-2.0 branch is a work in progress and should not be considered
> > > > > > the place to go to find solutions to problems with v1.6.
> > > > > > Not that I'm saying that the v2 branch doesn't work, I'm actually pretty
> > > > > > sure it does, but its purpose is to switch to the latest kernel uAPI, not
> > > > > > to provide fixes, should they be needed, for v1.6.
> > > > > Just thought api v1 doesn't support pull-ups so tried v2.
> > > > 
> > > > v1 does support bias since Linux v5.5, and libgpiod added support in v1.5.
> > > > 
> > > > > > 
> > > > > > > ~# uname -r
> > > > > > > 5.17.0-rc7_cpm9g25
> > > > > > > 
> > > > > > > floating pins should go with pull-up/down
> > > > > > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > > > > > 0 0 0 0 0 0 0 0
> > > > > > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > > > > > 1 1 0 0 0 0 0 0
> > > > > > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > > > > > 0 1 0 1 0 0 0 0
> > > > > > > 
> > > > > > > ~# gpioget -v
> > > > > > > gpioget (libgpiod) v2.0-devel
> > > > > > > 
> > > > > > > Whats wrong with it?
> > > > > > 
> > > > > > You forgot to mention which of those pins are floating.
> > > > > All of them.
> > > > > > Or what gpiochip3 is and whether it supports biasing.
> > > > > AT91SAM9G25, hw supports pull-ups.
> > > > > > 
> > > > > > So does your chip support pull-up/down?
> > > > > > The kernel can only enable it if the hardware and pinctrl driver supports it.
> > > > > Is there possibility that pinctrl doesn't support it? I think other gpios
> > > > > used in kernel are with pull-up.
> > > > > Example:
> > > > > pinctrl@fffff400 {
> > > > > 	1wire {
> > > > > 		pinctrl_1wire: 1wire-0 {
> > > > > 			atmel,pins = <AT91_PIOC 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>; /* PC0
> > > > > PIO, pull-up */
> > > > > 		};
> > > > > 	};
> > > > > };
> > > > > 
> > > > 
> > > > Pinctrl and device tree are outside my area, but my understanding is
> > > > that setting via DT is a separate interface, so while it may be
> > > > supported by DT it may not be via the gpiolib interface.
> > > > But I will defer to anyone else on that.
> > > > (CCing in Andy since I'm pretty sure he would know)
> > > > 
> > > > Not sure which pinctrl is relevant for your case.
> > > > pinctrl-at91 doesn't appear to support setting the pull-up via the gpiolib
> > > > interface, but pinctrl-at91-pio4 does, so my guess would be you are using
> > > > the pinctrl-at91.
> > > pinctrl-at91-pio4 didn't help, syminfo says "for Atmel PIO4 controller
> > > available on sama5d2 SoC" but my is sam9g25.
> > > How can I find out if it supports gpiolib?
> > > > 
> > 
> > What does gpiodetect report?
> > That should given an indication which driver is being used.
> # gpiodetect
> gpiochip0 [fffff400.gpio] (32 lines)
> gpiochip1 [fffff600.gpio] (19 lines)
> gpiochip2 [fffff800.gpio] (32 lines)
> gpiochip3 [fffffa00.gpio] (22 lines)
> 
> Compiled and linked both pinctrl.

Ok, that isn't helpful, for me anyway, and I'm not sure where to go from
there. Hopefully someone else can chip in.

Cheers,
Kent.
