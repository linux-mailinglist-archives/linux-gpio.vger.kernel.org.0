Return-Path: <linux-gpio+bounces-10339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA697E355
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6361C208FC
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E01679E5;
	Sun, 22 Sep 2024 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkEchFHu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F12AEFC;
	Sun, 22 Sep 2024 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037892; cv=none; b=G3GlIfuNOAaCDescYAKe6niHlEZ4ACT1G8j9yxylFIn/ffvPPLKaUQyUXhd/GLSjNaFM3kBjSbkpLi4OhVusTsMlBwn6FHmNFpgLiRaA7wEkf9Q6VuW7t9AgvwI2YXpOvYTSxQkyO/81BdVoefpT+5G3PWoEucwHy73bLdpQ9KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037892; c=relaxed/simple;
	bh=VdEP323SNOVdHySyl7mlwTpgGnx6KhCLhlVGwyM5sb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZyH6aJGKOj23I7QymnenQuTiuyJoXcL1/4DVk1GqXDzAUp8OI7/z4GBbmuAKjXywfBCkm/NoIOGYsQwlP8TPu0a0os1yiRhmifir4PGufqmdYPpV2Wv7RZwCrrM/kVs+ctRoJH3tTFdak/WAPa6d/raEbInNk7jeazyIplyans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkEchFHu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D602C4CEC3;
	Sun, 22 Sep 2024 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037892;
	bh=VdEP323SNOVdHySyl7mlwTpgGnx6KhCLhlVGwyM5sb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkEchFHuE2X7fhGALyCdI+A5kPUwYmW0TEYoPmRPIeV1SU6mRwVe9DLOts8GOgEpa
	 uwybCyPb1JrklQAKcSdVDEAK6zwlpXhfK8gW/kVEYRAqCzbjTPqwyxeJJi9JQwB9te
	 XbWl9jLKz9y+mXW1rTcj0m00vVdVMAFYIFjlWPVLr/9qag1RqMA1vBIEYYWg0FXeEd
	 6ALfGKgdN3ZrdgydqvOVlqlTdfr7X7RDDrmBUS7bW7Uw12V4ef1QJvEbleEpAaFvFI
	 iX3pweEsTSLn9gse4YWtveOkbPjgpikAHYrxPvspjnOT5v/QXOJiXv3rSXzY54ZTHB
	 6t8V1sKz02Mqg==
Date: Sun, 22 Sep 2024 22:44:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 11/20] dt-bindings: arm: apple: Add A11 devices
Message-ID: <gq2wfnidltpmyyejyt4lb2np6wrza2xkju5cpq7vwbyajblh7c@j4aqrxkn27ex>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-12-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-12-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:06:00AM +0800, Nick Chan wrote:
> Add the follow apple,t8015 based platforms:
> 
> - iPhone 8
> - iPhone 8 Plus
> - iPhone X
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


