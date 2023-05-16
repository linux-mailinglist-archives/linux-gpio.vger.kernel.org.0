Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60A1704831
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 10:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjEPIwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 04:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjEPIwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 04:52:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CB34C0E;
        Tue, 16 May 2023 01:52:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3DFD063663;
        Tue, 16 May 2023 08:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90387C433D2;
        Tue, 16 May 2023 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684227119;
        bh=5i87WjgwyMiViOIMguz296sht10SHl9HYvunIq8Fdz4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QLNhcuAENyPWj8HBP1xQi92yQxaGrmxituQp8obI3cx7BjaPVB9+qsvvsvlI4Nqgf
         u9K1wOfF+YfKEf4fhK3iI5ee+6qgGb8I9l8eonvaN4PeSuzlq+BzFeB/NuzdKw45tc
         fn5rSwzJFYbqRvRD2T0Bike6LbN5JyhXXNm+dD+kZ3XAydlEsduQ9US8S7kqe35Cmi
         nOjb9Wew+jxCiWaQv9ICqZTPNKMpaXCUsqk/2ytILmk5a7V6VPJtoIPI+sZblVbsoS
         l7YSO3KKqTC7c5miN190ZnZXEcXB6xx43fCS6g99KF/COv9tKlP9rtCkDbmUVtCR1M
         pCyqIxfYS9kmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1pyqPV-00FTKi-5E;
        Tue, 16 May 2023 09:51:57 +0100
Date:   Tue, 16 May 2023 09:51:56 +0100
Message-ID: <86h6scmzf7.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, tglx@linutronix.de, linus.walleij@linaro.org,
        vkoul@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
        pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
In-Reply-To: <20230515112554.GA10825@google.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
        <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
        <86o7mpmvqq.wl-maz@kernel.org>
        <20230512153933.GH68926@ediswmail.ad.cirrus.com>
        <86mt29mt2m.wl-maz@kernel.org>
        <20230515112554.GA10825@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: lee@kernel.org, ckeepax@opensource.cirrus.com, broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de, linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 15 May 2023 12:25:54 +0100,
Lee Jones <lee@kernel.org> wrote:
> 
> On Fri, 12 May 2023, Marc Zyngier wrote:
> 
> > On Fri, 12 May 2023 16:39:33 +0100,
> > Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > > 
> > > On Fri, May 12, 2023 at 04:10:05PM +0100, Marc Zyngier wrote:
> > > > On Fri, 12 May 2023 13:28:35 +0100,
> > > > Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > > > > 
> > > > > The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> > > > > (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> > > > > for portable applications. It provides a high dynamic range, stereo
> > > > > DAC for headphone output, two integrated Class D amplifiers for
> > > > > loudspeakers, and two ADCs for wired headset microphone input or
> > > > > stereo line input. PDM inputs are provided for digital microphones.
> > > > > 
> > > > > The IRQ chip provides IRQ functionality both to other parts of the
> > > > > cs42l43 device and to external devices that wish to use its IRQs.
> > > > 
> > > > Sorry, but this isn't much of an interrupt controller driver. A modern
> > > > interrupt controller driver is firmware-driven (DT or ACPI, pick your
> > > > poison), uses irq domains, and uses the irqchip API.
> > > > 
> > > 
> > > Apologies but I really need a little help clarifying the issues
> > > here. I am totally happy to fix things up but might need a couple
> > > pointers.
> > > 
> > > 1) uses the irqchip API / uses irq domains
> > > 
> > > The driver does use both the irqchip API and domains, what
> > > part of the IRQ API are we not using that we should be?
> > > 
> > > The driver registers an irq domain using
> > > irq_domain_create_linear.  It requests its parent IRQ using
> > > request_threaded_irq. It passes IRQs onto the devices requesting
> > > IRQs from it using handle_nested_irq and irq_find_mapping.
> > > 
> > > Is the objection here that regmap is making these calls for us,
> > > rather than them being hard coded into this driver?
> > 
> > That's one of the reasons. Look at the existing irqchip drivers: they
> > have nothing in common with yours. The regmap irqchip abstraction may
> > be convenient for what you are doing, but the result isn't really an
> > irqchip driver. It is something that is a small bit of a larger device
> > and not an interrupt controller driver on its own. The irqchip
> > subsystem is there for "first class" interrupt controllers.
> 
> I'm not aware of another subsystem that deals with !IRQChip level IRQ
> controllers.  Where do simple or "second class" interrupt controllers
> go?

This isn't an interrupt controller. This is internal signalling, local
to a single component that has been artificially broken into discrete
bits, including an interrupt controller. The only *real* interrupts
here are the GPIOs.

I'm happy to see an interrupt controller for the GPIOs. But the rest
is just internal muck that doesn't really belong here. Where should it
go? Together with the rest of the stuff that manages the block as a
whole. Which looks like the MFD subsystem to me.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
