Return-Path: <linux-gpio+bounces-9917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9197160E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF05C1F26D0B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6466E1B86E7;
	Mon,  9 Sep 2024 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9nxOOS6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9721F1B86C9;
	Mon,  9 Sep 2024 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879666; cv=none; b=VcXAlR36OtZzave005FsPl2m8rpwg6YDvdygviYGT/RWeI7Mm3QICphqq7tFKrNqpCpsAWzqh5ZjDEModSy8FSNQxt9rRNYhyzIUJpSOEFQ9rJUyNX7XuS0r9+hj67tKnfXWFwFPgRnTPWPEdBr3DgzsPfIlpFsimU9uBl3UQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879666; c=relaxed/simple;
	bh=0Xbr1FdDyKpKj+3Fr+/QuaoEN4dfbHmAhWgDRUgmrrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kKs+0cP1Cou3JBv8M0g0AmAsfdRETjuRs11oTTwzjNGMV+MkTmP2l2RsRmgPepahfYqfMXPNufGADWB4RaoIcRepPp+GHJx7Bvw+L4adFSnQu+K0DMa8ETmFJ5dqZmqrLan0sLjq/SpXMsmi29mrKqanh2FG4dZ04R6ofGeIpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9nxOOS6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d64b27c45so51536566b.3;
        Mon, 09 Sep 2024 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879663; x=1726484463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIorSPo7KTJeiqhdkQyEU3TTtvPM5JLNIBDUUuxznsI=;
        b=W9nxOOS6/iQJFsKczHHp+Su00plFCYsJSp9rdPV3Iz7mOP2ouV57RLrdakHLOEGUs2
         b5XXwuQVB3j79cy+6/E4U6SdAL5ICErfdvbPZvyEqN4QvVfF8A/HNPboeS1CBJ7qcHyY
         Wo95CnxfmXVnx6ltcKuGrt7HMLx1+32HQLqcv3DrgkvotEFeuQhrLmy/B9Kxkkc4v3HZ
         7/4JFxJ2O2lH+xZvf4xW/bnbhp649/hG3rx09omvSjM143yBgkLzoAcwazKx2YUI/U6i
         METgJcm6OyzxnXZeY+nib2RItumNHcygPveEsQRyZ+iGqrtwDuGOV5PXsDpFDBCa18/D
         lsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879663; x=1726484463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIorSPo7KTJeiqhdkQyEU3TTtvPM5JLNIBDUUuxznsI=;
        b=W1QppZW1G5s7qHatSeJvX8QpgMem3XBrkeUHYoVJe/+pIZTYRTj6iGYzB7Zy7sQh5A
         8d8vYZH4xgVoreTMkVXnWbAg4QskVA61S7ewVsK31I95hwWIWrRf3JF/8piTWaxociLB
         JLFO95ASNp9NxKyK+HFDmz/Jpl2eA4fepxXaiRsDwLYSgaJCsEwCHwT3N1nqAVmWMz79
         2JGxV0DuPkoubOxV+GMBrwVAXXfUHT8nPOR5+zl4YZQly9QM7J8tkL/bUSucdFJKYfSC
         d3ZJPBwbBXEEc/1Y1Wbzy/UentnMcqIcvTmmK2kKnik4jZ1EEAv14n/A26qrjXzMz6An
         UO2g==
X-Forwarded-Encrypted: i=1; AJvYcCU78Crsy6+ECmvlUMg+XBJcRexaXr+vv+Puye2b9wze9j3fI2uJEopegKqQSftcI650o3t24ItsW7SYDg==@vger.kernel.org, AJvYcCUoyARAIyEElmLVMTDrra11v+Vb06FVFx2o9rdIpd3CBFaLLrqFFwYnJCAQRahsiBQj1RV+mP489QljJ1jP@vger.kernel.org, AJvYcCW4z2umObEKQaYWbOgwW3rIiTKHiI/KtLkLQP3plLcJr0rsq+lQu9683Q7ZE7k+30SNPe0uooignblE@vger.kernel.org
X-Gm-Message-State: AOJu0YygrCvZUtf3PVarsInzJe0+cZyym2BPQsCwus37898svF4tQmGY
	FZndF6/bugIVxYy0hfMzmJ4FMTLIq69DnESBnSDTvstamwNJqE+x
X-Google-Smtp-Source: AGHT+IES/Cpk3XRkGYVpLodwiL3AFJB0x656S+4nyN88Mzp6acqA21rD9FGtL9f41OZgniLiaayuCw==
X-Received: by 2002:a17:906:c103:b0:a8d:571a:e863 with SMTP id a640c23a62f3a-a8d571cab77mr229981766b.25.1725879662663;
        Mon, 09 Sep 2024 04:01:02 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:01:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/10] dt-bindings: arm: samsung: Document dreamlte board binding
Date: Mon,  9 Sep 2024 14:00:16 +0300
Message-Id: <20240909110017.419960-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S8 (SM-G950F) board, which is
based on the Samsung Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 01dcbd8aa..49884a7ab 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -224,6 +224,12 @@ properties:
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
+      - description: Exynos8895 based boards
+        items:
+          - enum:
+              - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+          - const: samsung,exynos8895
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.34.1


