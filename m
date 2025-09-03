Return-Path: <linux-gpio+bounces-25459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 440D0B417F7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1406F1BA3ECC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1252E54D6;
	Wed,  3 Sep 2025 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRbxBhfV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804C332F759;
	Wed,  3 Sep 2025 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886764; cv=none; b=Uvx3j+0WQOI7+qXtOSBoAcN7FfdjhaYhgzmKO9utxX4IYK/LMWG3dQdPoXkANiE4nL+qgdD31T0Wc+VQen61U+32MCD3+5hz9uyaDyQNXQ6Xzs1G+bWU/NOJ4iV6yO3A0b3pNToEEf+8xTEgD0ETCLatQI7Tjh96G4Ag8URcW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886764; c=relaxed/simple;
	bh=wDnvBLehK7IJqRY8ivJ2SBG6bvf3CzMsEAz5fK3TvCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUsM75jcYzUWLau449KiPQ/cu7Mf2iAtox2vCIAdowRqZxywhLT4ewWA4wdJE1P3ypcSa6p3dtRi3kkZzW/NpTzIwmNymSxg+IlDmyXOAmxHSdoaGSKGucTZ40tOTGoUMriryts7uJRryjROpU2q5bDrfYBkurSaZ+9nwbLPqa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRbxBhfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B5CC4CEF0;
	Wed,  3 Sep 2025 08:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886764;
	bh=wDnvBLehK7IJqRY8ivJ2SBG6bvf3CzMsEAz5fK3TvCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRbxBhfVISQ3oCC/dXePYzlkZqd3oAjksWMD/mJydWudE21uxv2qnSBB6OsHrlyLe
	 C6pqEo68ozPGxUTLDgQCNldksyjBEh0tSdhUqtGqzDKNtPTwfHsarHuv5GASJx35jc
	 6X/0mcFTVo71PfsgPIZAnCqebaIrKMShfENt7+A3kSKkHB4BVvkNuJJZu3KPNmYzRZ
	 +6MrCLxauIdcB/ibHmnwcUpfVLYyZyG2+q/NMt29xXg5BDZqFewZVRd3fmsfkdIYpG
	 uq8faRq3Oyq7ma1FcCAUhgNfQ9F39E/AO9DHJMSVOocjnJO8cT8ueBjougrgkQs6zx
	 6KLtXgUlX0Irw==
Date: Wed, 3 Sep 2025 09:05:58 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Jiri Slaby <jirislaby@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/21] mfd: arizona: make legacy gpiolib interface
 optional
Message-ID: <20250903080558.GC2163762@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-13-arnd@kernel.org>
 <20250902124427.GM2163762@google.com>
 <5a683d99-b323-4ab7-bf0a-e91436ffd301@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a683d99-b323-4ab7-bf0a-e91436ffd301@app.fastmail.com>

On Tue, 02 Sep 2025, Arnd Bergmann wrote:

> On Tue, Sep 2, 2025, at 14:44, Lee Jones wrote:
> > On Fri, 08 Aug 2025, Arnd Bergmann wrote:
> >
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The only machine that still uses the old gpio number based interface
> >> is the wlf_cragg_6410 board file. In order to remove the dependency
> >> on the interfaces, add #ifdef blocks here.
> >> 
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>  drivers/mfd/arizona-irq.c         |  5 ++++-
> >>  include/linux/mfd/arizona/pdata.h |  6 ++++++
> >>  sound/soc/codecs/arizona-jack.c   | 17 ++++++++++++++++-
> >>  3 files changed, 26 insertions(+), 2 deletions(-)
> >
> > Just FTR, I hate this!   =:-D
> 
> Any alternative suggestions?
> 
> Would you be happier with a hard "depends on GPIOLIB_LEGACY"?
> 
> I see only two in-tree users other than the old 6410 board
> that use the modern path: exynos5433-tm2-common.dtsi
> and drivers/platform/x86/x86-android-tablets/lenovo.c.
> 
> Making those platforms 'select GPIOLIB_LEGACY' is technically
> incorrect since they don't need the legayc interfaces, but it
> would be a temporary workaround until wlf_cragg_6410 is
> gone.

I've applied the patches for now in the hope that these can get cleaned
away at one point.

-- 
Lee Jones [李琼斯]

