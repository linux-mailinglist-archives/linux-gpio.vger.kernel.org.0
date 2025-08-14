Return-Path: <linux-gpio+bounces-24387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB0B26397
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AD4A23258
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4D730274C;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKrbPVNC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323652FC898;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168734; cv=none; b=nR3nI0y9+DebqAaMDcUo95EKUbwqlvlPnBpq3aRzB45RvaQS3wqhjE9Q+J+ib+0oyL12zGlvMYnls3Ipjg+e9VaEsyXThp3kNz5KSxth8wdRGefWAO70mh1eEjvl2VEZ/0CrfRhEKxwPgZ7zrx2lO4X/KaFVWTTJOOfNRJUcVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168734; c=relaxed/simple;
	bh=SkZlS7jX9raYlHR3Ve0oCZpRMKEZX0aeoX+eevk1TFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/eBDMjd11AqseYa9nh3hqkLh/9/jryjMsAin6f+S1N3MT5DbymjuvjL8DsngrVSZMoOk+U2sRcVaJJ+uW735MM3qOsT+EYHeQNQzzsJdwn0LFW5KOD+ZNBUSwayxI/xSdny+c8nPhdNCeln76GPXSItMLVgLbIVMyLGSqmacOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKrbPVNC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D97F8C4AF11;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755168733;
	bh=SkZlS7jX9raYlHR3Ve0oCZpRMKEZX0aeoX+eevk1TFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cKrbPVNCE69MN9OMz6ZbeezUPcpxqLCeo7QDrAuH3nA1o/72G+E/vJK9oQlINYpaY
	 OzEHAGEp5FLKId2QK0ZB6uVu9hu+2PoSace/QXe9MPYh7CWn8OlBhjZVrEyJnZIl6c
	 AWsn7zUSUg6ROUW0UQ+jm5/YHQxkPqUVPvJeKPWSR3QQei5YV2RyQyUxrfXtoN6CJP
	 OxpqT0YBFh8x6/4NluM03eZjGCrla4uvRoPfjyV8wjIpAgAud97BIzu47UKytll5Ye
	 ync02qws15M8hy1p0KaVsyMUGPfseXurulY1+oWzSmJaLVIyRv8aUInxQFZCuVq3Db
	 KDhUTYlS3cIlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C58CA0EE8;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Thu, 14 Aug 2025 11:52:27 +0100
Subject: [PATCH 5/6] dt-binbings: gpio: Add bindings for the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755168753; l=1989;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Mi+0w4C770q9JTWbgxwKL384Ye5xiUh9QjGwMTrZ6Xs=;
 b=QLTCDnUrhQy1nxd3vzBpXvjXbpC1vLZCvqc0K7r7lTNC42scTylXuXsFZvLH4YtgHM4jB1kh7
 t68Q1yWWCI1Apgec7jBBIpTgcV+bsyyGRNhhiAsbx5ajVbTTDqopUTX
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Document the bindings for the GPIO controller functions of the
LTC4283 Hot Swap Controller.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../devicetree/bindings/gpio/adi,ltc4283.yaml      | 33 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/adi,ltc4283.yaml b/Documentation/devicetree/bindings/gpio/adi,ltc4283.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..39ca59c53519ea3a761c75c394c56de885d63fea
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/adi,ltc4283.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/adi,ltc4283.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO LTC4283 Negative Voltage Hot Swap Controller
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  This module is part of the LTC4283 MFD device.
+  See Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
+  This implements the GPIO bindings for the LTC4283 negative voltage hot swap
+  controller.
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4283-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index d5d3018b5424f403e7396f0470a12ce8c94a5e49..e492e75833564bd9065fe2422e86479553ea59dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14505,6 +14505,7 @@ M:	Nuno Sá <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org
 L:	linux-gpio@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/gpio/adi,ltc4283.yaml
 F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
 F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
 F:	drivers/hwmon/ltc4283-hwmon.c

-- 
2.50.1



