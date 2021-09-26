Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DED418A03
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 17:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbhIZPkd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 11:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232009AbhIZPkc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 26 Sep 2021 11:40:32 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39F0A60F9C;
        Sun, 26 Sep 2021 15:38:53 +0000 (UTC)
Date:   Sun, 26 Sep 2021 16:42:42 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
Subject: Re: [RFC 02/11] drivers: Add HTE subsystem
Message-ID: <20210926164242.7447c0e2@jic23-huawei>
In-Reply-To: <91744e4f-b1b8-399a-b521-aba0215a5dc4@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
        <20210625235532.19575-3-dipenp@nvidia.com>
        <20210704211525.4efb6ba0@jic23-huawei>
        <52ecf0a6-07a6-ec43-4b1e-fb341ad969b6@nvidia.com>
        <20210801171304.6e8d70d9@jic23-huawei>
        <91744e4f-b1b8-399a-b521-aba0215a5dc4@nvidia.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 13 Sep 2021 22:43:02 -0700
Dipen Patel <dipenp@nvidia.com> wrote:

> Hi Jonathan,
> 
> I got some time to implement RFC version 2 while doing so I have a follow up comment
> 
> inline regarding clock source comment of yours.
> 
> Best Regards,
> 
> Dipen Patel
> 
...

> >>>> +/**
> >>>> + * struct hte_clk_info - Clock source info that HTE provider uses.
> >>>> + * The provider uses hardware clock as a source to timestamp real time. This
> >>>> + * structure presents the clock information to consumers. 
> >>>> + *
> >>>> + * @hz: Clock rate in HZ, for example 1KHz clock = 1000.
> >>>> + * @type: Clock type. CLOCK_* types.    
> >>> So this is something we got a it wrong in IIO. It's much better to define
> >>> a subset of clocks that can be potentially used.  There are some that make
> >>> absolutely no sense and consumers really don't want to have to deal with them.    
> >> Is there anything I have to change here?  
> > Yes - specify which clocks would make sense.  You might not need to explicitly
> > allow only those, but that might also be worthwhile. Otherwise, the chances are
> > you'll end up with a bunch of special purpose code in consumers on the basis
> > they might get CLOCK_TAI or similar and have to deal with it.
> > As for exactly which clocks do make sense, that's one which may take some figuring
> > out. Probably REALTIME, MONOTONIC and BOOTTIME depending on whether you care
> > what happens when the time of the system gets adjusted, or whether it carries
> > on measuring time across suspend.   Very application dependent but there are some
> > you can definitely rule out. Don't repeat my mistake of leaving it vague
> > (which incidentally was a follow up to picking a silly clock to use for timestamps
> >  before we allowed it to be configured).  
> 
> I believe your comment is under assumption that providers have choice in selecting
> 
> clock source to timestamp in turns clients have it as well. For now, the provider
> 
> I have implemented has single clock source and hence I only implemented get_clock*
> 
> hook that provider implement and client can retrieve that information. I guess I can
> 
> always implement set_clock* hook as well for the future providers which support
> 
> multiple clock sources. Please let me if I missed your point.

I'll be honest I can't really remember :(  too many sleeps.

Sorry - if it is still relevant perhaps it'll come back to me on v2.

Thanks,

Jonathan
