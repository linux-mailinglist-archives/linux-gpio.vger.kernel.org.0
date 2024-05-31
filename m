Return-Path: <linux-gpio+bounces-7003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A98D618C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 14:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750711F250C2
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC13158217;
	Fri, 31 May 2024 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJZ58x4/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26BF53E2B;
	Fri, 31 May 2024 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157905; cv=none; b=DZVfelUiFaiNXL6PP9ddmpWLtlpeN/KvR5fWYCHiPZDrTD2yhLscmUPrIdpkoZ8r2SahBFQchiepIAfFdcDh2ihKIe182ZVQAvb9y6GDTM3c+NGDn6ndLIAUYzZajWss9taxJmEVPnh95LLz419Nh12Skvmfe+/y4S2Mme6ZoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157905; c=relaxed/simple;
	bh=zevBtrAlxwk7eCbz5TmrxVmKUYzp5ZJ8ZLsSZvn6/kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yww3DnDtkdO7MGzcarJ5vhePIeXoery+Z5u2rvc30gQezEiT7Vfy+D0DrYRO6GP8+e27Benzre8Y/s2O/+EDJZFpqWm6ErCepv8vE8iOJesmlNPoxn/P5vazxm9xVd7hUj0hVqDdfhOyX+NSYMQPRJp1GCNDqkRiPrY1S8pJVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJZ58x4/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f8ea3eaa67so52926b3a.2;
        Fri, 31 May 2024 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717157903; x=1717762703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6nN55NaGFHk/st+B+hMw10D6rHDhXDIUegK+8U7JQ8=;
        b=bJZ58x4/zWGJNmreEjt7hjfM1Courb5ERDrR5TD064X8XgNcdAaAs4Uuhqz9b9X6tT
         Ac7BWl06Ap3bWr5RHAG3c/9ILtSYVbmaT4kzTqIQyAWmRvN2ATNlLN+E0qZNM1aj91Ch
         JogbgK/2MbRh18rM2lOh9ZPbVyKU9Pvz14nwaBGzzt89ah0ILGHVdjTMptjP9XcNSJXy
         ew/e7es2uu+Nsn9wjW2mlvzprBLwbJr+G+xZxobgXx0NMlMTu6Lq3U8Ic2ixaBhgHok0
         V7LG99F+sgZKH8dmRh2nRb0/vn2vunE9j92lHylsUwezyqbUdVe7JPPiVXOf0veBs75O
         mfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717157903; x=1717762703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6nN55NaGFHk/st+B+hMw10D6rHDhXDIUegK+8U7JQ8=;
        b=pOFBO4RhE1aUJ8FPV+/F7nffHg2kQKUY/CSXmKRSLjqwg6NZBA85tbHcjGue00wpq0
         EfWvHnR+SOufk9L8uFYwNOKPPlDt8ZvzT8QRJ8e/iPY2KEScxRdX6PlQJaQfYWzfcbgO
         ZUAkGL6Wwo18xcMQA4KvfG1ryYiqJro3Pd5ybcteC9oxASnKK00+rasTJtJL0x1ecAzA
         aHA9yxf4/T/6hnF1moIZwnrdZlhjoG3Z1xFT8mrqf3rXUXme3rNCSPQQFpoF7ObxNb/M
         kdS3BgmbSryPgLCXmgdFTgXoFbcs6CTQ3+eGDChdt8T1H0XMFxParzlSaUFruCD9cQRX
         uXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa1TxNhodNuArS07i9H8ZLP5sqd7VQspjDlTZuDMHEDRwP/7Tw/5BQ1m9nh7fceMWuIv/5/nXq0mZswCRTQI6Qyfokide/63URd8RD/Dz/CBEhe6Xsuu+ikQHJnf8HHu+F/KVmcYU=
X-Gm-Message-State: AOJu0YwRQ6y24CUsQD/qb23IksPb25V9z/oui+Dh+vKEgIMkFdv4xGKp
	NbkoCjf05OGiP+c0/WGw2u8wE1hJTsFdKIGr4rf5D/uBj2Ynx7rz
X-Google-Smtp-Source: AGHT+IF+XZwG1dgxpM/NvvlZm/aKkfIoW/JFo+08OMFpoBIlWaI2yCmfAx3HbK89JhkuIhXT9XWwpQ==
X-Received: by 2002:a17:902:e54c:b0:1f5:e635:21eb with SMTP id d9443c01a7336-1f63695268emr18626495ad.0.1717157902955;
        Fri, 31 May 2024 05:18:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7c3c:8970:23ae:7bcd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323e8ad6sm14918425ad.185.2024.05.31.05.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 05:18:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: brgl@bgdev.pl
Cc: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] dt-bindings: gpio: pca95xx: Document the TI TCA9535 variant
Date: Fri, 31 May 2024 09:18:01 -0300
Message-Id: <20240531121801.2161154-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531121801.2161154-1-festevam@gmail.com>
References: <20240531121801.2161154-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TI TCA9535 variant has the same programming model as the NXP PCA9535.

Document the "ti,tca9535" compatible string.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 99febb8ea1b6..51e8390d6b32 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -66,6 +66,7 @@ properties:
               - ti,tca6408
               - ti,tca6416
               - ti,tca6424
+              - ti,tca9535
               - ti,tca9538
               - ti,tca9539
               - ti,tca9554
-- 
2.34.1


