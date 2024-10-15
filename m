Return-Path: <linux-gpio+bounces-11328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF099DE7E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A8B3281D81
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B62189F56;
	Tue, 15 Oct 2024 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="L0QFYw6m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD667189BBF;
	Tue, 15 Oct 2024 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728974102; cv=none; b=HDnyZZXV5w7hc+9oojLzr8gnAfER4Y2HhH7rGVmP6o3YiGCMXyrks6ZQJRSrKhuQWjdJDASX9Mx96wUKgcsNNF5F37Ep3VMqZyyD5WKSw0h+NtIJQNghQ6ujB5EGDd5VeqQ5xmb9BRcRrHp//kj76pxdiaYepNsEn6EpUl4yyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728974102; c=relaxed/simple;
	bh=N1tK/Gf1hqrbHvTeOFOJ9O1O9vrudZVyOkpSwb3tzr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9B2+/M13irlvjx1x04GYcw/GxAUeK/RhQPaHu05SOXCWgj8mMhq6YKpHJBlxlxSdjBDBLuRcdYDlGMmP57lvEilC3mSDenedKZp/U5kpd2c5YQvdl2Cc0M/T2zzJ9RqMrL/fQzeCvneTeCa3RsDzmD97DyFYLUrmdIy3KapMoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=L0QFYw6m; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPLT2mNJz4wYS;
	Tue, 15 Oct 2024 06:28:33 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPLK3dS9z2x99;
	Tue, 15 Oct 2024 06:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973708;
	bh=N1tK/Gf1hqrbHvTeOFOJ9O1O9vrudZVyOkpSwb3tzr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L0QFYw6m5XAau/bTCVXv/UpOZcJkK5AmADVGVM8hyUA4wCZtaJGd25rxru9eLgHDJ
	 yAUYOlpNWFV9AhsHZQbD2GItIE4wwan4lqWAtgw6TYdTdx3ceGYbu4pgQ47u8scHga
	 7A8E1P/VO+vIQLE7mWIZM593bx4BJ5c/DwXDin1wNJmqhi239y8YDHnv7G+ohfv7SK
	 ml88pFZ1gNLBQSLdCcCbhaXkEPZNKQyeU0o2o3uCqy7ZO32uizXI/LjUjYvEUKs7Cq
	 srHznZIIhr0qtjQ9R4M2fW33OlyFA+gVOyuiJj3E0DmFzVlRuFahiuBf83UUUkO09/
	 W8wthRMbfySZA==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	david@mainlining.org
Subject: [PATCH v1 2/7] dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990 chipid
Date: Tue, 15 Oct 2024 08:27:41 +0200
Message-ID: <20241015062746.713245-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
References: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the exynos990-chipid node, used by
Exynos 990 platforms.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index c50ee587dc1e..47a8d98346eb 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
-- 
2.45.2


