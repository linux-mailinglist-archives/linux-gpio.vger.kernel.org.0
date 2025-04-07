Return-Path: <linux-gpio+bounces-18393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F49A7ED74
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE873A9EDC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA297258CC1;
	Mon,  7 Apr 2025 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGSsEXD5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E740E257AFF;
	Mon,  7 Apr 2025 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053415; cv=none; b=cDfnYSgDduAupVmzilyXyO++0q6XB694lITF4Bn546O4UIk1EEH7362b3sak3ByNMD7pylfX/R4Ce7DCqNFFw0CfQKqeOjODwIWc9ThEsSlVmEj8W9H8LrQUbm+GNToemtkzO5Wy0XgbfojAdfFFMC4d/LALSbp9IWHo+urVxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053415; c=relaxed/simple;
	bh=dTapJYMltZ/LkEZoix/tSaPJdrQ5H79wRE3apyv56EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DLe3U3IfORdg84FrzcpKJ4xg86ZEPYH5RMr4cuvPt7o1G3H4vVle3ZfqRZIkVh7EJDz00G/MgATG/DLolQEEkTegGlWMFrizlLPt8mavGQ8/4zh5tKyE+GLvO/nBDjGTzwtSosnq92yQTOiSfW8jiv1IYFZrOMOyCfOgiCiIk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGSsEXD5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3291263f8f.0;
        Mon, 07 Apr 2025 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053412; x=1744658212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEBbZeo6UYdkpEaruUccb1yRp1WUtpCpe/onjplnb9E=;
        b=nGSsEXD5stKNDtGRpS7gg6hglBzdSX6c0bKikpMRQdp3RCUkyAdcbuTuFyJpHO6Bf6
         Y3Wa31EOBz14vMOKW93H3TYyEvyL1dOShtKRywRCaquMwjWie+LP4I1X+BP1AZTtO1Np
         UjGz0Hdgf+W99ImHQIOFGDrBdbhtaUig2wZaHOxQWfd9/VoB4LDAKOHBThyO1CPVpltC
         EN3rf3+xoomNlZKFnx90od8am2w8wvhPvbDoH/tAQChqONvA5XN7w/90/ECDcxIAi1/q
         c2Jw9JDoLQXhk/8d+2BiqhNeIn0nIa9+SpPSwzqsYwrSo7/9IPCc5G4yfZDJY3KcNzfJ
         c6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053412; x=1744658212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEBbZeo6UYdkpEaruUccb1yRp1WUtpCpe/onjplnb9E=;
        b=dHg8THY5Cri25/pXrABJ9LmXxnGWPiAHmMjk0qfz+w0BgdJygLqlEhiJpdveyOat8W
         cFuJ1mytRHC/6g53Pbfp194XlbmkaBIhLulPSnqrPvutwixKDyfchE529H7DtuScJqPy
         LKamFBVZSFS7JA9PcI/r4UdfhMeAyCeWDemnCr8lQaDUwOzzItTreYzj40C1g48B3yaG
         LOjCoWbwUv1kZkpOkriiouhPiy5hkilNLTD5wSToT43qHIZ4qebaQ/Ux8rVZXxTWwKN8
         9FwBvCSPCc6RW0VF8MDIwEWCTtEF5FFaz7XvsbwSQaFi4YcYqqN+0fz7JWAFRocekJO1
         gJCA==
X-Forwarded-Encrypted: i=1; AJvYcCUSawGBViZR+n/CfQuRtoYTGRqjgEjo8jG0DTOX/J3qLxtvsfEleikANkgB7zJGR2lBJK3YXhswM72O@vger.kernel.org, AJvYcCVPMwXQ8R56yaVtxWgd/6MXDf6jVD71ns5dDBvnhZ0p2/g46xth0PDxLHVHT524DaEwizxQE6OmIDjT@vger.kernel.org, AJvYcCVxRLyFnl0muIHZ+ion0adb12RfkU+qdlClOhFMIXDgVFYR+hNddLiIJXKKCZjzC9IQgj5f/sRaKkzcQN2N@vger.kernel.org, AJvYcCWLvpHSNDIMT6m/gF2PCGTeWh+kgVQWVVbMUw2b41Zd+BvF18ERso2eVOUhLahVtSvZpuPSR6RD6YSTbQ==@vger.kernel.org, AJvYcCX+Q37OgslolPzYSgbRppB6f98iixIfAvpg2pto/qKbkrA81ew/1CGU4fkPmJaAEzIVP9m+yVJ7V62cEPxv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pLggHROmUssoh/8+6WwkrCadpdRV0lydggj4kJLDiNgoRaxy
	NBkviKr3D4jDEHvPGfEyDRhgXgU25dBSz0ejq2J2R+L8Ke/YAjBV
X-Gm-Gg: ASbGnctoalUjA3llaZACdW/ZJHvhm79ZVpFBLmyuXEhA9QR239ko7As9FDQpXvC17av
	boOigjcYPMv9cBC6p845VoVnLlTfxckxaiy3n8cL0uYwSP0xW36y/ORWuAhvG5Do0EjTq7bwP5B
	29Ss94fj0+drPyCTjHeYzWY5txm5xGZchLBxQbgYJBAGeT+1vISlsebfI9IJldtclIrxGBuMgxx
	qwPXgC/yUYvbWEs05zfxcWo4K7QxeOCxlzsC/lwYMESeV+tCciAjSaSUjTg0X9GD6fWijvEMz6d
	Zs2qoXzlioaaEo9PuW6+Q7mFQAR9lPhd1lUJKqn2/REwRBRCsa1r9xQyvIXZlNJUsCnrIw==
X-Google-Smtp-Source: AGHT+IFiDUo9J2+nBZy+79g55q/2Htaf/2z9pu/kiC27rFNG7z1qWseBbo+Sk0V1MHq4JaDQClWaUQ==
X-Received: by 2002:a05:6000:186d:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-39d820b0b73mr592410f8f.12.1744053412019;
        Mon, 07 Apr 2025 12:16:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 09/12] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
Date: Mon,  7 Apr 2025 20:16:25 +0100
Message-ID: <20250407191628.323613-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/V2N
(R9A09G056) SoC. The RZ/V2N PFC differs slightly from the RZ/G2L family
and is almost identical to the RZ/V2H(P) SoC, except that the RZ/V2H(P) SoC
has an additional dedicated pin.

To account for this, a SoC-specific compatible string,
'renesas,r9a09g056-pinctrl', is introduced for the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped `renesas,r9a09g056-pinctrl.h` header file.
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 768bb3c2b456..5156d54b240b 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
               - renesas,r9a09g047-pinctrl # RZ/G3E
+              - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
 
       - items:
@@ -145,6 +146,7 @@ allOf:
           contains:
             enum:
               - renesas,r9a09g047-pinctrl
+              - renesas,r9a09g056-pinctrl
               - renesas,r9a09g057-pinctrl
     then:
       properties:
-- 
2.49.0


