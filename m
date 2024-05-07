Return-Path: <linux-gpio+bounces-6204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CC8BE835
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 18:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 674111F2C90C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 16:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6B916C858;
	Tue,  7 May 2024 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpwgShI5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE516C6A0;
	Tue,  7 May 2024 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097718; cv=none; b=U4FFjgYGZO/iKStcb+Al6PYS25cYl9GlTL9P81GMnRSxcLtEwykrmDUcbYZAC8eZV/sWrUyUyanzbQBosHe3GQgs0Kovo3Z2KZf5abzinf9E2rzK5bvF+1oUUW6IQmh5ttsclq2Fz29X5o2jg8DLWl7lzy7iD+r7vGPWAif+B4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097718; c=relaxed/simple;
	bh=VZJ8+RLe61gK9PUlD/myRLomOS9W7a54C8toInBF7gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDPsN3bn7F/NwAq6Cs3+qWQgfpaWca7qhQ1K8ueIfj1D3B4k2iAf6DSr2LJh27wiAwysGyl95lUNgtAXHN3CHqYVUJYkWGkRHW1gTYu2dljQ3lCBRZC7U9ZHw19IWSVeUY75Eb8VZk/ZnZz6X2qzjKIk0pvYk1BpoIhcE3tJtc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpwgShI5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBED5C2BBFC;
	Tue,  7 May 2024 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715097717;
	bh=VZJ8+RLe61gK9PUlD/myRLomOS9W7a54C8toInBF7gE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SpwgShI5wIUMTdUWl1AeFmLRRDMtdEx/ZrTwMcKYxc9Qf5PMou/bpLvF2mHuXtYsh
	 afCaX30hHxu15qEi2zpYsZX8K4knnxrSaMaU/dJjEnHU5aM2AlfKoLJtEJTnPUyPPk
	 Q9bWlJuTMbPzN2ljhYFoVjyCeSJqn+cYuoiOFFGHwZxBQLtUdY1NicXRZ13uUFKgCs
	 0vLEuwJ+XnjC0wwho324ZcrX/8TuCng5HZHv6vypkOQvg9UPE+KsLQPJgHY0ES+syw
	 D6NqFfQoNjQ0wbTZM6zvuxdVST6Du/tMSl405yFVrj67Swyj885sRcp3iilJoGGF6j
	 zE5RSniEqZUGA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 86E8BCE14CC; Tue,  7 May 2024 09:01:57 -0700 (PDT)
Date: Tue, 7 May 2024 09:01:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with
 SRCU
Message-ID: <1e9042a9-f8ba-4ca9-a5e3-5eed1a02e1ca@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240507121346.16969-1-brgl@bgdev.pl>
 <597f5da2-71be-4144-a570-fdc4f06c4cc6@paulmck-laptop>
 <CAMRc=MexihBpLBcY-8aX06buUYmtE07ZpkMq0Ho3jrHb6VE7Sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MexihBpLBcY-8aX06buUYmtE07ZpkMq0Ho3jrHb6VE7Sw@mail.gmail.com>

On Tue, May 07, 2024 at 04:48:04PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 7, 2024 at 4:24 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Tue, May 07, 2024 at 02:13:46PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> > > caused a massive drop in performance of requesting GPIO lines due to the
> > > call to synchronize_srcu() on each label change. Rework the code to not
> > > wait until all read-only users are done with reading the label but
> > > instead atomically replace the label pointer and schedule its release
> > > after all read-only critical sections are done.
> > >
> > > To that end wrap the descriptor label in a struct that also contains the
> > > rcu_head struct required for deferring tasks using call_srcu() and stop
> > > using kstrdup_const() as we're required to allocate memory anyway. Just
> > > allocate enough for the label string and rcu_head in one go.
> > >
> > > Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Closes: https://lore.kernel.org/linux-gpio/CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com/
> > > Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> > > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Looks good to me!
> >
> > Acked-by: Paul E. McKenney <paulmck@kernel.org>
> >
> > One semi-related question...  Why the per-descriptor srcu_struct?
> >
> > If the srcu_struct was shared among all of these, you could just do one
> > synchronize_srcu() and one cleanup_srcu_struct() instead of needing to
> > do one per gdev->desc[] entry.
> >
> > You might be able to go further and have one srcu_struct for all the
> > gpio devices.
> >
> > Or did you guys run tests and find some performance problem with sharing
> > srcu_struct structures?   (I wouldn't expect one, but sometimes the
> > hardware has a better imagination than I do.)
> >
> 
> I guess my goal was not to make synchronize_srcu() for descriptor X
> wait for read-only operations on descriptor Y. But with that gone, I
> suppose you're right, we can improve this patch further by switching
> to a single SRCU descriptor.
> 
> I'll send a v2.

My guess is that a separate patch for each of the two changes would be
best, but I must defer to you guys on that.

							Thanx, Paul

