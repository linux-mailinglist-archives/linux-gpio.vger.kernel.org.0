Return-Path: <linux-gpio+bounces-16480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F55A41B07
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D2D170E31
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258522512D1;
	Mon, 24 Feb 2025 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLb5KMKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B824F5A5
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392936; cv=none; b=CHOv09yHjvM6RAEC227YZw1t5mM7ya7CUgHG93BQ7vS+dZei0nM9umN8OgUywkybBSpJQsWkDEuRrFt7VXnRHh/wH9aomOn8vpQYowoa4l/lxe3AQEklPiU5+HNkLz3XzP+1KQyF324NFSZ43vIJUvpbMC4/9QbhQDywS3+EBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392936; c=relaxed/simple;
	bh=nQJBIUhPLwK8sP/au/kpUVGthmufT8a/T2KHwyqpg6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKllEDKwd28YjypIVuBjuATzotCx62+W6WI3N98he4z7fMP8V4L09ALMwkklDmoCnXu2Xk6lj7iWaBVsnfFI5K0UCxL+RJnUZJJmUUTO05CcasnzHXzKS7r8kVsE8uWRT0cVrHqhzTuVaGfyYJNHws3fJemCOviuriO98yxCY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLb5KMKp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb8d63b447so535892566b.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740392933; x=1740997733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fd8CWfeG8+6FfaIh+fTT4LnoouZsbi9TX6aHe3LpoDQ=;
        b=PLb5KMKp6dktPX2RaD4AtP3jyJWlcCbQGMKvmKDoOsJEx0Qc9jQ6zonUfsHuppb92s
         BJiK0FcJWxH1Z78ngSdHHyR9cl9Dg0Bxvq/u36fn6MEF/mtxQ18LsjnHryXpfthpph1L
         AtI+A9oE46814zySqHuvZfGZXWZug+x3sDjFUMGrZsvi1kCSaJHfPvqcYblIn1fto/Uf
         unF1XgfcvoWSmFq/XF/xppqJsJSungYz6uZMb2M0YWjQuj0wUaMbIvIDWeHHJGQ0ySjn
         3tQBuJ0LwB+ZQ397f7NBh2eFvaG9Wcn8e4BEM6uki45r5ZfvM8phADAsRjpy59bBQFJA
         rnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740392933; x=1740997733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fd8CWfeG8+6FfaIh+fTT4LnoouZsbi9TX6aHe3LpoDQ=;
        b=s4dX5JplirL/vxBVAuL7libuUm0TlHpB15m2YL24hKYrbPTCKaRFvStCQUTOrZlsvZ
         Nb2wIjtPXKXOfgzUDZpAMyqsBXRnrZYdgteIrBUbxR+dNRXZwpiRs0Rl5P91czNWN9aP
         opDc/i81oXzGHYKlQb/jy3BkBEb/V/yKXuTHx2XlWUjRse249Dho+kK/VFVmbZPfxGeP
         5tOt6lVmbkCdQMLjmfu3eyi8RTYOKlpDkpbUNxFcVERw5vSGgbEEsW2Ct5ZBpGb3oi1g
         B/IKd6hsVYVpvemQ2VEUa9VJrrHAA4e5VGMgxWUsoPLzDE7u8BpzxoT/VgswB4MuybYw
         O96Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP4Vm4Lpb721JB9Uz4ktUQcQV9mODHr2F7WQ8UWl6VrjV0IFd/wnSW+JC0Ekc9nOQ0RkMEZkI3d0Ft@vger.kernel.org
X-Gm-Message-State: AOJu0YzFifkjHgkvEFqGOVF6iGk4S3lZArZtKY9CUnZ+vkIZkesEHGhs
	WQmHQcZGam+oTNqRQD9vXhPMAuVNKK4pHTWKDb32syYayTT3zAtptMK35JEMOw5iVVI6o0QR4Y6
	vB6U=
X-Gm-Gg: ASbGncspS5Lk2gXxEVhXCZa7ITMOBaF7N0A401t9Ooj1/PDU4N7ffgU/9M2ZSPUee9r
	P9SwBoFkNhj1vvXB2Fvz0lyStgedQ6hNc7b/bqNQXn5vKDOXzb65VIKWLQeFCsgPUueqz1RtEdg
	99NercD21uNj9/Pk9RzRdGy1CZMi4Y/Ch/bt+LRzUu90gOHB3hCqK5o/pSUQMg71wwW8WNqZkJ1
	SY53m5sJHngrDrbnFDLEf7wQQu3/OzfWbJ4qe6tbwq4pJ1eC/RPlyB9/X+R8RjnyaHD4gOYenW9
	eqTvUsY5EwY5hLJIW29MqbPmSwKMBPJkthasV7dKhM34sCsmnFt60e3MvS+e+WOjOydLLPngJjN
	WcMpgIST0Ww==
X-Google-Smtp-Source: AGHT+IE4q27LpmwxJ6khnxFSWavRGTvEjWQZ/aQgFTEve7pPUfHXEj5f+O5XTnie9HbVpDVpkSkYgw==
X-Received: by 2002:a17:907:1b26:b0:ab7:be81:8944 with SMTP id a640c23a62f3a-abc099b88ccmr1369497166b.6.1740392932757;
        Mon, 24 Feb 2025 02:28:52 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb186c5d5sm1349206666b.51.2025.02.24.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:28:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Feb 2025 10:28:50 +0000
Subject: [PATCH 2/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-max77759-mfd-v1-2-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
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
X-Mailer: b4 0.14.1

Add the DT binding document for the GPIO module of the Maxim MAX77759.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/gpio/maxim,max77759-gpio.yaml         | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
new file mode 100644
index 000000000000..9bafb16ad688
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/maxim,max77759-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 GPIO
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, a GPIO controller
+  including interrupt support for 2 GPIO lines.
+
+properties:
+  compatible:
+    const: maxim,max77759-gpio
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 2
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false

-- 
2.48.1.658.g4767266eb4-goog


