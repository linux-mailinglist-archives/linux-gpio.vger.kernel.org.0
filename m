Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158D7333F4E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 14:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbhCJNc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 08:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbhCJNbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 08:31:40 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED8AC061764
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 05:31:40 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 124-20020a1c00820000b029010b871409cfso11009251wma.4
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bMOvPe8N8rGJXOLjCxzS5gSb/gTvdEZoEOlGF4GuSFs=;
        b=NLPCffky6G7GzaObhllkOllIgtNjBeMsGjkEMASPl+1pYHywRsMYpm2dtlcyg8Mib8
         KwVVv4nAqkmnzcogt078Dvez0a507CpBKA+tJqKRJBcxaYDNWIi7zlQV2h4gZ9wKz3L6
         j3kQgf/A+1u4o9qE7lMpQ7EEJOiZI6/9tl0x/oaILLtId4rQGq0DiqT9WTLHIMixEUWJ
         Osd21hXPUX+hEuewL193hn1+YN+pQznzUc5B9A/MJ13U8ort3kQ35MparokcriCZU9YH
         hwDXRCPg/vCK/Lthwuf6UThwdLUGaK/BxDJ9Azo/RtJUMNwP/L+WSKFIGnylkhmpWbmH
         OAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bMOvPe8N8rGJXOLjCxzS5gSb/gTvdEZoEOlGF4GuSFs=;
        b=F3B6T36OXEaXWP1S5CxzuMEpXH1SAu+Uv3MA+5/nJ/LfRvAsnSSbdlLiENT3WKI6r6
         EV03c2bEllHL0uS26eDunt9fi/mqyN/e7RES22g1tXekXTbyVvkvBSISQV2NVnNQnpOX
         liFU97CfMMi+AMJFz73B3926w3rcQmfJMMt6AIzlczrfbDfb+n32zQX5keXTYWNBTl93
         dD+ePfbVEyqNNxUcYrdpPpLXQkIdbvAP8S+0hPK8c5ctH4+gaNiISvykWfHIR/VRL4nt
         126r4i1S7Lu8ddS9wshNtdeEoMOegWkL0to86DhzPbo3gmZy/mZsXEOLKxfuHr+M3h6x
         XhHQ==
X-Gm-Message-State: AOAM533VQamJCgoCsIdh6IJYd7BEN7pnt3DgLY5djbSW6xIQ2U0PuZIv
        2Kk0uB5AbYCqHq+xs+g55l29Sw==
X-Google-Smtp-Source: ABdhPJyfXWtzHaUWQl/M4ZEr0SSi/Fz8xcU7IHooODBN0RLT7MhUmViUHHQQEekoUzXnBL6YUKMhJQ==
X-Received: by 2002:a05:600c:4a06:: with SMTP id c6mr3384475wmp.35.1615383098982;
        Wed, 10 Mar 2021 05:31:38 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id j13sm13409331wrt.29.2021.03.10.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:31:38 -0800 (PST)
Date:   Wed, 10 Mar 2021 13:31:36 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Message-ID: <20210310133136.GQ701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <20210310103639.GG701493@dell>
 <a631bbc3dd3bd0f02693d1c35f9a14dbaec67cc3.camel@fi.rohmeurope.com>
 <20210310111755.GN701493@dell>
 <e7bb00af76de65c60061c58a570d5b6f40961eb0.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7bb00af76de65c60061c58a570d5b6f40961eb0.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 10 Mar 2021, Matti Vaittinen wrote:

> On Wed, 2021-03-10 at 11:17 +0000, Lee Jones wrote:
> > On Wed, 10 Mar 2021, Vaittinen, Matti wrote:
> > 
> > > Hello Lee,
> > > 
> > > On Wed, 2021-03-10 at 10:36 +0000, Lee Jones wrote:
> > > > On Mon, 08 Mar 2021, Matti Vaittinen wrote:
> > > > 
> > > > > Add chip ID for ROHM BD71815 and PMIC so that drivers can
> > > > > identify
> > > > > this IC.
> > > > > 
> > > > > Signed-off-by: Matti Vaittinen <
> > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > > > ---
> > > > >  include/linux/mfd/rohm-generic.h | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/include/linux/mfd/rohm-generic.h
> > > > > b/include/linux/mfd/rohm-generic.h
> > > > > index 66f673c35303..e5392bcbc098 100644
> > > > > --- a/include/linux/mfd/rohm-generic.h
> > > > > +++ b/include/linux/mfd/rohm-generic.h
> > > > > @@ -14,6 +14,7 @@ enum rohm_chip_type {
> > > > >  	ROHM_CHIP_TYPE_BD71828,
> > > > >  	ROHM_CHIP_TYPE_BD9571,
> > > > >  	ROHM_CHIP_TYPE_BD9574,
> > > > > +	ROHM_CHIP_TYPE_BD71815,
> > > > 
> > > > Is there a technical reason why these can't be re-ordered?
> > > 
> > > No, I don't think so.
> > > 
> > > BTW. there will probably be a (trivial) conflict here as both this
> > > series and the BD9576/BD9573 series add an ID here. Let me guess,
> > > you'd
> > 
> > That's fine.  I will resolve that manually.
> 
> Thanks :)
> 
> > 
> > > like to see them sorted?
> > 
> > Wouldn't that be nice? :)
> Aesthetics is not really my cup of tea. OTOH, if amount of IDs grow,
> then sorting helps spotting whether some IC has an ID here. So yes, it
> kind of makes sense.

By 'nice' I don't mean 'pretty'.

I mean 'improving readability/maintainability would be nice'.

> Can you do sorting while resolving the conflict between series or do
> you want me to
> a) do sorting if (when) I re-spin the series
> b) send separate sorting patch as a part of this series
> c) send sepatate sorting patch after all the pending patches touching
> these IDs have been merged?

I'll let you use your imagination.

I just noticed that the latest entry did not fit well inside the
current list.  Why don't you start by putting that in the list where
it makes the most sense i.e. somewhere near ROHM_CHIP_TYPE_BD71828,
and see how you get on.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
