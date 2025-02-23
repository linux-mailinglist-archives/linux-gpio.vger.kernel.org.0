Return-Path: <linux-gpio+bounces-16435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD6A40E95
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 12:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EC9B1787C8
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE5E207DF3;
	Sun, 23 Feb 2025 11:50:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694592066C7;
	Sun, 23 Feb 2025 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311441; cv=none; b=CpkJ1YvurP833qn9GWc56ueRcPBrHQwpeDGjYJIp52VQYKOdfNPAYhZR8GW0FnCkQXZFEAwoUXhLPymqkr1BLw8q+7kBLea/U7VNGBoTbHFRsQsW0R1vE0xigFiCIeShrtgBwy/WPfI2hxnbtfbHoHAftRAf6m7cqmu2alZs0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311441; c=relaxed/simple;
	bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNuAPqqDOWpM9FEgXkdsRpykew0VfolCfmqXkoyJ+L/GedcEQO6+++5A7nOk+ErU0bqW8uZWsIgTaTc3De+WkG4IvS99QAQak86ODiItOJnnrshz2f66bgE583XFX1QI+o7GltHY1AZlCIglyXeN1AlTdRLeMDvRaZSbFdTT3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6C23534317F;
	Sun, 23 Feb 2025 11:50:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 23 Feb 2025 19:49:35 +0800
Subject: [PATCH v6 4/4] riscv: dts: spacemit: add gpio LED for system
 heartbeat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-03-k1-gpio-v6-4-db2e4adeef1c@gentoo.org>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtstaTnHcyIlwwJ1iQoDw5MUSJCELE0FaGxn
 vbar+q+U+KJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLbF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Tv7D/9QYZOiFPN/p0YDxm
 YMTwB+gLp77a+Pk/aTBd3Q1BBFDUSeh/QqIgL7JVqcXppSrsbCd8AgOxI38PhMy7/P3smmDwXeh
 rvM9uD6zCgNaGLxtZb0Q1N49aBbKSW0o7SAkn4rBOuq3sy/v1G4yJ3jn+fPhKEyuhk++Qr1MqhI
 c2qqWBMieiX+y9ImTan1SUG/PFwEC4QAujuxihknhm80+p1Yazk5Kv9+JC8R8bG3eEDCK2By5Gy
 o05qVWDOAkSYjRzU5mLL1UCbStLV/eqv92zRI2cf4UY8ny61mAZrxnv1cLiGCNB7O+3L2fk2hvR
 txkoYbKmS0omARR3IPUi8EbsTKmJv9aNcoT2ZEUvt95za/myl+el38ZhvdBqCDVfk2HsvBF02f8
 xqeZ/UVjvIrJxRmhINQ9sQDZOGX4wylCH/aEEYSD25uMF48buXyFyn7zRzAKzF8Od/nJIGPpTHG
 GWbw110Bx7pXyFkDAUzE8z6+JWGzHXxafVTzZOK0UiuRsGvMXAWkd8a2Ol4ts1fIw4ldyWHBVwN
 tyOv9K77nMGDcYdsM6b0WD/m9tMVQoQ/BmLxsnuSmhIxAdZTA+68tBipCHjszxZrNGQWZLYVHHm
 xTesnw9RD00Dk8VVrxcu4PUQvfBLLwH0nOX2fToDArsBz8mP0Uvdu4OFVVws0dOWBXNw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Leverage GPIO to support system LED to indicate activity of CPUs.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 1d617b40a2d51ee464b57234d248798aeb218643..816ef1bc358ec490aff184d5915d680dbd9f00cb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -17,6 +17,17 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
 };
 
 &uart0 {

-- 
2.48.1


