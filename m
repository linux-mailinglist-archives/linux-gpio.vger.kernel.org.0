Return-Path: <linux-gpio+bounces-5725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D23DC8ADCF6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 06:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A5651F22BC5
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 04:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D7B200CB;
	Tue, 23 Apr 2024 04:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0sh72l0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214B1CFB5;
	Tue, 23 Apr 2024 04:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713848125; cv=none; b=IQ/sbblKdX7XV7KMVEfVry30dI8Vuu5RT7eeEjcFek5WM5WTPhlBx9sr3TTWgsR5WG6xqmGD6C9B8w3Sm+iu9F0voMHPvOEwO/ctua0Qf1zWGunR00U02UUiXGZ5Y9n3DUUqNIy4Bzf4O2Qsk4jDwJqZxG1rA78XMkM9VFxQzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713848125; c=relaxed/simple;
	bh=IN72Blivl3xOjGqK+nwwshKHtKCRadrGPFUIrtVUOwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dPeOk9G0FEVr2MX2HfiENg4Wp0d/8S3gfTigChciQryorw0Wly2WkDE9MWvF+2nqgVB9N5ah5ddg6tVF+Dx1RSU/1qBmksgspYooa2DjUjO6tp4Cxf34b5/lRX6BWgSK44WLKj1nyHh5K10+NLmCuHANjZXFnaOhI+BkhZnDANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0sh72l0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so7729273a12.2;
        Mon, 22 Apr 2024 21:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713848122; x=1714452922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZri1bj6pQ9QXHSvnyPN/Y1Q6Ds0162YmTBPPdNsJqU=;
        b=S0sh72l0NkKuMff1/DOLzRpOcGbeWSM7w323u0Bc0tcjX7pSrT32bSww4GtzTWWbny
         nahwseKHE5NEnZNWeU9+YXaCBU+YVIKVh3DejeU68eiil4pcPAzBpxdEw6cwYFdrEXua
         A8NgIpKmwOHgToSctu9uUVlpTteHzdaLrvJq2iXtHZHFNNc29rvMCukpkXs5hXlPIn3C
         eGT2JcvA68QKJ+vNF5gBBLCOMz2VRUIKln1TFn8rA4gfimT7vBCfu3ZKrDWNj7Yg2Oyn
         COsHw9lt6DNu2xFT/DKeEDLqEV2HOQyhXAXSZnzOijb1bflCJXOoI90CwYFSS8xC48Yu
         XL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713848122; x=1714452922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZri1bj6pQ9QXHSvnyPN/Y1Q6Ds0162YmTBPPdNsJqU=;
        b=kjAqyErtmmTfsvbYYO3Oiox4+JOxrSMsoJoIyfPqxpqO950bDpirGNMRmsp8db9BxS
         oXJoUMLBCDlEpOWuU8lczMwNvZ1XIY5xWc5y24l/giFdT8jF/ZxbJrj9JDnNsjpP6gS+
         Q7+n21p1RT118dEmjpk7ymhREBt7MJazGigz+X9UzNpCNJW6z4UAVcCP/V8fBkcfF0eu
         lWhJ6EdQzdWQzfm0+/D+Zgs2sLQ19fUmMP+vHFtwH50rNRgyvge6T8AyDRtiskJDFBpK
         YEpQ2nU2PLrSBFcgzRzY6wyjKVRBF+zx1w14JyXoeD4Cp765cSKZbs8IuzrEq2jbf7DV
         jISg==
X-Forwarded-Encrypted: i=1; AJvYcCU8MbTKs13nTTy+VJ45Psj4bv55eHmsjGJ5i8EcUwsOPlXism9CDZu4GGTiPOlc8bcNiSO57KgVghBQUb4VGe3HdQP4Y+bGKGlSee2TktyYLFT0oi8eV/YsBLb0poKhXuU448ir3WY=
X-Gm-Message-State: AOJu0YyV6bWivpErNEG0i1asZEezzFGd+2VglBNCkzwX7hJwzy7Iszzx
	2+QMunG0K6AHitofAAEPLqdcZQUBpQSnLkO6GnZ0ZEuc9BeSI7lt
X-Google-Smtp-Source: AGHT+IFSKe8jvyP1Ht4wpCuOFwYLEwvgWH0E5ppWlcON8JBGb/+WQ9+0qATSieF5kLfBtW8V9RnDTA==
X-Received: by 2002:a17:906:915:b0:a51:c964:3cb7 with SMTP id i21-20020a170906091500b00a51c9643cb7mr10662587ejd.61.1713848121918;
        Mon, 22 Apr 2024 21:55:21 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id rn2-20020a170906d92200b00a55a67a81c8sm3019557ejb.126.2024.04.22.21.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 21:55:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH RESEND 2/2] dt-bindings: pinctrl: mediatek: mt7622: add "antsel" function
Date: Tue, 23 Apr 2024 06:55:02 +0200
Message-Id: <20240423045502.7778-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240423045502.7778-1-zajec5@gmail.com>
References: <20240423045502.7778-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
pins/groups"). Include them in binding.

Cc: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Rob Herring <robh@kernel.org>
---
RESEND without 3/3 that needs more work

 .../pinctrl/mediatek,mt7622-pinctrl.yaml       | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 60f30a59f385..a9ab623b2697 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -75,8 +75,8 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm, sd,
-                   spi, tdm, uart, watchdog, wifi]
+            enum: [antsel, emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm,
+                   sd, spi, tdm, uart, watchdog, wifi]
 
           groups:
             description:
@@ -90,6 +90,20 @@ patternProperties:
           - function
 
         allOf:
+          - if:
+              properties:
+                function:
+                  const: antsel
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [antsel0, antsel1, antsel2, antsel3, antsel4, antsel5,
+                           antsel6, antsel7, antsel8, antsel9, antsel10,
+                           antsel11, antsel12, antsel13, antsel14, antsel15,
+                           antsel16, antsel17, antsel18, antsel19, antsel20,
+                           antsel21, antsel22, antsel23, antsel24, antsel25,
+                           antsel26, antsel27, antsel28, antsel29]
           - if:
               properties:
                 function:
-- 
2.35.3


