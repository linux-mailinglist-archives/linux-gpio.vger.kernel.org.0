Return-Path: <linux-gpio+bounces-26761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00271BB41F5
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 16:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE9C04E2921
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 14:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4938311C3F;
	Thu,  2 Oct 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIwcwe/7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9331065A;
	Thu,  2 Oct 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759413817; cv=none; b=SR0PEYxyThtsLN1iHARwJO4bhftnREjxY8K2P6/nPTCelXzIJ8Q5KzrUJYB4qAGdvC3g5RgmBOD+yr4bISLS32aAEmsy2Fesc2r4nFvLr9BCJlbuc7deDLnYGB1eh6Dn+0hUEQVLbb3YQrEm6gJr3eTW55tSuJo4bR9syA5iaRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759413817; c=relaxed/simple;
	bh=qvTW9/qjw9TJ4Fq+4KOOSQ0NOg2jKMFr5YIVN5iAJkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6WUhesvhDdBzqT9AsE5agsfAdzVniivSjymWtxe0Z7UeI1oIcJr5JL2WKmrce4q6zZWNceMpjlrl4hYdeJHDCjaKwt0DYDeLvJc+ZJNSP2JV3ogQ6jvl4LQpe1HJAEYgIA5BL0BEJEU9Tb+MbLmubSCPMfOOemoMNK5eULkICQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIwcwe/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCACCC4CEFB;
	Thu,  2 Oct 2025 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759413816;
	bh=qvTW9/qjw9TJ4Fq+4KOOSQ0NOg2jKMFr5YIVN5iAJkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIwcwe/7l1lFw8mjdgehUhxzLAIIFAN8MnszKlSFy+HRAe5yjZUWfoXceX8iK5sbc
	 lhmQaQ8y4vo8eGit09WJE3CUkSjRMien3YBEQzVrsa0Yd2xNLUiG/eOXiMVidbE6mJ
	 eGCYkLr57JJ22z4wLr6sI/Yq8M0XKyXCRbd7/9blu9XnvIIzDw1+iW2fDBgz1+ah0y
	 cI/OSHEZssoDNBiYi4OVi3YVaK0ET9lBpZQOnSVIyZlXQMHTktiudX5nKb2IVK5RIz
	 eSsGv2g3j8YKhanJZcm43tNEgLIS2s4wb89q8U1RD0kR59EvxNbB08R8em/iTEXXJ2
	 VtZgdAf+1vbIg==
Date: Thu, 2 Oct 2025 22:03:33 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aN6GNYXFiyZpqGVw@tzungbi-laptop>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
 <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <CACRpkdZ6_YkUsCNRFfRM1v68fpvAJcdqPRtAKTGqLqHf1geJog@mail.gmail.com>
 <aN1DlPjbQgzfmpUl@ada.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN1DlPjbQgzfmpUl@ada.csh.rit.edu>

On Wed, Oct 01, 2025 at 11:07:00AM -0400, Mary Strodl wrote:
> Hey Linus,
> 
> On Wed, Oct 01, 2025 at 09:15:14AM +0200, Linus Walleij wrote:
> > Oh this RCU thing is a bit terse and a lot of code.
> > 
> > Can you look if you can use the new revocable resource
> > management API? It uses RCU underneath.
> > https://lwn.net/Articles/1038523/
> 
> Yeah I'm very open to suggestions about how to do this nicer.
> 
> I can't read that article, because I don't subscribe to LWN (Maybe I should
> though). Looks like it becomes free tomorrow, so I can take a look then. I did
> find and skim through this, which I believe is the implementation of the API
> you're talking about:
> https://lore.kernel.org/chrome-platform/20250923075302.591026-2-tzungbi@kernel.org/
> 
> Based on this, it seems like:
> * This uses sleepable RCU, which I don't think we can use in the IRQ callbacks
>   since they don't allow any blocking (this is the main reason for the complexity)

Good to know.  It hints me about maybe revocable should provide both RCU and
SRCU variants.

> * We'd still need some sort of list primitive, because we could potentially have
>   multiple workers being torn down at a time, so we need to know what all to
>   revoke when the device is being torn down. Right now, I'm using the RCU lists
>   API to keep track of this. My instinct is to use devm, but that also isn't
>   technically safe for use in IRQ handlers.
> 
> I obviously haven't played with the revocable resource management API, so
> maybe these limitations aren't as big of a deal as I think they are.

To use revocable API, we need to identify what resources should protect.  It
seems there are some UAF possibilities in gpio_mpsse_poll() after unplugging
the device.


Thanks for letting me know the use case.  We are figuring if revocable could
provide subsystem level helpers so that device drivers don't need to play
with primitive revocable APIs.

