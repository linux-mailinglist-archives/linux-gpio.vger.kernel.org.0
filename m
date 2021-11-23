Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16EDB45A45F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 15:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhKWOIA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 09:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbhKWOH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 09:07:59 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBC3C061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 06:04:51 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id s13so39226567wrb.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 06:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Bzy/Y3ck3dj84M7rIZti4gcaUHLywhndwcZgIIfzR2o=;
        b=QtNP+WAloQrMTo9h9CF7ZtU94onNrQyLlqJrrWQkny8yx4++amevXbQEJXNEQZ/rzW
         Rqlom7xb6RnOpF24A7ZE+PIpTVpSABKFwTeqXmcyuZLuhFyExtghJO0jZ7feKKyabvVb
         z3iGThDzbgNWEBndPheetNy8Uw4rnpkKEcn+soMzSJdqgGlSzDZ8zyWc/6OgLHWdHunH
         LG30dVQTcAm/dgOGuXb3kUVMM9gtvwiKV/tLIIIc0RkAIKxCq42tBYrwsasZTWSgq4tT
         p+rLNLtUYFOsy2YVMDtaWJQ0RuWyi9RpqesWhnHftFzBcWC7BC77+ddLsP0CHVYgwN0C
         OcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Bzy/Y3ck3dj84M7rIZti4gcaUHLywhndwcZgIIfzR2o=;
        b=SPBKPiaMW4J3HKgU15YCjwk7GHFINcV7fTv5NW2qlefhvGbajlp/sswiFykoS8cGiJ
         TD1RkR27GrDNv+Rk5atLZq3wpQeGwkstjaOhywRxdGvj8mO4a9k8YM2XIt1zaBI19/YE
         aNG41TKuat0BPmeAzBMMx91sGPq+xQq0YOj9moewiFHzQ+I9wJXqt+/crdL22ZAz66y2
         TCjMUiFr+vkaysoB9nNwP1nHxvCIyaeS/5eYKnE6EKQPEEO6Z9ojjuWChiqQFq2o43Ql
         ChQt0+W9885IsYgClABAAPvRHfyHiLO7gz7SMhKLEKoG4DFxaqfQoj19lHNfVlpW4ydW
         u6Og==
X-Gm-Message-State: AOAM530j9OjiMicqbG9sRQuvrlrRFiWpBE2uZTkgIszHS5FDfz618Aif
        1bpZjRAQPjggtSM44kHgRvws3w==
X-Google-Smtp-Source: ABdhPJyoFSV6HE0hB44FhLebkdA+nNWgEFjAI4FEbr+S6S1zXjvMPNw6v7SEtSdIcua2bSrjgHm2dQ==
X-Received: by 2002:adf:fb86:: with SMTP id a6mr7474660wrr.35.1637676288788;
        Tue, 23 Nov 2021 06:04:48 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id d6sm12034669wrx.60.2021.11.23.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:04:48 -0800 (PST)
Date:   Tue, 23 Nov 2021 14:04:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Ed Schaller <schallee@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Ed Schaller <schallee@darkmist.net>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <YZz0+VCROEa0E4br@google.com>
References: <20211122223606.GA20997@darkmist.net>
 <YZvYhBB23ITS+Pw0@smile.fi.intel.com>
 <YZywikZuMSnbqpI1@google.com>
 <YZy2jh0hexxgiPcw@smile.fi.intel.com>
 <YZy+mf9E4YVsv9Ru@google.com>
 <YZzAyZgqVwPsjsSh@smile.fi.intel.com>
 <CAJo6XL_DfWcVbT92X8fsd=mvs9AkzNQ2A1hPJpeGxrqC3BuL=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJo6XL_DfWcVbT92X8fsd=mvs9AkzNQ2A1hPJpeGxrqC3BuL=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 23 Nov 2021, Ed Schaller wrote:
> On Tue, Nov 23, 2021 at 3:22 AM Andy Shevchenko <andriy.shevchenko@intel.com>
> wrote:
> 
> > On Tue, Nov 23, 2021 at 10:12:41AM +0000, Lee Jones wrote:
> > > On Tue, 23 Nov 2021, Andy Shevchenko wrote:
> > > > On Tue, Nov 23, 2021 at 09:12:42AM +0000, Lee Jones wrote:
> > > > > On Mon, 22 Nov 2021, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > > Odd.  This didn't make it into my inbox.
> > > >
> > > > Hmm... Maybe it's sorted out due to linux-gpio@ vs. linux-kernel@ ML?
> > >
> > > No, I mean it doesn't appear anywhere in my mail.
> > >
> > > Including LKML et al. sub-folders.
> >
> > I see, this is indeed odd.
> 
> I submitted again with Andy's RB.
> 
> I'd suspect spam filters given the issues I've had with that domain before.

Ah yes, that would make sense.  Thanks for resubmitting.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
