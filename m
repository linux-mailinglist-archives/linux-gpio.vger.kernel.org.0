Return-Path: <linux-gpio+bounces-17035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B4A4DD66
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A049B172039
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1E5202960;
	Tue,  4 Mar 2025 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="hVXnd9mj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31B1F1905;
	Tue,  4 Mar 2025 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089776; cv=none; b=S2RUGEYBgMQ7JHmsCGdLXwjzzytB6vEB+KIVG+4dUvSyLmxYBUB9NuANE7R54WSqhVM/MxL4KvPz0fO83lGuCbHJwVVqpOjMi6pJGJ5Qyj7hqB3zOdrEbC2tSUv+jpcFivfMFkqHhFbrmUSpZpd8IUafQUQgqVZil2yKgde64Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089776; c=relaxed/simple;
	bh=TXGv1pIwVEBbCeNerLtu13FRxeGcoc0TtN93YIc+TDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eex6EAZ42dQXxuW3086UMsr8NAi+MbsCh81/q1fJpQwcHq1zMJuCt7dA9fvczE0VpZTcpFUQTH2Rdty5ldXIYCP4kwToyS0H9wkfZSoWBUEHfF1Te2rTW7oRgUQ39frrVK5EKNXSPZmVmX+7CLuLABQ2CdMSf9mcv+5men2/Xs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=hVXnd9mj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jboAJ0TDh+OlkHuwftLCsZ+FXL3CIibc36b0PSVLhec=; b=hVXnd9mjU1mx39Frs3fVXG4nsk
	PypU+idzTuaxwZRaKhxK8UKH/Y5nNI+DFbbX39bSMPWWetpees56ae1Bd+zkuGCBai6pxlIQG17pA
	DBD20/NGKrGHP4Jw2Zv3SDF4BO3wGju/8FmqXjxriq3UHfCkSTNFubTsYZXO/nZSBAFzxCsQ7TyQK
	6lg2mZQgGOFsaGXUZX17nHiLcs/MhK12WArWUsOygCfjkqRou1HL214UOaZH6q064XUfByPmo9jUQ
	bpzjtku3eyNLrlToGGxik1MPckohT9tTznEUH/tPzIX+wcrnEmDrOm8whuV06maozrQWVQvZo5fIQ
	V96IJMpw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpQz1-0002ws-FJ; Tue, 04 Mar 2025 13:02:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] rockchip: Add support for leds and user button on Radxa E20C
Date: Tue,  4 Mar 2025 13:02:45 +0100
Message-ID: <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Feb 2025 06:40:06 +0000, Jonas Karlman wrote:
> The Radxa E20C has three gpio leds and one gpio button.
> 
> This series adds dt-binding, driver support, DT node in SoC .dtsi and
> gpio-keys and gpio-leds nodes in board DT to support the leds and user
> button.
> 
> This series builds on top of the "rockchip: Add support for maskrom
> button on Radxa E20C" series [1].
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
      commit: ac32ad07a97648eb8330b2c4cb840b0ef46903ae
[4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
      commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b
[5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
      commit: 0d2312f0d3e4ce74af0977c1519a07dfc71a82ac

Patches 6+7 depend on the parallel saradc support series and thus
do not apply - and need too much rework to safely apply.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

