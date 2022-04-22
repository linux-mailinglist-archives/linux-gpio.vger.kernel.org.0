Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99BE050BA29
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 16:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343596AbiDVOgK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 10:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiDVOgK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 10:36:10 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F162A5A59F;
        Fri, 22 Apr 2022 07:33:16 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 817151F37F;
        Fri, 22 Apr 2022 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1650637995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/MJZREkQoOkcIzsntm8w4AEaaNqjLbeosQZdzW/Wx/Y=;
        b=C/fCgSNJX3yVbtTBTGNnSJKUDeF+k4GJD97ivJ4cbwoNdxQA1RytuXsAJdWzu6RgE1bYFq
        NIyNQEBOXyzWa4A7A5rmtWolykorDzo+fCZongbkxv8xhe1Mpd8TO1n7QuivYgm3JM1G6Y
        hdAITcpiekcmTA3Aha9oxZfbMfyCniQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1650637995;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/MJZREkQoOkcIzsntm8w4AEaaNqjLbeosQZdzW/Wx/Y=;
        b=gSxgPPeYTa2lJBafS2O4WWs+P9yia9McMxHOx7uQS07Ic7+FGL3eG9DmCf1AjXpdTJ2LRK
        QwaONnHX8dLvuUCw==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 7267E2C14B;
        Fri, 22 Apr 2022 14:33:15 +0000 (UTC)
Date:   Fri, 22 Apr 2022 16:33:15 +0200
Message-ID: <s5hy1zxrxw4.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Takashi Iwai <tiwai@suse.de>,
        Shreeya Patel <shreeya.patel@collabora.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev,
        Mario Limonciello <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [REGRESSION] Missing IRQ via amd_gpio
In-Reply-To: <e4c9bb60-210d-243a-e225-6b3546c0b42b@leemhuis.info>
References: <s5ha6cdtglj.wl-tiwai@suse.de>
        <e4c9bb60-210d-243a-e225-6b3546c0b42b@leemhuis.info>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Apr 2022 16:17:36 +0200,
Thorsten Leemhuis wrote:
> 
> Hi Takashi! Thx for CCing the regression list.
> 
> On 22.04.22 15:03, Takashi Iwai wrote:
> > Hi,
> > 
> > we received a bug report for 5.17.3 kernel showing a new error:
> > 
> >  amd_gpio AMDI0030:00: Failed to translate GPIO pin 0x003D to IRQ, err -517
> > 
> > Not only an error message but in practice this leads to a missing IRQ
> > assignment; the IRQ 27 is no longer assigned to amd_gpio driver.
> > 
> > As the error number (EPROBE_DEFER) indicates, this seems to be the
> > side-effect of the recent fix, the upstream commit 5467801f1fcb
> > ("gpio: Restrict usage of GPIO chip irq members before
> > initialization").  As far as I understand, the problem is in
> > acpi_gpiochip_request_interrupts() call that is called from
> > gpiochip_add_irqchip() itself.  Since it's called before the
> > initialized flag set, it always fails now.
> > 
> > Below is a temporary quick fix and it seems working.  But I'm not sure
> > whether I overlooked something obvious...
> 
> A patch that afaics will fix this hopefully should get merged really
> soon now:
> 
> https://lore.kernel.org/all/20220422131452.20757-1-mario.limonciello@amd.com/
> 
> See also v1:
> 
> https://lore.kernel.org/all/20220414025705.598-1-mario.limonciello@amd.com/

Thanks, good to know that we reached to the very same fix :)

So, feel free to take my tags to Mario's patch, if any:

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Tested-by: Takashi Iwai <tiwai@suse.de>


Takashi
