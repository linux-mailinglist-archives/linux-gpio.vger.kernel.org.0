Return-Path: <linux-gpio+bounces-23434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0330B09C28
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBA535A6C02
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062AB2192F9;
	Fri, 18 Jul 2025 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePewANYk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DD217F26;
	Fri, 18 Jul 2025 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752822830; cv=none; b=PHWWj8pqpG+Nn3uUERvkNh3AUC8tbK1rk9im2K4zdsjG81JIqpf9YuZaG4eC6b/kE9jWn+DjDLH3QxSOQ6mwf8YIlHatO3WXAT5c6eVNFqD5qWYcdFJondHRniu2wSrEd9/+u8W2PyAmoHKg7D5xEcgcs2tSFrolegRh5bCY1tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752822830; c=relaxed/simple;
	bh=OdMtW5lc/8Syc5fXGf6jT6SkSmBc/+J9IqjG6QyQdco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bycZgQ0oNJK3Gm4ORjB6nRm4w1k82EOWCNiuRvgmryX5gkX/1yWAnVtVn8IbJZf++3F17KpyVDgH3mfF/NxalpyU+rfdoeHRKDKtoxJyPv3OypP5RVEOsCERTnguZi3jSDxNgCyCVR/ZCOx9ihbHMEF9lFIToWTdlskaR7cdT2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePewANYk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5025FC4CEED;
	Fri, 18 Jul 2025 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752822830;
	bh=OdMtW5lc/8Syc5fXGf6jT6SkSmBc/+J9IqjG6QyQdco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePewANYkgnoEx2ygQsQvJACtYlUxJX7ZPXEaGZx4yZPWGwfwv36vcFSEXPy2sVVTJ
	 Ad7oPxtO4whFPSp2Zmsy23uRQj76Mr12mFlgsKxjiyUh+xIvle7Wct3hdHe4MRPS5v
	 JJZnZURuQV0mBzHFwgpbpBoXYFVBrxcK04ob2HdCGV40fXTJFxHpE6/bwSDFmZ0g7o
	 sofviehkHfxQ41ppbdE9cygODg9jMlrigX4Pln0QjicFxQFe4qLMZuEpR4lpZEx7XK
	 62g5cyqgkSih8R2S3pgc0TApOd0F/AO6Gai0iIlrZ5yB6Hu3cGbg015Kvt45yYQxtm
	 pKeYehf9WSnwA==
Date: Fri, 18 Jul 2025 08:13:44 +0100
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
Message-ID: <20250718071344.GA11056@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
 <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>

On Thu, 10 Jul 2025, Mark Brown wrote:

> On Thu, Jul 10, 2025 at 10:49:06AM +0100, Lee Jones wrote:
> > Enjoy!
> > 
> > The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> > 
> >   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-pinctrl-v6.17
> > 
> > for you to fetch changes up to d90171bc2e5f69c038d1807e6f64fba3d1ad6bee:
> > 
> >   dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC (2025-07-10 10:40:21 +0100)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge window
> 
> Is there some reason you didn't also pick up the regulator patches?

Is that a joke?  I'm going to assume that you're not serious!

https://lore.kernel.org/all/aCWfre2-n_PSuhxR@finisterre.sirena.org.uk/

  ">   1. Apply this now and merge the dependents next cycle
   >   2. Apply this now and provide an IB
   >   3. Wait for all Acks and apply as a unified set
   >
   > We usually choose 3, hence my assumptions above.

   Well, you choose 3 - I do think it'd be a lot easier to go with option
   2, or with applying the rest to your tree as acks come in.  There seemed
   to still be a reasonable amount of discussion on the MFD bits (eg,
   there's some formatting comments still) so I was expecting this series
   to churn some more and was waiting for a resend."

https://lore.kernel.org/all/601dd4c7-0940-498b-815e-99e570e732d2@sirena.org.uk/

  "So not apply the first two patches and share a branch like you said
   above...  TBH these serieses would probably be a bit more legible if
   the branch were created with just the MFD patches, that'd also mean
   smaller cross merges."

IRC:

  "<b*****e> Probably the easiest thing is a tag with the MFD bits and then I can apply the regulator patches?"

Etc ...

-- 
Lee Jones [李琼斯]

