Return-Path: <linux-gpio+bounces-11319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9499DE4D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236F91F215C6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF1A18A6D7;
	Tue, 15 Oct 2024 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="h7/ozqdj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95E18A6A1;
	Tue, 15 Oct 2024 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973722; cv=none; b=HtQUrE4oklwwMTaNiOCnzIeB5Q/zS+GT1tRVRYK69zRl74gymfFktufQ6XbXgUlu5BkX4LDmJmL/1BgJCfW1bvnbpWXJhi+gCYJz3FVbIwAmFkaE0qWTWmmP4B6zJImQ9lpdfaEpnsTUIS4sM8QdEAW6c4vlab4WbJqFankpEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973722; c=relaxed/simple;
	bh=gUlS1i8qx/2ojHqYIjPj+RLbxOrGmJfLGOal1pufpCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGrPdkyXgbpHqUcd1Cie/z8YUE3hSllrN1ik3rd33TesxaWquKgm3kyiJotFPCpeWIaWaRJg5EiWRmZ2K4DwZnEtJdKwL+HlpuVsjwC9Z9Tf70dPs3DDa/c2PpISznNdD4BR/SOoCMb9CFgimSstGG7fm6NXcKbLEhqSauduqxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=h7/ozqdj; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPLb4p6tzGpTQ;
	Tue, 15 Oct 2024 06:28:39 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPLR5Wl5z2x9F;
	Tue, 15 Oct 2024 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973714;
	bh=gUlS1i8qx/2ojHqYIjPj+RLbxOrGmJfLGOal1pufpCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7/ozqdjvIst0wenYXXPEQCqLVYXWnd8loL47VLt/5O65olsZGl4pJgib6zGium3+
	 UpyuN4Uz6TjI61wkdr29JdVm7fr5l6H6I5K16A7Hox8bl9zXixji8ngKoH6RjBIAZI
	 CkxELZov8QMuSzjFzV+aLphIjj9w1YeJggTjF10knzrTb7WfIhBGvTSU/mMS5jhv84
	 bLnQ/KWhsN6IBsiJh7XIOr+W+lmaeoi3BLkRgSbL7uqow1Cfl/llRQYMcfx3vaXXhT
	 qh287O82vFZrSJ6tnRa8AkYbzzqVLmF9mmpQuJ1J1UYHRH/utkpUxIIVRwALeJlW3S
	 EwByDzv9dVmbw==
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
Subject: [PATCH v1 4/7] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
Date: Tue, 15 Oct 2024 08:27:43 +0200
Message-ID: <20241015062746.713245-5-igor.belwon@mentallysanemainliners.org>
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

Add a dedicated compatible for the exynos990-pinctrl node.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index a2af2c88a331..7e6ef8249de6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl
       - tesla,fsd-pinctrl
-- 
2.45.2


