Return-Path: <linux-gpio+bounces-16599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E50A451B1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 01:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B3BA3B1E9E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 00:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C460F1531F9;
	Wed, 26 Feb 2025 00:42:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64845148FE6;
	Wed, 26 Feb 2025 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740530559; cv=none; b=W8P6Rxzhu5+A/Gf2xg9d5XThZveGEkyfQp3BwILXq9HZ4w2vgudznk68ySWjMduTImi0yJahfkK8BbXmggYNT8QWqH/1ljrRmdjLn+IL+Z7FQO07yFWOA2+INHGt4OoT7DFyYU4IRIGtrHzTwZgwRa42f1FYpDX+oWc6s7g/1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740530559; c=relaxed/simple;
	bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3AND8yZEqNhysosFW2Tvcp4XiLJn5y2giU3uReQUed2BMwzDYvwWJ2EKOgjrverO4BtoU4Lsxxx5MKCIy/pu8bjMNc1fYEx1pKr79hiyFvVgCuItt27b3jGhvUoKn1/OuADHit9YlQSEY2ooJrwLDWJynXBY+hzdwTAviTda7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 22E3E343295;
	Wed, 26 Feb 2025 00:42:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Feb 2025 08:41:20 +0800
Subject: [PATCH v7 4/4] riscv: dts: spacemit: add gpio LED for system
 heartbeat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-03-k1-gpio-v7-4-be489c4a609b@gentoo.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
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
 h=from:subject:message-id; bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNZyVtJ2VkRubp+5r3iGXn4YIW33afvNJoLu
 PpABgGjFHSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jWV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dtjD/9mTDjJxgSN+JWk6p
 5DGO6MfgMO5FXvUJDioNmC4UiQlPyFCqlrCTIVF/yuh92AVykFESB2Rh6Puwh+w91fYpC0kYKfq
 KAVAI8NWvfDLdPEZB+IRopU2AECe6B+QoEIt5nHROZ0PFMY5uf/kcGe6bP4tjBd43VX/eiBhffS
 Ta+9Tg13OAWa8UmcyxZPAEvEoZpbh1rCXnQhpF728CAOlADJJ9OZECgWqzsUSTwVZd5jsKPe90g
 gujQ12U5Nqkte3haRonoLlMz4HnwugjaWjqWscQcWBK3COEHya+S5N99Uvm+eYjDO122uZMAhlI
 NZDngPEvmcy0+hQ7dbGH7S2ZRZIPR7Jil7lm4bIIlgyfA72gMbVd4H+khRAkQleKFMHMeTFhQSM
 S+xqrOF/GpxYDfYwo4avTCXn9UXdDODkVp/YXfINlIbhZqtElmp/unxc6DAwNtmOJbTAEn+MbSX
 zr5SgVYhnek33iMswimiP/1TL9HEsH7IwmiQpmRnRq25uNqEnV8aah5b37Ob+BgwSdIBsdwZI3s
 sv8HGDG0iwd6y1/wXk3qYm1/cpzKl/S+OHbur869f6yZVGZK0TH2MfaXWPN79r0jewj+qT6MNmI
 MrMRZaVw/mWwkv7JbaLSlvKIEdIfEMFIZm41rDjD4968cui5ENqenHCP0mRxgwHacm8A==
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


