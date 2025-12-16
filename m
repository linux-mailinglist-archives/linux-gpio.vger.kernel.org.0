Return-Path: <linux-gpio+bounces-29604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A8CC1257
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 07:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18EB8307F60F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 06:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E7D341666;
	Tue, 16 Dec 2025 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6eKLQbs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC6341060;
	Tue, 16 Dec 2025 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866323; cv=none; b=n5SSw4jGy/j/bEhNhMJaIDm2CXN3YJsl7joNaCI52mVZE+o1uCYIMZ5Xfnj5G6kkYqhurFesnKOQ/ejZfCnW7DcAeVuzBCZaChGTfXrU++OFU2xmDDedvOMnj3Edbt3peOdHQKOLTLu4d2ii/etbinIq5/IMAFdh9Lw5SKGBjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866323; c=relaxed/simple;
	bh=jURSggc8h5Auoce5njAyzjWeWLT5P7bncC7/J9uqAIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icQa6lA0XBEfJvXFrzqDiN9MqviwlC1v2ZCeJktYhMapncQZnFqVLI2504U78h5S/v/vV55Eq0BUIDttzaNN66Q9cLKg99IwbextWo4vr4lO/nezH+RiGw9H0LgFq/KnMz5GnC78Ir2K6mFGaIopMLt5KEnCFflb1a7TMfTvJh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6eKLQbs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEA4C4CEF1;
	Tue, 16 Dec 2025 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765866320;
	bh=jURSggc8h5Auoce5njAyzjWeWLT5P7bncC7/J9uqAIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6eKLQbs299j6gqCWs0N6kliERfyOLEJYBLj9OjmQWO8xApvcW1nMZW7qSPX9qF2t
	 Gpl8+hGXqMt3pkh0mxh/9/e+v5GKe7qILvY7jujhVhdrTJDI8QDBp0e/zterdp/Au8
	 XZ7GtBVJr8c33wkRJEmNk/pxUSM36yPE5/+e39YE+pIdIRqyd21KJxjfieF+Y++vHu
	 KLfdXaj1r+PVuSxADZZpJczinr4nWQOZ+dlCe4/iSsOeGsEGzNAhDqs8PQKwxUNDQl
	 N6x9LzTfvBVbI4qDrV+33hthxDs4imD+uGJ+ksRIC7z2GVq/u54ScozuMvWeVf9khP
	 3sP/tTAuG7i4A==
Date: Tue, 16 Dec 2025 07:25:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	=?utf-8?B?SsOpcsOpbWll?= Dautheribes <jeremie.dautheribes@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/8] dt-bindings: vendor-prefixes: Add AAEON vendor prefix
Message-ID: <20251216-tricky-masterful-wildcat-1efbd5@quoll>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-1-6bd65bc8ef12@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-1-6bd65bc8ef12@bootlin.com>

On Fri, Dec 12, 2025 at 08:41:04AM +0100, Thomas Perrot (Schneider Electric) wrote:
> Add the AAEON vendor prefix to support the AAEON SRG-IMX8PL MCU driver
> devicetree bindings.
> 
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


