Return-Path: <linux-gpio+bounces-11318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B699DE49
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79521F23662
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3378A173320;
	Tue, 15 Oct 2024 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="aI+RI5Jj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D6189B9B;
	Tue, 15 Oct 2024 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973719; cv=none; b=njD10oJbqz60NW0ClUcSZS0PbhS0Gzinsx9GvL1xlMZD6sIQ9xhjhLG18mysn0zuyfzBwb/wbZ3WYf+5BllE4aNqwrnq+IJ7YPOrPorM7qWsB2Z8QXT7rvsunlfc6tK1QJwJjmdCI/P6uB8YY9WuCeqMq2brbofoQ9PMcU8wUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973719; c=relaxed/simple;
	bh=i9CRyCmH1jmIrAYXtqp2Ol8Cit/CqxernI4YANbTw1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmJ/OWUqEQVGygKBKhutNSEhJKwJ3fpBPh/ictPrwsDSn6rWb02f/l4q7rKdGfZLBtZw2W9zxMiIk0wGq67pmfysV1v/szQ7T5foo9K+rOv4iUYcTrOrPYNKJtrl+VlPf16N9wvQj5U9E9BEaT+YQaqmZkxflT2uk0xXaK9sCPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=aI+RI5Jj; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPLX3c7mzGpTN;
	Tue, 15 Oct 2024 06:28:36 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPLN4dLYz2x9B;
	Tue, 15 Oct 2024 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973711;
	bh=i9CRyCmH1jmIrAYXtqp2Ol8Cit/CqxernI4YANbTw1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aI+RI5Jj0ZuHMJrqNNHIK2d6BZ8Y9/nJP3Pzy03E32BGvPe2RKUXHle713jweG3Wx
	 1botSQGLoy599cFXGE659COzlEQ8QMtCbffRAFB2lMRvVSCZa4AzcIHOCZrf57RVuw
	 qsRD+/cVpRH5eT+80dBxbp6a+hlBNwIdefXYnBObvu5PmDpc5oTVaHSi4LhiJU+Y47
	 9VaN7igxDX+FL4CluBvvs/MBvZP058A6oaoFPb5EzUfCR0mT9crcPJDB+B8ovbG0+Z
	 DYmjknS2CnBdDWFR6wuyGVEZp2OXz9P36ONs6LfvsyzRqjaL5D7x1HZ/mfh9N7BxaF
	 yGcazTKA0PeSw==
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
Subject: [PATCH v1 3/7] dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990 boards.
Date: Tue, 15 Oct 2024 08:27:42 +0200
Message-ID: <20241015062746.713245-4-igor.belwon@mentallysanemainliners.org>
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

Add devicetree bindings for Exynos 990 boards. Currently the Galaxy
Note20 5G (c1s).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 49884a7ab5c6..d25a17e69725 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -230,6 +230,12 @@ properties:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
           - const: samsung,exynos8895
 
+      - description: Exynos990 based boards
+        items:
+          - enum:
+              - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+          - const: samsung,exynos990
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.45.2


