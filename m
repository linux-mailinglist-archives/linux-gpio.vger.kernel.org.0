Return-Path: <linux-gpio+bounces-11329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC699DE83
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8F5283143
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD51818A6CF;
	Tue, 15 Oct 2024 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="DcR9lsnH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE31189F30;
	Tue, 15 Oct 2024 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728974102; cv=none; b=torHOYD2VIqLpezMvzbCmKahTWTZSNWk90F4ATAi58J/8n54+m2uE57L8UCGGRnuVXXsqWUyocb5xA9bclHvz/EOLubOrhXzvo16xEJ6pqK5QdYKCqBiaRES30VweEOUR9SRU0KxcfxOozkg9KQYttW38ueQGz4haXFlJQbzuzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728974102; c=relaxed/simple;
	bh=gaLEZ2d4+Gi0QtC+bneHdGHQJ2El3KoJZBMz6bRlRjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdcG4YiJHlA7Kpdee8ocOgxITtG06iryeRmaNyo48rTjl4pxC3udkxywnstudhlCZuFR+HyIU48FYmIiIf9WR0vgE8WcXU2gqZhjIKqGfWkcbFdTyE62dNumC+iN06xIHGNXCX58d4/cZhMzb18vS5QkbWLakV7GYfRKeiIdlbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=DcR9lsnH; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPLQ214xzGpTM;
	Tue, 15 Oct 2024 06:28:30 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPLG2Rygz2x9F;
	Tue, 15 Oct 2024 06:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973705;
	bh=gaLEZ2d4+Gi0QtC+bneHdGHQJ2El3KoJZBMz6bRlRjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcR9lsnH8W7SyiEYfbf3yNQDDoPVfFilFIzFqwdvVbQTPdkr2TBHVnhZYxzuXonSy
	 wbZtiDT3ouVmxGnXzM0/emw7SQWtcrMzedL5ra9T2qtHIsrbeN3woP3Yf2NOaCJq+1
	 O5EhxwVPmn4vMazsZIIjo8CYCRNlLzHiAoreIGBffDUhgOvZaRvo5kfQ3AWh4Zn60w
	 W1BriBxr4tjrMKQ6uGFoJm6TxByQMpW3BuaCpOLwQ0g2NRDqVyNF8i5NxqRs6ORCX7
	 uwnjskHFapW5/c2NFGTuUherMgBb4bd8//ziAHC11uskubcd8zPcvGUFgxYTKMr2Sn
	 45Rkbed5O5M8A==
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
Subject: [PATCH v1 1/7] dt-bindings: arm: cpus: Add Samsung Mongoose M5
Date: Tue, 15 Oct 2024 08:27:40 +0200
Message-ID: <20241015062746.713245-2-igor.belwon@mentallysanemainliners.org>
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

Add a compatible for the Samsung Mongoose M5 cores, found in
the Exynos 990.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index e41a8aec6066..c54d20dd9d7e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m5
 
   enable-method:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.45.2


