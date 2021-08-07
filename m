Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512663E3377
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 06:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhHGEvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Aug 2021 00:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhHGEvm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Aug 2021 00:51:42 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F74C0613CF;
        Fri,  6 Aug 2021 21:51:24 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u16so9910442ple.2;
        Fri, 06 Aug 2021 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GX4fAo4gZowc2/UObZ0IC1xUUvBo7nyrkPAPltf/NFI=;
        b=p8CK2a9BidNO2in0zHu5N/7NyeyvP1ZFpEPF5/4sd51eyRSOnXTuyiXU+BUm/tm21j
         adFPUIdtR/JJlT9nXg3t6KHre4m9limmYhiklrzOrx9lFgF1j+bq53QABu5WAcYtZXq2
         rAZdbgcJIlwvpDgAsfyVq6lcswP2oNs7F+CxZV+t95dAMjbyovAgOFt9XuHkeKfAMnkK
         EhtPeyZ0dzaZfeQPGnn6Uwhm6gGNLsZM/jVY59+gZze8LEovsME5uDX/dz0EQupI56S8
         3zmkpaRAmfSqguIrPR8J+ux3Fl21D0hog2RpUPToCxwP6mZc8j/ZnuDs3/RrNJpEnal4
         O+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GX4fAo4gZowc2/UObZ0IC1xUUvBo7nyrkPAPltf/NFI=;
        b=oxGZv3VKd7VTE68O7xRmPnTGgobIJe0cwUiOhVt7dNmk8t5RIIrW+649kBr+jeTSU0
         PtCCNnrQr6GhxBDiIO6U87iDE3Iy0JqQwsOjz8eCDNYFjT8P9iTmzMfai/enTAKkcDl2
         oftpqXhaskMyP/l11lP8c6ra7X2KquE0E5svptg6dgcn0HxL/lp15kaZZvyHWedmt3Wx
         qyJRzCGi9qeylsfHlVWX+yka3UGg/igZd8kZFw5KuhickzOYCdK7mUUECZj3ddv6ZVyG
         1lpoy0Wq97q7SeG/hi9rQ1kOFPBm78fb1dnvbs9iDwVpM7yBQk7t4sP+h3g2Ujh/AC5e
         asWQ==
X-Gm-Message-State: AOAM531jC7FwLI1Hr613NRJ/xh9cUij+lyU6mLenHS07oUmcLKVZDa2S
        0PZ7CH7wNnwPxEPaFSx0PtE=
X-Google-Smtp-Source: ABdhPJzzn1sM7j2m2fnuwkSOTvNQa7eJqaMQuqUlMwG2/B+bMbE4y2NwCxps3TK+fhyFCYZLyLvXTw==
X-Received: by 2002:a17:902:6b09:b029:129:c61e:e31a with SMTP id o9-20020a1709026b09b0290129c61ee31amr11313997plk.57.1628311884405;
        Fri, 06 Aug 2021 21:51:24 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id f4sm13544176pgs.3.2021.08.06.21.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 21:51:23 -0700 (PDT)
Date:   Sat, 7 Aug 2021 12:51:16 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <20210807045116.GA13675@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
 <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
 <20210731154323.GA24906@sol>
 <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com>
 <20210807030746.GA9850@sol>
 <91a173b3-18dc-5d6b-002f-893e7478717b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91a173b3-18dc-5d6b-002f-893e7478717b@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 06, 2021 at 09:52:54PM -0700, Dipen Patel wrote:
> 
> On 8/6/21 8:07 PM, Kent Gibson wrote:
> > On Fri, Aug 06, 2021 at 07:41:09PM -0700, Dipen Patel wrote:
> >> On 7/31/21 8:43 AM, Kent Gibson wrote:
> >>> On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
> >>>> Thanks Kent for the review comment. My responses inline.
> >>>>

<snip>

> >
> >> 2. Does hte handler solution create race between two handlers? i.e. edge_irq_handler and
> >>
> >> hte_handler, for the worst case scenario as below?
> >>
> > No.  If hardware timestamp is selected then no irq is requested from the
> > irq subsystem for that line - only from the hte subsystem instead.
> > So there will be no edge_irq_handler call for that line, so no possible race.
> 
> That is not possible for certain providers, for example the one I am dealing
> 
> with which requires GPIO line to be requested as input and IRQ needs to
> 
> be enabled on them.
> 

So, for your hte subsystem to work, the consumer has to also request
a line from the irq subsystem?  That makes sense to you?
Have hte do that, rather than the consumer.

And another reason it makes sense to integrate this with irq...

Cheers,
Kent.
