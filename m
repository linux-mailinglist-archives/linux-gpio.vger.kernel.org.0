Return-Path: <linux-gpio+bounces-33515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL2iNkj3t2nSXgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:27:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC06299819
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6192302DE7A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 12:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F70396564;
	Mon, 16 Mar 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="DqCXl/Ix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1902395DB5
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664039; cv=none; b=bv7fkB+gDphk7bsyH4auXno5n+SJK3964hsbvjr4011E4QOE4gxECUSC99c1gT1NllAJjgQlQ2uC14gvmnlvRart4nOoPi6vV5m2y2w6DWfdrvASjZ3hSLj8L3BWdJgOJYS7LZ+ubsDn0hJSAgO4hSFyoSlR+JYSZFx+2Wgjrus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664039; c=relaxed/simple;
	bh=z5bTSnOfCXpsdyszj/zQ1VyCEsbWXJpuSa2LiAKJ5QI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FXxiYzasVYDDHN+ips7uendU/oRUobdDJXTteJhWGD8Vil41ekPxUfTtF6FFqOLgjBRma8wEYMSN1nO1IgoshgXtSZr8+eu+HLFEXUx5l/zEfPl0XGyq6mztI9+hA3iV590RnhwrGnKUIMoxpv+KAV0HVzJQoAeWV9tsvzbKGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=DqCXl/Ix; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2ad617d5b80so31602235ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1773664037; x=1774268837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jCeOFdqqSIe3CaVdT9a8Lo0webumtRzvsw7kpgbj3U=;
        b=DqCXl/IxODtluQ7DIoeDqJORMqDo+n7Nj93ULSnNGPHIk3iBV0x4oc0miHypaK6Vz2
         ZWrBPZpORBlEd5bwO7A03S0XR60un8t+NzPs+CXrg5YGnAk3HvFUhz0M6NudgdA+twPa
         OWKHJ8S9MgcM0pfyk4k9o5WIEWOfKG1SyS0ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664037; x=1774268837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jCeOFdqqSIe3CaVdT9a8Lo0webumtRzvsw7kpgbj3U=;
        b=VZMQaSrd2ttCF9gurVue+899OfYt0Lb3fQjCOw9/Ef4TNa9cWC/cqkWgufPzVsvRYs
         2cg4BSsOOYhfN40mLln2MBpv7gJkoa1AF26R609mW0LMG0i4lD/hebN6shzfSedfboLl
         IMKklVpN3lc8C1B3bLaEpkrpJMna4hckQGkCyRiMHrwgOlHIRwamhtV+2H6xO7qFZU9x
         bWx4kK9j76HibEr9h3YjqnesvXnkT6fFG6h8vtibhw7kP56aMDlAkJ9bbldwehwJv6CG
         WuzHJ4r3r4ZyUDJMZv0UubKB/CwyA4JeG1U2stxYK0iQYzx9ljF60EU01mgl1fVqK5Ia
         s9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkeodrGpajX6WNI4B6FoRhRPw6Ya1W/eYSoz5WUDAJhNQdRr87TB+asC+fRlaxlIz/PjsvYD9DLCcB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8qEF5Tvo1hxvWzWJ71Cw0dnD+HAkfpJfRhog+zl3hfrdQykw0
	BgaGhfJQBo1OYTOJOPYr/gs2ZyVjZqmG72xvrL7x9DqyjDMeaNzlHvX3ehieqsTbwto=
X-Gm-Gg: ATEYQzxCRw4d+2jt3yR8VQv44jEIe44EA2npZoCft1I4pccSiuLYGRt4Y4W1pvvRf3p
	1USNNOaK7EbkvT/RfXhtu+AU+7A7S7VL5vqhwKeMxGw/FlJVIesbBbqkP9A8bwePtxqAlszCkEE
	wc/Fd3RGzMK7HmBvXTFBpvFrjovoTf1aUjLY2Phi5dno3+uwkqMt4cL2rszEe9qoSLvFBNurvvQ
	UBuZr2zbXRWxeh2lE0L+QaTbKBxPBI7m08+5DMXWKxFbYZmANZH3eEZ3talVAAxhNXlr4ddrYhW
	pnGa5Y5U/pK8gyLjvmwCHGkltotLJlm2HT4Ui7O9OXAm7jDklK0E2YlP8/qrO3xR2kzcXz1/JYH
	y+YygWkV/exk4BgDgMq4q7WDfgoLrV8WnT+6tA9rHNdMV2B+tD65yz7qgnUgLcN89pbyZ3t+XJI
	2thK4uvUFAsWNqmffUEDHHkvTwYXSDkE8k+xjX+VJS3Q323tGEXIQ1bV/4P1GlfuwqCZoImvA5
X-Received: by 2002:a17:903:3203:b0:2ae:c88c:197 with SMTP id d9443c01a7336-2aeca9eb9cfmr131744215ad.17.1773664037145;
        Mon, 16 Mar 2026 05:27:17 -0700 (PDT)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05b4e6094sm23397765ad.77.2026.03.16.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:27:16 -0700 (PDT)
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	sudipm.mukherjee@gmail.com,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Subject: [PATCH] dt-bindings: gpio: gpio-exar: Convert to DT schema
Date: Mon, 16 Mar 2026 17:57:07 +0530
Message-Id: <20260316122707.23353-1-ssrane_b23@ee.vjti.ac.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vjti.ac.in,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[vjti.ac.in:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33515-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ee.vjti.ac.in];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ssrane_b23@ee.vjti.ac.in,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[vjti.ac.in:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,ee.vjti.ac.in:mid]
X-Rspamd-Queue-Id: 5BC06299819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 .../devicetree/bindings/gpio/gpio-exar.txt    |  6 +-
 .../devicetree/bindings/gpio/gpio-exar.yaml   | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exar.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-exar.txt b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
index 4540d61824af..9f183e66bce9 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-exar.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
@@ -1,5 +1 @@
-Exportable MPIO interface of Exar UART chips
-
-Required properties of the device:
- - exar,first-pin: first exportable pins (0..15)
- - ngpios: number of exportable pins (1..16)
+This file has moved to gpio-exar.yaml.
diff --git a/Documentation/devicetree/bindings/gpio/gpio-exar.yaml b/Documentation/devicetree/bindings/gpio/gpio-exar.yaml
new file mode 100644
index 000000000000..be592c7d4564
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-exar.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-exar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Exportable MPIO interface of Exar UART chips
+
+maintainers:
+  - Sudip Mukherjee <sudipm.mukherjee@gmail.com>
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description: |
+  Exar XR17V35x UART chips expose a subset of their MPIO lines as a GPIO
+  controller. The GPIO controller is instantiated by the Exar 8250 PCI UART
+  driver as a child platform device and consumes firmware properties from a
+  child node describing the exported MPIO range.
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^gpio(@.*)?$"
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names: true
+
+  exar,first-pin:
+    description:
+      Number of the first exported MPIO pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+
+  ngpios:
+    description: |
+      Number of exported MPIO pins on the primary Exar device. The driver
+      automatically doubles this for cascaded XR17V354 and XR17V358 devices.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+
+required:
+  - gpio-controller
+  - '#gpio-cells'
+  - exar,first-pin
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    serial@0 {
+        reg = <0 0>;
+        gpio {
+            gpio-controller;
+            #gpio-cells = <2>;
+            exar,first-pin = <0>;
+            ngpios = <16>;
+        };
+    };
+
+...
-- 
2.34.1


