Return-Path: <linux-gpio+bounces-10742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E498E0E2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 18:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30A56B263B7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47471D31B8;
	Wed,  2 Oct 2024 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="VdW4evdE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA091D31A5;
	Wed,  2 Oct 2024 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727886599; cv=none; b=pRZ0LTRB3j58XFOc1kQqz5MaLZms2GX/pwDtUT1eUCKJae7ekc4zeKoJnNQNkpX5Ka7hoImGWOs2kWx7EFX8M+LnD5X9hKjpHMRe4UF6DAAWVMcs9OwoLmOhCT9To0MymV/hXNkKz3S+tL+kBZPKLbeEpK4IdenwyKTHfy3gM6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727886599; c=relaxed/simple;
	bh=kkbTx5Cgt7G+P6xs+9X+HNQrS0uHhWMptZCOhmNsQ4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7wyoAG+J9/3bdBr79lK6ck7YM/gIw5b7MtsolT8EwM9gil25fsnEtDi6K+5XDk4k3sghYlETMwgOQ+Q/+PFY692YiI5ufL3AQO4qfORT7jxhmesZUbPBcAOAMzWzc4GbNUyLQt83tLozW3z1ajRT5fl2YqEjwjFpQ5fdFaRP48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=VdW4evdE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3F91E23D65;
	Wed,  2 Oct 2024 18:29:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQsAR_GTJ3QJ; Wed,  2 Oct 2024 18:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727886595;
	bh=kkbTx5Cgt7G+P6xs+9X+HNQrS0uHhWMptZCOhmNsQ4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VdW4evdEhDgrDnquXlyPANj9/UFzkaotuaIR6hgy1s2uENxUfksy+slhcDSEvxLbQ
	 A8vPN5F6aRGpF6b7hi6P2n/6bcKNqxBdjR7BBrPMoyewpQ0xz+DyCt/WcSuGMYvHR0
	 Wp2SzeuwyGA+hNlyVIqeKVp9VmbCGK4aqKH7wz2ZIDuN/E9esc2vs4wsJrzY+c4dHO
	 PUNJVRsxwXAxh8CeGHLhdqZh3EGNvX5XhNQK8YlZDNP9sW0WEFRtoitLsPrs1g7+5U
	 qxSTrItdEhvS4Z00hvYNHmuBQkER/qRW2uBhQWA9T7GhDkM2GMEwTKVWBUtwaHY2Dm
	 QD4UD/U43MMRw==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v4 3/5] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Thu,  3 Oct 2024 00:28:10 +0800
Message-ID: <20241002162812.31606-4-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
References: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some ipq5018 based device's firmware only can able to boot
arm32 but the clock driver dont allow it to be compiled on
arm32.Therefore this patch needed for those devices.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a3e2a09e2105..f13520095cc7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -199,7 +199,7 @@ config IPQ_GCC_4019
 
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
-- 
2.46.1


