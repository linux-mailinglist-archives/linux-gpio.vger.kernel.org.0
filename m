Return-Path: <linux-gpio+bounces-9916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AB97160A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0147FB260E7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7791B81C9;
	Mon,  9 Sep 2024 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIzJYINz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C531B7919;
	Mon,  9 Sep 2024 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879663; cv=none; b=PbQbgz49+r0GFx0vywSlaV/ofP98zQ5Fa/JkSRX4YNqbTvD34ITRb5PWywJl357oiJRrMNzIOp5maLhoKytapYPevB+1RZvV7l7zO+ZHEe2UKiXYZn5YknFnfcqRWpzQ3+9yumVY+WyZCQapM0j/WNGP6bpf7X8Onl0Wtah6cKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879663; c=relaxed/simple;
	bh=AiWC3ZfhqL6ldc1FB2y26ZdRa35WGsVGr4Q8zOs9JoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMHw5L+5JXyKU42BYYTu/AHkC4yFMAB5hH6r9Let35nE5t/NbXuGXR6HnnXRHI0MVDNOgtKbcEQWj/ZzvFbCqEuzD2izyUf4iiY069//gy1VkQUJdk7shAG9mdQTROyo9lMip94rDMvKjit0i1GEWe+tZgj2geThKxGc9AqJS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIzJYINz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so4685850a12.2;
        Mon, 09 Sep 2024 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879660; x=1726484460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS4Hn7bIf4a0dCsNyQ0Lh+IAlZYQwZkw+bfpG9czwyA=;
        b=UIzJYINzz0irWMGZ3XD8QTTI1//R/T+DGKxw1iRqK+VIk5hpkdlNw543sjkDDsLSZy
         TdCZ5xBsFiRxjDaB7+l79bShVfJh9NGjNjZkJxHc6X9mEjHIdt+2ak30cn8viswnQOQ/
         HN1UrTPt88Wg6Wje/PrWp2okNRivFaVc0GBF8GzkKnpVMKhi9kr2X4ZMmBGcRpJwj7pA
         rrpKdcKOzyV/6FcS9rDw6u+iz0RqeUbWeUo0A6qWnkevfqQI8eemvr1TAu3qaEZJkvYJ
         l+5dxJbM4ntH32u6GoYG0ycgp176reu+kmtw0etfykjWYCoUMfBWv5FLW5JujVuBC6Yw
         ucEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879660; x=1726484460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS4Hn7bIf4a0dCsNyQ0Lh+IAlZYQwZkw+bfpG9czwyA=;
        b=Q9L+QQi8sWvU21s5WZ4215+C0tLPtD/KvWbrgzktT3Y0pqiJc+MU00cPnq0CQqUxJG
         mQ8rj/W+5wrzKX8UTgC35xlVAg98EYlWESHFyoSQFiOQ0MwdCJ11jIyq1xVUHiv+5DBA
         IPfEVk/WJL8zYk/59ePFCnNixSOzWDKX5wvdmpCsopFVA/vA57rcpFAVKtbLbqDrB53l
         pkyzVDEM4NbGksd7x4ea4OVMdYQZ2e38R2XR2WludncdvzR9+XN8bEtU06t0FacRrMg6
         /c8FuBCS2AG2mzGOjCvbrdx70xWIZB1m41L2mWubdgZj54vAvrWuZVXujGHHjMJt4rxZ
         XLGg==
X-Forwarded-Encrypted: i=1; AJvYcCXSTx2/Z0szcohRuFubmMA6Xb58b4nSYF/W5Yb1I/XlCU+fPTq1PKlH6jge64vsQd2Gk+rDL5YhpUWw0PdA@vger.kernel.org, AJvYcCXlJVR2EJqGfHpGxsEG9vG47LedhXG7sFAwHzK3n6h2+9MILG5Vdq0MGy+MPF6BvGvpuDwsAxwpPX76AA==@vger.kernel.org, AJvYcCXxSfzOaYoTdmV24W2JITvCt/l2VB1nG9JonRmhJhRkn1u1uG7AYKDO3yh9ubL1helBAzFiciCvtHLq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PPT07QzUqDQLo/pSibC3cxfDXgmMnKfdc/sN//sxrDW3B9tV
	bapOR1s0TNu9gTmK9Utk3T9Gxe/0nOhH1wGpg2X6AT1aMhHVGH03
X-Google-Smtp-Source: AGHT+IGjlx3MFsYGcDjzz+qUs5bBXIQBrlyrzGmFF5diUPB3UauE3Z/C6EH9CJTCxf6jNGshXWzgeA==
X-Received: by 2002:a17:907:6022:b0:a8a:926a:d027 with SMTP id a640c23a62f3a-a8a926ad63cmr635036166b.45.1725879660080;
        Mon, 09 Sep 2024 04:01:00 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:59 -0700 (PDT)
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
Subject: [PATCH v4 07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
Date: Mon,  9 Sep 2024 14:00:14 +0300
Message-Id: <20240909110017.419960-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add exynos8895-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


