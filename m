Return-Path: <linux-gpio+bounces-6160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B98BD45F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 20:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC23D1F237C3
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 18:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42FC1586F5;
	Mon,  6 May 2024 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVO9f3O/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843BD14293
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715018845; cv=none; b=cqrkP3wQe6jxnOxa8nC6BY2XU0CKeNSNXQjfhXHW1v3Nl4k/nygAe7/QNVkee1uEv6QFiMSHy+pDaEk5NHR8UKsOpTFooV6EvnLW8wP0LmyMi0ub+q55I0G8r8ednUK9dgKhhPoQvEFgzXWnb4K74hyr8Z+qwvwuzuEDVrmGidg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715018845; c=relaxed/simple;
	bh=SsF60UEse9cN5j+AEEBJQ5tTWjVXwRe1d229iHATptk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9KD7dkuovchl8Y+jx4SL+cxYOBK74HLVdcas7x5i+XE7T+pihMP2pCHvvyF4zLPpKJdR9cQSatkaiV8JPmanfCnh5TOIiXW6FhQ/nXUjeltD7i8mfNErnYAvls+XXJpjM6K9gP2WqqHemqrmAPm7W5CHoC4dTT8zXqQ7q98fXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVO9f3O/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEBEC116B1;
	Mon,  6 May 2024 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715018845;
	bh=SsF60UEse9cN5j+AEEBJQ5tTWjVXwRe1d229iHATptk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hVO9f3O/ruPLkp7rEcgAKuR3VB/Ekhl0gg31r2xfyE1UJhwfKH2pxMyeH1jl5CSLF
	 uxFzShCCYYFDT9IYDaFELWTfBc9r7JpVr/e8iqk2yHmY7XYbizcnDfJxfvnD0CJVMM
	 nkq5Vo5mKAX5ULQhhGsmJidx7yYJen6EfdWuupJ6csWmWzzhGcBVqSgzPdTRjGMMmE
	 KDMLKWFJGHQoUyuvAb98T2E6WjlDverNTMN6/Rp+mJcJMuhN3IkHRe4Xn3W9Iw2JJJ
	 Qlfz4VxqqwdagymHohMrVfB2YGOTkf17rqGoYvHCJj+GTMH3/vQVHbZS3GrjlWFtN0
	 cbY/35U+CRibQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AA05FCE0C56; Mon,  6 May 2024 11:07:24 -0700 (PDT)
Date: Mon, 6 May 2024 11:07:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Performance regression in GPIOLIB with SRCU when using the
 user-space ABI in a *wrong* way
Message-ID: <1abdbbea-7d2b-46f6-851d-94531e889136@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>
 <2b2eb5f5-af66-4ba3-bab8-c34b680d8715@paulmck-laptop>
 <CAMRc=MfnSc1WWg47g-SZqqgEQPUQG-EfHEQxEqvvmRA1ksVnDw@mail.gmail.com>
 <4c2ea46e-8062-4289-bcf8-c3cf6ebedb9e@paulmck-laptop>
 <CAMRc=MfF4kkXToy+RSt4QPXPtsOEUcM4xpXdosWTxtjUy9x6CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfF4kkXToy+RSt4QPXPtsOEUcM4xpXdosWTxtjUy9x6CA@mail.gmail.com>

On Mon, May 06, 2024 at 07:46:18PM +0200, Bartosz Golaszewski wrote:
> On Mon, May 6, 2024 at 7:01 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, May 06, 2024 at 06:34:27PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, May 6, 2024 at 3:55 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > On Mon, May 06, 2024 at 02:32:57PM +0200, Bartosz Golaszewski wrote:
> > > >>
> > > > > The offending kernel code looks like this:
> > > > >
> > > > >     old = rcu_replace_pointer(desc->label, new, 1);
> > > > >     synchronize_srcu(&desc->srcu);
> > > > >     kfree_const(old);
> > > > >
> > > > > I was wondering if we even have to synchronize here? The corresponding
> > > > > read-only sections call srcu_dereference(desc->label, &desc->srcu).
> > > > > Would it be enough to implement kfree_const_rcu() and use it here
> > > > > without synchronizing? Would the read-only users correctly see that
> > > > > last dereferenced address still points to valid memory until they all
> > > > > release the lock and the memory would only then be freed? Is my
> > > > > understanding of kfree_rcu() correct?
> > > >
> > > > It looks like kfree_const() just does a kfree(), so why not use
> > > > call_srcu() to replace the above calls to synchronize_srcu() and
> > > > kfree_const()?
> > > >
> > > > Something like this:
> > > >
> > > >         if (!is_kernel_rodata((unsigned long)(old)))
> > > >                 call_srcu(&desc->srcu, &desc->rh, gpio_cb);
> > > >
> > > > This requires adding an rcu_head field named "rh" to the structure
> > > > referenced by "desc" and creating a gpio_cb() wrapper function:
> > > >
> > > > static void connection_release(struct rcu_head *rhp)
> > > > {
> > > >         struct beats_me *bmp = container_of(rhp, struct beats_me, rh);
> > > >
> > > >         kfree(bmp);
> > > > }
> > > >
> > > > I could not find the code, so I don't know what "beats_me" above
> > > > should be replaced with.
> > > >
> > > > Would that work?
> > >
> > > Thanks, this looks like a potential solution but something's not clear
> > > for me. What I want to free here is "old". However, its address is a
> > > field in struct beats_me and it's replaced (using
> > > rcu_replace_pointer()) before scheduling the free. When
> > > connection_release() will eventually be called, I think the address
> > > under bmp->label will be the new one? How would I pass some arbitrary
> > > user data to this callback (if at all possible?).
> >
> > You are quite right, that "&desc->rh" should be "&old->rh", and the
> > struct rcu_head would need to go into the structure referenced by "old".
> >
> > Apologies for my confusion, but in my defense, I could not find this code.
> 
> Sorry, I should have pointed to it in the first place. It lives in
> drivers/gpio/gpiolib.c in desc_set_label(). So "old" here is actually
> a const char * so I guess it should be made into a full-blown struct
> for this to work?

I should have been able to find that.  Maybe too early on Monday.  :-/

Anyway, yes, and one approach would be to have a structure containing
an rcu_head structure at the beginning and then the const char array
following that.  Please note that the rcu_head structure is modified by
call_srcu(), and thus cannot be const.

> Also: do I need to somehow manage struct rcu_head? Initialize/release
> it with some dedicated API? I couldn't find anything.

No management is needed unless the enclosing structure is allocated
on the stack.  In that case, you need topass a pointer to the rcu_head
structure to init_rcu_head_on_stack() before passing it to call_rcu()
and to destroy_rcu_head_on_stack() before the rcu_head structure goes
out of scope.

But in the usual case where the rcu_head structure is dynamically
allocated, no management, initialization, or cleanup is needed.

							Thanx, Paul

