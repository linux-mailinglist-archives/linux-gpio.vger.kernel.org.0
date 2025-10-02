Return-Path: <linux-gpio+bounces-26762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9505BB429A
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 16:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DA0719C2998
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 14:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F6E3115B9;
	Thu,  2 Oct 2025 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="fG3l6Q+V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3A5464D;
	Thu,  2 Oct 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415341; cv=none; b=sWqDRlhEgyUdqpU94SpZAxrZxvR/DoZb+Oaa0H/8LDcty5P+lXdG4Lz00cAEF9sAPyeRRYg8uxaM5aI96qLzemlaqMwIJljAnYdqkmVdvOsEPFP5G+qjWNj/stbD0jLxqdejW/YgX043sRvqdkdlXU/lDjIjfOMdEJUdNkbYDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415341; c=relaxed/simple;
	bh=+YBZQEkAW+nv8DgMUCfzH7Di3KVglmnoPApd9uuPUqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtDsSVPb/FGUDCNns9ByKyNHXcxqNiloRT67jVUkFD7k0KS399cGilpX9+IuTLSJXv4JSlF2lOBGzre3Txo0oS2Aw4E5rNlvgEJ8bt/vdpUXGcScf56oI+NV+mgrqGjsbLOb3SmmkeV3C6J3w2duWruh7bwbXkZBLYqPhZUdzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=fG3l6Q+V; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 38FAB40EA0BF;
	Thu,  2 Oct 2025 10:28:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759415330; x=
	1761229731; bh=+YBZQEkAW+nv8DgMUCfzH7Di3KVglmnoPApd9uuPUqY=; b=f
	G3l6Q+VQhm8v9I/2keLIKneA649gW2c8Ktp94wB71pTpE5IOK1TioLxwnermUUDt
	VTq9Iah+gF6wNDkYboRHpNP/pWeyDy0dEjZX7gv84l9X320SEqFCbw4U9+/sDRS0
	kcyxSZq9RaZnkmjhyl4eUCCvcwsyzvIPhHiJRWGVLI=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l-_14F8ab49j; Thu,  2 Oct 2025 10:28:50 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id BAB9445735E9;
	Thu,  2 Oct 2025 10:28:50 -0400 (EDT)
Date: Thu, 2 Oct 2025 10:28:49 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aN6MIX54e49yALeO@ada.csh.rit.edu>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
 <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <aN6F7Qw7wZAYpHCB@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN6F7Qw7wZAYpHCB@tzungbi-laptop>

Hello!

On Thu, Oct 02, 2025 at 10:02:21PM +0800, Tzung-Bi Shih wrote:
> The change looks irrelevant to the patch.
I can put this in another patch in the series. I wasn't sure.

> I'm not sure: doesn't it need to use list_for_each_entry_safe() (or variants)
> as elements may be removed in the loop?
Absolutely! I noticed this too. Fix coming next revision :)

> 
> > +				/* Don't stop ourselves */
> > +				if (worker == my_worker)
> > +					continue;
> > +
> > +				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
> > +					list_del_rcu(&worker->list);
> 
> If RCU is using, does it still need to acquire the spinlock?
I believe so, yes. My understanding is RCU lists are safe against unprotected
reads, but you still need to protect list ops like add/remove:
https://www.kernel.org/doc/html/latest/RCU/listRCU.html#example-1-read-mostly-list-deferred-destruction

> Alternatively, could it use the spinlock to protect the list so that it doesn't
> need RCU at all?
Yes! That's what my next version will do.

> I'm not sure: however it seems this function may be in IRQ context too (as
> gpio_mpsse_irq_disable() does).  GFP_KERNEL can sleep.
I worried about the same, but didn't actually follow up on it because I never
ran into it. My bad. I will make this GFP_NOWAIT in the next revision.

> > +		scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
> > +			list_add_rcu(&worker->list, &priv->workers);
> 
> Doesn't it need a synchronize_rcu()?
My understanding was that synchronize_rcu was a grace period delay, so you
could be certain any readers after this point would get the new data.
In this case, we don't care what the readers get. Now that I'm thinking
about it though, maybe the irq loop should call synchronize_rcu first?

In any case though, this will be going away in my next version.

> >  static void gpio_mpsse_disconnect(struct usb_interface *intf)
> >  {
> > +	struct mpsse_worker *worker;
> >  	struct mpsse_priv *priv = usb_get_intfdata(intf);
> > +	struct list_head destructors = LIST_HEAD_INIT(destructors);
> > +
> > +	/*
> > +	 * Lock prevents double-free of worker from here and the teardown
> > +	 * step at the beginning of gpio_mpsse_poll
> > +	 */
> > +	scoped_guard(mutex, &priv->irq_race) {
> > +		scoped_guard(rcu) {
> > +			list_for_each_entry_rcu(worker, &priv->workers, list) {
> > +				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
> > +					list_del_rcu(&worker->list);
> > +
> > +				/* Give worker a chance to terminate itself */
> > +				atomic_set(&worker->cancelled, 1);
> > +				/* Keep track of stuff to cancel */
> > +				INIT_LIST_HEAD(&worker->destroy);
> > +				list_add(&worker->destroy, &destructors);
> > +			}
> > +		}
> > +		/* Make sure list consumers are finished before we tear down */
> > +		synchronize_rcu();
> > +		list_for_each_entry(worker, &destructors, destroy)
> > +			gpio_mpsse_stop(worker);
> > +	}
> 
> The code block is very similar to block in gpio_mpsse_poll() above.  Could
> consider to use a function to prevent duplicate code.
Yeah I agree. I didn't really see a satisfying way to do it with the difference
in scoped_guard vs scoped_cond_guard, though. Now that I'm thinking about it
again though, I could just take everything inside the mutex guard and put
that into a function.

Thanks a lot for taking a look! It's hard doing a critical reading of your own
code, especially for concurrency/memory safety things :)

