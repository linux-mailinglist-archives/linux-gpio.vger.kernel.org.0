Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0608B334337
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 17:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCJQit (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 11:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhCJQid (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 11:38:33 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69587C061763
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 08:38:33 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso11467459wmq.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sVQWlrBBeoHKwdd8D9L9gvXK0pkYdnkCO45O59sXhqE=;
        b=q0jOQtaYZjQtMu6WQQD9tfAYd5at3q0TEHS1dUCtD72fMVVqkUYR87DPWZHJiDyy+q
         vFZTNiFX5UjeF3jS2V2FB/TneNRx3Bd7Zx6ln/1DhisKyiOJGCEe6ZKfk2f7qNKfO6AU
         /aXcMcx9zW3jq26E+kIs9+yMB4spWrO3tfJ465ANnCpKOy9Ov4KIV8x27u7BQdeDygqb
         9TC6WFH2Gqm1L9KEqiK0qnm8GSII/tKMRmGDsS+l81kV/ZyAGP3Igr4KyD4TJdCVCHRJ
         0bRf+nadEtziMOPrKBx/ZV+LM1WdQBYKGgQgZSY3klS4OBLzQMbZTf45HjaV/p8KEVPN
         Fcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sVQWlrBBeoHKwdd8D9L9gvXK0pkYdnkCO45O59sXhqE=;
        b=PhS3mwvvDa+Qf5/wx1ee+hpx1yfi67+LczBpz1NDE+EpOBKxA0bNqBlmAQZ/w2uoVO
         Mkv+TNcXnmFIZ/MjHaFdBMKddyWxsbMWtspRylgHFoFwidDxPiigqAxwByfbO3DwSTZ3
         MqldsIhM+yxt157tvwuIBOg1UA8Bu5DkRq3atkYI/OflEp2bza59HFzObNtOsOYZLQs+
         u9zsD1MuZXLmgTLqwD2HvgPpQtB4x/TVswR9xuW6uGyAb3VMqmYcOxD2fbt7VctnU3YA
         VWZng21flJlPmDGJ8uo8230QoIFjNwR56hXJWMcmwL4sovHTN6Ws5kVNWasvtWEr2JbJ
         Ncng==
X-Gm-Message-State: AOAM532JXcSXPpiv8l+CFfzgehh49rcobDk6nguu7nAST9PNAMelIaJI
        5ewiKI6FpwrE267V+Cudl+n4nQ==
X-Google-Smtp-Source: ABdhPJwDrIR7F7SMof/RHEqmZ96cNOGJ6ObmZEUKOAayqrXrKfrobyIkYN8y7xne+Pl/tcOX6LVXLA==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr4242467wmf.17.1615394312049;
        Wed, 10 Mar 2021 08:38:32 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id p12sm8446541wrx.28.2021.03.10.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:38:31 -0800 (PST)
Date:   Wed, 10 Mar 2021 16:38:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Message-ID: <20210310163829.GS701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <20210310103639.GG701493@dell>
 <a631bbc3dd3bd0f02693d1c35f9a14dbaec67cc3.camel@fi.rohmeurope.com>
 <20210310111755.GN701493@dell>
 <e7bb00af76de65c60061c58a570d5b6f40961eb0.camel@fi.rohmeurope.com>
 <20210310133136.GQ701493@dell>
 <c1cb760a0bd2cf46dc5d9b21d1a08286a7671d21.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1cb760a0bd2cf46dc5d9b21d1a08286a7671d21.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 10 Mar 2021, Matti Vaittinen wrote:

> 
> On Wed, 2021-03-10 at 13:31 +0000, Lee Jones wrote:
> > On Wed, 10 Mar 2021, Matti Vaittinen wrote:
> > 
> > > On Wed, 2021-03-10 at 11:17 +0000, Lee Jones wrote:
> > > > On Wed, 10 Mar 2021, Vaittinen, Matti wrote:
> > > > 
> > > > > Hello Lee,
> > > > > 
> > > > > On Wed, 2021-03-10 at 10:36 +0000, Lee Jones wrote:
> > > > > > On Mon, 08 Mar 2021, Matti Vaittinen wrote:
> > > > > > 
> > > > > > > Add chip ID for ROHM BD71815 and PMIC so that drivers can
> > > > > > > identify
> > > > > > > this IC.
> > > > > > > 
> > > > > > > Signed-off-by: Matti Vaittinen <
> > > > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > > > > > ---
> > > > > > >  include/linux/mfd/rohm-generic.h | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/include/linux/mfd/rohm-generic.h
> > > > > > > b/include/linux/mfd/rohm-generic.h
> > > > > > > index 66f673c35303..e5392bcbc098 100644
> > > > > > > --- a/include/linux/mfd/rohm-generic.h
> > > > > > > +++ b/include/linux/mfd/rohm-generic.h
> > > > > > > @@ -14,6 +14,7 @@ enum rohm_chip_type {
> > > > > > >  	ROHM_CHIP_TYPE_BD71828,
> > > > > > >  	ROHM_CHIP_TYPE_BD9571,
> > > > > > >  	ROHM_CHIP_TYPE_BD9574,
> > > > > > > +	ROHM_CHIP_TYPE_BD71815,
> > > > > > 
> > > > > > Is there a technical reason why these can't be re-ordered?
> > > > > 
> > > > > No, I don't think so.
> > > > > 
> > > > > BTW. there will probably be a (trivial) conflict here as both
> > > > > this
> > > > > series and the BD9576/BD9573 series add an ID here. Let me
> > > > > guess,
> > > > > you'd
> > > > 
> > > > That's fine.  I will resolve that manually.
> > > 
> > > Thanks :)
> > > 
> > > > > like to see them sorted?
> > > > 
> > > > Wouldn't that be nice? :)
> > > Aesthetics is not really my cup of tea. OTOH, if amount of IDs
> > > grow,
> > > then sorting helps spotting whether some IC has an ID here. So yes,
> > > it
> > > kind of makes sense.
> > 
> > By 'nice' I don't mean 'pretty'.
> > 
> > I mean 'improving readability/maintainability would be nice'.
> > 
> > > Can you do sorting while resolving the conflict between series or
> > > do
> > > you want me to
> > > a) do sorting if (when) I re-spin the series
> > > b) send separate sorting patch as a part of this series
> > > c) send sepatate sorting patch after all the pending patches
> > > touching
> > > these IDs have been merged?
> > 
> > I'll let you use your imagination.
> > 
> 
> Right :)
> 
> I'll sort the ID enum when I respin a series which is touching it, ok?
> Or do you want me to resend this even if there were no other changes?
> 
> It's just an old habit to add new enums at the bottom to maintain
> binary compatibility - which does not matter in this case.

I won't let this alone hold up merging of the whole set, but it looks
like you're still short of quite a few reviews.  I'd be surprised if
it's this version that gets applied.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
