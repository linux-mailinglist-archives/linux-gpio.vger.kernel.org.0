Return-Path: <linux-gpio+bounces-29809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC7CD882F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D8BE3007B69
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25798254849;
	Tue, 23 Dec 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VzAuUizP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EFD30E0EC;
	Tue, 23 Dec 2025 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481103; cv=none; b=iD6L1W1T0BjslYTn+iC4burA5K3szIvtZGAubPyl6VlPiZIS7i0F9VbGPAiNM94dwpjqcK+QdA6ZVX2Bvmwm1g0xV0uGzNdAPe3K7KW0o0oF1PzEqY0ANwNNrvqjqRg5UOxLK2ot2kRoAZ/EKpwOGJua7ctP6C4o2AsLRtV6LlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481103; c=relaxed/simple;
	bh=zRP5kB8Bg0I+gikI6IUrIjghYJOlbkwuwGj2YrT1/uQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+eWfMQ1gmrf0JBPH39aNcGIHutiaBIl5VprKMG01OHwRA70KQOPmR48tvzc+Y5Wu6y8OnRQHdgfgHDJb+LR663MWmuZgujfxeWfSL0W8Vf1oPc7IJ1B87Xyqof6W8mtjF+5qmLnsThGt6lADUo4+9petueMi+6fKpX36NaizKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VzAuUizP; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766481086;
	bh=xv295mRbFd/MwI+3jqPuKT9ohgq+Kl7APeZXZSYkNLw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VzAuUizPMvSvnA3KxDLu+CxmK52xECKQWfaEO34OpSKapPlNdsTu5LYFcd5FBVRUr
	 0FWr456JoCe1mvr14iKMR154AtMZxBwN29uUZkkGXOSFdPTKBxdZG5iq/HWQ/1eaSw
	 j5VovwUf3gCMRvzo7goGRpKbUEHL10yhqeuP5HhI=
X-QQ-mid: zesmtpsz6t1766481080te4b08a3b
X-QQ-Originating-IP: HDa2ljzHg8kBwp4BcXTul0BL/+wF6FAskTULdgy/VmI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:11:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16625877039514221719
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 23 Dec 2025 17:11:11 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481072; l=1822;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=zRP5kB8Bg0I+gikI6IUrIjghYJOlbkwuwGj2YrT1/uQ=;
 b=0tXUZiZUb+RN2K+xRaLFxkhamxEESjAbc7gBfBZnoQgXETKe8O0dEMIxF9lWZXZlYpf1HpqJk
 BDgX8EB9hl6BmyEAwCzlu/1S8yUKyIrpDHvY53DmpMHWeeGDv+IlHvq
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MDnRDgydGgijA+Gkzwpx3Rh1GvXTopId7EDaFXze43+6qbQI7xgrUPUd
	4keIB5iYKSfFHqCQrnRlXMlOXsqscY/xAnzhJ3ECu07B7GwvHYiyYxNdvf2DDwHeVjnLJZH
	5hdnBbIEdvxK6aCfmJdkl1y4nmPA0nmQRTToVqJky8nYfmF88plISFT0f/uEOft8scMrNwA
	ejQFU0bec96SDSq279tLoPkSBpfiOv4PqYPCZ9z4rKNM9ZFHxxX7DhT3o8qPrMLUfCMWC3O
	UEQy5CIotnhZrXpgt3DUgUhiiwUKZkOK/85fyX8Qwax0xAWM6DOLOEEZSf9PAdhPHukHU0p
	28Wwq/rx3r8EgYaRQhzfTf3M6z/CrhEsDg0U+7jE6zy2Sua85Ss3WXKs7MBsszGT8uG5DZw
	bgXjINnXtIAqc1V4FOT9Lvt0ut3AitXgQ6sl9Q6Efwf6/UZRROUfWFkctiBaj0Gp2uDO2PI
	hCwUFwq0+vZtw1MkPRafsy1XJgYJ6kGUECnSQqZoHj1RBkkZIu2l7FN3t/cEDOxmUUdOqcR
	UZ+FltfYsGj+hR5CdOM/H9jEXt7uPykYDM3QTo6sc5ukof5C9FcDQU3CP2Z3h8QK0iskCAU
	6/+Ygm/Kfn2odILcSJBgoPQ3KgsUvXtJtfEyGtEBs/dSJWZW9UCgehP8bYOeDLFvyVyPts4
	Ohb2xM77de8tltLEKxVJtol/dUJX2yKwKx0jgXw8xjLOdXvIxJTYIhzDQl3luYCz8oBbsRA
	HyjpN1hrRM0RMsnJ9kq58yalz2TINDvYZ9cMWTe1S4HqcRXecXTMcfQ9SfKLuQ19WlMCvIq
	h/zklohEJILgroSkHqAOY8gcLM9jJwqv7bwUfPSOMg7Y7zj5zS6n8J14phEBKzlLVgVyDVn
	Wvh/Es6RgPxrebWv94zyiq4z/u2bz4b2clwF+K3+vRjPybarozPHNmnHTz0ISaBg1pcRKbq
	PXJUwm2vv4qw56iZBSPrcnajie+GZazxd1M4D6u2c2kBgGLrqvj4glBe5wlZ6cw6F9VTISx
	CR+UJv+ec4NFy78V3+54evHNrlMr2K7+hZVtpK86A8m9C/SJOYdKRm20kGFxx+Qn1Zh+Qgg
	BlJzipYl9zjFFVlbgC8XtnuSDlqsS40yJrKvweO38casEFlrdYCW7AofEj9iVNEAatkL8ta
	POIqQQ4Bw9k86ixZtqhMkIoUbw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

In order to access the protected IO power domain registers, a valid
unlock sequence must be performed by writing the required keys to the
AIB Secure Access Register (ASAR).

The ASAR register resides within the APBC register address space.
A corresponding syscon property is added to allow the pinctrl driver
to access this register.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index c5b0218ad6251f97b1f27089ffff724a7b0f69ae..4dc49c2cc1d52008ad89896ae0419091802cd2c4 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -32,6 +32,15 @@ properties:
   resets:
     maxItems: 1
 
+  spacemit,apbc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that access the protected register
+          - description: offset of access secure registers
+    description:
+      A phandle to syscon with byte offset to access the protected register
+
 patternProperties:
   '-cfg$':
     type: object
@@ -111,6 +120,7 @@ required:
   - reg
   - clocks
   - clock-names
+  - spacemit,apbc
 
 additionalProperties: false
 
@@ -128,6 +138,7 @@ examples:
             clocks = <&syscon_apbc 42>,
                      <&syscon_apbc 94>;
             clock-names = "func", "bus";
+            spacemit,apbc = <&syscon_apbc 0x50>;
 
             uart0_2_cfg: uart0-2-cfg {
                 uart0-2-pins {

-- 
2.52.0


