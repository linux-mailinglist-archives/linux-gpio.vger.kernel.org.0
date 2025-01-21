Return-Path: <linux-gpio+bounces-14957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9627A17655
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 04:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0425A16A70E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 03:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F6F1A2C11;
	Tue, 21 Jan 2025 03:39:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3872186E2D;
	Tue, 21 Jan 2025 03:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737430769; cv=none; b=uJdsZjXnbFJ4VxkSWsb8VSnyWSGSJE41k8ImO3NA2CNckO1BCzoX9SIJwEwp8FjH/6Y5djAgreQmqNIusnADcjYjZjYvKIy8HlH4ucWuvKZ4xYksYobLIlq4x83udcU5bhrebUeJSKMXYei76Uj+fxwmr8/1R4OZn+EgxbtUI68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737430769; c=relaxed/simple;
	bh=lFZgZmhYkcEJpdHbY0qNXCwSjdIAVxJGoIVycN66Pnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srECdZ/kKveMmA6dyf9dqaPJaWxwV4dNLJ0dVeKfeLZ47mrVoR4fHfwlkwc9lEXToeMLRaQ2MJldRdgfIvwdn7/qdcC7kcIRgrbLGw+oRHvGHsduOXncuM40vi2f5AktUubw3uc+pq9TqrtrB+r8LpJWR9RNbnGAwSrWnNAVCck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC411342F65;
	Tue, 21 Jan 2025 03:39:21 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:14 +0800
Subject: [PATCH v4 4/4] riscv: dts: spacemit: add gpio LED for system
 heartbeat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-03-k1-gpio-v4-4-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
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
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=lFZgZmhYkcEJpdHbY0qNXCwSjdIAVxJGoIVycN66Pnc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbN7cmieyDopiKBskGZhPewqEhky6rj7e+nm
 r+eTauBPA+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48WzV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Z/OD/9Le1iIS9730td45l
 daTvXRkUpRuXJbi9xY2qV0ZFFLd6axR0h+qSRs+lzFJq3FakBWQL7mU3ujJAUyZOaaiXIvnjaVe
 eGzlLSwPZdPJFtMzRDQwD9T8IBmGW5J2/0mbLL86XuGupzjX5rwG1leyGDdDZscFI1twhsfcPzx
 x1ufuRyGDmuHBRGEAkQyXvOxIMOMihF/oyR5rU2eoHrDjCSuz+IZkw8kLiOykjZqx17kqNA36hs
 7Uqyu6SeM6azO14P6AAQMfCYz5dVzNDSvtnZnIukkkmTvu7AGobhYbXf0ADNk5EAVDn2HKi5nSW
 cMawJ52MJzaTmRtMxlrPKfs8wlsj+p9eYRN3y3DdxUMn9SJPJidnXlFiN5SMexTkLzSsXusn3Go
 plzxz5yGxyd24NnuyxAoSYV39l5joX55dYbV7btcFoHN1K1/dCZYQ12Vh6uJhLGWgqf00yjWeo2
 51+BjsdLKo/mV07Qu55e6+yXDOdYX5X+F/6Znd1aF0WllkeSwajalyzS2tzeH+rrB4DDecGQR4B
 AyPgM37APfTQd53GchBqfUkVMbMHNiK6azRoE43WZof3Vi7PGoWkgSpjcYwo2jloavHZDGw0fEe
 B+A7swy22jCgV8v243VgKwZE7ajQujsgki0nZ12DnxXnFLWYErSYnC7b9y/VzjwkWTYQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Leverage GPIO to support system LED to indicate activity of CPUs.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 1d617b40a2d51ee464b57234d248798aeb218643..6113e7523109076b99c493c8ac9ba69efd734620 100644
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
+			gpios = <&port3 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
 };
 
 &uart0 {

-- 
2.48.0


