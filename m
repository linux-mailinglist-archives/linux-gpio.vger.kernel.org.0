Return-Path: <linux-gpio+bounces-20287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA08ABBE1D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 14:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 949163B59B1
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 12:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151A2278E7F;
	Mon, 19 May 2025 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXHUVwNu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67E22339;
	Mon, 19 May 2025 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658559; cv=none; b=G2Q6OmZUhsJH7Wib97/ofJBynWzwbyAind941n9EU6JssRK1exFpFuKaZJ14bPqbn/fNNTDOm7utabiPeCC4HgdqFAsy/FJITYTudiMwZNPFY2KEtGFT+3tt3/9JFyDTceUeX42Cx3tnlOKKd8+Iq6W8zDPsGSlEIJwoIpy7KAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658559; c=relaxed/simple;
	bh=iWb64mpfGWYFttCriCMI9AmY9YMbIIrfyB0yaxjiDPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReQEHKP1KRKVnAagzCYxiOhSMrab01bkiNcpSI4e/0D6Lv5J+TjFLUEQPMu2pxd0Q/EcbiHoEG4TcHCykz7Y3n9YXPfj86OWpIqnlUt2LWcz1KdaarF1ftjgRKY7ge67YWRuoFZsoWCT+b+MBS7ixGZIZwbkcG/7VVlLJ5lN8RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXHUVwNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FF0C4CEF1;
	Mon, 19 May 2025 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747658559;
	bh=iWb64mpfGWYFttCriCMI9AmY9YMbIIrfyB0yaxjiDPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXHUVwNua4905w+hsZeutp4rRHq8dH/nVXBOTybw5lo+Xn+agxiIx+iD0u5EOLpmp
	 izSdJthAxXTVSn/pr2zwc++p1PcqoBTCJwS3JUXGXOoXu8GN721IrYpKDVnqfYd2DN
	 VmzNHJAX7ykmMFqT0J4h4s3zJ/g3iPHOvcvXhILc/b3N9P0rD1Uyi4UVe1f/ubprRu
	 8EXjpdPHNzsHhBtilLuLZg5zhgWtRCUhLhFMxmkB6CHDnzUAYpweIf6E7c+Zo8a70P
	 fGm1a5Ldiyh7GFug7Q9emdkIEiXdqK29p+FCKnT+KflRkV+rWtoIR83g460cTIHZSh
	 e3VhZxSg7m6jA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uGzpC-000000006ah-23l0;
	Mon, 19 May 2025 14:42:34 +0200
Date: Mon, 19 May 2025 14:42:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: add missing mutex_destroy()
Message-ID: <aCsnOthU3z1jwWdb@hovoldconsulting.com>
References: <20250516104023.20561-1-brgl@bgdev.pl>
 <aCckl9cC8fCBhHQT@hovoldconsulting.com>
 <CAMRc=Mf=xW6HFVYOOVS2W6GOGHS2tCRtDYAco0rz4wmEpMZhmA@mail.gmail.com>
 <aCdutI4J6r5kjCNs@hovoldconsulting.com>
 <CAMRc=MdS0QG_ThYUhwTRaKidyGcj3h6x0=jmaW7UK8EBPhrYrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdS0QG_ThYUhwTRaKidyGcj3h6x0=jmaW7UK8EBPhrYrw@mail.gmail.com>

On Mon, May 19, 2025 at 02:18:15PM +0200, Bartosz Golaszewski wrote:
> On Fri, May 16, 2025 at 6:58 PM Johan Hovold <johan@kernel.org> wrote:
> > On Fri, May 16, 2025 at 02:32:54PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, May 16, 2025 at 1:42 PM Johan Hovold <johan@kernel.org> wrote:
> > > > On Fri, May 16, 2025 at 12:40:23PM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > We initialize the data->mutex in gpiod_export() but lack the
> > > > > corresponding mutex_destroy() in gpiod_unexport() causing a resource
> > > > > leak with mutex debugging enabled. Add the call right before kfreeing
> > > > > the GPIO data.
> > > >
> > > > No, there's no resource leak and it's perfectly fine not to call
> > > > mutex_destroy().
> > >
> > > No, there's no leak but with lock debugging it still warns if the
> > > mutex is locked when it's being destroyed so the change still makes
> > > sense with a modified commit message.
> > >
> > > > You can't just make shit up and then pretend to fix it...
> > >
> > > There's no need for this kind of comment. You made your point clear in
> > > the first sentence.
> >
> > Your claim that there's "a resource leak with mutex debugging enabled"
> > is is quite specific. Now I had to go check that no one had changed
> > something in ways they shouldn't have recently. But mutex_destroy()
> > still works as it always has, which you should have verified yourself
> > before sending a "fix" tagged for stable backport based on a hunch.
> 
> Yes, I admitted that the commit message was wrong. And yes, it
> sometimes happens that we get copied on crappy patches. However,
> unlike what your comment suggests, I don't go around the kernel,
> "making sh*t up" just to add a "Fixes: Johan's commit". I had this as
> part of a bigger rework I have in progress[1] (discussed previously
> here[2]) and figured that with the series growing in size, I'll at
> least get the fix upstream before v6.16-rc1.

But it is not a fix. It is based on a misunderstanding that you should
have caught yourself by just looking at the code before posting.

Sure, mutex_destroy() is an odd bird, but you still need to verify your
guesses before posting patches based on them. It's that lazy attitude
(and violation of the stable kernel policy) that I'm criticising.

Johan

