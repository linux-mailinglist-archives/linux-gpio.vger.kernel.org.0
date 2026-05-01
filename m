Return-Path: <linux-gpio+bounces-35960-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UChjGrTR9GkYFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35960-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 18:15:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F74AE03D
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 18:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1500D308BD60
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416E63DDDC3;
	Fri,  1 May 2026 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="d5TuYKoB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CDF3DD53B
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650897; cv=none; b=axXLjSfR17GielDcbidFaZlQuQ/2ljh4aLQjOVfmDQCf2F6tIw+XoyYDJ/diSMZuQjt21ZIWa+iUwZGnbYag6KwXrLjZfrAERLCyNM+po4A+2rVGSQD7sj6Oyh0UZfBhP3Dy/PYb37nhkJ7ds+Hnow0Ln+V7UXntAYhBlpq6pBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650897; c=relaxed/simple;
	bh=3EvigSq/dpN+56ACeHHTAxXSD8//ELNhyucmUDQBNOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzpuiOr4Y1HsstU+brdluRFiSDTszlX09kzj4xWhtwsY1V8UC2aAUeKaW0cfgYvX9IuqYFZMBWeQxLfvpxsXex2pD1Wtgb3Mt0pd84EV9hCPqIv0bJx3238mq4Kh6zyvjAlbF7d37zJcDNlHcxr21h+31hfo2NlcW/zkEBhETNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=d5TuYKoB; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso30532726d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650894; x=1778255694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
        b=d5TuYKoB1iNsFXPzdfSOfPMA7JWzQQqwg6krbNhrtbUusGhP9e3jmHXdIhMEItlfKp
         5e45rfC8NWzOUeDXRI0CVnq4Q5HANPmxneXZplZQs1ZAwCmv7KgE1cGy8XtkXH6rkF6s
         AOYMX8J6uXur0xsiV1qplMsypsj2RpWYPeYNHxuhmghjJ4gX4+xQCoSBZ0GKMVq2zM+2
         Jr4TIKHd5ATzfGZzmD97JkTIW0COn7ywuWNuI+CXqIlJv2K8cEyh8lLtrETU+Jtijy7Z
         Cs/oNQOyD3GbSgLRnqDlFz+So/Y1++kWFvYjQVoKIsrQQ49LKujs+wep8QzqCRwqC9Dr
         WSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650894; x=1778255694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
        b=WT3HO7qDaLNq1MT9cXdA1ioFf+YSaDBeuBdeR18WbRjzATLhcPEAi0dl738/q21A51
         15FyrmU6CY8LS24LBIP34JciSSXUH4fjeRYrqmDSgTtaKLxvr3PZstovk4q0/IQGcBTR
         +Y1SNCCj3QY6InUnBOPYIhBiP4Nhr/f4Hk8FKMFuYGs9AR92Zp/RLArMFMJSRl5VWj/d
         /rFa4QTrQ+MSc/2LX99Gqqwo5OenS0sGiS6IJPS6VI1719/IquiS3lTEVjzt9CUDUiC1
         /Gu4AfrAR9cgjYROce9dX8xQn9/Je4SpIjnw5VEUymmN2qKo4W9eSN9XZLCSjr8KhK3O
         EAvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iCDDRfc+QlxXlq7Jxrx99ThaifcWYzHopXY7GQgp8qpruKLusZDYtQmjTKKtCM3GQCubETYEKdJTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwXP/n0zHIIUpZ5dm4hG6XWINhghScB/Qyn8FdWm8421gJHYDwG
	Y0MQHjQZEwNe/jtzSFsZcr3WhcSPdnpP9TZFeEniJGM/UYyac6aDc5H86+snN9yvzjY=
X-Gm-Gg: AeBDiesOy6IdPv/65VhVeMv+SVes5ZfCHATa65t3BbHllWunlq4lcnPBOyLbWq+32+J
	A1eWsJyAKAQZGhx0dKko3Ww/mf8BhunP81FL6Y15Jo0ecXHTmj4gVhspNBYxdDDjISVozcMWEOR
	SgBhjni/C8kQDfrR/38iQ05kd07SNaXOs4dDr4kYvK26pOaYpN7vJeix7vgLwOpQiQPLEE9u2ij
	VDz5W2FaCbutGDXxPsm+uG/tGj4gdEmhNnRnw1x36gknTzSgcqb++noTa2cLh2zEE/fD6LtXDWH
	N0ChdLIU2/zZl2SZlvGITnSmDCC2Zg6ZSdU5PCM14I8Y3Do9U9Px6h47VwYMUSdNy50+Y3j6rFm
	6J362/7GkhzfZ57LWtglFRDthG/UqsYsbmcZOiS96oqIHJme66fH6UeRP6ePIm+e2ajxoUqttch
	X1DHULMp0rxJA5wwVvEau2nZb1p4fw538Y/+GHYZQIrnVfRe+2/CBZfwn5/b9NB2UcxMBpBh34P
	YW1pQ==
X-Received: by 2002:a05:6214:54c9:b0:8a6:f065:3ef9 with SMTP id 6a1803df08f44-8b6664fcf69mr1373226d6.15.1777650894371;
        Fri, 01 May 2026 08:54:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	matthew.gerlach@altera.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac: add TC956x Ethernet bridge
Date: Fri,  1 May 2026 10:54:16 -0500
Message-ID: <20260501155421.3329862-9-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C99F74AE03D
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.44 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TAGGED_FROM(0.00)[bounces-35960-lists,linux-gpio=lfdr.de];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_SPAM(0.00)[0.647];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1c:email,riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,devicetree.org:url,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Spam: Yes

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
new file mode 100644
index 0000000000000..d95d22a3761da
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  This node provides properties for configuring the Ethernet PCI functions
+  that are attached to the internal downstream port of the TC956x's PCIe
+  switch.
+
+  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
+  switch together with a number of Ethernet controllers. These bindings
+  cover only the Ethernet functions of these devices.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+  - $ref: /schemas/pci/pci-device.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  # We can't allOf reference Ethernet-controller.yaml because we end up with
+  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
+  # small number of the properties are useful on TC956x so we can just reference
+  # what we need.
+  phy-connection-type:
+    $ref: ethernet-controller.yaml#/properties/phy-connection-type
+
+  phy-handle:
+    $ref: ethernet-controller.yaml#/properties/phy-handle
+
+  phy-mode:
+    $ref: ethernet-controller.yaml#/properties/phy-mode
+
+  mdio:
+    $ref: snps,dwmac.yaml#/properties/mdio
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pcie {
+      #address-cells = <3>;
+      #size-cells = <2>;
+
+      tc956x_emac0: pci@0,0 {
+        compatible = "pci1179,0220";
+        reg = <0x50000 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        phy-mode = "10gbase-r";
+        phy-handle = <&tc956x_emac0_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac0_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id311c.1c12";
+            reg = <0x1c>;
+          };
+        };
+      };
+      pci@0,1 {
+        compatible = "pci1179,0220";
+        reg = <0x50100 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        phy-mode = "sgmii";
+        phy-handle = <&tc956x_emac1_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac1_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id004d.d101";
+            reg = <0x1c>;
+          };
+        };
+      };
+    };
-- 
2.51.0


