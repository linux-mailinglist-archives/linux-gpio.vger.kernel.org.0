Return-Path: <linux-gpio+bounces-5159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D507C89BB2E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 11:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743981F21BAE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 09:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324B13BBDB;
	Mon,  8 Apr 2024 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAJqG4aM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E03B7A0;
	Mon,  8 Apr 2024 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567121; cv=none; b=GiPx+tOkr9/G33lnK2EVftOQi45821xCq7NkAYsusZrjiWkh1I0NXG0m8UBrNd7mNM6IsB0Y0SS8BmYdA38Sobt/aQYD43yv/m+Cbxnp1sqZ8n34JY7/UQFsTtn6Su0H54XdjebNOVvBdsz/p+KYV9pL16rQ/dQDL1hxbVjvH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567121; c=relaxed/simple;
	bh=2DGn3tC2DC25Q8ONnOYgSwt8i2x5hu7wa19N9yrKrFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFCt+DmmL9tshmnsXKmPhdO5XFfF88JpBJ6Wmjo0LqZK4vWfeGbeTQM2WROywv9gcgKciRBR/dRUQa9D9EDYA1MVBhL8hhOTUVgVgJcqzzNagx2HJ0vpiQwMRVlC6hzeiexnxKSzCdWo3z1d+y8VaK/ZMY2kB3Gx/gVLb8XCpmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAJqG4aM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso4684351a12.0;
        Mon, 08 Apr 2024 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712567117; x=1713171917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urPnK9SKsV5nVEA1yeOAoEutTVGuSxP802X+pnIxpxI=;
        b=EAJqG4aMQvZjJNGQTbYbwrsntbBZf4W2mdLs/pZTolPOcf4ox7oWpdg1VWdVZMgHrv
         DjH17P9ooRzyqen7Y/0xWUdkhkpGNt42q/vVbXlc5R0vDBa6KbS6GYsmAiPI++cX2Clp
         1Hu+nBmfaC8XHzKwmKloDq9p5QWonqRklADZyD1swTYujDdbKz1Iv2e0uRmgEldYhtNu
         RmSB+EbLQSF1TdXZ5OT44FCSHW1d2Dx6aHJkefiZ8HlcMqSDUIL9RTjseUgu2tWZZZWb
         MjLnjepp//QS3vJCZZtX0Q+rG5lCsB3Gz+ak+sMiMoLAsskULeu1IM9UWA5Oq+CjZjpu
         elaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567117; x=1713171917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urPnK9SKsV5nVEA1yeOAoEutTVGuSxP802X+pnIxpxI=;
        b=esM0jXoOGEYbkHUzLfnI6fwJRq6LDhH2wwxa77xYDw1HVk8lJXJB2xDBW7z0K8CZVl
         TJJ0Lt6I1Ru3siQimd2OUcTY4wgI0fVwexobQnLIkUhaGQWtLzTbDQcU6ARyNqMywkaR
         u10sDFIg87Hdl3xaEmZNWzSa1WDcQ9y60H6KmNOG/XDw/4vaaBBrbnBRYEaWI+LFOH0T
         BotHxB+i4DVej+x8d8XAtVkOWPkgwFCvEO6dHtLdvG3FrHeJS2rx1Dd1fSiM4obzh0ty
         qKzqQ8zrKDMgEB/35p5uRnzQA+AahLxOqIVDN4q4Bq2y4cKXSRBkvS7UIJ+wNrsxint4
         3uSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjU9mCu6EhC85s4snEYoFAhhXMseHnPkfKkYUDS36TMU+iqkzvcPeh9TRg8Rh9nsQdWAFYBSWBGH728Hc2e/hAgz+4HhqPLkQfM7x6OO4DguGfVhsI8tH7hoyBoGg+VaZtRhfpmIY=
X-Gm-Message-State: AOJu0Yz01b/ic+m7NfjvDFwOF0f1+gqJ1iF3mKp7EXYoYyUnhtM3hRRz
	eZDCkE8Fbnd9TUul6MEhUEuY1cuZ+XVijX+0ofkQmrDsqfefhXM1
X-Google-Smtp-Source: AGHT+IFrzZOCYf3cevStt0TK0MTR+9GFEq2JSptieBkxHNbtINxf0w9YFW6N4oKbZw0HPh2N8wyEWQ==
X-Received: by 2002:a17:906:3bc5:b0:a4e:3715:7f4a with SMTP id v5-20020a1709063bc500b00a4e37157f4amr4263965ejf.71.1712567117295;
        Mon, 08 Apr 2024 02:05:17 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm2773969ejk.121.2024.04.08.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:05:16 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: pinctrl: mediatek: mt7622: add "antsel" function
Date: Mon,  8 Apr 2024 11:05:05 +0200
Message-Id: <20240408090506.21596-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240408090506.21596-1-zajec5@gmail.com>
References: <20240408090506.21596-1-zajec5@gmail.com>
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
---
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


