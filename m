Return-Path: <linux-gpio+bounces-15765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F8A3133F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 18:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7DB162869
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 17:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C5D17C91;
	Tue, 11 Feb 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="P3iRA/LF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA126156B;
	Tue, 11 Feb 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295663; cv=none; b=K3ih+JRDsM30bRoA6Zboux0vCqmMpIQS0qHzrAGuKKMljxlInQGw1O9HcZ9ibm5taskJVgeNM9o59QVItcH7JVftqAfDBtvzH1N09C8n43g2AKm3SSyZjYBa3PmzwigM8WgLT8jW7zCKohiDcZ0syxBq8IP2dj35IQS9WZtHFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295663; c=relaxed/simple;
	bh=GOiwm1wHZc/AznJrAuxQaJv6N7XnPRihLg4UA4rAFHI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=CXpO/rqV0ruhH2g4OK/3YUMPFbyi60z7KTIWKCTt5mWyvOA/YYfFW39nrFceQYd40K7nAzlGAOMzD/bmnIvb8Nf6UTqJS6zoKzgASDjxRjSejXi024/fVOMkXp4Y1ywZWMXXlchvXSSSKL5jdOnRhwx2WMAa+MEQuS1MzLeC3WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=P3iRA/LF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A858A25B0D;
	Tue, 11 Feb 2025 18:40:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SotM2Jdszzq; Tue, 11 Feb 2025 18:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739295648; bh=GOiwm1wHZc/AznJrAuxQaJv6N7XnPRihLg4UA4rAFHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P3iRA/LFZEX1s9f0Z0/3GlcbJ6usxjiHNpVMnzOKgpgC3asR1tryrnnNM1S4d6dKo
	 7DWGN2n77QYchJs1MqDyxOklxrhE52E4QFvySI8riosYYr3iPEdASqUvwxGDmg3eND
	 sf22RN4B6sXqf8ZkBZmjnNeQNLuzan15rugqMLRCOl9qhnkT6HWg508ckl1DXuLSRK
	 nhqVvFMEzyPWhQ8x6c+JSzKykZ0XnbX3JRsX4KSLso25/AKYmkZVrIatZjMRJBAkf+
	 9odluTlD2LzQj+ZT9RLvmw1/Mk1oag626SF25Y5f1BuEWqFXyXCtpf9ZKFtsl/uCf0
	 LG9hjdKMgTbRw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:40:39 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 3/3] pinctrl: samsung: add support for exynos7870 pinctrl
In-Reply-To: <20250204-exynos7870-pinctrl-v1-3-77b9800749b7@disroot.org>
References: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
 <20250204-exynos7870-pinctrl-v1-3-77b9800749b7@disroot.org>
Message-ID: <03c51c96256aa6b927febf7c005d9164@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-03 20:35, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Add support for the Exynos7870 SoC pin-controller in the pinctrl driver.
> It has 8 GPIO banks, and 3-bit PINCFG_TYPE_DRV width.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 141 +++++++++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.h       |  29 +++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
>  4 files changed, 173 insertions(+)
> 

Please refrain from merging, wait for the next revision.
Thank you.

