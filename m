Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53803421893
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 22:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbhJDUna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 16:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhJDUn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 16:43:29 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60681C061745
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 13:41:40 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id n64so23346512oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Oct 2021 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+izU4J5bYsSH3R+RuetF7ONT2ktU7ChIhXQwoWP/W0Y=;
        b=imLBdtvhuPT+pvpu/Cf4J9jnO9IkN0tH14wK3oRZ/+b3zLNJem3mArO4ie/Sc1DM4c
         G0mWz+8DBlz47iQWuL3MkviVsa1onOQmqYNu04PzLcY2PKKhU4mvOkwWW+Bxp62FJnqS
         49Z6lfeMq9T4JTo/3Ezw2nUU0s7t0w0UKGAbk1GI2sGt0jVzDQAPc+899HAuOsReDarP
         i8It7OBwl4a5/nUNt9HCwu9rG/6mBsYyRGjWUrDmdzpXQzZsgzZ71E41gJKWeEzt/k84
         pFyeNyx/Ojw+ENot2rPshfO4KWeGytuNaxLuiDjtthEm50d67IV4ld4z+1+axjwMitTi
         R/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+izU4J5bYsSH3R+RuetF7ONT2ktU7ChIhXQwoWP/W0Y=;
        b=Kh2Ij2Ybd60Vt1LqHg4aA92RIUQvGcBNvh4ETBd9Y0bZdf8emdoyRiYO0+QQI2hKbj
         OL5EizaqICZDS7rwd0PDUOItea6Tq6i0Na9LtLCsQUT0G2mwH3gGCtZ6VqVrMiP3HSpK
         wzGAhUneVboa7HCr4Xv3YleBQ18EKiOBBN/YwUkzZYSD7Y+4hpZ92H/DfKqUfAMvjQBS
         BSKnv7Kljn486Soe4CQFnspFsx7QgFON1cn76SREAbmcGRDm1W4BrYp5niyB2Zuq+D4c
         UewiaPGxDRIS2sB2XCsog6vqrYzPWJhpIDHKlskfGN1tM5mmcU04qRFZSqvgTcwBnfF4
         OLAQ==
X-Gm-Message-State: AOAM530jHu2ktLXLfevzLedRKptks5UgFsCsgESzdOBcwZzi2Vl6Qli/
        vOTtrzzYN8Bxd3vkUzJTI91hzw==
X-Google-Smtp-Source: ABdhPJwVYjHGjS49VAplJNccS1unY/urlFdVwfPxw0BrqsEIdgT4LIhQcGl69wZZ4Ovz4RYJ0137Pw==
X-Received: by 2002:aca:3656:: with SMTP id d83mr3448263oia.176.1633380099619;
        Mon, 04 Oct 2021 13:41:39 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id u25sm3019137oof.48.2021.10.04.13.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:41:39 -0700 (PDT)
Date:   Mon, 4 Oct 2021 13:43:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
Message-ID: <YVtnanxVSGR0QJv2@ripper>
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
 <YUfZbsf3MX1aQJ2+@builder.lan>
 <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
 <YUoHr0F9qjr2Toeb@ripper>
 <2d2891e2-0cdf-1938-f9a1-77135066f5de@codeaurora.org>
 <YVXP46FvzmZ1xDvY@ripper>
 <bc194561-d9f9-ed13-ead1-1a7252d7a5fe@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc194561-d9f9-ed13-ead1-1a7252d7a5fe@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 30 Sep 22:34 PDT 2021, Rajendra Nayak wrote:

> 
> On 9/30/2021 8:25 PM, Bjorn Andersson wrote:
> > On Thu 30 Sep 02:46 PDT 2021, Rajendra Nayak wrote:
> > 
> > > 
> > > 
> > > On 9/21/2021 9:56 PM, Bjorn Andersson wrote:
> > > > On Tue 21 Sep 03:39 PDT 2021, Rajendra Nayak wrote:
> > > > 
> > > > > 
> > > > > 
> > > > > On 9/20/2021 6:14 AM, Bjorn Andersson wrote:
> > > > > > On Fri 17 Sep 01:37 CDT 2021, Rajendra Nayak wrote:
> > > > > > 
> > > > > > > From: Prasad Sodagudi <psodagud@codeaurora.org>
> > > > > > > 
> > > > > > > egpio is a scheme which allows special power Island Domain IOs
> > > > > > > (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> > > > > > > TLMM functions with Island Domain functions.
> > > > > > > With this scheme, an IO can be controlled both by the cpu running
> > > > > > > linux and the Island processor. This provides great flexibility to
> > > > > > > re-purpose the Island IOs for regular TLMM usecases.
> > > > > > > 
> > > > > > > 2 new bits are added to ctl_reg, egpio_present is a read only bit
> > > > > > > which shows if egpio feature is available or not on a given gpio.
> > > > > > > egpio_enable is the read/write bit and only effective if egpio_present
> > > > > > > is 1. Once its set, the Island IO is controlled from Chip TLMM.
> > > > > > > egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
> > > > > > > 
> > > > > > > The support exists on most recent qcom SoCs, and we add support
> > > > > > > for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
> > > > > > > 
> > > > > > 
> > > > > > I was under the impression that this feature would allow you to
> > > > > > repurpose pins for use either by the remote island or by apps.
> > > > > 
> > > > > thats right, you can repurpose the pins for usage by apps by setting
> > > > > the egpio_enable to 1, when set to 0 its owned by the island processor.
> > > > 
> > > > Good.
> > > > 
> > > > > > 
> > > > > > But if I understand your proposal, you check to see if the pin is
> > > > > > "egpio capable" for a pin and if so just sets the bit - muxing it to
> > > > > > apps (or the island?).
> > > > > 
> > > > > Right, so if there is a request for a egpio-capable pin, the driver
> > > > > flips the ownership. Are you suggesting having some kind of checks to determine
> > > > > who should own it?
> > > > > 
> > > > 
> > > > I see, I missed that nuance. So Linux will steal any pins that are
> > > > mentioned in DT. But that would mean that you're relying on someone else
> > > > to ensure that this bit is cleared for the other pins and you would not
> > > > be able to explicitly flip the state back to island mode in runtime.
> > > > 
> > > > I would prefer that this was more explicit.
> > > > 
> > > > > > It seems reasonable that this would be another pinmux state for these
> > > > > > pins, rather than just flipping them all in one or the other direction.
> > > > > 
> > > > > hmm, I don't understand. This is not a pinmux state, its a switch to decide
> > > > > the ownership.
> > > > 
> > > > But does it mux the pin to the island, or does it state that the island
> > > > is now in charge of the associated TLMM registers?
> > > 
> > > The island processor does not access the APPS TLMM register space, it has its
> > > own TLMM register space that it configures. APPS TLMM registers control its
> > > mux/conf settings and Island TLMM registers controls its mux/conf. So essentially
> > > there are 2 sets of registers to control the same pin.
> > > This bit is more like a top level mux which decides what register settings
> > > take affect.
> > > 
> > 
> > "One mux to rule them all" :)
> > 
> > When we switch this mux towards the Island TLMM, do we need to configure
> > the APPS TLMM in a particular way, or does the state of that not matter?
> 
> No APPS TLMM settings should be needed, the state of that does not matter.
> 
> > Would it be reasonable to say that when muxed towards the island the
> > apps should always be in gpio mux with some predetermined properties, to
> > save power?
> 
> No, the the register settings in APPS TLMM are nop/dont care when egpio_enable is 0.
> 

That's good.

> > To reiterate, as proposed, mentioning a egpio-capable pin in the apps
> > DTS will cause it to be muxed to the APSS TLMM. But I'm not convinced
> > that we don't have scenarios where one might want to dynamically mux the
> > pin between island and apss tlmm.
> > 
> > My suggestion is that even that it's two independent muxes controlled in
> > the apps tlmm, we'd express them in the same pinmux, i.e. we'd have
> > something like:
> > 
> > some-local-state {
> > 	pins = "gpio1";
> > 	function = "gpio";
> > 	output-high;
> > };
> 
> so this would set the function to gpio in the APPS TLMM and set the egpio_enable = 1?
> which was also what the original $SUBJECT patch did.
> 

Right, the effect for any of the today defined functions would be the
same as the patch you proposed.

> > some-remote-state {
> > 	pins = "gpio1";
> > 	function = "island"; /* or just egpio... ? */
> > };
> 
> Here we add a new function to the pin and that's used to set the egpio_enable to 0?
> 

Yes.

> > One case I imaging where this could be useful is to allow Linux to
> > configure a known state of pins when the island isn't running, from the
> > remoteproc driver and then flip it over to island mode before booting
> > the remote.
> 
> So we save power during boot up until the island processor comes up?
> So fwik when we boot linux its either configured to boot the island processor
> or not. Are you talking about some scenario where the island processor comes
> up on demand and goes down when not used?
> 

Perhaps I'm just paranoid, but I do like the idea of being able to
explicitly describe the "island configuration" in DT, rather than
relying on an implicit "if I don't define the node it's probably in
island mode".

I was in particular thinking about the case where the remote stops, but
I guess that should only happen very shortly before the remote is
restarted again.

The other thing that your proposed patch rely on is that all
egpio-capable pins are left with egpio_enable = 0 by the bootloader,
because the only way to flip a egpio_enable = 1 to a 0 is to recompile
and re-sign the bootloader.

Regards,
Bjorn
