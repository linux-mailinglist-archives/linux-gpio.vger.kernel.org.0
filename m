Return-Path: <linux-gpio+bounces-18013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAC1A718E0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F4BC7A33C3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF261F7910;
	Wed, 26 Mar 2025 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBAMnQ+L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D31F582F;
	Wed, 26 Mar 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000010; cv=none; b=W1471XB5Cu6Ag4am2RJNfChKtkYl2wIjr3KwHkO+WOdTIkygEj/5UFCgt8zmktHLtpkoPudChfGrbgs3aVc28g+9FvMyVSxnxw/nSDHySdym8W0TUIgvKOz/G7FckJDDf+0/t7zTJt9PZ3U8aXzEvVTEATK8pDg1T2Yf32xY8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000010; c=relaxed/simple;
	bh=f1CbqiCxzwDj/7ZOEmQUbfPFa15B5e0tpP4hyDRWljM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVrqSVOCipQk6YUgQhntZdMxDlcXhNDDG0WEjlq5IDrtyvQswHY6X5rb3vE2yAScziHqdh5zNW6ViCNrxerwIKrTcVN5aBrNpcCjYJabm/Zqm/ImPkF3SJnyRb2WSlqGdDcTzVldBhsRgxWHw9gEv8R5CCT2Uxi76g+NhmBG4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBAMnQ+L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394036c0efso44928625e9.2;
        Wed, 26 Mar 2025 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000006; x=1743604806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lXjgaJ30mX5cDcOLM5e2+yWI/YHl60h4te+LJZ26is=;
        b=UBAMnQ+LiX+fEL+ZDdDez+Nhn1KOCpWQ+DlNVaG40WAh9R/lELyONozsqtVNk7+Gq8
         o+W2hcR8Z/RY3q9y9xh+1t7+qSUuS8+Ignml30U0+3Vw+2/9+bBE2u36jyMiXZr2uVKW
         CEvlWbZRuyzkFcIUFy+4k82S79+FK4onpgYbm/BsEwneruLzCNalOiIbvYT7Yyq0BEWp
         02+PaYbcpQg/p8U4KRwM/FUW6OyLg87lQgS1R9aKb7SeP3E8YMiaWlkiVoCrTNlxfPoy
         WniXhg9Hz7fczXKTzzTwn04H1jbXe2OgbslNlo9MYOBnhN/gQ0XWa647s/CSsnCUA7yf
         MOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000006; x=1743604806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lXjgaJ30mX5cDcOLM5e2+yWI/YHl60h4te+LJZ26is=;
        b=tO3m6InARhND0MYsC8SjzNUjOC2YKHwAaq3eg+3xjUFO2pnoI3qXAFn6ah6OBDo+mj
         eQfSSlg8xZ57K9Z3z2ykdiMNQyAVQOTocGUMvPXdcmTiDeQaKpKpy4t1u6RC+00YzyQZ
         epm1lkB2z3Gy9swzZzNnw+w9BetSkg4AwHQK3bJKFTiM05CHfsAaS67OBvZpOVy66YX+
         bBTODBK44DojsV8O/UCNzmoaKHS/jdEuugyZX1YX0E5NlQ3RtmQu7hxC7h/85payTryb
         6fIto1GH94XLNT8F26By90AyqjQ58kMOoHfDv4a8K4wQH1qQQFwL3dO9ILfievfAAo4z
         sc6w==
X-Forwarded-Encrypted: i=1; AJvYcCUvd69Ohzg/2kvUGe7/Hx5AGuwqSXX1Gdipy1KqzNyiXxhJADyAi0dsSO9aWmoU9Bdt8FjIobASRWZI@vger.kernel.org, AJvYcCVDBZQyvOFlWcDuewRXmY6mW1pX+d8xjXt5X6eGrLn2V5b8AuRSMglbuZmF+A77A6DzVYCEP0YTNxqZ@vger.kernel.org, AJvYcCVmz4ismeZLlMdS+E6g2DArnAiKqDy9zC8ViJ1FvZ3bI3Ew/y2U7OgxJIBKpC/OIabZGilpzJgarvyT7g==@vger.kernel.org, AJvYcCWTv1n/berZJ4JvDKOoxbfUuWVZ/DMjiV2c11jZWPNd2IBZlMsCvkf3ltA+CN3VEeSoVx3CM/gal8mnqG73@vger.kernel.org, AJvYcCWVBXENf6Ob3djnNLL+A9j1YcmS9WsRYetHAakmX1DVp/eASmXRRwbmGr35m0cBBN6dmbycKYUhR2mKve8F@vger.kernel.org, AJvYcCXbdHBQfAylLJp5IlHkMZGyvvMxCKT//kfOZ8w2JsuMOwjUz0MJgNohBOVLoCKkK0W2AU0jMkELsp0e@vger.kernel.org
X-Gm-Message-State: AOJu0YwfoKyoSN9ggXPaaGqMnsNrHe1p7axjj1w6iBntq28FZ+2fQ4tQ
	I7HPM9S3XXaM1gcbEVwyJHAJ6cycT4z9+wBrhCQzxl2O3vfRkVOg
X-Gm-Gg: ASbGnctGiFWClDhEMRxkiGvWA2lGndEKc2U/3Z5duM1T0AGTzB069cjPFSnGatjP/e9
	AMR7j2BV5XFAWstqYaTXA1btOopCS1IVmubCH1HOhifSgeDDqUf6qqH5fozThcT6DP5isRO9RZu
	P55s6MG514fAHQTk3r1xx8CaZh3PGriLZr7X4MsWv76k2sYpxnw4IJaihfHA+6KmNu0QmHBRYph
	wjgFrp9eItZOfgbrCmFyUB/AjRrHCLfaknnBW/NSLZtCqnYHCliz61rHBjKvAn9C4LI0O2iMl7c
	1skLm1bJB6iVwsULG/G+Agbqrw6awjXH3q4kwVaaIYaAsZcn8ZrqVW1fjzdU7v2QV0LC
X-Google-Smtp-Source: AGHT+IH46KfQuYDthexFM9JOF37fPKyd4C3Ozaj4K3acaAOPvFJgrgx3LcP7JO5sXYRF9Zdn87Jt9Q==
X-Received: by 2002:a05:6000:2b08:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-3997f9104acmr15697964f8f.33.1743000006086;
        Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
Date: Wed, 26 Mar 2025 14:39:37 +0000
Message-ID: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
`renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
existing driver without modifications.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 773baa6c2656..7563623876fc 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -69,7 +69,9 @@ properties:
               - renesas,sdhi-r9a09g011 # RZ/V2M
           - const: renesas,rzg2l-sdhi
       - items:
-          - const: renesas,sdhi-r9a09g047 # RZ/G3E
+          - enum:
+              - renesas,sdhi-r9a09g047 # RZ/G3E
+              - renesas,sdhi-r9a09g056 # RZ/V2N
           - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
 
   reg:
-- 
2.49.0


