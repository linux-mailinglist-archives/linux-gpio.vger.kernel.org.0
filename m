Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEE03728CF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 12:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhEDKZ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 06:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhEDKZz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 06:25:55 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ACEC061574;
        Tue,  4 May 2021 03:25:00 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id t21so4602853plo.2;
        Tue, 04 May 2021 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ma4EiObMBquMsz2PddchRyGnFpOxTXtAB3JuHu0TlJw=;
        b=DzvfvxOdUFuXg+fhdCWxmvr43CrjzAyrafo6t8SSvLAO6U5HjdIgMQoxE3hJ+4tEyO
         2Rmkxgg1Ibnu86NRPP1hWV3XlzUpnzw6c+dkzjPMu0R6Aq6fYPq66kbOeb4k7UjXHZgJ
         Emk/Qa1Ab7rxiU45OwvdjKz22/Rq8Pkp74ArsGVbgQQFwdnGzIC7yNepOXsGw8fpwgZ8
         hpmOQBHWXqPkKTaA6/5o04c3/vyOr5TzfY7pfcQLXicSV+GXmhe19WYHWDTnqnZLn0wI
         lJ+nD4FpKlfA/fajKfb3FlN8EMFjHc9wlVDeww6CfjRKfgzxc+gPME/LG3NEn41yfMsI
         v1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ma4EiObMBquMsz2PddchRyGnFpOxTXtAB3JuHu0TlJw=;
        b=Clc8HAg7SNW0kIunuPoSa67A63fXhvm9d3TNZkRMSqxuuebzFNDaz2uXuSQ3J6NmxT
         b/zR9uY/WXOCUQuMuoQX75BRGWSTob4tKZYNHYm+9Di8Q0O/2296XbgybLA8gweKmZ3c
         HbHdbxQyAKHCi4/SEOHBYQjs1VpgKRIIKzOzTFe0ekEV4hPj5GmALUr9EUelh15hbr+d
         e1jt93a6oPQnmpHOekP6iIacsUx+uH2UnWCv4+eBo+KbUY0i5/fkXuFhId+EozjoV6R4
         Yr1I+yK5yXlk0mgz4tb8Un808zJbZeAWmEoqsCkteQVhdkZf3U+zZH6QXQmtL3nrE4ec
         RljQ==
X-Gm-Message-State: AOAM530xewUysm4tYiR+apwOKwe/PbfYIPPBO+TZC5mSuxeTkRBNi5J8
        NEnpBSs8ont6psYVolTQotk=
X-Google-Smtp-Source: ABdhPJzME6ZWPWxPuechAs1rXqqcdw9f+bRITo/lyjxDSQ/RjGcVrTEftDosM4WnyGlepgZuVhN57Q==
X-Received: by 2002:a17:902:8d98:b029:eb:43c2:d294 with SMTP id v24-20020a1709028d98b02900eb43c2d294mr25680394plo.49.1620123899597;
        Tue, 04 May 2021 03:24:59 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id u14sm3191930pjy.6.2021.05.04.03.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 03:24:58 -0700 (PDT)
Date:   Tue, 4 May 2021 18:24:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20210504102454.GA21266@sol>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
 <20210504025546.GA13356@sol>
 <20210504091459.clb5nkwgrgg43ixq@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210504091459.clb5nkwgrgg43ixq@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 04, 2021 at 11:14:59AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, May 04, 2021 at 10:55:46AM +0800, Kent Gibson wrote:
> > On Mon, May 03, 2021 at 11:05:26PM +0200, Uwe Kleine-König wrote:
> > > For active low lines the semantic of output-low and output-high is hard
> > > to grasp because there is a double negation involved and so output-low
> > > is actually a request to drive the line high (aka inactive).
> > 
> > +1 on clarifying the naming.
> > 
> > > So introduce output-inactive and output-active with the same semantic as
> > > output-low and output-high respectively have today, but with a more
> > > sensible name.
> > > 
> > 
> > You use active/inactive here, but then asserted/deasserted in the patch.
> 
> oops, this is an oversight.
> 
> > My preference would be the active/inactive, which has more of a level
> > feel, over the asserted/deasserted which feels more like an edge.
> > 
> > And you still use active/inactive in the descriptions, so now we have all
> > three naming schemes in the mix.  
> > 
> > What made you change?
> 
> I had active/inactive first, but Linux Walleij requested
> asserted/deasserted:
> 
> https://lore.kernel.org/r/CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com
> 

Thanks - I'd missed that.

I don't suppose you happen to have a link to the gpiod_set_value()
discussion that Linus mentions?

> While I like active/inactive better than asserted/deasserted, the latter
> is still way better than high/low, so I didn't discuss.
> 

As a native English speaker, I find deasserted to be awkward - though it
is the appropriate negative of asserted in this context.

And there is no escaping the naming of the active-low, so I'm curious to
know if there is a good reason not to go with active/inactive.

Cheers,
Kent.

