Return-Path: <linux-gpio+bounces-12077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E49B0143
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D851B1C20F04
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25307206066;
	Fri, 25 Oct 2024 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+9pE5nw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F0205E0E;
	Fri, 25 Oct 2024 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855524; cv=none; b=WtZQKyZIUFFmYJgU5EQwEC5PtmNHEbIDUWAWfVtwdI0ESOweXnAxm6Izi3avjbaTR50eXfjQOyyE57a3kcHD4/StL9gDFE8INyD5gVfohMzoow4kRz5x0wK5Sw3wzIjioFZZBAHXFcSRiqJ4bXXg4737XHaWSsBSks57qkEVH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855524; c=relaxed/simple;
	bh=QjtBasZbvA/8f0B/+aABkLP1VAZE3+DKqz2/AET0FRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgCG+cDR40YhAxzAXpsGPCcO5SZL7Oq9jqqfAwHuHQY7QExeSpEjlVzoHSLnjHWL+Awsdn0wkhnNt3y8n8VAxK7oDyDLYQCkP5E9cL/1wgtAbnto2wPCItktYiWLzcZT/BeAQ3eE9d9HHmhrOHHUb4fqzygKfzA4NTo/hlDGqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+9pE5nw; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f72c913aso2513267e87.1;
        Fri, 25 Oct 2024 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855521; x=1730460321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfmk75Hhz2Xw4yga2iQQdoogsTTdr+c9FXbno8sZsXA=;
        b=V+9pE5nwdP9fMx4F6d++QZ9Qh/sYDToOvoUuTv51Aclbj9tclz68h3zfgz0kJjGD3F
         x4ophBzG7m7B4wyBlYkF0FmajHHmjH6Z5YKcMNqdH4drzXcVhK3ls3pirdco9JiilFWq
         aVk30+vLA6txuSLD1bcA6ravqyrLOHFVzoIBxsWq/GfNGZa4wVuuUt+KXdlxNy0USEo0
         zCMH4Zp+A+wXBHiOXcTcLxs056HdLz3uGqmQIF8VbprsLOjs4whcy/6hJrbkcMnIYmTP
         jn7ropgaPsyENIriI7sv/+pwJ5vm29hW1uWNA1o07c9Q84uLwntt08F3oaZAaEPR0h9B
         om3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855521; x=1730460321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfmk75Hhz2Xw4yga2iQQdoogsTTdr+c9FXbno8sZsXA=;
        b=SUJhgQdDDSFcPKeVqIdA4PiLyxqBVXlylGYLA0zIO52SJTdSLVCRTLUhRdQqU//ApS
         ur1TUlMUZjor83pTvwMO9OpvnUlxw5XTzC/A4NorIABPI407NxgdI1lotTS/J2qBjm68
         OtF+tZE757uwyx6CGZyJlqaCLEqM6CKualQbnXRgXqMoDngZYncAE4GpK65s+uwKHirk
         nY/ozshpJC2Zt7a/AwPiOsH69pEgrRiPnorZgPHlKpKPLcorCQcoq4IBu6v9aVYGlg80
         0Du5JxTriVLtT2+F24fPUQ+lWhtsp+Sla8t+7kAOXfGzCPHC5AS+8uZjPYek+OfgegAZ
         iH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrDKul2bodUUgy//IfZbg2q2A669Zhr+6Nh/YZHJfeGQPuk4RSPtlGSHg9KWZ31X6AwylY5U6UdB0PMfpy@vger.kernel.org, AJvYcCW70zeS1BF8I5SLQsqnBmjggyHU3kDtUXC1x2zMdKVuLJZLuS0wuCY66M9P97d5SydqQwKp24WrDn7oxaTLGkvFH2s=@vger.kernel.org, AJvYcCXgVwJxOfU0s3rLFJEKMrXgDX0ZxGJ3HOxBgFyG5pNXkGmlVaNdR2PmPI5cnQ6TAZRK8YuLTrwOkWOP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/p0O+iysFFW45+Ht/V8pn6qjG/fHCqFNTX3Z4pAu8yTQ0HGMt
	ynF/XvFoSDfCtkMj7PrIh+uS3ahwRRLDe7jOjnYMw56XwDDrQFfdpHBdvA==
X-Google-Smtp-Source: AGHT+IEKuF2qGblcDX0DaNtthJikseGLtcL4BLcwgFrdAEncZrgjqZqtz3jqOjY0n7fo4E5XUjsoCw==
X-Received: by 2002:a05:6512:1392:b0:539:fcba:cc65 with SMTP id 2adb3069b0e04-53b23dead9bmr3447856e87.17.1729855520458;
        Fri, 25 Oct 2024 04:25:20 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:19 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:56 +0300
Subject: [PATCH v2 09/12] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-9-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=940;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QjtBasZbvA/8f0B/+aABkLP1VAZE3+DKqz2/AET0FRk=;
 b=ncmttaClZaIRfTZtg4vfNFS4I8cwBDlN9bWFjIpjluY4rymx8V7ECfUz67WUr9/Wk7q4dA/Hl
 wDMrvBxTz+WDmuoHj1pcX0qkbNTmPwPpgwDYR9cAQIavC8rvf6+2B4l
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


