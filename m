Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C723E33A7
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 07:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhHGFmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Aug 2021 01:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhHGFmh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Aug 2021 01:42:37 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FCEC0613CF;
        Fri,  6 Aug 2021 22:42:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k2so9952668plk.13;
        Fri, 06 Aug 2021 22:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h3Id8M67EDYA4oftmPt0MF1yxlKi4SAv+ZwAi66z1h0=;
        b=IxnCXHoKkR+Av77wnIM3ZpSCpu6fUNWfPJuD4gm+L0PAmGaKxbGoFOQW4u7Y4tBJGX
         IpeOtCette2U9I0N1Y8uJVjjkbTUczX9S4DD+f37zdGfUSXQAJwXPC//ppiNlo4Z5Xay
         wkR/Nuq4KkOMyHYfqnJSlx0/XqSQKzt7JmgWLfdKIFwybhBulYrIO9HNMA74K2hulD92
         lH9V0nOrsF/z7JRGqmt6RzMR/TkP0KSZAxEnCgO/Rp+zKJQvjmIiSB7d4/QmbB3Te1co
         +5tmF1F1BeJQdBQZtz4IdHMIru54aXv77IgO15EzSRhJLMMGWN+Qi5e4WJpwZjjTlpzD
         6CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h3Id8M67EDYA4oftmPt0MF1yxlKi4SAv+ZwAi66z1h0=;
        b=ryj95+GpIXGBhua7G5NuirqkTBqb3SBpYbPZFSmnmkRyhS6JlW4GBP3k9reVxjchD9
         vp68SjEN/hmVOn4eQf6x3GfhAKegNNZ/enMEzYm7S7VQ+GTA32a28MrcShcrqBSjuvcN
         Uvu/p/gSWqPRrX5wEwVWPGQ/US2wdjJfy6WoZkPyqdOi5HgJ75wY/Ysg5w3q3dh+3A7w
         ddc7liz321ajUDtrWcZSaS73pbpFRrVSHkQqwNRtKGUFAWGtbPgfDuOFH4HOGvP/xWIL
         gLi4TCHhkJNvAJ1qPBHjyrBN6hepS7NhO8R8xt5Kb5K4y+SACulzdVJyOfTgkmijqwxx
         yMtw==
X-Gm-Message-State: AOAM531BrVE9b5cPOyFv6Yeqd2eTxYzWMuXy8CL8bM50zIOYBTtFQFlb
        p5nDpyCX/GUV0E8gPU4jR2o=
X-Google-Smtp-Source: ABdhPJyzrF+tgC9Wbm12wjUmhBB+JbW7ppgrwCGpjq81d7/agN2NEHw5koO9dr3kkJR5gUGy/IlDGw==
X-Received: by 2002:a63:5641:: with SMTP id g1mr84757pgm.33.1628314939371;
        Fri, 06 Aug 2021 22:42:19 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id h24sm12747632pfn.180.2021.08.06.22.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 22:42:18 -0700 (PDT)
Date:   Sat, 7 Aug 2021 13:42:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <20210807054212.GA15085@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
 <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
 <20210731154323.GA24906@sol>
 <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com>
 <20210807030746.GA9850@sol>
 <91a173b3-18dc-5d6b-002f-893e7478717b@nvidia.com>
 <20210807045116.GA13675@sol>
 <7f6a2591-c264-e005-18ae-242320d4a22e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6a2591-c264-e005-18ae-242320d4a22e@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 06, 2021 at 10:35:10PM -0700, Dipen Patel wrote:
> 
> On 8/6/21 9:51 PM, Kent Gibson wrote:
> > On Fri, Aug 06, 2021 at 09:52:54PM -0700, Dipen Patel wrote:
> >> On 8/6/21 8:07 PM, Kent Gibson wrote:
> >>> On Fri, Aug 06, 2021 at 07:41:09PM -0700, Dipen Patel wrote:
> >>>> On 7/31/21 8:43 AM, Kent Gibson wrote:
> >>>>> On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
> >>>>>> Thanks Kent for the review comment. My responses inline.
> >>>>>>
> > <snip>
> >
> >>>> 2. Does hte handler solution create race between two handlers? i.e. edge_irq_handler and
> >>>>
> >>>> hte_handler, for the worst case scenario as below?
> >>>>
> >>> No.  If hardware timestamp is selected then no irq is requested from the
> >>> irq subsystem for that line - only from the hte subsystem instead.
> >>> So there will be no edge_irq_handler call for that line, so no possible race.
> >> That is not possible for certain providers, for example the one I am dealing
> >>
> >> with which requires GPIO line to be requested as input and IRQ needs to
> >>
> >> be enabled on them.
> >>
> > So, for your hte subsystem to work, the consumer has to also request
> > a line from the irq subsystem?
> 
> Yes
> 
> >   That makes sense to you?
> Its not me, its peculiarity of the hardware that I am dealing with.

My point is that the peculiarities of the hardware should be hidden from
the hte API user, especially if it is only necessary for some hardware.

> > Have hte do that, rather than the consumer.
> 
> Sure, for cdev it would mean to duplicate (most of) the edge* or line_create
> 
> code in HTE.

And your current way every other hte user will have to duplicate the
gpiolib-cdev code....

> For such hardware, my initial doubt remains the same about
> 
> the worst case scenario between two handlers, but perhaps that's
> 
> implementation details for hte to handle.
> 

Indeed.

Cheers,
Kent.

> >
> > And another reason it makes sense to integrate this with irq...
> 
> Alright, will explore this route as well. I remember both Thierry[1] and
> 
> Marc[2] raised some doubts (time to revive that discussion).
> 
> 
> [1]: https://lore.kernel.org/lkml/YFm9r%2FtFkzVlYDEp@orome.fritz.box/
> 
> [2]: https://lore.kernel.org/lkml/87h7l1k9yi.wl-maz@kernel.org/
> 
> >
> > Cheers,
> > Kent.
