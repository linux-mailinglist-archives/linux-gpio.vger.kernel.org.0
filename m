Return-Path: <linux-gpio+bounces-26856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02473BC0976
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 10:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 006E3189DD23
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 08:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB0628CF42;
	Tue,  7 Oct 2025 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQezEBHu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDD28C5DE;
	Tue,  7 Oct 2025 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825027; cv=none; b=ZTYdmh4sjsOYKfN1dMVkSvh6lqlp8EVzZ/1JI23MEhIXm9N18CcQUyP/GTlzvxrH/q+pF5scjUYWfr9GCvNHfeVEf8CuiZXW27xKbUnA427tCRgWENAfOzIHPXESNE86n0Otitx0lYdkwNtqDhKLw+mkEqLT3TliOhj3tkq7PA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825027; c=relaxed/simple;
	bh=F/Pu2cP3Bsmi2dyQ5mUal6sOBG3HrhOQ+IgdWZ/RgOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6o0/XD78nZz0Xs1OYWYxd+rz59Zso1iv4XcQEQj/m2ZcxQhr9kEjYOU9rFIdPQXEfmJ3BQJr6XSdidO4MVd4RSprr1RxSaN3Uj32j5Sg3u/KYIsBJNQ77pexJmG8ucOmUjpAuo1VdBRBXN6iEfnzwjHBjrmDX1e9rDTS+n75Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQezEBHu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F10EC4CEF1;
	Tue,  7 Oct 2025 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759825023;
	bh=F/Pu2cP3Bsmi2dyQ5mUal6sOBG3HrhOQ+IgdWZ/RgOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQezEBHuO/J69raMkQR+o2Oh9TLpqNtYmthe8I8RGhfMN+mkNrM76ZKvA1LyM5Jmc
	 QOdgcKrXW7aK+vb5E4JIJ28b94n++fkv/Tn3z+ZeNd2MnxwBaaEvYGlv1qtDax+LeQ
	 eughTz9ufMzK2TPmSGFBsP9CdmJ6Uxm3BX67ogrnS0iGDBUPqi3LZsXh1gj00Pq97n
	 mZDfBg2WK/1n2Gs+5zh+bDz1hEesxc8R7vK0/JLxMemYx3a+pir3iwuelihoYfZG/r
	 LJjS9NCdNp+cRIQe6qkYz3VZYNCc+xGm11jMcDhdJsu0jbpc45loIMDxUPknRWki+A
	 760wMGlFnLXFQ==
From: William Breathitt Gray <wbg@kernel.org>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	mwalle@kernel.org
Cc: William Breathitt Gray <wbg@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andriy.shevchenko@linux.intel.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
Date: Tue,  7 Oct 2025 17:16:55 +0900
Message-ID: <20251007081657.30422-1-wbg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=wbg@kernel.org; h=from:subject; bh=F/Pu2cP3Bsmi2dyQ5mUal6sOBG3HrhOQ+IgdWZ/RgOA=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlPziSc3L0y9V+xx773a3/9PhfCK7iqQ6dx1xa2ZctM3 lWvePNRtKOUhUGMi0FWTJGl1/zs3QeXVDV+vJi/DWYOKxPIEAYuTgGYiNpuhv8RZpNOCplza9Xf VviY+CGpbq2FsKJG5+SCG9O4LYyYQkIY/spf/KH6grWquXl1rRnL7gmcAQt3H+OsecPq6rN/p7r qNlYA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Mon, Oct 06, 2025 at 09:37:14AM +0100, Mark Cave-Ayland wrote:
> root@debian12:~# gpioget 0 0
> gpioget: error reading GPIO values: Input/output error
> 
> which also output:
> 
> [  329.529321] gpio-512 (gpioget): gpiod_direction_input: missing
> direction_input() operation and line is output
> 
> My guess is that this is because
> drivers/gpio/gpio-regmap.c::gpio_regmap_get_direction() isn't able to
> can't handle the situation where lines 0-15 are outputs and lines 16-31
> are inputs, compared with the old idio_16_gpio_get_direction() function
> it replaced.
> 
> What would be the best way forward? Possibly add the .get_direction
> callback to the gpio_regmap_config? Or is there another way to have
> mixed inputs and outputs with the gpio_regmap API?

So the intention I had with gpio-idio-16 was to provide reg_dat_base and
reg_set_base to define the input and output bases, and then
reg_mask_xlate would do the translation between input and outputs. I
think this design is allowed by gpio-regmap, is it not Michael?

In theory, gpio_regmap_get_direction should call gpio->reg_mask_xlate()
which is mapped to idio_16_reg_mask_xlate(), and thus set reg and mask
which then is evaluated at the end of gpio_regmap_get_direction() to
determine which direction to return.

Is it possible idio_16_reg_mask_xlate() is returning the wrong values
for reg and mask?

William Breathitt Gray

