Return-Path: <linux-gpio+bounces-10347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A10097E377
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D52B6281285
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB5E6F2F9;
	Sun, 22 Sep 2024 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD5NvXFv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99871E885;
	Sun, 22 Sep 2024 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038085; cv=none; b=SASdMKl/o5hQE1EeIxd3k5Vb2dwziwSY9DPbimp+5sQFlV6qrBSRvZLO+29kzdsE8bneZKBhRWc5EEOuVfMvVn4TtvHVCjC2NJhCMo8PMGpT/4IMTjMACq6JbTqR+EeiHJbAGJrAi2VkgvY0CZkoMDYEn1CAqgO8e9ZSdDbt4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038085; c=relaxed/simple;
	bh=1DoX6kMjVHukEwNMDo0LGa7/+nERPQnFShkMMKp5U5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJ3TDLkbcdaMqpPihPzwRQS61fbegijAFvBOQnHZ64ylUym9FAUNh28Y7Xyp6ZWoNMaqpWcJPyLCuorHlYoxitYIW5lssmkUrFW9J/OYJ2C6+kLF3ypxMUQ/uvhR4dSV1nduH2pl+LsUbU8XbsSmwbjFwzlZh7HyLJcXhGYsoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD5NvXFv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82109C4CEC3;
	Sun, 22 Sep 2024 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727038084;
	bh=1DoX6kMjVHukEwNMDo0LGa7/+nERPQnFShkMMKp5U5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QD5NvXFvDUINpjCz7uFx9Yju9EKa5WSmzz+ZXNWI0fqnhT3dmzKX2LrPffr8D2d8Y
	 rHsynzKRPprukd84jqLzXjp7jVeASedift9tneuHW/ZIPsG3Y6r6doZi+Qt6MV/0Zh
	 CwQohmuf7cWKHHgULpLfrBbSvK8ABz8nC9BRSSj5auEryYNsJSBeJpe3KKPvDENK9f
	 vu4ZsaUf1ye6rSXu6Es6/UeMPCKsqeg/0vuNbKXNQoBhVYWy/6mPZcGQ0sK2HYD7TR
	 xEbS/swCZt5NKOGbn0O1nZmLVqHNQf6dYlY8NEPy4kQBfzdaxO+Q3FIPRo+Ger0j0M
	 VeEcBPoqSJ2Kg==
Date: Sun, 22 Sep 2024 22:48:00 +0200
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
Subject: Re: [PATCH v4 20/20] arm64: Kconfig: Update help text for
 CONFIG_ARCH_APPLE
Message-ID: <cbddajjjmw76kooled45r7qg3syneoyrwdntoa37poeetmozl7@tgbwyilrc4pg>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-21-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-21-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:06:09AM +0800, Nick Chan wrote:
> Apple's A7-A11 SoC is now supported, so the original help text is no longer
> accurate.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  arch/arm64/Kconfig.platforms | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


