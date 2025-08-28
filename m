Return-Path: <linux-gpio+bounces-25054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48020B39E74
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284C93B1AC1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9884D31196A;
	Thu, 28 Aug 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aKK9f6+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EF311952
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386929; cv=none; b=LzmU1ucG69O+Koel97ncMuPhMQz3hBzcFgIR0E0A+pUbZuMU9VonoDommWGwi5zrcnArIrzijvJoiOzvnNFJskRsyJd9erFsqFpYtc5jUmEahDkflr8aMQqilQexWTd96lbdo3oz2kLElBuyMXiQ+mQ63re2GuK+6+cdMNuIvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386929; c=relaxed/simple;
	bh=cplGFDqmgtSpbjmRX3cAoVtjixMSRofZ7eAFWsu8/iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJLt0TUa9+26hQxj0yHwNM0bkZYbsQTIS4DhTnFASeOfYIgoaPKa5A8r0qKAPO3bCJZ+oWkpmJwV4DlBdCS/JFXsjpGHRqApNDtz9IllwY3BcY1JBdmvTIgFGAyBFhbZEhc2dJ1xFvyrsEQJeUKqO2CPAYHG50saBNRrNIlF4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aKK9f6+p; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb73394b4so134301666b.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386926; x=1756991726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=aKK9f6+pN2tIa6PHgMWIb1JiUm2xc+jVylimGixQkkQs6bmsyvDfKm9oWGWeFKjbYN
         DOcL9BjwSGcgIUCEyWS7CN3zGeCySSxZh0sYXcGgqjcefbT3ryPog+Z92gVKjh1iCJ4E
         Qn4ndcR3RiQmMqVELirin/iyF0s1Nenw4Ru5EkG08WcDv2FA4iNSsCbzIaeYNcEJKI77
         0z769kHt+oZMWB5mUMuSCMPgBsG/YCGZmMfKn7vTSkLPzHHNY09DSgfR0f1DuFL4Fb/U
         8P7JMfkHc/SlCWR6+F1PYg1Pn/ZOMJLoMsi+Hzdr59sc5HSCxwRlIPa6+4qeLKzZQFtJ
         sUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386926; x=1756991726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=u4cXX5X4NcRQfViEc6JG4ZMyTy9JyLOcL+NvR85Rhy7AzE3+tC1+9ezHOKdCOsPfi6
         Ag4FItx3bcYicdC+M9tK048FWf4koXrmzH7ONUHij0vqvF51bTBXZfEjJDfRY795SV3k
         IGDv2ojxsFCXYbU2ehvp1O7iP3OSmsgtANc2OpJ2Mqbdk4Of9FJmRg7degHUg9Wrxit+
         fi0PJuA2oVtYsv5LTyrcY6vFouJGrzEF47YRD2oYVlXo4E0koT1XnUB2CMLF8vsiZZUL
         kOIVreN+XlJ2n5ImEVWQsbuGQoCNe3NivoMUvmSit5vCFtO1D3ilKrYni5mLSfyoFe0E
         S6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXscjmrWLUIuDFrapVI3NWdbLRlAKPvyTJ6YB1RWrM9qetJ1d8LnxOW0gYX7V/X8P/rBOEkDpz8dknb@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5dfqZupckR9msc6PniiDYa+G8MwP8rMQgo4jwrsYR8dCnr0G
	7HOst/wLAx/MZ78slyyStpzkcPF3iHM+lTCsjFERCingeYpyatx5TEAMRPNC+43nmcw=
X-Gm-Gg: ASbGnct/3I3quqYjQjfdbHOCPvvHr6XISRDf5dqqynsbC72OGkrwOsNaN+9SFuw97fR
	GJS4UQRdhxKre/DWYfmHuVTwyfTc3+ZXHHIvAtecwDdw7LSxLWjZaIKEvShSePJhgTVHIGIlpFn
	BlhTcl4iQl12NPJLEwcEpItfdKG+FtLJ3yCceOEJbE3/7/udiKQAtFKQypVKRJpuGfI/3TBYDp0
	pPK+EShIzHE/VM9/CxdKDVnIbXnCrNGmIoNn/XuW8P4G58wKbnsMqMuDO5KzHeBU/6Vf6/2jJe4
	HCMlfmoBJCUwwpGe7Gdz5iX0W1OtvJOZwl5xMFormwl8vf8HJuySEI7eGXdXefGH+jCgQEBNhhF
	/KusPYhW2+083/ezJybzNZ6CoaL2Rd4rQJM5MAivQaK1Pn/2w4VKb8jhs7l0I8hmlqxJbb3IHEy
	7RgxbeadIFNu7TPhoq
X-Google-Smtp-Source: AGHT+IEI9YD/yIKwxGzebC+FCV1SyBTlu4bST+Ltd9CEVkIOaKvOCGIoQzOBpgJhki3SAdvQXPUT6g==
X-Received: by 2002:a17:906:4fd2:b0:afd:d994:cb3 with SMTP id a640c23a62f3a-afe294d3edamr1890495566b.65.1756386925746;
        Thu, 28 Aug 2025 06:15:25 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7ddbf166sm895554666b.78.2025.08.28.06.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:25 -0700 (PDT)
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
Subject: [PATCH v2 1/5] dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
Date: Thu, 28 Aug 2025 15:17:10 +0200
Message-ID: <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
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


