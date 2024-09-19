Return-Path: <linux-gpio+bounces-10281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B297CC2A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F401B227BD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FD411CA1;
	Thu, 19 Sep 2024 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRJHT7ch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A51A0BCC;
	Thu, 19 Sep 2024 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762555; cv=none; b=q8WkQZOSVwn1mT81TXJjdEEUkFSssOIzmTuVpUY4ry6IZIylr3/OXPWH6P85fJ1xUGoowscMICyULy4jHeXGrxWYHvDg4D3mCOW+BrLYbsVnaygsuchq+qNabPAoZrfSlqpklWdzct1A/9Y1v3K3ccT4lDG3W5Ys31aReAHcumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762555; c=relaxed/simple;
	bh=2Mi+LQsk6H7sTtNS7ssIED2QfrpMgi0n72ImYqupLZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smidmfpVd8g1OwZ7Ll5JgUBUNr+wmEtVZ2ZBRSc/DLvCAVaMMdgFLj+9cbzvTdFz8GzZrNq7Wb535AR6yqmac9qKUQgS9QtC14AtHVIYshVbbQhKaBSkhrp3/V4upw2cqYa8f3iQy5FL06Pbo19oDMwvQSEEt/i6OngVwEgcsHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRJHT7ch; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso789859a91.3;
        Thu, 19 Sep 2024 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762554; x=1727367354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMRF9THVps1AR5ry5FdaXMrI1EoOSY731ai3zz91BDE=;
        b=cRJHT7chjW8iXyLkd5KJMI3Hy0IdRYH49SuB+/ejhK48cnXcho8Yv7w9uvbNvubZRG
         57y3eLZemQWVSpOdMmBMgRG/DDuRTwe47VPDOStyvxNZa+frDiwyiBhoZkHmIfBraFMF
         Hb3Tt/SRMF69K1/HCWZzs7LkeTF6ddVF/hD9XKHV8wFr2V/LM5fpRQ7DiGBY23LrncJj
         jFdprtrIdqNK79ELBfgC1LlRju4XUUy1SOUyIdxjYWauW+pE0t5vzdsLFG3OAxdPLijz
         6Yje4dH9ED40gxecgnfm2ia8lQBxXAtl/ah+HClht+AhxDHNAVPbyMRZXy2Jwz/AlPB5
         m5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762554; x=1727367354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMRF9THVps1AR5ry5FdaXMrI1EoOSY731ai3zz91BDE=;
        b=jk2lf+vqVTM98dydV4vGYhf9arqmQ0CdxDpt5oyUgzIqksCVPzfZkgmom3DKZUPnsY
         KPAjaYxPTXGO6DZORlr0MA75Ln1LW92+MGIKUoAgC4npqIOmVXM9CglW8c8nhOKJd8v3
         9cAIuwG1qgR+BxHmlkzoibhfyQf+u9NCjLbIf4oPAQ8L8QMOSc+4zL1eo7ewiSxv5XLA
         LVD13nc4Js9xd9kuc4Z6YnFC+CbWdVo/GQRi+UvxmOJ3gnwgT9i31fklr/1utjruJlTN
         WKtvxdI1YuJ2jiznb9LBqogALJaAEfD/nY4SVnYb5zGucwKxivwfOkUIVpKy8ZzUwOBS
         /k2A==
X-Forwarded-Encrypted: i=1; AJvYcCUXhuDVLM2LhGuO+oKNNa2jbvhvdWUFGFHEnKtjQJHJkNvPF9Rssg9QpgdlBTkQiPprc9/Et8fCc5MBysoIUEk=@vger.kernel.org, AJvYcCUb0h13CUSYoFUOEXfmlFTRcDbVJarAAE2XRCuHK+lEdr2xlY8sp79uVm2TgizTh2EduACxaqD67xmdXLRk@vger.kernel.org, AJvYcCXbLEJCmJWPqVEOUOODSBg0uC0IgTeFqlEJ39x2t89AQfPUEi/1pbCy+AY+ldIgtbo7MARe9Q89ApDFFQ==@vger.kernel.org, AJvYcCXj/hMsxHv8TLLE+TBWZQW6BG78AgBnovHnK2hNQKA4yXMM4aY0SfTrWY3px7B9xxQ4HppXNJkbIEF+@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8Luls4yfnWRujxj16rRJUZTaB4YRUdwXIVzPp0D79WcOnKzG
	F9MSuHJ4Tn2+gQ9nOzM72CJylBg5vZGFQu9396o8Cuj5xHtHgrq1
X-Google-Smtp-Source: AGHT+IF0XHT66Vo7/4btQeV8A++naOulHbnvfn96p7hTaP6pPukyueHMCyiuas7nD6oscxYX3DwmGg==
X-Received: by 2002:a17:90a:740a:b0:2c9:649c:5e08 with SMTP id 98e67ed59e1d1-2dd57f8163bmr9034958a91.15.1726762553766;
        Thu, 19 Sep 2024 09:15:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:53 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Fri, 20 Sep 2024 00:05:52 +0800
Message-ID: <20240919161443.10340-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple's A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.46.0


