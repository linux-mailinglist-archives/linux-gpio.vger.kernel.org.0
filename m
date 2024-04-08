Return-Path: <linux-gpio+bounces-5160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E289BB31
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 11:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E951C218B4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 09:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA593B290;
	Mon,  8 Apr 2024 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G36gI50C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724883B7A0;
	Mon,  8 Apr 2024 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567123; cv=none; b=Py1mkxEydT5OkquJM4S/9BZP2W11mRI2XGKNeXmdWruUncdaQT2bHSXcrq9WUUMFvil5dr4KfOAFK5rzL+Lgvnyc5b/rVhgHdozYc5fYc56kJjlKkFnMtfcQrkBGQMTjJ0gKh9roiL9Y61L5pk90WhmeDguEC9ium5AyRmdCGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567123; c=relaxed/simple;
	bh=o4HxjF8YLfbkt08SM/H+IglYCO159ltjmDCZdY5PfRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFIRE8xcGnZula9/UclwdY352jlefT2uvTidNqDmGWbEetPce19YM5XEpZhxM6pQRkNctrycEbVqFxXfug1oDNZkRutz74bswzORD7xmUJcuORI8Vz/Xut+blHC+85uIMVuupT6F2tmuG+vt1B4f6kSIJUGdIslf94uKV/tdQ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G36gI50C; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51a7dc45easo331949066b.2;
        Mon, 08 Apr 2024 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712567120; x=1713171920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WziNI0dy9ontwBLhhuwGeSxizPXdz8ruFPYdBGBNZvg=;
        b=G36gI50C2OzaqgX5lbYTAoEF8e+v5GIOMLt/MvlYqbgh9k6CsDGEte99bTppXNurBx
         iHZPq4Tn9VuWY+ODzomU6vQLcPmcfj8500T+8u6J9diJHgHhl7bM1jqSne8sEsQtPsc/
         SEgsU1P50kBJ8NokTVtv71aCu5sO4X+JNxFiuQAQ7FVRCuzrwOKfzbVn2w4a3XB463Hx
         QLkeGyko/wdNkiRhrqtcxBEATSYl6dS81xaDxonY47MGCpR7+qo0exGUuL8xw+RvX0Yc
         aazQCupeYNgBnKhKoE7BVTBvzSkAgEeIOwVRzD2l5aluXtso/3K4iOEHoMrplBhoeMsD
         wmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567120; x=1713171920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WziNI0dy9ontwBLhhuwGeSxizPXdz8ruFPYdBGBNZvg=;
        b=JiMV5GCJLA6Chf7YREtrNVnGgJtmhQccEE7IGphalnv5r5JcHtnXJIfY+AqyQPK6/N
         uuRU7OqUsn18gSCUtmk45p5dTvy9PcTblTqJBFJeIvbYlaHPLskyiT/H4U53gpm2f+lo
         xurQZbYfZYTrYt3t6XjQb4170PddVTJmK+ABUXXJkgKN//KHPMlsgHZfjnw9RdDTLC6U
         2q8qZSMql2vywwHSCo4ZWGiXqImww0yPq56ZaMPZv1vmiGMNxqNdNIsPblQKUkt+dSuZ
         0VVaDN2lTPTlj4jbJ7pKQ4qJscKsHOB7pUz2YRjCL8QXhVcP7bG8Y1fX4LfUCTDupekN
         X9vg==
X-Forwarded-Encrypted: i=1; AJvYcCWJxeBpH+H7tnvVllpMTEpjqNpy328XQiJTQFH1p7iUO0A3dRGEs4mUglOBplOJPyPhkMlQ3ffoPFxcBkduO3lbz1CFgpEo+1FGHZG0Mri+dCjlvfL+FU7imOwoFi5JbL6ZlFQqtxQ=
X-Gm-Message-State: AOJu0YyJWEOKtJ6rlDErmYqIFHBu6fN1gShLwEpZpCF5ae9Ao9CV0ji2
	GfEPTCz4aWzCmO8j6qG9lHsdbYsv3kJZeAVyjQwc5X7yToP/PNcY
X-Google-Smtp-Source: AGHT+IFJuDSPZV6Dt59lpjhwCnHica/ftb5KxSrdAGBGyr3hReB6zu7+J40yCPnZLpMbPyfGBIDvvA==
X-Received: by 2002:a17:906:ecee:b0:a51:99e1:1f1a with SMTP id qt14-20020a170906ecee00b00a5199e11f1amr5386527ejb.64.1712567119701;
        Mon, 08 Apr 2024 02:05:19 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm2773969ejk.121.2024.04.08.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:05:19 -0700 (PDT)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] dt-bindings: pinctrl: mediatek: mt7622: add "base" reg
Date: Mon,  8 Apr 2024 11:05:06 +0200
Message-Id: <20240408090506.21596-3-zajec5@gmail.com>
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

Both: MT7622 and MT7629 use two reg spaces: "base" and "eint". It wasn't
covered by the binding and also example didn't match incomplete binding.
Fix it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index a9ab623b2697..eaa65512161a 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -19,10 +19,12 @@ properties:
       - mediatek,mt7629-pinctrl
 
   reg:
-    maxItems: 1
+    minItems: 2
+    maxItems: 2
 
   reg-names:
     items:
+      - const: base
       - const: eint
 
   gpio-controller: true
@@ -364,7 +366,9 @@ examples:
 
         pio: pinctrl@10211000 {
           compatible = "mediatek,mt7622-pinctrl";
-          reg = <0 0x10211000 0 0x1000>;
+          reg = <0 0x10211000 0 0x1000>,
+                <0 0x10005000 0 0x1000>;
+          reg-names = "base", "eint";
           gpio-controller;
           #gpio-cells = <2>;
 
-- 
2.35.3


