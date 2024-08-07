Return-Path: <linux-gpio+bounces-8619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFC94A3B3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD8D51F22FDC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D371D2F7A;
	Wed,  7 Aug 2024 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+6j+mKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ED51C9EDB;
	Wed,  7 Aug 2024 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021764; cv=none; b=BlXIRpuXPs7ztXjrg6BwX73dCdztXwpD9Lff2YI+lW2uHyKrnPpmiQmFypBu5hBgQOFxseF7ZuX8cv+c1OlYBes+YN6ha4m+ficNeaaYaUk69ugUMpREHqlEm8XgC/JbYSj41W1GZTKY53JuV6UV3004fUqTZ21KElrQOIo+ZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021764; c=relaxed/simple;
	bh=8/uWEwUofH0wVFvSrr5zwcOGvndIpj5DuLKZcYn3bew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DshaJXRrQ3TPNZez7VtHYwG5+/jOPUE7Fj5swNgNLoDvp1mErul3UDI2athhMNfCylolerqnFRUuj2nhOJbzgMVv4KSMqdD7QAQFLZSuT01AbN7899G3iU/KmbKRvpBW1VWOAKRptJKVnYhK1tRG7PM0sxX3NXqv1Bms9QnAZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+6j+mKF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428243f928cso10362075e9.3;
        Wed, 07 Aug 2024 02:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021761; x=1723626561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv9ErE3PI85nZC8EiP12E/7wPOyJSmRoE64Ycmzcljo=;
        b=G+6j+mKF+ZvC8dIWzaIXhwddvlXKn+7gFZdN3rHtkYskoLO8/xoS/m/3sa+w63PkoU
         Xh70aeMp6/zXaolzOsG3Ebm6lQjdPSFl3HUr1ylblSVsl2LWQUTa8DJq/nnbkpycP3i+
         zTcMwR2JnnVWhoEzp7C61xXRKadnf2tz0sTOWbCOEEijapF38m91lwwOJPzb/PN0jD/+
         1TjI7PC0T4bl3NChJqqZ1Ue4HN39M+BtL0xitytkcJirn4GRgvnaEikM/CHPPKg7D9jb
         ui30QrBRw5xmSVZZqtKplUGVcv9hNTBI7/euf7lSvOQ/ouxlvn6uda8m7ZxORwotq6Wq
         LwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021761; x=1723626561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv9ErE3PI85nZC8EiP12E/7wPOyJSmRoE64Ycmzcljo=;
        b=uzeJWNp975OLp47Z/9JeEswxH2L9MVSnSXjsNcF9wBLswBkBGEK/G9DKfRG1WzQ/Nm
         ezWu1jaanwbm/DXa71GSqy2zUCKokBfUhu6OZlFMUXE/mjdpLZ6fS4/t+mBGosrKWNPI
         5oZhWWFLKdsoWmogN285PRP2T01e77VeH3wbtRrCjP3FAhysqKoaH26DZ7C6a1gPkP7G
         Ak9OcIhTzd3C2sDZhQRXn386UtHIr/o+94743RSuf3igDx5s/osAb5BF09ZLoLyj2qSd
         j+2FBUQ9c6xzrr3kR1o3rqd3Wlm0yLmzx+ywOBU7YDQVFU8D7z1oHKur88kAhI+RcrL8
         P3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXYJnTW4CVXXV3Fy//IagToEuiivPTXUp09b9PgeCR/HadnFwNXNo+pCvanKRAiCHHjM0czXi95oBnzFCT07nVLVNO6qq/SzErCzE8hN5R2ZIrCNjXMPWYa9o33sYg6BcUiyYbt4L/p6NHazn0EaPJdIkz58ldUG2M0ZuQIJU6OqdDv/I=
X-Gm-Message-State: AOJu0Yy4O+oU1MNURhbtgBAH5vhRsVhGEu7m18XbHNRvuH5GVuhfK0mA
	D+lH7CxM6uRiL40GRR2rc0t6/KZZPhXkV4kKjDgHRoUnCsUAMNFB
X-Google-Smtp-Source: AGHT+IEr7l6xqFKtie1zq/7KOfHmazHxw5ijBAJrBoyZFRP3L2jvRRg9so96ETZwsv4Kzat6VEQmEg==
X-Received: by 2002:a05:600c:5787:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-428e6b04a2dmr113192275e9.16.1723021761220;
        Wed, 07 Aug 2024 02:09:21 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:20 -0700 (PDT)
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
Subject: [PATCH v2 07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
Date: Wed,  7 Aug 2024 12:08:55 +0300
Message-Id: <20240807090858.356366-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add exynos8895-pmu compatible to the bindings documentation.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 15fcd8f1d..5c4ba6c65 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -53,6 +53,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7885-pmu
+              - samsung,exynos8895-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.34.1


