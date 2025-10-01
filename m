Return-Path: <linux-gpio+bounces-26724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EFDBB101E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 17:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9CA7188312B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 15:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDFB2773F4;
	Wed,  1 Oct 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="B85LBEpq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02CF26D4F7;
	Wed,  1 Oct 2025 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759331717; cv=none; b=PEDePQUto2LAXDbaBmbzA/YfFKfT3a+6X+9D/9tWKsJfmXb9B7/ZBqCdLNuKkgSG32q337TZjH5fVJIytNu6NGX6V8d1E8F//dn7lMj9C/qcwU68Z73sxc98ZDSbFg4B0Is7ipEjZK5w9AHmGyBKJKHAWG45zguNuK5vkkZHGIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759331717; c=relaxed/simple;
	bh=Oh5XPGVvCUnedsp5fIcftvoBmPh8/m3fOSzyJpAjoA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbhWF/KCgLkoWDRih58rg9PByNf8zLHVf0cnoJ0TPIL6t7FJKt3HYYERP+3cLdRuiXBTZX5iveWwgSJ6vKR6AaX9++0pIfqBs0wscJK9Q5H6oWD7AGhmJg5jcFnkmLcXQ04gYH7IxAKVz3GsONQ4VDrYJ/49eWvp0FQUv6i70+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=B85LBEpq; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2B478415682C;
	Wed,  1 Oct 2025 11:07:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759331222; x=
	1761145623; bh=Oh5XPGVvCUnedsp5fIcftvoBmPh8/m3fOSzyJpAjoA4=; b=B
	85LBEpqEAIvv9oZPdDA6In9YwSZ0W2zB+S2u0PKws+U3LlYpyIXo3Ri2b+CygslU
	S+sswy3aNilr9ZBvCHalKELIVCgpDYLImHLob5NvfyhJ3vZcnuNKx94o6Ex9eubS
	YwfDbaRICYLsIEI+KRhbjoY+wiYb3MQzJIW1gVesHo=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id L3VEk2O1EZcz; Wed,  1 Oct 2025 11:07:02 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 09B21457383A;
	Wed,  1 Oct 2025 11:07:02 -0400 (EDT)
Date: Wed, 1 Oct 2025 11:07:00 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aN1DlPjbQgzfmpUl@ada.csh.rit.edu>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
 <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <CACRpkdZ6_YkUsCNRFfRM1v68fpvAJcdqPRtAKTGqLqHf1geJog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ6_YkUsCNRFfRM1v68fpvAJcdqPRtAKTGqLqHf1geJog@mail.gmail.com>

Hey Linus,

On Wed, Oct 01, 2025 at 09:15:14AM +0200, Linus Walleij wrote:
> Oh this RCU thing is a bit terse and a lot of code.
> 
> Can you look if you can use the new revocable resource
> management API? It uses RCU underneath.
> https://lwn.net/Articles/1038523/

Yeah I'm very open to suggestions about how to do this nicer.

I can't read that article, because I don't subscribe to LWN (Maybe I should
though). Looks like it becomes free tomorrow, so I can take a look then. I did
find and skim through this, which I believe is the implementation of the API
you're talking about:
https://lore.kernel.org/chrome-platform/20250923075302.591026-2-tzungbi@kernel.org/

Based on this, it seems like:
* This uses sleepable RCU, which I don't think we can use in the IRQ callbacks
  since they don't allow any blocking (this is the main reason for the complexity)
* We'd still need some sort of list primitive, because we could potentially have
  multiple workers being torn down at a time, so we need to know what all to
  revoke when the device is being torn down. Right now, I'm using the RCU lists
  API to keep track of this. My instinct is to use devm, but that also isn't
  technically safe for use in IRQ handlers.

I obviously haven't played with the revocable resource management API, so
maybe these limitations aren't as big of a deal as I think they are.

With that said, I think now that I've found spinlocks work, I could use those
to gate access to the list everywhere, and use the standard lists api rather
than the RCU lists api. Obviously teardown of the workers would happen outside
the spin lock critical section, guarded by a proper mutex.

Let me know what you think... Thank you!

