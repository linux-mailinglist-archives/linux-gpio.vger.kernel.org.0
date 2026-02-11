Return-Path: <linux-gpio+bounces-31581-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DjBJc8IjGl7fAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31581-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 05:42:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B24031213C4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 05:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3202C3035D48
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 04:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AA03542F7;
	Wed, 11 Feb 2026 04:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8WzXhdS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13758353EC7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770784971; cv=none; b=ECWHGy+H4XZ+xK449n+Ty47bjXZqI5E3mPNnu8KGzZu1NPFkG5soi7O+v81An5pP4bh11GPZZosgJi/0ov3kf1BwNarYCKeelMBjhoGeRpYDIDdD1GzSlqxlw3RLyzjBARjVpaFlwOr2AKr8qlnDVe/7aasWuevY7KyetzMjBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770784971; c=relaxed/simple;
	bh=pQeaDOzPamoeAF5ooQECreYyUnj19b18eNZDNf80rdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtOxpEaYvad2Hlv4hddsxC1+2IPX/AHtCRAqe3b0xzaoL1uJubPKTEzS4qnVjuEzG2hG+f07TYEVhLCBSH9Rq0GzsqKenqMVxi7TfzF/ZTpz734ROEKiXotHnHkhVhNcUg+sbLe9IgnMtVmQem5cPOvsTBUX+ub5nH5tHvG3vvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8WzXhdS; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40438380b88so1013968fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 20:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770784969; x=1771389769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9Z7oU+P7jRFZrLVuDGug2HJhb2WxlffNp9qdHif4WU=;
        b=P8WzXhdSNrCtQvg2wJwKfg9ksjHo0lM5YgzkQcCIhEBkk7swVEaCirvULCQPW07C7+
         hoN0wgJiCAOYJMKNjuGxTrA3tGpZaltI5zypP85OYBp0u9LGx1fK9II82R5YHkNqcF91
         GC3ebT3jaESWD5MXIaIkSXwnDptaY3xbXvtnh5D+ogmmYExrHQbYoE2/Pc0JMOzpoavs
         0v2r1WcFQodziStJpaDXbipX7tbEbN8UjCx2YPQRVsxBKhy1Rp2K60KnglDSX4VEAZnJ
         gR8Ko8oJfOHElCnZKLXyEpQb3KmpG3YvL4WI2FIAGDH/K1qqEWLKPDZ4AyzVFLpyJo0t
         H8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770784969; x=1771389769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9Z7oU+P7jRFZrLVuDGug2HJhb2WxlffNp9qdHif4WU=;
        b=tnx42ZH5HLPIRQY5/jnT1hvwqgRB7nSUG+Cafsu/1Ck+0tPDdBbsEMa7A3+BjgZI+2
         MFqKLXEikXWtkVBArRjuIP0MurSp4z5/MB21uBkMNC73ZzuDlIYggtx36qwK1DM35BiI
         X2CGehSRrFoRvmCGPUyLB/hW4UUToY65s1lJrIy5nQNjjg+1N0Qs9wQ+X9FAPpZarcIU
         2rogAfIobtEaKewmEZ3zwzqWkYBrB6pzJ84kNp8u+36Gk7CE2IvBfJp3346rCIIip8AW
         8Jxqrp7GOJOj90Ob4n0spVAc8HYCRlLX5MmboEhrbtpNUsUTAcqsjbs6w8KiQbMNsoSK
         DSZQ==
X-Gm-Message-State: AOJu0YysoDSAAaCjA1fACkC4z9qaf1k6IrEHyMQaq4p9PzEVy+Fg7k09
	tuYFQ/nhDcu5RWIyZRnZFYhL0Mz5hkouvDOMX2y18zsmOGnxhb3vF3vFdJUdcg==
X-Gm-Gg: AZuq6aKEJEgVrA0rOgrGoVXxBhLq29n4T/Js9I+gCmeuKNEqPezO5PhnRs2OolR0oX7
	5KRZP1MTCB3kXSEqUR+nn0XvTmFkgtRvFu4c4NWHvv4/Oz35ZA5ThPC+zQeVju7L4Sv7zEUvUVD
	nuLuvpnkTrlYQtwxdfInOfvAZ6S7PEtPudcTFMm7sA2v5JFKZ0WURvOh67PY4s7IG98jr2K+9Tc
	88pJwAKk57W3NtJZbUPwwTjcWnQQqJea7sRHEejdLJf2SGmeIWz6P/+o2Q1FGmfrLi4jypmQkx1
	vObsQDBKRta3ocKo9I7sq6Qj/POooEVPQJDQVxMLB4TNyqdwBY9qevqbTR13PKeJWyOQU09QFsw
	ImdLIOWF8nqbraR5w7FFm0N5j0iB302svgdmoxlL3E2hSVnjj6kQskGtX7ELt7jZu0izHHyfPJ/
	uD+yLJvQc9f2IjZBV9NsvB4Xg6jsMR0p99jSx1uqBjyI/GFP3AKTeBo7sAZ4JCnma1rvvuhb+Nu
	RvGxJdSeuxHziBCTPyIK52s6cg93eGVlXXRaJVhdOiOJoOxX4/b/fSpJPIZGuu24Q9Bw82DPQ==
X-Received: by 2002:a05:6871:3401:b0:404:1525:10e6 with SMTP id 586e51a60fabf-40a970480c2mr7112051fac.49.1770784968730;
        Tue, 10 Feb 2026 20:42:48 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf16c383sm541309fac.14.2026.02.10.20.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:42:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Stein <linux@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] gpio: aggregator: add gpio-aggregator DT compatible
Date: Tue, 10 Feb 2026 21:42:12 -0700
Message-ID: <20260211044216.2885718-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31581-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,ew.tq-group.com,vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B24031213C4
X-Rspamd-Action: no action

Add an OF match entry for gpio-aggregator so the forwarder can be
instantiated without using the delay-specific compatible.

Add a minimal DT schema for gpio-aggregator documenting compatible.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/gpio/gpio-aggregator.yaml        | 57 +++++++++++++++++++
 drivers/gpio/gpio-aggregator.c                |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
new file mode 100644
index 000000000000..ec1d08f3db2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO aggregator controller
+
+maintainers:
+  - Alexander Stein <linux@ew.tq-group.com>
+
+description: |
+  This binding describes a GPIO forwarder that exposes selected GPIO
+  lines as a virtual GPIO controller.
+
+properties:
+  compatible:
+    const: gpio-aggregator
+
+  "#gpio-cells":
+    description: Specifies the line offset and GPIO flags.
+    const: 2
+
+  gpios:
+    description: Array of GPIOs to aggregate
+    minItems: 1
+    maxItems: 32
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    gpio_agg: gpio-aggregator {
+        compatible = "gpio-aggregator";
+        #gpio-cells = <2>;
+        gpio-controller;
+        gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
+                <&gpio3 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    consumer {
+        enable-gpios = <&gpio_agg 0 GPIO_ACTIVE_LOW>;
+    };
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 416f265d09d0..a09752fc5fe2 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1635,6 +1635,9 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id gpio_aggregator_dt_ids[] = {
+	{
+		.compatible = "gpio-aggregator",
+	},
 	{
 		.compatible = "gpio-delay",
 		.data = (void *)FWD_FEATURE_DELAY,
-- 
2.43.0


