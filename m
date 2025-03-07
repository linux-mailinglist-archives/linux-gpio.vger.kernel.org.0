Return-Path: <linux-gpio+bounces-17276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B46A56EBD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 18:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9037C3B7792
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 17:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111A4219A8D;
	Fri,  7 Mar 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/Rj2xu1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9D23F409;
	Fri,  7 Mar 2025 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367318; cv=none; b=sEncM7HTHwY6cKn8CC3z4eYlB4xe0I3U1RrwMebe2iWquzKQhkDL1yNYJKzzlRxh8f+Of82YQiote4qjTTuhhBDJ6bs60QbcYeyL17ZE3Ful5aKHlRyt2lv3HmKrDP+lAQCWfLTUgY4IwXRHXDKiC+RsbC/o/hIl5rKy+G9ug74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367318; c=relaxed/simple;
	bh=2MUxetF4tyBtf8QbKEGEF3P+QjNfEKaJtJGEcUXg7mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOt3pXJSSqCI/Iua16jQpF79CQHa9Q+5wilwATXq8mkGInnIjO3RF8jOtZ9aM5y99IOZq9CtwY1p8/KUybsADWlChtju8mngZ5ocmRVOuC7prOyxppc+a3+7kf5UmApRQuw0ocg4mQ8VbQY0B/Kf5xxdQVEQwi5RbpjwQYdXoF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/Rj2xu1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E40C4CED1;
	Fri,  7 Mar 2025 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367318;
	bh=2MUxetF4tyBtf8QbKEGEF3P+QjNfEKaJtJGEcUXg7mM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U/Rj2xu1Xi3TmGFEHezijuLZXqZ9j/jdhLhl3OBVIdMYHMzdDdMkXEpPQSIj1PMQ5
	 ZTomoGw3jgSGweVsEQjbu5YYuLsxH6wuKskHOu3dCdcXHXMk+cEsEWngQOwRc+67j5
	 NRSaJHz1nRlFJogBGv+g8KKLjC+uFjAkBPP47R0zPYyFbHbtt/xro8P8pC2etCkSm/
	 u3BtEjO0wdgi17Q+U1FARSIoJMCR2d7qSR3HZpvB3BZzTdmB/l8JNm70oOo8vMO5F4
	 +uq0qUy1d3Lpw0woIQW51tcmdsQkvjVdFiat1mm+mtFuHZBCOSXltEAG2wF0vn8YTi
	 z2L1RaB4OmT6A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 07 Mar 2025 18:08:20 +0100
Subject: [PATCH 2/2] arm64: dts: airoha: en7581: Add gpio-ranges property
 for gpio controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-en7581-gpio-range-v1-2-de1262105428@kernel.org>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
In-Reply-To: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

Introduce missing gpio-ranges property for Airoha EN7581 gpio controller

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..a8f8a9f0b807a2ee4fd11f8418b8e810a6945d73 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -65,6 +65,10 @@ reserved_bmt@7e00000 {
 	};
 };
 
+&en7581_pinctrl {
+	gpio-ranges = <&en7581_pinctrl 0 13 47>;
+};
+
 &i2c0 {
 	status = "okay";
 };

-- 
2.48.1


