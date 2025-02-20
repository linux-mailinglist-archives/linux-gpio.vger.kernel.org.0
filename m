Return-Path: <linux-gpio+bounces-16341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D068A3E706
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 22:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472FC189AF7B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 21:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F291F03DE;
	Thu, 20 Feb 2025 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ayV79j/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD211EA7ED;
	Thu, 20 Feb 2025 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740088359; cv=none; b=dQHnLSut5l6ceTGsyJMiOy5C1XWjQLkHVKMvmuQUS8xEuUQs6vqbL4IPHX3zZv9EKtoAQinWwhXQS0ObcqgE6j8kab/1DakbQulqDI9do0AQIYWOMzXdy5tlyOsFtdpiiPATvTAwLliBYcOxYshBt624q9LhYnmiFLI9d95wgjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740088359; c=relaxed/simple;
	bh=hkYlpMcQ4hjR1sAyKjYb41aAUN4ndAHMbj3Q4Y7pvjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aap9vwG+VuaUHn8xVFnGWEYAW9rcmC/b0Ah/IwGVBoXTV5eDL9t8fRAK+VwCrRIauznDk69SbOnd1Gciqy7XzeqaKS1MZXum2wNmBRoV37GqimJv434HW0PrAeRtXOst6vF22ua9xrDvJ8R84YWfRAGHBPlg6jLmtXAG2PmPNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ayV79j/B; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a/47VmsCW+/vWlcxtFseGk9lbQ/93FjGlNds+Bzw9AI=; b=ayV79j/Be8/8rhQCeszDDda11d
	2Yxlk8FKh6OU6gR6NVvkjKcHua7lRM6fe+mBkWsQLFGrEEKrLnHcKAT0T4FWCea5k9WKEbaS7FsrL
	vxHZ4rxkTHuvOR31xxiKvkjsDCsrcfyt8Bn0bHFqqUGzUFf9Qh6g9nMSftDOGUemeUcuPDI9tFSB8
	cXq+Q1oe3ZujlL/FAn84pbMTVtoofn2UHSgPvR/MkSODuA5h5bTyfvIksCMQQZrSItDGwbc8+mXPQ
	tfQ4MzvwZNebJOM74u+dXnw2ycS5n0pt1sbYmScP8GYDlHTK7fH/mg/ERBbeTtItk2ytdxh6BjmSc
	bcv3p9gQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlETB-0003Hh-NX; Thu, 20 Feb 2025 22:52:33 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH 2/2] gpio: pcf857x: add support for reset-gpios on (most) PCA967x
Date: Thu, 20 Feb 2025 22:52:32 +0100
Message-ID: <2590885.4XsnlVU6TS@diego>
In-Reply-To: <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
References:
 <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 20. Februar 2025, 10:56:52 MEZ schrieb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
> that is used to reset the I2C GPIO expander.
> 
> One needs to hold this pin low for at least 4us and the reset should be
> finished after about 100us according to the datasheet[1]. Once the reset
> is done, the "registers and I2C-bus state machine will be held in their
> default state until the RESET input is once again HIGH.".
> 
> Because the logic is reset, the latch values eventually provided in the
> Device Tree via lines-initial-states property are inapplicable so they
> are simply ignored if a reset GPIO is provided.
> 
> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

With the gpio-consumer fixed, reset-gpio handling works nicely
on my rk3588-tiger-haikou with the DSI display overlay, so

Tested-by: Heiko Stuebner <heiko@sntech.de>



