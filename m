Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DB441DCBA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 16:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351528AbhI3Oz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 10:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351530AbhI3OzZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 10:55:25 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A178C06176A
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 07:53:43 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id e24so7552108oig.11
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VIxcNt9zqnRNapqvBD226bMsuD2C6DbQkjAikT4Sfbs=;
        b=EZLK+026N367xK6Of3/3GFxZQGgcXh52/fAR/gMfyylEAMSLOjaGozS4BXHjQ0K/0K
         LUGvtSWNBkGbj3vK3NaM3SSlSlmXhEBUukIBUMcuNDEBcaKo29JVDhFwVhFH5z1k0Gvo
         Ejswi89qmuPtm2VivBxcTHW0bvbYqPLLm6Tc3PzXOGXXcHhChpAuSOGvtGhsYNz0v3KQ
         BCmp3DFDvaFHNeB2EP8FOGXDwgmbJCMGTjiU4uOYAgFnK7ihgh13gwKXhmDN4C7/EHGa
         0rhUVaPzBMur7fhj0lIC2F9eei/bW7mAO/kPsVadZyD1N39peE9xlYhe4pUyXEryKfZq
         A7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VIxcNt9zqnRNapqvBD226bMsuD2C6DbQkjAikT4Sfbs=;
        b=TR5h5XAPTQaLTl8hI5rBqn4gA1adyGL2wEHghbYOiCBfzc/vf+JJGrqyi8lvYBzkTF
         zxglWHwlyHnaKsbpo3PHOkiYfi+tn5AchJiZO6QDQFbhpBtIKCNO2DrL/D5DPZo8XVbf
         i1CUekQFoB2NL62/OFYOvBb8NwMk02q03rmRIWZLpHTjHuyN+vOJGBeuuXlEb4OvfZ4J
         WtVCA/lCuS9S7Bk4cOaClgAxZq0x+JLfoOLn9u7swVZ7YM9CdziqA+1ecFlL8ttlPd4w
         +HyKSBQZmUqis1An/Vke/bOZMoFjyI6WAqFDUizekQIth0laee4Wi+7Ji3Cu0HYFdhVr
         6eDA==
X-Gm-Message-State: AOAM530yjcBSU6QIN2iSd4Uu7fSA+xWXht8mWmtKEI0lYnVxIvHCwvsb
        h5CT5O4HMg/Zbi0VOyuHPbhub+oPX3wL9g==
X-Google-Smtp-Source: ABdhPJxoDnNjjvVhWww8Ms5gJnrwtghVKekf8KDWX4JcOvmCGqZvKZBxs7JTCgp9mPP+WeYCpgBpGA==
X-Received: by 2002:aca:744:: with SMTP id 65mr3319322oih.174.1633013622716;
        Thu, 30 Sep 2021 07:53:42 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m26sm606177otf.12.2021.09.30.07.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:53:42 -0700 (PDT)
Date:   Thu, 30 Sep 2021 07:55:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
Message-ID: <YVXP46FvzmZ1xDvY@ripper>
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
 <YUfZbsf3MX1aQJ2+@builder.lan>
 <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
 <YUoHr0F9qjr2Toeb@ripper>
 <2d2891e2-0cdf-1938-f9a1-77135066f5de@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d2891e2-0cdf-1938-f9a1-77135066f5de@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 30 Sep 02:46 PDT 2021, Rajendra Nayak wrote:

> 
> 
> On 9/21/2021 9:56 PM, Bjorn Andersson wrote:
> > On Tue 21 Sep 03:39 PDT 2021, Rajendra Nayak wrote:
> > 
> > > 
> > > 
> > > On 9/20/2021 6:14 AM, Bjorn Andersson wrote:
> > > > On Fri 17 Sep 01:37 CDT 2021, Rajendra Nayak wrote:
> > > > 
> > > > > From: Prasad Sodagudi <psodagud@codeaurora.org>
> > > > > 
> > > > > egpio is a scheme which allows special power Island Domain IOs
> > > > > (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> > > > > TLMM functions with Island Domain functions.
> > > > > With this scheme, an IO can be controlled both by the cpu running
> > > > > linux and the Island processor. This provides great flexibility to
> > > > > re-purpose the Island IOs for regular TLMM usecases.
> > > > > 
> > > > > 2 new bits are added to ctl_reg, egpio_present is a read only bit
> > > > > which shows if egpio feature is available or not on a given gpio.
> > > > > egpio_enable is the read/write bit and only effective if egpio_present
> > > > > is 1. Once its set, the Island IO is controlled from Chip TLMM.
> > > > > egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
> > > > > 
> > > > > The support exists on most recent qcom SoCs, and we add support
> > > > > for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
> > > > > 
> > > > 
> > > > I was under the impression that this feature would allow you to
> > > > repurpose pins for use either by the remote island or by apps.
> > > 
> > > thats right, you can repurpose the pins for usage by apps by setting
> > > the egpio_enable to 1, when set to 0 its owned by the island processor.
> > 
> > Good.
> > 
> > > > 
> > > > But if I understand your proposal, you check to see if the pin is
> > > > "egpio capable" for a pin and if so just sets the bit - muxing it to
> > > > apps (or the island?).
> > > 
> > > Right, so if there is a request for a egpio-capable pin, the driver
> > > flips the ownership. Are you suggesting having some kind of checks to determine
> > > who should own it?
> > > 
> > 
> > I see, I missed that nuance. So Linux will steal any pins that are
> > mentioned in DT. But that would mean that you're relying on someone else
> > to ensure that this bit is cleared for the other pins and you would not
> > be able to explicitly flip the state back to island mode in runtime.
> > 
> > I would prefer that this was more explicit.
> > 
> > > > It seems reasonable that this would be another pinmux state for these
> > > > pins, rather than just flipping them all in one or the other direction.
> > > 
> > > hmm, I don't understand. This is not a pinmux state, its a switch to decide
> > > the ownership.
> > 
> > But does it mux the pin to the island, or does it state that the island
> > is now in charge of the associated TLMM registers?
> 
> The island processor does not access the APPS TLMM register space, it has its
> own TLMM register space that it configures. APPS TLMM registers control its
> mux/conf settings and Island TLMM registers controls its mux/conf. So essentially
> there are 2 sets of registers to control the same pin.
> This bit is more like a top level mux which decides what register settings
> take affect.
> 

"One mux to rule them all" :)

When we switch this mux towards the Island TLMM, do we need to configure
the APPS TLMM in a particular way, or does the state of that not matter?

Would it be reasonable to say that when muxed towards the island the
apps should always be in gpio mux with some predetermined properties, to
save power?


To reiterate, as proposed, mentioning a egpio-capable pin in the apps
DTS will cause it to be muxed to the APSS TLMM. But I'm not convinced
that we don't have scenarios where one might want to dynamically mux the
pin between island and apss tlmm.

My suggestion is that even that it's two independent muxes controlled in
the apps tlmm, we'd express them in the same pinmux, i.e. we'd have
something like:

some-local-state {
	pins = "gpio1";
	function = "gpio";
	output-high;
};

some-remote-state {
	pins = "gpio1";
	function = "island"; /* or just egpio... ? */
};

One case I imaging where this could be useful is to allow Linux to
configure a known state of pins when the island isn't running, from the
remoteproc driver and then flip it over to island mode before booting
the remote.

Regards,
Bjorn
