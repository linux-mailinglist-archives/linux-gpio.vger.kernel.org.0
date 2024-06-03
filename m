Return-Path: <linux-gpio+bounces-7060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D58D8077
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E59282E92
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6612483CAE;
	Mon,  3 Jun 2024 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxh3iUvr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C174E0C
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412360; cv=none; b=rDKCDEOntt1B2tys05ZSkUEL1IIZiP3uINNsmDF68kCG0CjTyEO9zN78dhk/CQiawDtWArB2nf+ayv+kFnnW0ZACyq83Bgub7gQV8V2HkdQNQ/I23mhUd4ceb/+hUtFwGsrWBnX6CDea1W6lt/jnfSxaEgdxZZCGoE9mzdCeA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412360; c=relaxed/simple;
	bh=7ILYvgNYQysn3Q2vnJKuzjtSa+fBgRSs4YZ832U9VQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTrP7r2kmoiY8uKHRiBhIQmO+Y7aQlR0maWuPlBoLbqL2U7fYv2VR0MF3ADeLk99TtouyY1jE+Rm/cgFOG4sBu0AurunN1fVSqLhzriSQ18vhRHZ4ksfeQEy2v640AJNuUpGAiEM2lhjkFog7jUo7079CG6FaLeUyo2x8V53wXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxh3iUvr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7025f4f4572so814692b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717412358; x=1718017158; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IBAexqJ3zBDpnpuuxQ7wtckUzirwkuwxRywok3T4Rmw=;
        b=mxh3iUvrAa5RS5qMMtxHz6nwyD6hSbclul7sdgiAoaoKMKFqfDmFCGpprUR2jk9Df8
         DIj912g05KJIBs7qJ5G1iy3yOYfLrltqSnZoPilor1bGXfTdMZyD1ItcF8LtxS/wJIzK
         +AVeIIAUAFuzgAfko7WSlja58DXLudO6Hh2ekNfLi1JX6Qnx93hwPwPMCJwxj6+pLRXC
         iTtMVb221421GlyRZhB7vTFfIq+eM5dX+QghOQFz2jSqvhqqANNRaZgddksXi8Jpv+2/
         MLNPuHM6SliI3NTlnnkW9rNLLyqpOyv3P5Tzk9/cf7eRaIjkteIY9HhR1/yIhxw+AYkE
         Xs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717412358; x=1718017158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBAexqJ3zBDpnpuuxQ7wtckUzirwkuwxRywok3T4Rmw=;
        b=NJtDkDEnnYLeaidXArqdgZhL4PjjYE8OFmO859iQgO1pd0H619CVRvEVuRbrhjMz+d
         DZT4DL3ZK0ZtY5TVTBQHy5v/OWHLR2Aqd1U3WZdChK7dlICznCO567bN0+G58e9d4y/B
         Mna94PNG5vgTDk+bgdaAC3GAnMRM48b1C8BqaFUpYn08CD1e9dog9QEsvN1AYPaOoHwv
         3Gy5T0gUKAMwW/0giUGR8SFEcsPCufLaxPIQgPe0TqNBjE5AYyWc3cVGr4zw2Y6svbbb
         899XSys8my8TaYFJ7SC/TZfc6tqrPbOdvCqeX58Gnq9EB7KvvhOvtUnrrhhAPAC3QJgn
         DqYg==
X-Gm-Message-State: AOJu0Ywkmr2GlZmx7Q5dhQJ2G9EEpMyjTeIbVxOz/5Q9GBtIEFX/iv88
	3Scr6/DnKPtlGnE+T5mW6noZ4y/IOEjBFS8PHgpupDqZ5cHNij3seWGYsQ==
X-Google-Smtp-Source: AGHT+IGlXMQ9kL9Sz9EDOWQ9EOxmi10PqZKOQKV3d38O+CV/mvTszFJvjEuDa4ShVLLPailWIZTt0w==
X-Received: by 2002:a05:6a20:daa5:b0:1a7:590e:279e with SMTP id adf61e73a8af0-1b26f0e774bmr13816159637.5.1717412357960;
        Mon, 03 Jun 2024 03:59:17 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35515311asm5143363a12.38.2024.06.03.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:59:17 -0700 (PDT)
Date: Mon, 3 Jun 2024 18:59:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/8] tools: tests: fix shellcheck warnings
Message-ID: <20240603105914.GA97042@rigel>
References: <20240531134512.443850-1-warthog618@gmail.com>
 <CAMRc=McChxEY2cnbzmHY1LAwSAxT5+irRWtbv3KqW8anDgfL4Q@mail.gmail.com>
 <20240603104308.GA95478@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240603104308.GA95478@rigel>

On Mon, Jun 03, 2024 at 06:43:08PM +0800, Kent Gibson wrote:
> On Mon, Jun 03, 2024 at 12:40:37PM +0200, Bartosz Golaszewski wrote:
> > On Fri, May 31, 2024 at 3:45 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Following up on recent discussions, this series fixes all the warnings
> > > detected by shellcheck.  The resulting tools test script is now clean,
> > > at least from the perspective of shellcheck.
> > >
> > > These fixes do not correct any known issue, other than shellcheck
> > > reporting them as potential problems, the intent is to remove common
> > > shell issues that may impact future changes, and to simplify checking
> > > that any subsequent changes to the test script constitute "good" shell.
> > >
> > > All the patches other than Patch 8 address a particular warning.
> > > They are reasonably self-explanatory, but each commit comment includes a
> > > link to the relevant warning(s) which describes the issue and the
> > > appropriate corrections.
> > >
> > > Patch 8 addresses a number of warnings, all related to word splitting
> > > and globbing, and those constitute the bulk of the changes.
> > > Some of the earlier patches also address trivial splitting/globbing
> > > issues where that would prevent a line being modified multiple times.
> > >
> > > Cheers,
> > > Kent.
> > >
> > > Kent Gibson (8):
> > >   tools: tests: don't mix string and array
> > >   tools: tests: don't declare and assign separately
> > >   tools: tests: fix unused variables
> > >   tools: tests: use read -r to avoid mangling backslashes
> > >   tools: tests: don't use variables in printf format string
> > >   tools: tests: check exit code directly
> > >   tools: tests: shellcheck don't follow sourced file
> > >   tools: tests: avoid splitting and globbing
> > >
> > >  tools/gpio-tools-test.bash | 459 +++++++++++++++++++------------------
> > >  1 file changed, 234 insertions(+), 225 deletions(-)
> > >
> > > --
> > > 2.39.2
> > >
> >
> > Ugh, you added links after the SoB and it messes up with b4. Can you
> > resend it with links before any tags? Or better yet: make [x] into
> > Link: [x] so that b4 can interpret it correctly?
> >
>
> hehe, yeah I wondered about that after I'd sent it.
> I'll fix for v2.
>

Can I confirm this is the format you want:

    Link: [1] https://www.shellcheck.net/wiki/SC2145

cos that makes checkpatch.pl unhappy.

Thanks,
Kent.

