Return-Path: <linux-gpio+bounces-21711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE0ADDD57
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 22:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A95D4A0666
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 20:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459012EBBBB;
	Tue, 17 Jun 2025 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDalPvuM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7662E54DC;
	Tue, 17 Jun 2025 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193064; cv=none; b=rkKQCtAcZudtginvtPTJJt3PC1ds/cARFIgX3Yh1Vs2K6NcJ/f2lcu2uG3A/qMHhgzukSsGoQfj7DAB8CMY8WPH5pOSZI63JgS5I15UXMVUv3R1NFU2wQPmVjsmQACXGEcWaYhj/7kBFPJm4qaI9lPesrnOpJQI3dpFFjBtYvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193064; c=relaxed/simple;
	bh=9lIFVe210wCu+O443MgNIvllaTLGJCign0qNJVr/45g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjFHsMRdeqozfsiK+Wu2d6gaQk5uPw43Bo03Y8svk3+eBjZwUGCoYy5fsFoCP32Ug+FFB+YUeL+8Vsam8jfSgsL+twb/aPFnUbGlCNFsF1NAkc4QzLeplYtSROurFIU7nqLmSbvuya63UWB5q8NeCJWXCgV6I642dsgFJGqdO1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDalPvuM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adf34d5e698so11984366b.1;
        Tue, 17 Jun 2025 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750193060; x=1750797860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8J0Aj11It6mAJ2X+eSr/snawf5NmFdByKSofgIW0Fwo=;
        b=VDalPvuMUm1g90bBatwomQg3OPTIs3NihlcfK7wNFCswheDT96XaV+mZDCWxfGBVCw
         jdpZp+OThCCTUyCXkyGH2ujpZay8683/OU2XpeYwcw+DkoBJEduFrzUPdYrbUxYcANxZ
         b+GJFKTI1XHIYQ7KNUaXGM47nMC3VSJmlCm79YPTP91QNvAVGUxKl824f0TU6Cg9rBD2
         pXlujATibUyDMknEnfF4TWilPC4tMRL0qWrjht+G89RkWOfQ8SJYlEbqq4CAZFVylKqm
         RHZA5cXFcbcJE1iQr3ZVJVs40zA/Rn/W9hQaE5M4aTlP2tlr/WP/dXRJNkwUlC/PWW+G
         q93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193060; x=1750797860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J0Aj11It6mAJ2X+eSr/snawf5NmFdByKSofgIW0Fwo=;
        b=KyohumnAAnIWyuNi7EweMoqEfD4nGNflx5vjBbDANwyJ1TXvgJFw7SdfCFmoBSHDtc
         +GnVCq6RYunhJ0X+oO/JH7uEoeQUIuXxUbtRWqzRinOvW0a2R0i6zB0EkdtVhGSpKeEl
         L9LAoTxUyUVX1XkTG14IBESxjgg7U1TV/yqxUOJvZ+nyLXF0CNziYn7IHWi7AmafMxsN
         z68fD3zgH5FTe3Te1n90AyIetlUibEHVA9WotziP4eIis/OBvcY44RlqfuER8jWD4as+
         9/HVGNfyh2kh63+WF9UxxbparTW78e3got3R6dWWr65SMMP8Zo+5xtqBl9aB322+HxkI
         9+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxeb9yQMbn4g+1oNWuQEACMtpTKihzFWg9CnIcxUrpGZlavONVTr/xNc0RgfM12rl2LqRVDTU+PXpVTjuA@vger.kernel.org, AJvYcCXaHTauZDmCYbg7TdAbPp4nbKar1Leh+Dixv+0di9cFOxo5qOgPdCilDK1c40/pcLIM7Y2jAzUpNxm/@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0H0dvIq8BPRpjBMiobQ8MRJggac1DxqNt/H/gQ++bZfk6MSj
	1lx4WZH0qZJ+SEhugDqN4PSeiG8nvWefVKB3V28syw6/VTXq0ySgtc/8hdrnDvO9
X-Gm-Gg: ASbGncut+SjjGrnBI1ALR8tHN5fDKFL5gn9kaVhtl9zyB+gI4bPtNNciuoBpdTC6D8c
	DOMGyMlkma4ix1FPhV9GDGDAA7EKgfHWR6RS9mPR9DcHJ0HjKDBfEMEhiKxOfdQfMrqfjF/Wu46
	aReDJVwXrzQXBW3WolxpKZ44SBLvW49/e/N9uNq4Xf8e0PqDkwY2QTLjIi2vTTLi9bQvy7u1tNm
	XydIbeeRvxTkoNQYxQ3R7ugu5kV5KMaUGn7ta/6ve4PnPa+ZFgk/vcF7GP3H2wJwLI9sXc/LYnm
	YTpLNGSoF7WRIAJ1UfZ5vu7rD9zTJRwFd1pawNtiX0U6oFbC+MwG1WLIHSzx+YCAi+xEOogvvgw
	WtqcLqkOIoca6g196bg==
X-Google-Smtp-Source: AGHT+IHTmyRusS3kct6v+nxW8Z4vUHO5XQ4wFD69OSBC9FYHBzyA1QCfkY0a8VXtw3doBXcI8q2VxQ==
X-Received: by 2002:a17:907:94c8:b0:ade:44da:d2cf with SMTP id a640c23a62f3a-adf9e2ce1c0mr1595431166b.18.1750193060420;
        Tue, 17 Jun 2025 13:44:20 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec7b8fe73sm911857866b.0.2025.06.17.13.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:44:20 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>
Subject: [PATCH 1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
Date: Tue, 17 Jun 2025 22:44:01 +0200
Message-ID: <20250617204402.33656-2-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617204402.33656-1-mariagarcia7293@gmail.com>
References: <20250617204402.33656-1-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TCA6418E is a 18-channel I2C I/O expander with integrated ESD
protection.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4d3f52f8d1b8..12134c737ad8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -68,6 +68,7 @@ properties:
               - ti,pca9536
               - ti,tca6408
               - ti,tca6416
+              - ti,tca6418
               - ti,tca6424
               - ti,tca9535
               - ti,tca9538
-- 
2.43.0


