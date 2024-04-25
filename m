Return-Path: <linux-gpio+bounces-5861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3758B25F1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 18:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72551B26B18
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 16:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0D014C58E;
	Thu, 25 Apr 2024 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHtPJ+MH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8941494BF
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714061034; cv=none; b=Bid+nKqUG7lrAveX+TO3N+B9AsEw55iw1NERCnPY12iZAK73pw/pqyxQQDwlQg3tazQZQO8Cl1Hy7K1q95M73wdr9Zxh+QraCcyN6NfA55xexxX5YIKqsZhb5Zg4SFy6JrSOEVHxEYycGyburTjsa30JqIgh4n7oi6a+vDNGsqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714061034; c=relaxed/simple;
	bh=qjiLRzQ/LzL957Tztom+GeWOX7MmZNPVIPPVkVPDhT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWKIbYGXHvpvdD/aT9bzceZLpExEGyYqz1/JefEarcyeJeOS1hhRo7CukdTKmgeb0BA6wYXirVwKVdV9gylyxQSSze9XCbXi35lad5Y4hQAL/Jgx48Thxic+EvlI97z0YQ8242H5JxRbFHaRJa3xcTAO8flSO0ia1GJDdYOEZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHtPJ+MH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a56d7d457a1so141864466b.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714061031; x=1714665831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyR9vWPsqsAUgpTsJMpV9yCJydAsWbKkcw3s9RwSvbs=;
        b=sHtPJ+MHNzo7dyqS3Mq6LAfwyZoY4rPvgsIgnBAmHFdpuACdQjnediqFCq/ag85bNx
         Lvz27e9fz7BUxObzk8bk2XwSe1DqrZ/nkQtbvE4MKb2s3hQa1rb6ENZfBkH/+ABBKPub
         +B4F3Ii5GAzZxt0ESg5AMqQDU1ajfXmQp64eGaQtOg5uqjMkRKYF9kIjg1Qd8tuDgKYe
         kFsSRlpdXUS4Eeps9Z61MmE68MwGURKk6fZlz620EmZI9Wh/GcoK/onP113/yIVEWjoU
         H4MqUzpAp0JP6KEW+QmV8esy5SyYf8J4sHt6I64lEPRpfy03IqGjThcUK04qr1tz0q7a
         SLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714061031; x=1714665831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyR9vWPsqsAUgpTsJMpV9yCJydAsWbKkcw3s9RwSvbs=;
        b=wk8407JBajfPWR8UZJ+q6eiWAEYsd9uKa03RStskydQ+Bl6fKtQR9rNbD6+kBUeuPQ
         Z0pGRVrCWx+jB0dgq+p25QwEUMuAG1ysRBbUzkUAni+Iq512PkaLmutaMP2M2dBow4V+
         CDKo/6kdxMD/ik6q+TK3nHBXpLmXPSleaJx8smUFWQd2RGxgSeYU16LLZawzfSjCIFN8
         ovrbf5ukLta0RBkgMyvOdfOj6RhWOB8DPQry3ZZvHH2Q+zKzoiO88fBqUll03fIHbxKF
         +RC4D84O95S+XPbuUYQ38BgowkA3G+0nvbHbXZGpnE4dRavUn6fdeNSCyASDagDTYJfp
         GCTw==
X-Forwarded-Encrypted: i=1; AJvYcCXz7IgnCxxPXNaP4rg6nTfdKuabDAqqpZb1hjXJ3sJe27Tpv8/2ywWjhlES8Npud1/M2giVA2lZZlDeoy9yW4MaLUToY8fVmebEEg==
X-Gm-Message-State: AOJu0Yx8bH/+QpcBAT0WyBvgkzxcD2zcSyvvzHRC24pA7XOKpZOYOB1K
	8IF7RMTmqt6efjWwF+T7SX6rGcIpAvEQKyVFPu3aLjCx6ya68j6ZN73nv4h/6V0=
X-Google-Smtp-Source: AGHT+IHWlzXObnhoIYoQz5NBCn2aut5u9/VWIBSK4AfPvrhlCDjNKP1pLhTffJGnUYMckpFjpwyP/g==
X-Received: by 2002:a17:906:6bc6:b0:a52:367b:e4ff with SMTP id t6-20020a1709066bc600b00a52367be4ffmr120217ejs.42.1714061030485;
        Thu, 25 Apr 2024 09:03:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id mm10-20020a170906cc4a00b00a58a44a4419sm1329562ejb.57.2024.04.25.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 09:03:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 25 Apr 2024 17:03:31 +0100
Subject: [PATCH 1/2] dt-bindings: pinctrl: samsung: google,gs101-pinctrl
 needs a clock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240425-samsung-pinctrl-busclock-v1-1-898a200abe68@linaro.org>
References: <20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org>
In-Reply-To: <20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

The pin controller on Google Tensor gs101 requires a bus clock for
register access to work. Add it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
As we only have the one clock here, please let me know if the
clock-names should be removed. Having it does make
/sys/kernel/debug/clk/clk_summary look nicer / more meaningful though
:-)
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 118549c25976..49cc36b76fd0 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -73,6 +73,13 @@ properties:
     minItems: 1
     maxItems: 2
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
   wakeup-interrupt-controller:
     $ref: samsung,pinctrl-wakeup-interrupt.yaml
 
@@ -120,6 +127,16 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.44.0.769.g3c40516874-goog


