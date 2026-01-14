Return-Path: <linux-gpio+bounces-30573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F1D1FF96
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EAD030AC969
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8364B3A0EBE;
	Wed, 14 Jan 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHXlr+cP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347433A0EAB;
	Wed, 14 Jan 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405819; cv=none; b=kLYgUO4zUn7ld3sICWIQvByzV2ctbEu5pDX4taMndb2iTjSktxrShy+8Qab405fbLyXpnnxKgxO5jYB4UfY/dpVNX5pf9mOpD6P6zi5GMfVm3uyKDyhX0A0AqZDxMRJ8jCwPFccGpirlbsKOF9fawy9WbjnwBZ1DU+2WrccBqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405819; c=relaxed/simple;
	bh=WbeHBEoN+C8EbquNP50Ie42ERKUSvKWZulzbN1NwCfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvEiWkiYL06XHqfE64m1lUqyX0yCwwOtqlhxPFFeC14JjIlnSBUwCrFMWhuYROJim+RqSpCVyERQSH0h5PqJl4Gib2DRTcPsqbZQsjpOKEfpXA37J9uRZCCLtNz98DxBee953zyunlauSj5UOH3c401IYyyy7zpNm0nDv2cjNhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHXlr+cP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC68AC16AAE;
	Wed, 14 Jan 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405818;
	bh=WbeHBEoN+C8EbquNP50Ie42ERKUSvKWZulzbN1NwCfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHXlr+cPA7G+y9W/6q8nK6WTFjyGONueBdZPkyKwdnDiHUrSJ74B1IR2kuH0TZAxQ
	 esOy53tfz/kZo6ReazcNtY4Sy1hjaAZQdWZpnN3mXBZnQzc6MlxIDb6p8gQKgSvUhn
	 JdO0VjtVw4Ad4+N0t7HgjP9tXVoBO7E3dNFzUC56MdsobZjRfqnX3ZoKGiXuUYiXSw
	 8SnE3JLH3G/ll1oFrVWKy1uErJvobH6D4n4rViwPY0WKqCgAAMmVV4h9q0MR13zaN7
	 LbiwaV5in507qUcg0HkllfeHMVSTLjo54+ihzyeyofs/O3DkLRCLRnAjZVG+gXrKeO
	 vE5wJUNRowehg==
Date: Wed, 14 Jan 2026 15:50:11 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260114155011.GC2842980@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
 <20260113112244.GE1902656@google.com>
 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>

On Tue, 13 Jan 2026, Mark Brown wrote:

> On Tue, Jan 13, 2026 at 11:22:44AM +0000, Lee Jones wrote:
> 
> > MFD pieces look okay to me.
> 
> > Once Mark provides his AB, I can merge the set.
> 
> Given that the bulk of the series is regulator changes I'd been
> expecting to take it?

I have no issues with that, providing you offer a succinct immutable
branch containing just this set for me to pull from.

Failing that, I have the machinery in place to offer you the same.

-- 
Lee Jones [李琼斯]

