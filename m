Return-Path: <linux-gpio+bounces-14136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB829FA68D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 17:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B166E1658CB
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 16:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7314C18C035;
	Sun, 22 Dec 2024 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="k8LD56Hf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840321AAC9;
	Sun, 22 Dec 2024 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734883358; cv=none; b=I4hvm9IFbXTzQ+SbGt3ew5lMz0uT61h7EUTGHgGHrKT2dlT3zEAECuTKqxPGbSvXkTCPRRrgnuOrSaARspyAYokrOUKiFSpm3ZiT1kIWL8/u7VRDIYTF4hQzItCzXs4qHGSOOQ/sk5yZ+XUfPWZYm5p25gwBJIPvyCxI6Ncl8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734883358; c=relaxed/simple;
	bh=xKwoM2Z5uLqOQjMgqiAFdPybbh+144nACBp+gQSv2Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plbwNS+E//StOWhhaO6xbbDyYvjE5n5Qmq69CxhZaQD9cbGy0g7cZ30cszykAqOwhfH1JGWf1AQVbi472h8tAeW9IZVISkrlWqGzR9IHfB2Blr4XSub3IUcdSSF/ao4yiNGKM/wIpNUReaqpY4v3qiYeP7SWt7V4rizI0nXQfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=k8LD56Hf; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rRa9IasaGaPmRgumOCRmtMLbZmJIszfuqo58vEJfnwQ=; b=k8LD56Hfa/jfHKBukU6elsEoE5
	lWu34KU+POcPjFrv1d+tLtTfp9IUlDAUfn/Rt6ZAXxtTNyeP9paBfvPjZHm4H3silJsfgPZOWd8jY
	M6lWjKJD06r/3Wz4Mwm0XcezqLOqGCwnv81X0KBtBSSFlkRLpZehmd5PYIUqeCCcpn1UvBorns6aO
	UusK8fZ8i5uct2oun8Bx0ksFNRbsNhzv0RCl8WamVJOxAihOAZ+DAw/WUYjAI4+le7UoJWrYKI9LG
	jzw/+cL1+DT8MKC4x8mzzVutJgtDqOqD3L3XWtCri+RTAwX/wiy0/3ZxAdhw6KQ6SJSGO9HlyqVn7
	NF4eO/Hw==;
Received: from i53875adc.versanet.de ([83.135.90.220] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tPOPX-0007d9-JB; Sun, 22 Dec 2024 17:02:31 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/38] dt-bindings: pinctrl: Add rk3562 pinctrl support
Date: Sun, 22 Dec 2024 17:02:30 +0100
Message-ID: <6755532.4vTCxPXJkl@diego>
In-Reply-To: <20241220103825.3509421-5-kever.yang@rock-chips.com>
References:
 <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-5-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 20. Dezember 2024, 11:37:50 CET schrieb Kever Yang:
> Add the compatible string for the rk3562 SoC.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



