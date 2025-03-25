Return-Path: <linux-gpio+bounces-17935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E093A6EAFD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 241781893827
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ECC253B75;
	Tue, 25 Mar 2025 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YV7A77AN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D519D8A3
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889774; cv=none; b=G6CtaNlSB/m/SXlI8qTO8DxS8vAB2JjK5/iC1hkSkg/PBk50rQsKsWn+2yIv4iocmgZLQe8nujV8wCKZCZzxosOxe/axpVnyQBBhsnSSePmGD/6YH1ccxI1VvKPqPL0hdKgH9qSH/Y2O/7KZEkimOKjLAD3StdIA1uqyfWzGxWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889774; c=relaxed/simple;
	bh=SPqlnkjtrS5DVFkshdhSurAaxj8Nd6Gmu/f6A5AIxGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBPQdSY/E+cCzYEsAho25TR88m2D09iIir1R23Rj4SJ8lFz+Wcm/SsK6YWNxdClJFQcwKElo9PoRp2KvzhAkcaQt8jWgURxFczXO0DeCo+0KH+J79mw2BGjf8D0CHbt9FH5DcOheHttiJWVXWMhco41ogzB6ijHLC0EXSkza5NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YV7A77AN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so795405766b.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889771; x=1743494571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6hGtk8l3NJ5m0ZZ1f8dhJbnrFpOfREyFqNdfBX5qs4=;
        b=YV7A77AN2QHRQNEzMUUVL0ODg5ykfLN0b47U3KqnmW9sRxT1LWAxLiXI25VspD+v3U
         0ycmGp9M1lMT8yjdZ9wL6hIBR6heeONo5sdtieKqSNMnv+BN5ogclbn7v7O/+so3675Y
         gCY0NGULa/K4Rv0Rd1Sl3F6S8I5actofcSqPC67XpcbPjqs0FmXcfLJIfuJsuKAw4QSi
         zZyToiiygdKtwJvA9NxEUGdVNajd1hMeLIUG7+DjpT/ymmcSc/itAeITNZvt88QUT75e
         42UrLlVoHObCbNoEW5+EdLQZRWZcf8ftxZkzH245VR9EX93sKifliTDFJMT1C4VHCy+l
         LzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889771; x=1743494571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6hGtk8l3NJ5m0ZZ1f8dhJbnrFpOfREyFqNdfBX5qs4=;
        b=MVhlO/E1a0j0YZL8qR6Dqkwv9eKGshwDPBu0GqK9JYNOn+qsAMfUTBFgG5QwxiHZyp
         BHzLvABw8YYbgVfL3gnSKhY5yp2chawID3hxZ6n/5SiEf0DYTcnuDytg2bauQU8c9oKH
         /uWqfK/PLUlTaYpHYRX2tznKwQoGWjuXp9zYwZolxwChd9qMYQFVLIZPXovpEDAQ2b3F
         0L9x84nkvlznYIaGHtB/CIzvetRRTaLdgRFEGndBMVvdbWJ1M0P+amuG1c9BuQ77s8pt
         mIWheWmtxUcBlsdjUI9pdoIhPfK2NgZquiBdlagulce2/uN4uIfoGuKqJVKwmiRFB8RE
         SqZw==
X-Forwarded-Encrypted: i=1; AJvYcCXWD5JdoWbsxx5MJcRcIec3O2n0vhXYoseIEQQgY0/pQgJF8NTC5OxIk9f/YaR+bIZuU2yMbQ/OhqZr@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNUkVyWJdhcXpvYTTu7rm6GnEZrpufGj+Nm8OEnCctzl0jA/x
	gykEPL8EAdIeI7tQonRibfQJ5r/J4+4F6XwAdZtiCGQV7DeIn9m9S+YupNhjuO4=
X-Gm-Gg: ASbGncsgJqc0rE2TV37gMKBcy+hdFb9rY9pg8eF22XX+yLrZZE0Y69JvSziRPBNs3Th
	o07Jx8Dp+pzmqwsjINtfH/NZCZbsGhZTXwbQmUlQaxxTYOZRGoWReoh/WNUsmuWVMc01jPuimHJ
	1h7MuWQD1pdm/c5RhpRRXXF99grspn+KSIbwzeecnNCphXRBbBJxFY2qzZ8tkYFtdGdoH41j8qL
	NOwGWqBf/YubSizvGXGA1okmJwFO/VwBmpZn7epFAAJJN7LVJVBXyxiVhLQCHQcwGu4kMfiYOTS
	Jv+tR7GkaNmnZWrDRbwVBM9bGgnk1Q899gql3iZhxwZ7S8MT9obKapjlLExX+VglvcWpxI3DjYX
	X+NHQphiMDCqbhPAPk2IMU6eWObf9
X-Google-Smtp-Source: AGHT+IELkDVeKZ6AufhA6lJ7MjzTQsFQ3gFzAB+1T3Pvd2jU/2VAFg84gQd/PIk9YF8+lS/h85MrWg==
X-Received: by 2002:a17:907:cd04:b0:ac4:3e0:7ca3 with SMTP id a640c23a62f3a-ac403e0a6c8mr1292664066b.18.1742889770672;
        Tue, 25 Mar 2025 01:02:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb004fsm7446785a12.40.2025.03.25.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:02:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:02:25 +0000
Subject: [PATCH v5 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v5-2-69bd6f07a77b@linaro.org>
References: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
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
2.49.0.395.g12beb8f557-goog


