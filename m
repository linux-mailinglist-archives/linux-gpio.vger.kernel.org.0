Return-Path: <linux-gpio+bounces-16391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A344A3F64D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 14:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B284179F2C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 13:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97CC202F64;
	Fri, 21 Feb 2025 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EOlMpGf6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C61757EA;
	Fri, 21 Feb 2025 13:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740145744; cv=none; b=j20SGzyn+iKOU6A3qHkca35h5wvrh5qQjsYvJ6MseqQic0k5sKi6E7vPasVr9h1aaEfIqepWL2mmEHH2wYh1lFxpux8mf1wSZRXSZShGTldxznoVzTqv+nOLRRB9WSFTS1xxhtZb0fl2BU6NsUrscvyQPY1ZV/bKUZTAqarR4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740145744; c=relaxed/simple;
	bh=LpD8P8JjpqI/NjmfRrr1AhD28mE8fg5sTAYIzzPCseM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULIiyJWIhzPxM20hJVfgHx6EUOYkO9zNLb2a3k5bpP0gtX0gdELKGMwrbogUGNTWc6WAo+skOEF5YsuKi1BRtnVRyWQHSsrOcJFqppDOIRT1Zv9Ai1eaMyGDFb+sr3gdZ0K+U6Se+3yZNMzk/Nf9sQOlysmqHL0RPfERNOIFfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EOlMpGf6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4PA6AoUOc58pLObnZDeDC9vxCiLpRKUfWVTweUqJLBc=; b=EOlMpGf6Z4x3XKn2jeJ+0MxWRx
	o4RGyPM2SqMWVeWo83VUGe9BS8ebFNLcac3bio+6ZsUtXIigNT9XgaGxEChymTXGdSvPQS8tqCfQt
	X0gsEgE4dGAXxl/u7TtRsNUJisMPbhpX5iQLoQNsFVNr31JwYJIK2YPw/g/MWChTPHGMQFNpOjayF
	o6D/PVRpFCklSoWC+PYXbLM3sMq4rx9peHg1bArSQX0sUeU+7J+0iRH7LZ4EzFAViLTQFJVA7Fm3C
	io3Tbp2qETu9gobdkTgfO8azcy8/TiUc4kNSSmhuiSUYvDPaFUdhZFwBYzCsF1IjCT7DHbCM+FpBH
	iaieQ5wg==;
Received: from i53875a87.versanet.de ([83.135.90.135] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlTOh-0004r8-VJ; Fri, 21 Feb 2025 14:48:56 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH v2 2/2] gpio: pcf857x: add support for reset-gpios on (most)
 PCA967x
Date: Fri, 21 Feb 2025 14:48:55 +0100
Message-ID: <1947442.eGJsNajkDb@diego>
In-Reply-To: <20250221-pca976x-reset-driver-v2-2-a2bcb9fdc256@cherry.de>
References:
 <20250221-pca976x-reset-driver-v2-0-a2bcb9fdc256@cherry.de>
 <20250221-pca976x-reset-driver-v2-2-a2bcb9fdc256@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Freitag, 21. Februar 2025, 11:14:27 MEZ schrieb Quentin Schulz:
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
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de> # RK3588 Tiger Haikou Video Demo
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



