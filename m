Return-Path: <linux-gpio+bounces-6139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF08BCF81
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5BB1C21ACC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CE180C15;
	Mon,  6 May 2024 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/txX0ME"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FF1811E2
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003749; cv=none; b=t44Ms7mRJKbQWojz8nVPmpx7pOKqHCy6E3q5BRLlbJ1mhMOFw/3vYmve/FQ/NEqzl5pEO4niG2vmQv+6PkUQaQ7VpgHJlCyo7LxEEjcLoaJJCwlVOIEMA5YzsTtXPEQ9pF3NT29xVwpmdwJH/2bUEqN4YBlvY25QgEfRHmEeo1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003749; c=relaxed/simple;
	bh=ovV5Dft9TiJu5cZMJ37nmNAIe4WCT7ZjdtpLv9zl87c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFJYb93mrkLV3c6XiXWpJyqyUr/HugpAiw4GlYInkBCXSv2HFPgovp/RD8DeNAxBvibXMElMPcKj2JyihdCATT9ZkeEtR15MTR11wn0r/XC3lc47i5/UWqch1ExGiGq+cRBD4XtMBWCp3fI4DatUfyhdvOjhNjgqBqWrtaXIr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/txX0ME; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C27BC4AF65;
	Mon,  6 May 2024 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715003749;
	bh=ovV5Dft9TiJu5cZMJ37nmNAIe4WCT7ZjdtpLv9zl87c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=S/txX0MESKKL5t4ytwSfazKhqm6mqW01dZf9XgJdTsPPAZhh1CE4Kca4y+txQgew1
	 5PSdFYR+hT+fE0w/Dnrw3BY755fBpy2sx3VN/uJ79S04bgL8YrAiyMyhFUDW/A+191
	 DoIi12C0EE0ePnw//PvdeYO6rKP2KfKhYJld9s9RXuLRQiThaUAEdxmK5THgZQKiVr
	 0yDf9EzUIEpT9w2mUbLp6kKp2voNEiFOUoVZQLcotZNakOQ6AqymeqrbyW1TM0DqNy
	 m4zPcbNqprsQrz8im1fa91FCYmiDaZEO3MvLlcXsAsvhPki2reunl9AVLmus9KUw4M
	 upX2JN+C3Vfzg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E784ECE0C56; Mon,  6 May 2024 06:55:48 -0700 (PDT)
Date: Mon, 6 May 2024 06:55:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Performance regression in GPIOLIB with SRCU when using the
 user-space ABI in a *wrong* way
Message-ID: <2b2eb5f5-af66-4ba3-bab8-c34b680d8715@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>

On Mon, May 06, 2024 at 02:32:57PM +0200, Bartosz Golaszewski wrote:
> Hi Paul et al,
> 
> I have recently received two independent reports of a performance
> regression in the GPIO character device. In both cases it was bisected
> to commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with
> SRCU"). I assume it's caused by the wait imposed by synchronize_srcu()
> in desc_set_label().
> 
> In both cases the drop in performance is caused by the fact that the
> user-space code in question does something like this (treat it as
> pseudocode as in both cases users were using libgpiod v1.6.x but the
> result with libgpiod v2 would be the same):
> 
>     for (;;) {
>         req = gpiod_chip_request_lines(chip, ...);
>         gpiod_line_request_get/set_value(req, ...);
>         gpiod_line_request_release(req);
>     }
> 
> This pattern can be seen in code that implements some bitbanging
> protocols etc. from user-space - programs that call request/release in
> quick succession can indeed see a slow-down now with SRCU.
> 
> Please note that this is almost certainly wrong: in general the user
> process should request the GPIO, keep it requested and then perform
> any accesses as required. What this code does, would be analogous to
> the following code in the kernel:
> 
>     for (;;) {
>         desc = gpiod_get(dev, "foo", ...);
>         gpiod_set_value(desc, ...);
>         gpiod_put(desc);
>     }
> 
> Of course what drivers actually do is: call gpiod_get() once in
> probe() and free the descriptor with gpiod_put() in remove() and
> user-space should follow the same pattern.
> 
> While I could just brush it off and tell the users to fix their code
> as the libgpiod test-suite which executes a more realistic set of
> operations actually runs slightly faster after the recent rework, I
> assume I'll be getting more reports like this so I want to look into
> it and see if something can be done.
> 
> It turns out that performance stays the same if the thread running the
> above code is pinned to a single CPU (for example: using
> pthread_setaffinity_np()). Is this normal for SRCU to wait for much
> longer if this is not the case? I don't know enough to understand why
> this is the case.
> 
> The offending kernel code looks like this:
> 
>     old = rcu_replace_pointer(desc->label, new, 1);
>     synchronize_srcu(&desc->srcu);
>     kfree_const(old);
> 
> I was wondering if we even have to synchronize here? The corresponding
> read-only sections call srcu_dereference(desc->label, &desc->srcu).
> Would it be enough to implement kfree_const_rcu() and use it here
> without synchronizing? Would the read-only users correctly see that
> last dereferenced address still points to valid memory until they all
> release the lock and the memory would only then be freed? Is my
> understanding of kfree_rcu() correct?

It looks like kfree_const() just does a kfree(), so why not use
call_srcu() to replace the above calls to synchronize_srcu() and
kfree_const()?

Something like this:

	if (!is_kernel_rodata((unsigned long)(old)))
		call_srcu(&desc->srcu, &desc->rh, gpio_cb);

This requires adding an rcu_head field named "rh" to the structure
referenced by "desc" and creating a gpio_cb() wrapper function:

static void connection_release(struct rcu_head *rhp)
{
	struct beats_me *bmp = container_of(rhp, struct beats_me, rh);

	kfree(bmp);
}

I could not find the code, so I don't know what "beats_me" above
should be replaced with.

Would that work?

							Thanx, Paul

