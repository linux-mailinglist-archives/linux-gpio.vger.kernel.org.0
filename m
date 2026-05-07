Return-Path: <linux-gpio+bounces-36348-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCRUDEZM/GmZNwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36348-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:24:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AA4E4BB0
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EBA730A98A5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9017E3932C0;
	Thu,  7 May 2026 08:18:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95AF347533;
	Thu,  7 May 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141905; cv=none; b=lU8qTb+nj7cyqXdtqepzN5/F+wp+/lGhm8P3p/Sg5C0hDwsUE+icA62Wl/65z03eX6IndKmSkMhCMsg8bWBspZSaiiD4nPlKu9uyV45tGW66B1WwFFZEazWTtsi6Iy+y6DCBC86INkLyZiJU+kT7kLRPoNMHURId9DzvHKldO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141905; c=relaxed/simple;
	bh=hx5j7UE3kNi4rhGN4Erfamc90Rdc0PpVnTmIsbGGrZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNje/OGEYqS/vfUfUnVo/GO6oJyOYprN+uj1PPSDYxdwHAIa4dXxwjm49jSusMXCEUUwJHSD8zvvVW3ZaFcXX+ZVYwfggG5sB/QhnyCSeHzsifFF2Lol7cRUwE37oZ/704AIL3ikM+1b74nIgqQuxZwX40uuuToiabv+/YbESLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S6;
	Thu, 07 May 2026 16:17:25 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 04/12] dt-bindings: phy: add binding for T-Head TH1520 USB PHY
Date: Thu,  7 May 2026 16:17:02 +0800
Message-ID: <20260507081710.4090814-5-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1kZrW3uryUJFW5Ww4kWFg_yoW8tF43pa
	93GFyfJFnagFn3uw4SqF10kF1ftrZ5ZF15tr12gw10gws0g3WSqa9IkFy5uF48Jr48XFW7
	uF4Y9ry7KF12kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: A24AA4E4BB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36348-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The TH1520 SoC features a Synopsys USB 3.0 FemtoPHY with some custom
glue logic configuring PHY parameters.

Add a binding for it.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../bindings/phy/thead,th1520-usb-phy.yaml    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
new file mode 100644
index 0000000000000..37f5cfb95bad0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/thead,th1520-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 USB PHY
+
+description: |
+  The T-HEAD TH1520 USB PHY is a Synopsys USB 3.0 FemtoPHY glued with some
+  custom logic to configure PHY parameters.
+
+maintainers:
+  - Icenowy Zheng <zhengxingda@iscas.ac.cn>
+  - Wei Fu <wefu@redhat.com>
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+properties:
+  compatible:
+    const: thead,th1520-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY bus clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: ref
+
+  resets:
+    items:
+      - description: PHY bus reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: bus
+      - const: phy
+
+  avdd33-usb3-supply:
+    description: |
+      3.3V power supply for the PHY, named AVDD33_USB3 in the SoC pin list.
+
+required:
+  - compatible
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - avdd33-usb3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@ec030000 {
+      compatible = "thead,th1520-usb-phy";
+      reg = <0xec030000 0x10000>;
+      #phy-cells = <0>;
+      clocks = <&clk_misc 1>, <&clk_misc 3>;
+      clock-names = "bus", "ref";
+      resets = <&rst_misc 6>, <&rst_misc 7>;
+      reset-names = "bus", "phy";
+      avdd33-usb3-supply = <&avdd33_usb3>;
+    };
-- 
2.52.0


