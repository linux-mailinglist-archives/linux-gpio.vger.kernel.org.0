Return-Path: <linux-gpio+bounces-19495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B517AA4640
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 11:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 783BE17288F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A442147E8;
	Wed, 30 Apr 2025 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdu5M2BO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF9221B9E4
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003797; cv=none; b=mtFJmWtgvQU7uMCijbcjdnlIyFpNq6RV0i4zbkkqO5hj/ESAAYSHMIE8N9eUgbxRuyauMZnvwEhrIxK6MWgp5HobrHt4bgwM6qXihB//creMdcSay3RBbejXvP5ysepct/vEfT1xejuNpUp/jQ05D4XCoonC91GzAT0kcjydiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003797; c=relaxed/simple;
	bh=Cc1Ucs7d+DoVlcf66E1KPy7NQ5fP8mutIpm2TD0VDuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wj8dIPmDJPPtuv10cCOXq/BqIYSxX4vV07ub7JRTmHileO4agqkIUWssxEmGsVmUDlE/VBLbqZ1UmUJpWT3x78DbDvP8eMnYLObKTL2zKzu6sBlPY3bjBRIcMVS4UgpbxQiJSo0zk74T9S3KwRb+JHdvvrtjXF2vYLFNP6x7aPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdu5M2BO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ace3b03c043so1110465266b.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746003793; x=1746608593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rgc6ivQ4v0OBxVxiMV//REmkxOVzSIsF9RwMWgdL0S4=;
        b=wdu5M2BOvCYtLP31c+R4majTHgHEizvwMZ8fa7CnScROmmjq83XOx0ockoKXnhsj9M
         MifYakA9gftOFQo8n+lsZC9WLc2qBMSdRaVZdS7xXNMKD6YJhW4KLutHkOGCj61X1u6U
         IPercFCxtknFeXqvVnoJmzPmVhTgU2IGhYkjedetnAv+S103MpSLCsJL4LE+HqVbWj02
         bps+A8OHH6CiabIehAsMP0IVupMTGwzx+DRcLZF1IG4oVsRYbqnUfjcx8JigRxCfdMtO
         v3+gnDNgZzfHtmFg99pdDT1vsxRy0YeJpxntlJ85SEERSeyqz2aZ37NPnA8ICot0PUXE
         sa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003793; x=1746608593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rgc6ivQ4v0OBxVxiMV//REmkxOVzSIsF9RwMWgdL0S4=;
        b=AzCJ/G18izvQ9wt1uqcW361X1mAIkrul+AK4oZ4bwvb8+fx5gQqb5VggkJ2zxPajRP
         lyVTB7iLiqTjzG3iO+fch1ZRQANFRBE8WgLaWi6WRmkl8t49F+nyfvxuqP6RH/34Z6LA
         X/p4hSzzuRAI17MPRA6mw/O+OE7cSjjql9E9xUye4IIG/BbBnalqdNXpTO3q958juyK4
         aBH9kbRxZSS2yNTrTlBcHLgwZVPm7WCkHm5jJQQ4UYrGCGy2i6dNmzLLUE/M6IGkVRQt
         CzE0KcGI3pGZ5sdckyxuK5q/ToF2iNqpECJTxnn5xO35FdO0/038kwYWfw1VanLAMCIq
         7HMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX0uvqAGnVdQ2cKkUr5J/QFyeBzfkNRgMHacmrLQmsECiuOrFuX6zV5QgLU0C7fqfHRs9n9hJUBaop@vger.kernel.org
X-Gm-Message-State: AOJu0YxuTrLHwbalrLn9y2/ToRcgRobFoALAaHKLf8oW6EaWdGAPIFzV
	ulociW75iLVf7usmSdLvXEZO7T0DqkWQVtmvkRQ5GonygiuHUZhTGdVbv/PCm3g=
X-Gm-Gg: ASbGnctguU3fyabtonjsnJBS0zcl/3HJuEY1svhHjoL4YjV8qnKAkLL+mtUO3pdIcHr
	krLR0TM6tY0KE4pAN5jho+Ejy7fy0dqmTp/lg/snhP1osUfa9r2d5RWdrHGPvXt9/cVINtSwU8N
	V4aEdUUac2twAcOLs3a7sc4WMnAeMS8Bh+nnSmb5IGPJeIzgfLI2ArfmpRCGD7p1ezEU1Pf3NRR
	a8mZnyrWF65JhX3pAPUiId4z32TYY9eoY7Yc9vlhjp0xr80QOlZjvLgDCJlNl3lj1MUXTUTMd2z
	61SLdT2/x8S1/UTU6WoGhW/AXjWDDdYE3GGWxxMzjxzkCIeppC31TMHAa9huthyEVvGWk++0K8T
	7lEqoGN+9//CD6jPU7sVp57CB
X-Google-Smtp-Source: AGHT+IHh/frVfvYlJV1tmXFwo00h3A1apTHUNVvYyWOBXRDPAdhfFrheDXV2GwC9doZTSaZcj+ITqw==
X-Received: by 2002:a17:907:2d8a:b0:ab7:cfe7:116f with SMTP id a640c23a62f3a-acedc709fe8mr247900966b.46.1746003793118;
        Wed, 30 Apr 2025 02:03:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbb6sm889676766b.28.2025.04.30.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:03:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Apr 2025 10:03:09 +0100
Subject: [PATCH v9 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-max77759-mfd-v9-2-639763e23598@linaro.org>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes its storage module (NVMEM).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* drop example as the MFD binding has a complete one (Rob)

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1e3bd4433007341a11040f513bf444866b9e38a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/maxim,max77759-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 Non Volatile Memory
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, Non Volatile Memory
+  (NVMEM) with 30 bytes of storage which can be used by software to store
+  information or communicate with a boot loader.
+
+properties:
+  compatible:
+    const: maxim,max77759-nvmem
+
+  wp-gpios: false
+
+required:
+  - compatible
+
+allOf:
+  - $ref: nvmem.yaml#
+
+unevaluatedProperties: false

-- 
2.49.0.901.g37484f566f-goog


