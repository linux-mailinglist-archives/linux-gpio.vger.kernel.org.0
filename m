Return-Path: <linux-gpio+bounces-25379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CDEB40107
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B291172236
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C00A2BDC04;
	Tue,  2 Sep 2025 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+bWUbXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645529C323;
	Tue,  2 Sep 2025 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817074; cv=none; b=ba1UCyFxw4zrcTcZ51oWLYxcFg/d9elD5R3acgEZIvdYYorhpwRXA88GmjH7oAcSf2QMkcV4vL+KTJZIywcs3iJOfg1qxjzrtH/uWE1jjsHC/deK+cf0AYLC1yWVxORi+slCPuXnE+KiFokcU8zTbJ25FA2WSitsmMXDIuXTu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817074; c=relaxed/simple;
	bh=+u4Z+IQ9DZ5vSKPxsayJQJapVxCK69PmDrWyxnv6990=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAzvFRZLyF5z0YHUeR3ytdSfbUtT65UPjrCeF77+hGGw/XRdPCaSiUdjAs2ImBL7cPlpwLJB8bPtk/CX4c0Vyka2sgNBusiYd8bl/heFBQMsjMKe0YruwT9dFq9b2V/9b3G8f+e1diuH9LFo0dk2kVwPaXS3GJlqmviLpbJn518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+bWUbXj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A556FC4CEED;
	Tue,  2 Sep 2025 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756817073;
	bh=+u4Z+IQ9DZ5vSKPxsayJQJapVxCK69PmDrWyxnv6990=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+bWUbXjF3RzCU1RYQ2abOE4dFM1KEG1p9My0wadSBgHPKUoerUKaIv2ApqawSTVr
	 mcaTyjiPNeWfS+TYpqjCwX52YaooedEhVLJv8dtt+TRJfKEGiex8eGqS7OSbRYbRs6
	 dbLcCkajL9uFOHwVbOlbO8760SyapDz37DMf1M7GKSI/+9S7l5m4MkDO8y5VPOZs4a
	 5iCrBmPiPbc3fxKt9JfLMplNcxUav9BeUy+fG4/zegLt6GYNyaCC4G90pJU9Qc1jYG
	 9I3XV83iRJreP+aQ5txNoEwrC0Z7Moj00pgCts0ZzMuEZOHNA7od38a2pQ/FZIrs97
	 9xC/8epo6UxbQ==
Date: Tue, 2 Sep 2025 13:44:27 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/21] mfd: arizona: make legacy gpiolib interface
 optional
Message-ID: <20250902124427.GM2163762@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-13-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808151822.536879-13-arnd@kernel.org>

On Fri, 08 Aug 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The only machine that still uses the old gpio number based interface
> is the wlf_cragg_6410 board file. In order to remove the dependency
> on the interfaces, add #ifdef blocks here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mfd/arizona-irq.c         |  5 ++++-
>  include/linux/mfd/arizona/pdata.h |  6 ++++++
>  sound/soc/codecs/arizona-jack.c   | 17 ++++++++++++++++-
>  3 files changed, 26 insertions(+), 2 deletions(-)

Just FTR, I hate this!   =:-D

-- 
Lee Jones [李琼斯]

