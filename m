Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643EE375792
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 17:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236094AbhEFPh6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 11:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbhEFPgT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 11:36:19 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919ABC061574;
        Thu,  6 May 2021 08:35:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gq14-20020a17090b104eb029015be008ab0fso3663893pjb.1;
        Thu, 06 May 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3NED5lo/rXFGpEGb8DptKrlq06sGttfFpAnJ0c6aeAQ=;
        b=C3L8OhSIKS4AyfnITR1mwMRums+qT0AnNFqd1TGPc9f+ACdHA68SUtm8PuDffp3pd4
         BwPMCSIBAcs8WpOJ6QGOgroezqC1ii+bfMT9XzGkDvccO605lcDhjkT72R1ZaR1m+Glc
         BgCxQNGSoyb5BhIG7PaifqOJC00hvcZl9wx/+tgLQcTp6R20qpvCFYRiyUT9GJBnOKib
         XEFDP/yvGWK/UplrVIWn9f5H1Ck2NW1qXYNR97T5Ha0HnJIpXKEZxX/1zymVmK5cy3Q2
         eOViCD/uP7MS4kqwjOU441QOyC6MWFaXCPRL2EmYpGWYBV1aVDlBhGZACtHVkwexZCEv
         AoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3NED5lo/rXFGpEGb8DptKrlq06sGttfFpAnJ0c6aeAQ=;
        b=NELks2tvtUhcFwqDD5MoIHWnGaH3ydBf1P/0u21A2pHV3E4L4acrd7sjnNodDE/Cph
         DDmbHKt29vdZSzGJ4ooIx0M6waULfqDpXSzYUqL2RgWfnpM5AXWPo3Z3XxagG3d8r/J2
         J8Nz3TCcgu6+887MV9ASjdFFGBAqwJLHiFEcZKskHUG4oNbU7ff3IaYhFGwjN0YIUTl8
         OaZSO0rRhu+83kUo9iHwxYDzl960uGlyWJpVJkvweABrl9QcRWVoFMAzNSQ9KcJSbF0/
         XVi6kI8YpAB4Eu6cSC/qzSWjP8oybAoOzjCtHXsmJ+ikl7QIqFL1gMlHqvwUyWI6sQy0
         /eAA==
X-Gm-Message-State: AOAM5306tvL+qxPYtwb/xVe6b5NLD2GdzhgYHtwkwUEUvJbOJo0YqhJe
        hVi3cv0g756fFZ2RkAzX/XE=
X-Google-Smtp-Source: ABdhPJz4oQPhZjLRo6W4Tj+yGyUT/9cAPKv9LDJkaYg5cmIWIUN92lW78jqGHFylMfVtNp4cCp7zgA==
X-Received: by 2002:a17:902:e812:b029:ee:ff2f:da28 with SMTP id u18-20020a170902e812b02900eeff2fda28mr1995436plg.15.1620315303005;
        Thu, 06 May 2021 08:35:03 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id l64sm2441107pgd.20.2021.05.06.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:35:02 -0700 (PDT)
Date:   Thu, 6 May 2021 23:34:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20210506153457.GA29243@sol>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
 <20210504025546.GA13356@sol>
 <20210504091459.clb5nkwgrgg43ixq@pengutronix.de>
 <20210504102454.GA21266@sol>
 <20210504105653.bfhtqd7ildoipcqu@pengutronix.de>
 <CACRpkdZvZKR5g-=YRHWEgtEJyzd9NUoMsV-VH6dvPxACTXNGJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZvZKR5g-=YRHWEgtEJyzd9NUoMsV-VH6dvPxACTXNGJQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 06, 2021 at 02:35:41PM +0200, Linus Walleij wrote:
> On Tue, May 4, 2021 at 12:56 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> but not active
> > > know if there is a good reason not to go with active/inactive.
> >
> > Linus: So we're already 3 out of 3 who would like active/inactive better
> > than asserted/deasserted. I'm curious about your preference, too.
> 
> I suppose it depends on where you come from. In electronics
> the terms asserted/deasserted is commonly used and
> that is where I'm coming from. Maybe just the materials
> I've been subjected to, who knows.
> 

I also come from electronics and, depending on context, deasserted can
also mean the line is set to high impedance. Here we are trying to
indicate that the line is actively driven to the inactive state, so
using output-deasserted would be more open to misinterpretation than
output-inactive, no?

Cheers,
Kent.
