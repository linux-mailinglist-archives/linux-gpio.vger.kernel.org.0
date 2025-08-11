Return-Path: <linux-gpio+bounces-24199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79584B20D6E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E179624C87
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E082E091E;
	Mon, 11 Aug 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gPErYFnw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2472E03FE
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925489; cv=none; b=tNHoKoqDFl0ZN30EDP6QYgE9zZrccRjtECCKnjEupVwyJ+itoyEPb/xn8q6lPdFgBv7izTK80a9CKiOzgeevRRP4klZt03FMjelnkjsH2hV5T3BCBVfUduGGu6e9jHgQIS7GbwCDuu3hT/wnhRYh/ghCIh6/9l8B+8LE+kIVMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925489; c=relaxed/simple;
	bh=cplGFDqmgtSpbjmRX3cAoVtjixMSRofZ7eAFWsu8/iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjTEKiFVaQWKqcvvEqqAYEYYOa15rN1k12x2T2UP51RWxkOQDqFkSw2YdBvuxfKQoXJwzZ7wOhwNL4QdSG7nH4KfvmSd50ah0urK5EmCkCHcdMvcGA6BE/PDSmPngep+vlCWJ7SytouJa7t0Z8eVkED6tAReV+nJtrbAWIHr+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gPErYFnw; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so4153025a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925485; x=1755530285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=gPErYFnwb5l1lGHPEc+T7tH2DFgqS/lFV/3TftgpW1vnjPPazJnyGfVnE7vGJxtq2F
         0ZQ3FwD4fIu3w/FZyj36xFptt98ZC1PHWGfhyTn0X7PGjKU2h8OjHSdwocanla0MkbvW
         f8C6ifU5L7i3eBY+bysaWbj76c+0EfsSZ5G3DaNGVxP1WOszPZdgLnale9Pqqc60YKiz
         G37ZSEKVFYuYRN0Fal2v838SbFLiuouB2W8yL515BQSsxrLTxWtbntJPpV+8UHTuvXHF
         POFShPmhH7B9oOCUgZ+wlVn5g7oXxsNnI2QdGsBtiG6aJ0PAlUbqEUDEfbCGqahKSPP3
         NoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925485; x=1755530285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=vWjY4OFE1Sp0nJBhR9Tk0O33bm/LB9sEJ01I401cGZTbui3mb19+d33k8hGrpM+un7
         UYaOUmtQNfDilog3EVneTnRh3Opsl2YTsfm2VrddHv37CfkchTh6jS/34QTWjIZhymg9
         CcAzPIKtuZ9SXKWMFFez5str9Pk5UYcojTpvQK9iPvI5ALw/fybT/ui2IapZqwCizrlU
         vFm6Uacx5L+Xf9sFnDt82H0D5ypAs2sm5PqTLHPFWMsEPS5El1YgAUxz7Xln+Piv56XJ
         LLrcJDJEHAzfMyJHhmfOw2R4r9mK427xghymIHJPx7YosvlVF7SIy6i46IRwg9Mc0Xby
         +6lA==
X-Forwarded-Encrypted: i=1; AJvYcCXMewT/vVOpA1MSHRtaXcw5RQHbWAca0/1t6pGpr7+OXXh4jyXzhA4jXnPSHTzFwXdR2Pz7pyEA34wQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWKbjKKCxWNY+IJbhcc0ZejbtLnlmvyuSRR3f8J7LZLfd0jZ2
	FHrYNoJgcFmzLjTk1Nx0ZKUSJoPG7pNn4Kl0cBca32cYPiPvS9W22KnIp1J0ZpXmVdg=
X-Gm-Gg: ASbGnct3YCEK0gFyAdWJmKdOuSWu7MXdEjfK7L9/6TuND6ykncBmhgQIKUzzBlOf6vH
	jfYzHSonoxdt3/bDrSm4TCpdB4U6v9ST9KThGGcCZHE4f6lxyhLDSg+NHdQ0lRtJnLVDtWASu7Z
	s/xFRSVB7DsiPVH1jqLXD0HVn1cB9Ly//fHhYU+1BESTBlWvV3xOPPsQeqDLDDzTcIUMzkh0FPG
	A6fERc/9g+41BAHH8qaYx8gu9E4Zto9byAh4z4X1D0wonmOjgMz1BODiMlgTYO2cNG54Yq6zZuE
	QaEiotqA5GDJxA+qqu/prHHlYcdBD8N8lWuy02oqA8on1Mppa9HIern2awM6TCkhyTHpMguP34f
	bmPGZfAU2eURQ/R8SmA69GmGIazpq6dI6A1RKp0mQ+mWX0f0cmDxQId95IW4H3Dvsr8AniECkF/
	Ve
X-Google-Smtp-Source: AGHT+IHY6hHjl0ohw0BhRb2M7W6IV/iJBLaLg4s2DYOzsYCD7hIoPswY0Mvw0fvinMbPKLlE+Q0fyQ==
X-Received: by 2002:a05:6402:2810:b0:615:a62a:feca with SMTP id 4fb4d7f45d1cf-617e2e9deb2mr11476569a12.31.1754925485240;
        Mon, 11 Aug 2025 08:18:05 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9113e40sm18638282a12.57.2025.08.11.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 1/6] dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
Date: Mon, 11 Aug 2025 17:19:45 +0200
Message-ID: <57dd103c430f1a064b6c55809e4d2be54fad0e11.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Broadcom BRCMSTB SDHCI Controller device supports Common
properties in terms of Capabilities.

Reference sdhci-common schema instead of mmc-controller in order
for capabilities to be specified in DT nodes avoiding warnings
from the DT compiler.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..493655a38b37 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -61,7 +61,7 @@ properties:
     description: Specifies that controller should use auto CMD12
 
 allOf:
-  - $ref: mmc-controller.yaml#
+  - $ref: sdhci-common.yaml#
   - if:
       properties:
         clock-names:
-- 
2.35.3


