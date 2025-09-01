Return-Path: <linux-gpio+bounces-25338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE0B3EF49
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 22:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B38512C123E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 20:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D652652AF;
	Mon,  1 Sep 2025 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWCeABhK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803C35898;
	Mon,  1 Sep 2025 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757688; cv=none; b=ExiFf7nCuJgl/NI4u4AE2d0OUs3EBhgH85JNqgKLdOaXo4lsokUorEUrc+eGeAhTScKsZU4AntnIp3QKkjGRdRHr0TVYyYdCY4Ya4zYdwYaQqUb7YbowClZo3Xg2kfhNfT768VlPNvZzpjrjkikEw4A7FmNJPSCuSbpJiZhBdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757688; c=relaxed/simple;
	bh=XUjw+gkTug2t0oPPOFwOLTpUa/DqKZjK1vNIgNUzZI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glyVctHiH38Ta34vOO+R6Bsife5R2evdSQTaBxmuBb9+pCuPHPs6CJL49y2UMA/lWzIpIc6tUEMwCJESWvrblIZScX8uLV2djSCrthcWRNFWFWjjlcmU0EVTaerZHBf0+Mnc1PEEWG1hSBURqHVrDXv9p2G356REduLC7IB0+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWCeABhK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12478C4CEF0;
	Mon,  1 Sep 2025 20:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757688;
	bh=XUjw+gkTug2t0oPPOFwOLTpUa/DqKZjK1vNIgNUzZI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWCeABhKhjS8GHMFOD0CpQrHOrekr6efDq6tXA2PkLGEw54UnKQ5+ENvMTNj5S3G0
	 r9QrkojsuFEDfDjWCQjFO5EDWteUFyHd4JdJSTY5O/3BQC5vcZ9Xs3Zzscv5lXftzs
	 6cuTCTBT6rfch2slTZbr1aV0mcmNnE63o27CmqfdPIdDuf3kEV2oH+KWISAtCx94iC
	 VYHpq26cMo1IbS3Hb3+/Ggo80zYSnHhBn8KhQOS7Z0+u1vrjPK7Zjj8QfHZdmRANLJ
	 Ot650HiQjcgbvURdekk44U5YZU1ZzhI9VlPUssCZNlYDeXYHKl0FQFqusQJICrAPj7
	 gYeUb8lqWmq8g==
Date: Mon, 1 Sep 2025 15:14:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
Message-ID: <175675768662.267701.16704430254181198518.robh@kernel.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
 <20250830111657.126190-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830111657.126190-4-krzysztof.kozlowski@linaro.org>


On Sat, 30 Aug 2025 13:16:59 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../samsung,pinctrl-wakeup-interrupt.yaml     | 19 +------------------
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |  4 ----
>  2 files changed, 1 insertion(+), 22 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


