Return-Path: <linux-gpio+bounces-11886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF29AD7C6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F9928477B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E112022E9;
	Wed, 23 Oct 2024 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFW4we39"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F88200BAB;
	Wed, 23 Oct 2024 22:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723045; cv=none; b=dRYLvpm0D47Oo97/DfcvP14rlBg3JuQ9OFVDIfXbIsW5R8O/PGh+LirY0gVo/6RxEaN4+4dnRjAi7O03F4lD8aQDpfcL1U2lABrUd7MGtCX7IlrT+3AUnVtoAXbT/KQlMkCtqVvD+OufyG32rh79tKyP2KBeR48jXEhVCTZ26Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723045; c=relaxed/simple;
	bh=mDrRM2vw6yzIeJi/+7tORTimRHVKBC8rcLZLB3YC2lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnN4ecujfxiJ2gdk6fU5a05pRp39tDZZP/D6LDmqqZ3MbspohtCf1j+3NVBTyrxIaoICLjwFLL/FuoU0QhL8kyo1m2ZgQ3wCUd1G5VWqDaIm9fT08jBdSJwXrkqgYBXvvyg8mjr7zsdHdS+opXkyDvnz051OxgplmatjFNcb0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFW4we39; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so355974a12.0;
        Wed, 23 Oct 2024 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723042; x=1730327842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWmtqH5N2P1BU0MprmjFDoO+HGgjxkNsdCcT7wh2gr4=;
        b=cFW4we399HO/Fizeyjq93vIJiR2fcHRTixUWQowS/VEkEmplRKyYYJKMhMGrMFNQy+
         EY5S8dWmZVeZndrD/qcfKJJb4eM9pp2d3Odmvg3O6E75L9EV8fAytVU4vQlwLLeUtvt2
         ZNP2CBb3+McWCVlSX+3+IQl+FpUknBQKRWn5rXaehvpculNs1bWO7FtAuzChQJA1+uo0
         ygV6mhuPtNhMf6VsdgeNFWta8VXLK1StpV9qfmoB0GU5DLSTxb43RG1EY1pWcZMP0VvB
         QDnALxPsJJPemjutzpgbmSCPZxpLH2cHCasCmqDBr9vlzPXmRHY6/7FYvmI3HMSJVvFi
         NOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723042; x=1730327842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWmtqH5N2P1BU0MprmjFDoO+HGgjxkNsdCcT7wh2gr4=;
        b=cXBDzsGjRrbCfneUWzutXVQYRUUfNypkjXFgrihKuxQ1Vg5//iJTZ9SzG+cpYSrUXq
         hv8EWseWXGdyzmPpJjEcrakgYjNwBPGEpjL1oAIo6OIYEXujhiZXwS6Xu9LjULo6Ooze
         yJ7Lj/k8FHIjP5oApL2PxMzB5f4t2ZnAaleZMGczuxJtHVVhzftFSk5JuQHbelxYtjjK
         qMUMhuxN9dU/ggIngRHraEt+NAo1uDsZgIvqtJp2fQnTbIR+29HJRWNvQs3Jw4cMI98e
         Z8HPODPSlrRXDWkj009XZ2ejFGvp0b7SRBOwUNrrmTuWS+GEaEBrGBnFhRk3471w43Np
         cTvA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzKXUskVgarW7ZAvNff/N74flEj16VXeRJHirKE6AeFQu2eDrE1BPOw28HlHdLkpDuTsJpTKjEron@vger.kernel.org, AJvYcCVOQZAbsEQhsU83c9/P+lJqOVUb2vmvGx6DjTap8BFKxKGDxJp+vCIiz5dy8/89/GVjIn1wU5B231w7CUpAfLFORMA=@vger.kernel.org, AJvYcCVZu7zE5OcZ1qmKyDz4CSalMT3CDFlEKSU7H1eEoJicUtk/9mDyhFVoU7XijijvXv2plul51JzJiGn3wExN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgivwju01IH3un1ejbRwSqzFO001NCtWiy4joWDj62xyce2MSO
	wTWJFCzvmmEkco8LbPOeHmpq/fhOWo5XGk/ADwe31/w/jWNe8MhV
X-Google-Smtp-Source: AGHT+IFzgo2JsQ869WZYlAgaH+b7Atn/Vy2II8EQ4rEQzpHOsgtaGvwMKQGxGaJKoqZmvNgB6r9Vzg==
X-Received: by 2002:a05:6402:1e92:b0:5c8:9f3e:1419 with SMTP id 4fb4d7f45d1cf-5cb8ae70636mr3554294a12.5.1729723041789;
        Wed, 23 Oct 2024 15:37:21 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:21 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:37 +0300
Subject: [PATCH 06/12] dt-bindings: arm: samsung: Document Exynos9810 and
 starlte board binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-6-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1179;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=mDrRM2vw6yzIeJi/+7tORTimRHVKBC8rcLZLB3YC2lk=;
 b=dlXnErUtfJ/958tawHUHA0uCxWUUQJON3A0WPPEbbxCfpUTu6mkRraEbrWIh4MRKibiMhRJLq
 QLl7xL0FdHHCMI24G3+dDBIhfnL9b134SuVfqVs7zsmZS9MSk79W3ZL
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatibles for Exynos9810 SoC and samsung,starlte board to the
list of boards.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d25a17e697256f8d868e24bea47d21accd1184ed..b5ba5ffc36d687a6fdbc625e6d95c37a8a2e2b93 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -230,6 +230,12 @@ properties:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
           - const: samsung,exynos8895
 
+      - description: Exynos9810 based boards
+        items:
+          - enum:
+              - samsung,starlte                 # Samsung Galaxy S9 (SM-G960F)
+          - const: samsung,exynos9810
+
       - description: Exynos990 based boards
         items:
           - enum:

-- 
2.46.2


