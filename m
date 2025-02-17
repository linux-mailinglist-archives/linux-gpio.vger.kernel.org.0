Return-Path: <linux-gpio+bounces-16131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11EA383A3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603BC3B4D89
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91E621C172;
	Mon, 17 Feb 2025 12:58:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FF21B909;
	Mon, 17 Feb 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797139; cv=none; b=SHwBFygrdZINsViFqwK+XFbkbkWJb+TsJy9sc/rcUb7xxORX2LSsmr2MigVszeQAYOoZczLtVLCOfUqa5q+RFffAvqDQIyA2g9j+7DBm5eB1cMY7m5bZdafm+f01ZIRS/j/FkShbPsEIJ8WwMSoYECY1JKnNDnyiaL8xyvYpzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797139; c=relaxed/simple;
	bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAb6QS+hcDmdNHYGP7OuqrURhvdF5VKEMb+aUx3ZStLrI+9f7ae15QmdwR/sxkU62d5Nm4UXepHx8xPWzw4wdY4YJOJvNvljS/FOcC0BwW+vfYBf90Gw/x9NEugIQ8VQV4e0DDmKLfXhgUgXRacAZ/a3agc+DzaRFnBeb7o6zRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 82E273430DE;
	Mon, 17 Feb 2025 12:58:51 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:48 +0800
Subject: [PATCH v5 5/5] riscv: dts: spacemit: add gpio LED for system
 heartbeat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-03-k1-gpio-v5-5-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
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
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJm0HWAJxy2mTQGedoLSD4oLkE+RdZtfPiyd
 EkQX8ki7hqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyZl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WkMEACWEq0KC8AkQFoqAZ
 M9mCR9BxNBPgd3SeG4MlzCrtXvmAcLK8UhKpf3y1u0QwhovsuBVTZNQQQ2DePrGxbbN85SvtK03
 J6A02R7uuQRVzx2G9rQC+gEJoqtn0PY/e+Xiv0FWyN+QJBmJtvCZFhKY7J/yMPWsaOS0BiE079z
 xd3NwDbQpboI+G43i3RG1wnpHnal33l2MNVHpKYTn8ED88TM5Z40gL8qR7IS5+UD/m8QlP9fduI
 ihji0GxfTVjBDYBk77Nd1W3bH4aS8o6gx+gGwBaeLS3M/7NXjBjfiGwDT85+vi49Z6wgDV/0giF
 /NzujTOAD10PlIMZSvech+gyhViUz6i4lTq4QdVKyTMVvIPgWV4PrJhT1Vm7fN2HftUSkoQo8nr
 10I1Rd3m8J+5L6U6z6dYdYP1ec9tp8kcvvVCmkslF+gr2+pBj3nWnbhJlS1gBObpfeGgtm4ov4G
 yoWLyif56PX1MLBE0O9EqRP6Tr9kTPatpy8crxtLqG5a+BaDWAKgYMNotn6pdujE98Nwzp1Q5vI
 D8fziLE7cLatqN8M1FQNE1/lzIwwmpfLLSNPYuCxJn0s0MNWRsi8hAGCciMJNza+ypzS4RdJuQU
 zEBEv4KpZu396XUQD9Rb+8ac7YvYaRfQMSpdJ/rAKXGL1Xjvi9oXeCC7rFf9jH0mqtYQ==
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


