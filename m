Return-Path: <linux-gpio+bounces-6378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F78C61B7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 09:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD881C21939
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 07:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2667943AA2;
	Wed, 15 May 2024 07:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Q47T57f4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5F41C84
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715758252; cv=none; b=o5UBtpFOUocolf1vRre+8nJY30mQdgaSpi8kGwu1ShV/XVj5OEJivpbhSixYJ0igtchtKiWHd9rjvRIMvxFJWllibSa0B+kftMgxz6Zm3SbOOpgrPxRegCf+FYqX48IM/wij7hSQu85IsWwbodu1NQ7JsctA3YCbKQR795zF7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715758252; c=relaxed/simple;
	bh=JZUMdkSs6p2jDY9s2eg78uMKRAMR1blTOh7pbeQN0bY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h3roXjYdm1Ekmga7GwFkcd23zFR9EA9+NcywxH7EI2lhoHw/0KKNSPCMJswGYlLnsWfv2g+KhubGb/YX6H9Z+a+CEaphTHzAPH7kcsUNeE5sOZ7/gifxVkNuvggdZlR6kRfn8VonZfDh7M2KOj8OG4hE529D1FS3Kf05wrIuKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=Q47T57f4; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JZUMdkSs6p2jDY9s2eg78uMKRAMR1blTOh7pbeQN0bY=; b=Q47T57f4F5kBYcVQmlfZtjHrqP
	rVjS2C11/Q2KFcJw54zmkIuzA2tr+IaSVdzDrwB0a3/BChXpsGRtZScaxLk5i8BAEAUweH8I/G0Ga
	w5jZ272fIZovpkz6VgbAvJu0ijLWWh9KygRynA24am9KIg7ATTInFJdJizHvKOYIHc1b9HCZX+8Ys
	cs3xKfK9wL3lYsziyfCN3pVjhHvlSFvQnZFbXOfh5LaUFKg6dSr4kmweKbCiUtbUtwQnmRDFC6RL4
	t89F84zT+6LCfJIRPreWop1DBTo5ZlSdbYDvlIfjLelIJ/jQ6bR8nBZIAkG+E65UkSd8wRYVRxsKr
	6Wtm8FWQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s78ix-000DtO-Jt; Wed, 15 May 2024 09:06:51 +0200
Received: from [85.184.138.13] (helo=[192.168.8.20])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s78ix-000NJU-0L;
	Wed, 15 May 2024 09:06:51 +0200
Message-ID: <cfa1d2cc41a4c5f924f1599a4da0c8e6fbe00eba.camel@geanix.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, Esben Haabendal <esben@geanix.com>
Date: Wed, 15 May 2024 09:06:50 +0200
In-Reply-To: <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
References: <20240507022106.GC26136@rigel>
	 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
	 <20240511011144.GA3390@rigel>
	 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27275/Tue May 14 10:25:55 2024)

On Mon, 2024-05-13 at 01:28 -0700, Bartosz Golaszewski wrote:
> > Anyway, have a think about it.
> > And I'll go take a look at the GLib bindings.
> >=20
>=20
> I have thought about it. I agree we could use some simpler
> interfaces. I don't
> agree their place is in core libgpiod. I understand we want to make
> this new
> interface seamless to use for end-users of libgpiod.
>=20
> How about introducing a new header and a separate shared object:
> gpiod-ext.h
> and libgpiod-ext.so respectively? We could put all these new helpers
> in there,
> use the gpiod_ext_ prefix for all of them and distros could package
> the
> "extended" part of libgpiod together with the core library to avoid
> having to
> install multiple packages?
>=20
> We'd keep the clear distinction between the low-level, core C library
> wrapping
> the kernel uAPI and the user-friendly C API. Though the user-friendly
> API in my
> book could be the GLib library but I understand not everyone wants to
> use GLib
> nor is familiar with GObject.

For our embedded use cases we would go far to avoid GLib in our root
filesystem (and our initrd too). This means relying on libgpiod only.

With the current core API, reading a single gpio line feels cumbersome.
Especially because we often use gpio labels to run the same binaries on
multiple hardware variants.

So we would really like to see an "extended" API, with wrappers to:
=C2=A0* request a single gpio line from chip + offset
 * request a single gpio line from a (unique) label
 * read the current value of the requested gpio line
 * set the current value of the requested gpio line

Having those functionalities in a separate shared object is fine.

// Martin

