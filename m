Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779741F6C72
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 18:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgFKQxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 12:53:11 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46879 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbgFKQxL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 12:53:11 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 016F59F6;
        Thu, 11 Jun 2020 12:53:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 11 Jun 2020 12:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lovelett.me; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=1LOoi/B2WFs4KRTDa771H+Zwua5bEHA
        /EV6IvFbDqjs=; b=C1l75wR64MCsEeN6fnVOIkzwKJGgyIiJG0DydjpQ2avVJjk
        JCqwFlGMF/tyBwW/9f5S8OOs67iNdKtYYtKNdryIb2LZCdJtMZjkvzWwyBtFfQbB
        Ip5cIOPrKXP9P0TOozOK6PyIytykNOpEsSpvsCtjwICnFcLFZo60AvDtoujXtkch
        s3pl3NkE0L8btwCIWDY+npPCGgukcQgISWOjkTRuxpIdFiBc+7giKLoBgtFDNQkj
        r3aTl1gCFuEnxeVQ6SP6uTDL1EawEwgVNlVK39svp+9ov7LSC/q4mNAfDfWorVFX
        wW7f3kiPpDWeBp7rLCbJneQpnVVcLKbzZQ67c6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1LOoi/
        B2WFs4KRTDa771H+Zwua5bEHA/EV6IvFbDqjs=; b=XIzdYwIRoV0WAuQUUx98WK
        oPFial2SRkOj6hE9W+Lx8sqSjR3YezskZxafgUobZtkIfcjo4+u4Jmv3jVop17FI
        qWiipqxErmjIegyFcDtrM4ioYRNy5f1ccdpLRrgXvtnQy9zIeHNSK5cwJjTDMl4H
        z12YfvpO6Tbx6LN8RpSGoZrbKeuloHYuRg/WGx0HIVcLMdCcBgZBoydkQVYSqGX2
        WxqNXx1umhtnoqIeek+cMVb0HTkog3kREqaBbbXhrCga4uanSkfxspEKjjyp1VRb
        5qy6E2JussJsYlSj57zqU2zUCP3DBriaEvzEkKCchBO7ZYOBEkYQKXBMMqCr/Wtw
        ==
X-ME-Sender: <xms:dWHiXiPjqlF8IPOx_9ke3CCKriIv1-c1KxsJfXUGJDUNyb2ppTZyDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftfihrghnucfnohhvvghlvghtthdfuceorhihrghnsehl
    ohhvvghlvghtthdrmhgvqeenucggtffrrghtthgvrhhnpeegteefhefgheduteekjeelge
    efvdetkefgffdtgfdvjefgheegveduledvfeevvdenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnheslhhovhgvlhgvthhtrdhmvg
X-ME-Proxy: <xmx:dWHiXg9EDlR4gxJ3qtP7apzSk6_fKSuOQHeIshLecNPxZqV3ad5Y9A>
    <xmx:dWHiXpTMbFLBj39LhbupzhAXdsIWT2RFTglih973Rm4dE4nFdCbWjw>
    <xmx:dWHiXit_cw16NBE8EOt0M7SaTtXA2nh32enJyLUGhUG9Biq1APLQ3A>
    <xmx:dWHiXkpvecdMHq6Xs66pT01OUfezHfgYBIb_kkieqcwxspKq2KANIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 59A71E00A9; Thu, 11 Jun 2020 12:53:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-525-ge8fa799-fm-20200609.001-ge8fa7990
Mime-Version: 1.0
Message-Id: <ad9655c7-d341-4ebb-86ed-60e6cad38362@www.fastmail.com>
In-Reply-To: <20200603145447.GA26614@sol>
References: <c5498c40-7e80-4dc5-bff3-3ab8efd4898f@www.fastmail.com>
 <20200603145447.GA26614@sol>
Date:   Thu, 11 Jun 2020 12:52:49 -0400
From:   "Ryan Lovelett" <ryan@lovelett.me>
To:     "Kent Gibson" <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Polling precision/order
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Your approach isn't ideal.  It would be better to receive interrupts on
> both edges of one line, and compare the phase of the the two lines
> at that time to determine direction.  Depending on the responsiveness of
> your platform you may be able to do that from userspace - depends on
> how the interrupt rate compares to the interrupt latency to userspace.

That was my feeling as well. Thank you for that hint.

> The GPIO uAPI does not guarantee ordering of events across multiple
> lines, so mis-ordering is possible.  Also, the interface to userspace is
> buffered and it is possible for the buffer to overflow so events can be
> lost.  Obviously either of those would play havoc with your algorithm.
> What the uAPI does provide is timestamps on the events, and if I were
> you I would be looking at those.  That would provide you with ordering
> and spacing, and probably provide some clues as to the underlying
> problem.  e.g. if the timestamps are jumbled then you are getting
> mis-ordering.  If the spacing is less than you are seeing on your scope
> then you may have noise.  If the spacing is greater than you are seeing
> on your scope then you may be losing events...

I've found the timestamps and they to be jumbled. So I think I'm getting mis-ordering.

> I'd rather not speculate - more information required.
> It certainly isn't a use case that the GPIO uAPI is ideal for.

I think in general, that was my feeling. This approach might just not be right. I think I'll try a different approach. Thank you for the thoughts and feedback.
