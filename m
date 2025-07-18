Return-Path: <linux-gpio+bounces-23464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A040B0A554
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DCC1C8201F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 13:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F571386B4;
	Fri, 18 Jul 2025 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9O4l0Y7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAE52AD2F;
	Fri, 18 Jul 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845932; cv=none; b=RBblVtvqP6ld8VNfo2rKSRimX2vMZ9qH7MDPLQLVS1nG/4pITGTG6onSfDStP5CnfS3VglwxwYWE/5yp5qISUOU2GieeXJOs0k99QKaKAdu3MI0L8LpkvYDXgZo4snaR88fweUZ70leba4HJsCIKQT2NVVZdqOdn+y91wG5ss5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845932; c=relaxed/simple;
	bh=hhXy1hKhDJolxRQyk/NrBYTuqZpGCqrvUQ+9K8FtH5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8CmsBAvQ78MSd0vnrnLYX6idBDP8FVIPNpxYdWN/Y4m+9EqQAzmn4IEwMA7uu+OpNcyKS6hmV1Vv4HbfRWdaVXVPScS8bKXyZB2TdYxMIWMEMdelu4LeLR79juoA1ddCPO1g04T4YvvtgIzDAKUpVY/Qor233HjGP5Sp7QEoWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9O4l0Y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D886C4CEEB;
	Fri, 18 Jul 2025 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752845931;
	bh=hhXy1hKhDJolxRQyk/NrBYTuqZpGCqrvUQ+9K8FtH5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9O4l0Y7neB2dJP3p5M/diYfvq68WmH+sHkhJJw/D+WSIrrROYYHuyFtmkjPzFRVb
	 dUeRrCHnlww2h7b5xmDOXRog74TE3ruQkiA5CVx1aFv1//Gg0kPtZz9SLBpBIzZQpX
	 oBt/Qlz1jtC28B7nENvW8bmR5gWaOzqau1RcT05bD1Ma4u9Se9IyPir4gXTiO5Kdah
	 qk3ljj4uaVrGY+uuUHaKgyrHiA5Teh9WSr5Rr5vyAsverpV91gi07dObsOBTTVozE8
	 pdT5zGuTpxvGo1kMMAoTnD2bRZfypqnOcPCkobZv6INpOFFLXx+M+AJdRIs59psmXb
	 vaYhDcraG1nNw==
Date: Fri, 18 Jul 2025 14:38:46 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due
 for the v6.17 merge window
Message-ID: <20250718133846.GE11056@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
 <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
 <20250718071344.GA11056@google.com>
 <b57e761b-c1f7-46fc-a1bd-c419062ceb18@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b57e761b-c1f7-46fc-a1bd-c419062ceb18@sirena.org.uk>

On Fri, 18 Jul 2025, Mark Brown wrote:

> On Fri, Jul 18, 2025 at 08:13:44AM +0100, Lee Jones wrote:
> > On Thu, 10 Jul 2025, Mark Brown wrote:
> > > On Thu, Jul 10, 2025 at 10:49:06AM +0100, Lee Jones wrote:
> 
> > > > Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge window
> 
> > > Is there some reason you didn't also pick up the regulator patches?
> 
> > Is that a joke?  I'm going to assume that you're not serious!
> 
> There's two things here.  One is that the discussions you've linked were
> from back in April/May which was before the merge window and things only
> got applied a day or two before the merge window opened.   Then rather
> than resending after the merge window as expected whoever it was
> complained about the patches not being applied just did that with no
> further context and it didn't occur to me to look at the date and as a
> result I missed that, sorry.
> 
> The other issue is that due to the constant drip of MFD serieses getting
> resends what I'm doing I'm just glancing at the relevant patches and
> then not looking further if I've already reviewed them.  I frequently
> have no recollection of any individual series, especially if there's
> been non-trivial time since I actively looked at it.

This is bigger than these particular series.  There are more examples,
but I stopped at the three most recent ones.

For the past decade or so I've been taking cross-subsystem patch-sets
and submitting pull-requests to all other maintainers, after testing of
course.  However, more recently you have become increasingly vocal in
terms of an alternative approach, whereby I apply the set without
patches that pertain to your AoR (usually Regulators) and submit an
immutable branch for you to pull from.  I have attempted both recently
and each has received criticism, showing preference for the other.

Honestly, I don't mind which strategy we put into place.  Let's just
agree on one and go with it.

-- 
Lee Jones [李琼斯]

