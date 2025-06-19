Return-Path: <linux-gpio+bounces-21878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16365AE0772
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 15:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A878616F21F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DAE2737F5;
	Thu, 19 Jun 2025 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNtFV97u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D025C83F;
	Thu, 19 Jun 2025 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340121; cv=none; b=ShfqVGfh7sCa+9Y7kHnmjjr8FXcUkxG4+r0Ul3EecN+bK3tCOaH61KFwfbLaJ6bvQcgKe+qH/Z5D0Xs8PLqNJHP52ilnlznSWV267OuiItGLjVmiG6ew/UBzuPiAew+LnDERB8U4wbD8LNc5ol/m0G2dVFRP6BwhnIZwEhTp8UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340121; c=relaxed/simple;
	bh=nGBE81iJlu8wL29VIgLNBJjptMMyVWKnbJ7tJuB3pfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2OnWwJQr3Aa/ss3c9r8lC9pJEpQtr6pKkhks9peoFtjIlJcYSqD0bkIqQljcqYXcpBcEPdUeIiuCoHy22kYinKCv/WwZN4iGCWAHBolnR/FP+26BiWnUz7JLadbbReMAzrlQgZG+/OruHa8azSnWfJpBWRgTCGDe9AooNgCqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNtFV97u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BF6C4CEEA;
	Thu, 19 Jun 2025 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750340120;
	bh=nGBE81iJlu8wL29VIgLNBJjptMMyVWKnbJ7tJuB3pfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNtFV97ufpF+IrmqkPnD8MMoRkrDrl5EMNIC4OxW0JWQbBjv10yWzKeiNcQcWn+tl
	 Iwxc+qNptGUA6+Mzc7pWHqw3ctIjImmV2x/Fa0qTovAYWVvgK7I4a7m+waK6lq7ZK0
	 cnXjurgZHWhfCoOQiaKLrWpm0dDSjxpr2UE+SlbfEoXbMqCYDc7vaAm6fVyMJxCfxE
	 xU2ZIWV+pktlZNZ4tXjc4lXO4WfRFN4G6Sl3dJQ35jmMPjTUmP6dCu3iLEwvfNoLH5
	 Vhs8k1A1r159FzyhY9b+Uu8hzFWGDUiv87y4QqFkYOHSdAYSgrTAZfpZAvQQzhZhRm
	 F3JvmylKIqcmg==
Date: Thu, 19 Jun 2025 14:35:15 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/7] mfd: tps6594: Add TI TPS652G1 support
Message-ID: <20250619133515.GB795775@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-2-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613114518.1772109-2-mwalle@kernel.org>

On Fri, 13 Jun 2025, Michael Walle wrote:

> The TPS652G1 is a stripped down version of the TPS65224. From a software
> point of view, it lacks any voltage monitoring, the watchdog, the ESM
> and the ADC.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mfd/tps6594-core.c  | 88 ++++++++++++++++++++++++++++++++++---
>  drivers/mfd/tps6594-i2c.c   | 10 ++++-
>  drivers/mfd/tps6594-spi.c   | 10 ++++-
>  include/linux/mfd/tps6594.h |  1 +
>  4 files changed, 99 insertions(+), 10 deletions(-)

Looks good.

Let me know when you get the misc Ack.

-- 
Lee Jones [李琼斯]

