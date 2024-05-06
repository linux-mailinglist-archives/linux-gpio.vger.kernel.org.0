Return-Path: <linux-gpio+bounces-6158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B238BD387
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044621F21ECF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E131156F38;
	Mon,  6 May 2024 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/rneQRt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D8155723
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014875; cv=none; b=FyOd0MRjjfxeV3UvR1QheiT/RSJGJTSKHIMnbjigDBkxoXKSHqEFZKC/gyXzRjY1PiSn28MU//SGsbHwgDQaZM6HG3ffHBeZUyB0mrubFk8a/fctYGakyIrRE0KUsSZVdWCPz+Zql/gfqtlC6opOABeWrr8tXS6k+bAO9ZDZnH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014875; c=relaxed/simple;
	bh=9iPfHbZkaQ80Tm2MrSsuLQpJnkwdDfXEXCt8JfpcA3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YChDyJTgXGDBy28DMk4ikXZQiq3uxG9Hcv3q2IuSUQ9FinSKmvuN+AwS5iyp3CTCo3aKk9/lZXdA2HTG4QCpJSt7UlhfEIKB2/da+1m87k/SaKOhvI/e90jlP2s60k5b48W/ixfv05G8Mk6BJuHqpTD5bzHjUkktop7YMx74obY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/rneQRt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6510FC116B1;
	Mon,  6 May 2024 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715014875;
	bh=9iPfHbZkaQ80Tm2MrSsuLQpJnkwdDfXEXCt8JfpcA3I=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Z/rneQRtkGsA07p079o4WF6qgpkjaVROnMzsQeGA5aeWeVOuzNj6NQ/64QCIwKAlm
	 eV4/lwMrsR6ysSzjLbg09YntxWyWuk9HyvBVYvKzRf4yVqN/Cpjyf+Sfq8B9/ssN82
	 +wdBcOEUy7Z0FAdxAXUyOj1XbGzPUyt9jYXK5m1OkFzBcwQPw3yJiSbF7EgPQ6BS+R
	 iyFFoqUdAuyuHu2iFrzAWs2V5ZZGYc3HV1Ojcscc70g0oUnBBqhyUv5LS7n/FJgKVP
	 yv/UpATKrgVdO1MDJ9JmaBFd71gppPPtZVzPKXBUMf4huNTWZJjYXawkd0o9czufft
	 kMBwHFGxYOL6Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0E652CE0C56; Mon,  6 May 2024 10:01:15 -0700 (PDT)
Date: Mon, 6 May 2024 10:01:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Performance regression in GPIOLIB with SRCU when using the
 user-space ABI in a *wrong* way
Message-ID: <4c2ea46e-8062-4289-bcf8-c3cf6ebedb9e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>
 <2b2eb5f5-af66-4ba3-bab8-c34b680d8715@paulmck-laptop>
 <CAMRc=MfnSc1WWg47g-SZqqgEQPUQG-EfHEQxEqvvmRA1ksVnDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfnSc1WWg47g-SZqqgEQPUQG-EfHEQxEqvvmRA1ksVnDw@mail.gmail.com>

On Mon, May 06, 2024 at 06:34:27PM +0200, Bartosz Golaszewski wrote:
> On Mon, May 6, 2024 at 3:55 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, May 06, 2024 at 02:32:57PM +0200, Bartosz Golaszewski wrote:
> >>
> > > The offending kernel code looks like this:
> > >
> > >     old = rcu_replace_pointer(desc->label, new, 1);
> > >     synchronize_srcu(&desc->srcu);
> > >     kfree_const(old);
> > >
> > > I was wondering if we even have to synchronize here? The corresponding
> > > read-only sections call srcu_dereference(desc->label, &desc->srcu).
> > > Would it be enough to implement kfree_const_rcu() and use it here
> > > without synchronizing? Would the read-only users correctly see that
> > > last dereferenced address still points to valid memory until they all
> > > release the lock and the memory would only then be freed? Is my
> > > understanding of kfree_rcu() correct?
> >
> > It looks like kfree_const() just does a kfree(), so why not use
> > call_srcu() to replace the above calls to synchronize_srcu() and
> > kfree_const()?
> >
> > Something like this:
> >
> >         if (!is_kernel_rodata((unsigned long)(old)))
> >                 call_srcu(&desc->srcu, &desc->rh, gpio_cb);
> >
> > This requires adding an rcu_head field named "rh" to the structure
> > referenced by "desc" and creating a gpio_cb() wrapper function:
> >
> > static void connection_release(struct rcu_head *rhp)
> > {
> >         struct beats_me *bmp = container_of(rhp, struct beats_me, rh);
> >
> >         kfree(bmp);
> > }
> >
> > I could not find the code, so I don't know what "beats_me" above
> > should be replaced with.
> >
> > Would that work?
> 
> Thanks, this looks like a potential solution but something's not clear
> for me. What I want to free here is "old". However, its address is a
> field in struct beats_me and it's replaced (using
> rcu_replace_pointer()) before scheduling the free. When
> connection_release() will eventually be called, I think the address
> under bmp->label will be the new one? How would I pass some arbitrary
> user data to this callback (if at all possible?).

You are quite right, that "&desc->rh" should be "&old->rh", and the
struct rcu_head would need to go into the structure referenced by "old".

Apologies for my confusion, but in my defense, I could not find this code.

							Thanx, Paul

