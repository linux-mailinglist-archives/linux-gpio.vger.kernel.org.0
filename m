Return-Path: <linux-gpio+bounces-7121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7FF8FB31F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 15:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4CCB2AC90
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 12:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E2A146A94;
	Tue,  4 Jun 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ+NQfiy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB11465A8
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505568; cv=none; b=rEowN/j0/uDW0GcAKAkXHGs6TW3lQ8cJU0WbJbN1x2fzUyvBMJJAW0UvMmKC9kEpJQOECnQuOUuAV2c0aux9hn/4TRvTwYsDFV8UIr9dwEgIP5RxjgyIBhktbrB17LdASm8T+GRYheltcMm+H9SPorNnJZgDiQ8tC46Bey45Wss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505568; c=relaxed/simple;
	bh=EzzKMQrhCwyYKh9hdJxi3hM2htnoQbHTyEncuCjHan4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4hKOIuUbHkBWq/LYfSVY8fgyo/HaL7rW/VVhOSBB2BGVjI0yAvAOxzo9OmowZGVn7Q0PybHe2ZwKmvD65W5bZocrpTv1t8vgc8GjYD2r6jELx0HZrS7Lv78drgdCeLhcucrXsrm9sRtUpo/AWXHFkthqSFSffgrve0g4eawu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ+NQfiy; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6c4f3e0e407so2811770a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2024 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717505566; x=1718110366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHOytmQcmBNW5xM0P2p1kKm+NQ9LFO+8ic9E2+NFcP0=;
        b=kZ+NQfiy5qadHbbI977l5isXxgWGjmr8Jdg9ktm9ZmYyrIMrp8bigeZ2A9fcoQzL1C
         PI0DxSImHe5VqDcBUtLTGJlZXn4avIQY3Uv31+f4/Y4iRQTX/2EqYwBroGdnzN4RVA1Z
         sSFehQo7CZ1qwRnDLYEjE+ipLWTxYuHwuoII1p/vHyiz6TvhIwYRCq9ludlwtuk60xVj
         qsOBnTyTTxUeoakD/fCSAhigwwDU0HHseo1M+z9ZNmYbMnJpq7Jh+L7zIhv6/YfAfuuV
         D3KNa8HPAez8jL5RB37k0JPCTH63oc/Oh26m++OXRH2IiXe/enrVVSJryI1lGH7BqBO6
         62Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505566; x=1718110366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHOytmQcmBNW5xM0P2p1kKm+NQ9LFO+8ic9E2+NFcP0=;
        b=nWNF4WGSM86XO/r4iabhCDVIOnpMVEIgz+CeSVFwRB47Njx+Uo7p56aMMQaus6Is6F
         yQVbLZgJ4kvVT4riVAeljG+cRwplQRCeT5XQd/cWJfD1n12hdsbWNZwGewNFAMYpivtp
         Ew0A5x8s8Jj5sfb/s0i0zBEjDCfPa9/UitJlUc/ipGvxuKfCXXuUqNQ4IpVUGm1k/FVD
         BjXrxnOAs5SgpVTsZT9WWkdw6rAFCxb9y+J7Rc9LWSnElfGoQ8Hi6m1lbvSSqHE+7xJM
         3oBCpaRx7ZrDH6yvx8VPMiWhbg6s1TrlKCeJ/vZcGcdIkaFZZOzqOX7CAWTTKzo+los5
         ZEIA==
X-Gm-Message-State: AOJu0YxpY791gIIBMBQtfVSJX+3h4lUgiS6dQOyVLx6DIC1Kr5yKELKP
	RGvy2YpWlfgPcRQAkFw+nmcefqzp0MpyUtYCxo22N2o0SWnW7aGFllzv5w==
X-Google-Smtp-Source: AGHT+IFUSypABqkDGhqGh3NOCgpS7E7JdrU0YDS2zI+L/VFou7y4HQ7+W7XRONE+6ewe+FzC9ZUaXg==
X-Received: by 2002:a17:90b:e84:b0:2c1:a6e1:6a7 with SMTP id 98e67ed59e1d1-2c1dc5c8af6mr10661053a91.31.1717505566451;
        Tue, 04 Jun 2024 05:52:46 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c254a76729sm1604783a91.0.2024.06.04.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:52:46 -0700 (PDT)
Date: Tue, 4 Jun 2024 20:52:41 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "David C. Rankin" <drankinatty@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: Documentation for line_config PULL_UP, effect on line_event
 edges and line_request values?
Message-ID: <20240604125241.GA295468@rigel>
References: <d82c276f-fade-4b23-9617-206c4cf0796e@gmail.com>
 <20240604024322.GA45268@rigel>
 <2b815f80-5bc1-499c-9f7c-38749e112269@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b815f80-5bc1-499c-9f7c-38749e112269@gmail.com>

On Mon, Jun 03, 2024 at 11:39:16PM -0500, David C. Rankin wrote:
> On 6/3/24 21:43, Kent Gibson wrote:
> > Does highlighting that line values are logical help?
>
> Thank you Kent for the reply!
>

Btw, when replying to the list, reply-all so all included in the thread
get a copy directly rather than having to check the list - I only just
noticed this one now, some eight hours after you posted.

>   Chuckling... yes, flashing attributes too and a sledge-hammer waiting to
> fall on my head may also help.
>
>   All kidding aside, the reason I bring it up, is if this is something that
> I scratched my head about after reading the documentation and the header,
> then I'm not alone. It's always the case with documenting code, when you are
> the author (or closely involved in creating the code), everything seems very
> clear and obvious -- you've lived with the code for months or years...
>
>   However, on the other end of the understanding continuum, is the person
> looking to use the v2 uABI for the first time, without any familiarity with
> the code, that reads the chardev.html document will likely never appreciate
> the careful use of the words active/inactive. The comments in gpio.h header
> really do seem to just make that point more clear despite having the same
> text. I know it was that way for me.
>
>   It may not take much of an addition at all to emphasize the logical edge
> and value relationship. In fact, just what you explained in your reply would
> make a perfect addition to help clarify and bridge the gap between those who
> know the uABI inside and out and those who just start working with it.
>
>   Without looking at the code (or isolating the PULL and ACTIVE_LOW) it
> wasn't immediately clear which one was flipping the logical relationship.
> From a hardware standpoint it would make sense that either one could do it.
> Your explanation of bias being physical and the ACTIVE_LOW flag being the
> one that sets the logic makes that point clear. That would be a great
> addition to the doc as well.
>

Agreed - I'm looking into adding some clarification to the docs.

> > >
> > >  * @GPIO_V2_LINE_FLAG_EDGE_RISING: line detects rising (inactive to active)
> > >  * edges
> > >  * @GPIO_V2_LINE_FLAG_EDGE_FALLING: line detects falling (active to
> > >  * inactive) edges
> > >  ...
> >
> > So that does not makes it clear that the edge definitions are based on
> > logical values?
> >
>
>   That does make it clear, but for whatever human-factors reason, it is not
> as apparent in the enum gpio_v2_line_flag section of the chardev.html web
> page. Maybe it just has to do with the way the web-page puts the explanation
> on a separate line below in smaller serif font? But it almost seems the
> header screams "Pay attention to this!" while the doc just reads "Here is
> some other info too". Your idea of highlighting or at least bolding the
> "(inactive to active)" and "(active to inactive)" would certainly help
> there.
>
>   In chardev.html, adding your explanation on the logical/physical
> difference would work great as a "Note: ...." right before the enum
> gpio_v2_line_flag block (or right after whichever you prefer)
>

I'm not sure that is possible, given the way the documentation is generated
from reST.

And, given the way the html documentation is structured, my preference would
be to expand the documentation of the relevant ioctls and reads, as that is
where a reader trying to understand what the function is doing would be
looking.

>   Anyway, all just good ideas intended to improve the ease of initial
> understanding for what is a great improvement over the v1 uABI. I'll leave
> the rest in your hands, you provided a great, short and concise explanation
> of the logical verses physical implementation of edge detection and value
> behavior. I'd only ask that you give serious thought to adding a few
> sentences or a paragraph precisely as you did in the reply. That really can
> make all the difference in understanding for someone coming anew to the
> gpio_v2 ABI.
>
>   Thanks again for your reply.

Thanks for the feedback.

Oh, and are you ok with me adding you as suggesting the patch?

Cheers,
Kent.


