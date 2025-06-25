Return-Path: <linux-gpio+bounces-22227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41140AE8ED8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 21:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E478B7AA768
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0232DAFBD;
	Wed, 25 Jun 2025 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cB634nAy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230D2BF00C;
	Wed, 25 Jun 2025 19:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880303; cv=none; b=SjzKluEJ1Quu9l0T6kiGQ7K4g74VAis6A4Tg+pyAoRbY1br7s3gxj0i+ZbWivtVQFjyHLvssdSW+zi9/XfXV+Gj2yhkJ58XvkTejXyEtQ9BRRX3jQ8MRQkfpQV5q4lV6/1+m7q94cTzyrKiHFgiIFIHeg3n90bYhkK8FxVjsrXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880303; c=relaxed/simple;
	bh=pwFIsXgv0jLSLDkzwQ4SNkMiI5VIG0czRQZUAQtF9nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCjHbqbEMrIC6B5CY0if6xTQ2f1EsiCJgk24qPpzq3IYxJYBL0/6sn8jdiJLavO5BpQqb4CA6vBhLpcVLG7RFXv0fOdFQCIkD0S3ZJaS/vk1CAQw5VetQO7x4pWBx+GXWH9HDOSb/VL/3Fy1YD2CbXHsToHxqgBEbmzblos/fT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cB634nAy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A763C4CEEA;
	Wed, 25 Jun 2025 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880302;
	bh=pwFIsXgv0jLSLDkzwQ4SNkMiI5VIG0czRQZUAQtF9nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB634nAyoPtk4yrpYunxkzaAwXgeq6j2V72DD3axaFkRazYJOULImQfq9yfJWRLNu
	 nX7n0CK6pkoOmqxEgUmlpanBvXFrifyFBG9FGj5wbNJy7U9Cw/vh1scCUPuuayaqD+
	 ZRfCmay010+kNuw7D9sK1hTu2jDs8OJmB1S4keojNgO/i4JfLi3uWc9QhuqtqLClYm
	 FXMlgcsW1M9PnG+KmXeH048HTPN7/pCtsvCbiLAlxCPZ6Qrneo14F9zv3qfedY6knT
	 VZxJ3xNF4e3WqEJv+4f4+D4GPFxltIV1zMn6fvFbMtbqALX//JBuR6HJLGVpAK8hAG
	 FfDk3GQAJd8iw==
Date: Wed, 25 Jun 2025 14:38:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Document Tegra186 pin
 controllers
Message-ID: <175088030096.2091553.3144090820246144987.robh@kernel.org>
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-1-502d41f3eedd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-tegra186-pinctrl-v2-1-502d41f3eedd@gmail.com>


On Sun, 08 Jun 2025 21:13:13 -0500, Aaron Kling wrote:
> Tegra186 contains two pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   | 285 +++++++++++++++++++++
>  1 file changed, 285 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


