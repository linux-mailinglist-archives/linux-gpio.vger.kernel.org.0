Return-Path: <linux-gpio+bounces-18726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A3A8693A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 01:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E1C1894A08
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803942BF3D6;
	Fri, 11 Apr 2025 23:32:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29E219A86;
	Fri, 11 Apr 2025 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414366; cv=none; b=XPBoixcG7+VOw6UxOBNXRTpsIcGOZIsueF28RI+2oElMEIyZ81XeublvQkdW4K5/16RaAO8FU8GkzTtLFIQCkTPgvN0tYWuf7ygdH7+zBCWMkTjydyvFxcyp+pRObT5FI7W2Sj6boWaBuoW7AEHQDmlucGZ5Yoe8RcbOcsmLmjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414366; c=relaxed/simple;
	bh=ez3lQ50wt4PHNJjw/2DzRy5zUu0J1UdIhacJCZQJdao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJz5c1kb0eGhuDIF4ulKQedLBeYYeR5175X5eMg6jsFWfldW8iH70vMIMpJuqYjjdm6hWg5ajEVXT0pRNJFzmcXY9FBrAr9xO+TcoWtNXUdBLHZflj1lQKD6p3lsf78tiyXf0U541IUvTW10DP6UVR16F9iYtw8dCe8/MCiriQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CED6834386C;
	Fri, 11 Apr 2025 23:32:38 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:32 +0800
Subject: [PATCH v8 5/5] riscv: dts: spacemit: add gpio LED for system
 heartbeat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-03-k1-gpio-v8-5-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ez3lQ50wt4PHNJjw/2DzRy5zUu0J1UdIhacJCZQJdao=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZxfiI6vSFppUJQZcclFJxoGxukFzknzKGWI
 bSazNSymHmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmcV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aefD/9NlWbYn29Msk3Awk
 JEFX4IoCMm//CCjVRGM9538q9qidfJrfb8Eoh93p+BTEL7GH9VJs6QUaXb5xF3jG7rO5vAtQD/8
 D7UjxTtBlKeW2TVsBVVIkPr/mX6utN4uERzdFF9gr/+7tI3TcMWeHt+nPknCAYq74gfdY2t0pcc
 xzW7l9Qpj026YMdE5OpU/obV7jTWPUaSdrISKV+Brj+Z5dQQ2JQt5Av8MMGeH0bgMjn1w79DZxB
 HfFWvzahQOAT7h+HXndZ7QMC3gT7mSRhFk+fH5xWR+rbasYseok12T3CuPm1tslK044v/kkHxCC
 YQeN/byAURzjLDPGFIy+LmNVs4d7IhDR2PVugjlpftNtiFfBlro1hgrXab13IfxbtpmjVs40PGy
 gv15fhqGtrRXvXuaWhPQDXnlgvtLYNm336jGAnWvYN0AUNFMQYEhQv6NYoHOEHbDW7FUC7VSZ1J
 w65vdLBlqOoKotUL/DUGo5TS8zA7rLDdKo0LFIQ5u0vZ50U2HT/FrNoOK+KopKzrEpL9CD60+Wj
 zYRG797irsmcXl/n5IEVPpoxswpUztkAz+3SILGSqjGYh/W4CxUjGYYTlLrNuvCxIYrr4kbYGz2
 YamsKUmzR2HZQHLUFr5KCuns0xWiv2sQE3baUi7A+4gZXTEU4xbMEdxKPQWxO7RKhZdw==
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
2.49.0


