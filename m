Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEDE25257AA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 00:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359090AbiELWSO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 May 2022 18:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352682AbiELWSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 May 2022 18:18:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF9B5DA59;
        Thu, 12 May 2022 15:18:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 76E8B61FBE;
        Thu, 12 May 2022 22:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5978C385B8;
        Thu, 12 May 2022 22:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652393891;
        bh=tLlse9Ptk18riW3NRcxJx2+E7xjxRC2cJ9RqvGFV72s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bpj/WZF+DtqdeI+aJJ4bK/MEKl/Vgqwl4ocyOt1fNlWZM/8QKOdoQVa1y0v9gtW0W
         AnIxQlpXbB0axVtv8wkSMyCy64J4eUOw6/qCntZ3nVkFeshcOgMhFgBB5D0RPm/vjR
         GJ/rGxlMF4rV4oaIGh4kbzbLBROYixs/xhmP0Axs5sskp6B5TxGlAaRYFdo10My09q
         yvaJJ2fsIp3/c9DUYMK+s+4RYT/y5LErMl/eEiT29SEZGzeQaD0myoAeRQcDVQG/Cd
         SKJgAdgbbuty/fNvOHHKQLC66CfLFWtJDG1OfOfcd5kmvZ8aEUxTvteTbUWR5bC1++
         iT6lJsBAKZrPQ==
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1npH8L-00AzWE-02; Thu, 12 May 2022 23:18:09 +0100
Date:   Thu, 12 May 2022 23:18:07 +0100
Message-ID: <87tu9umm3k.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
In-Reply-To: <Yn1Fe4WPp3ZaUERj@smile.fi.intel.com>
References: <20220419141846.598305-1-maz@kernel.org>
        <Yn0/DIl3+i/heRH6@smile.fi.intel.com>
        <Yn1Fe4WPp3ZaUERj@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com, joey.gouly@arm.com, jonathanh@nvidia.com, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, bjorn.andersson@linaro.org, agross@kernel.org, jeffrey.l.hugo@gmail.com, tglx@linutronix.de, Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 May 2022 18:35:55 +0100,
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
> On Thu, May 12, 2022 at 08:08:28PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 19, 2022 at 03:18:36PM +0100, Marc Zyngier wrote:
> > > This is a followup from [2].
> > > 
> > > I recently realised that the gpiolib play ugly tricks on the
> > > unsuspecting irq_chip structures by patching the callbacks.
> > > 
> > > Not only this breaks when an irq_chip structure is made const (which
> > > really should be the default case), but it also forces this structure
> > > to be copied at nauseam for each instance of the GPIO block, which is
> > > a waste of memory.
> > 
> > Is this brings us to the issue with IRQ chip name?
> > 
> > The use case in my mind is the following:
> > 1) we have two or more GPIO chips that supports IRQ;
> > 2) the user registers two IRQs of the same (by number) pin on different chips;
> > 3) cat /proc/interrupt will show 'my_gpio_chip XX', where XX is the number.
> > 
> > So, do I understand correct current state of affairs?
> > 
> > If so, we have to fix this to have any kind of ID added to the chip name that
> > we can map /proc/interrupts output correctly.
> 
> Hmm... Some drivers are using static names, some -- dynamically
> prepared (one way or another). Either way I think the ID is good to
> have if we still miss it.

No, this is a terrible idea. /proc/interrupts gives you a hint of
which driver/subsystem deals with the interrupt. This isn't a source
of topological information. /sys/kernel/debug/irq has all the
information you can dream of, and much more. Just make use of it.

	M.

-- 
Without deviation from the norm, progress is not possible.
