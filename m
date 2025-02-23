Return-Path: <linux-gpio+bounces-16430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC5A40E17
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 11:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EDF73BA9D7
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 10:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5A3204C2C;
	Sun, 23 Feb 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+gd4JXl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B791FCFC6;
	Sun, 23 Feb 2025 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740306799; cv=none; b=FY0O8E4Zp8N4kr5yoh2dFx+A6X2ekDmonuG9Sts8WNcMoNGvydjYUt1lSr24Oa7vq00pS1RTsL+hbRxSubUV/rkDNo4esdVPWzAe7h/3jSGXhvJtA8gaRlS2bZlU6mvuEfty3Rcl5wHSN5nCBXHjTe+09wXR8C+EVUknA4LXlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740306799; c=relaxed/simple;
	bh=FLirW3ftLfXRJNxdSRNnrqsyTaGJiadECUqG3czTtBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlwDJTyxq9qgO1U/Er72aIT6vliph4P3l87BdqQ67WWUVnzIOsC8yk3uCkxeU7/SVK5JKqEMrN7OVlb0JG/j5Sgz8MKFDGHvtvs+bwdcVBhRqvQrdBqnbPDV4OYetbqon//w6aNHlSrNyUfpoR4IZPIoYLEHLsCUA89BRv7IsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+gd4JXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC8DC4CEDD;
	Sun, 23 Feb 2025 10:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740306797;
	bh=FLirW3ftLfXRJNxdSRNnrqsyTaGJiadECUqG3czTtBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+gd4JXlabh+DhfEPBhrqC28xt0zFouB40fJznlRA8WX25vNK4NpubB/XTu9wdohm
	 TUGFxqw3M5vfgiYGMVDeJw93JSRd0+pzHg6bwb+p0POjtkPZpR5FBWvKR2IvCGFgaL
	 qvfBnula+H7SpAGtgz43ix3B2A63IznR0saRl7T6fbhv1GcpsyGBhmvHW1cTVA244W
	 rg87/ohN6zauB+kSi9VAq9DWeT/OGUIZPAGBc9I5O/Be2KEd2VuJDI+LjdGCFO5oUG
	 k/iZVR2YHYsJobPDLZlBWjG6i258UqwoEIDZWqNSALq65CSxUM4RClCltHUPSDyfQ4
	 ml4X5nhorGRMQ==
Date: Sun, 23 Feb 2025 11:33:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: samsung: add support for exynos7870
 pinctrl
Message-ID: <20250223-peculiar-coati-of-gallantry-6556ee@krzk-bin>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
 <20250219-exynos7870-pinctrl-v2-3-1ff9b10bf913@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pinctrl-v2-3-1ff9b10bf913@disroot.org>

On Wed, Feb 19, 2025 at 12:18:59AM +0530, Kaustabh Chakraborty wrote:
 +
> +/* pin banks of exynos7870 pin-controller 2 (ESE) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(5, 0x000, "gpc7", 0x00),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 3 (FSYS) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(3, 0x000, "gpr0", 0x00),
> +	EXYNOS7870_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
> +	EXYNOS7870_PIN_BANK_EINTG(2, 0x040, "gpr2", 0x08),
> +	EXYNOS7870_PIN_BANK_EINTG(4, 0x060, "gpr3", 0x0c),
> +	EXYNOS7870_PIN_BANK_EINTG(6, 0x080, "gpr4", 0x10),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 4 (MIF) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(2, 0x000, "gpm0", 0x00),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 5 (NFC) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpc2", 0x00),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 6 (TOP) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpb0", 0x00),

Why do you need this new macro? Isn't this the same as existing
exynos8895? Maybe just rename exynos8895 driver bits/structs/types into
7870?

Best regards,
Krzysztof


