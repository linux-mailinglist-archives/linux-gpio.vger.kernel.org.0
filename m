Return-Path: <linux-gpio+bounces-18249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE0AA7D034
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Apr 2025 22:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73DD170695
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Apr 2025 20:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868FA1A5BAA;
	Sun,  6 Apr 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3pFV633"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495917A30B
	for <linux-gpio@vger.kernel.org>; Sun,  6 Apr 2025 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970973; cv=none; b=kj9i/1xbycMT+ga3NFDlTUN+JWj0iPXEHMrgI1+vTTLWAknb6cR91FJyZficNCvxM72m6fL34ytZRJEdGAIs9wxtudSVmugw4/2QGs1YwkWnu5/eEyIs1B1fBT/hg74QuiZ7MKBoW6z1FUayN1QsrgvdoUSF3CX5koZfHPkOUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970973; c=relaxed/simple;
	bh=glJmHiiiisPltSWPE6uKZxk27f/zOlEOf+QIvg7TROg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJq55n9TBRyqWNIfnSqeZEmqErPNCVS2KAhrGdvv+F8Be0J4nVDIsA/S952xYLfbQBjmJfeTQ94zt3Kgi9p7fNLsGmj8qH2Am7zM+PjsCU/stxtsZH+WMepm6HX0tidqzPuJhgFiWKRpCPx0JdtNzP6sasQWU4UxwZm0QWUxsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3pFV633; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so500437f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970970; x=1744575770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=;
        b=d3pFV633MPbx5cnK9OZG40YGkyvXB42T6nW/aUao9wDDfp6loCNBSvsZuzW9cN9APf
         pqEDpB2zPTAU/1IzaQSKTaShOhg/mKtPYsPIHcEpnIf2SrWQs3l0028gnOZBiusDKjv9
         S55tAAsadOu6qxF99AMdvgkstUAk2N03e31L+O7vx/KCT6z+KkRdcoGEcIEZgefWPgZq
         G+KnMkJtmE4WXMfr1ndzT3lrj5KRmqilp1C6THFb3fM/6Tos0sS6r2pOjq/wPEcs3qD/
         GNbXcQ2JvGWX8jCR3uwThUyhVoWHBaUw2jvBAg2EQxwBHOBD++A0gw+pUjj0qF2wpSmS
         D1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970970; x=1744575770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=;
        b=V+n1aeJk/SuOUpmoDvcon8sv8Ka5Dt2bZXNcVS5Q1MdpWGDzzjFxz8f5rHXDriy1uf
         q9hSMnK53Cg4EUPe6vl11CpOOKfJN1C53eOYo6HYuNDdBcDi5Ifxxd6OMsYCMkTljZlX
         ToLA+uI+NsCInxrsoPoFaoDy2pRhinRT0tTJKBv6Vpt58wls5IQGyZ/plsfmIRKftcpQ
         SAHz3t72YhUF9Df8l+QAl7qU3wT5L/ESPPHMPu5IchTRlEAwqUSgvhIHfN7t0wpccgHs
         7z9enRJyw/jHbgM6gVX04Cr6UjL2v+V6+G4zEc2au/zuDoxB+smuujcr+Tb2viLwI8j/
         1vvg==
X-Forwarded-Encrypted: i=1; AJvYcCVT6r7/Kmtpkz/HJRJxyeFd/ez0nFYp4s0ntiXPnoEcUgOJIpYr4rFhu8CMY12T3k0HgO0wZpzj7ciA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0bcYEebcslJoQb0mOkQt5mb2EFFzXV+l7SoU2dMhKt50Rw3N
	YITdE8NfPZRTY32rlHmrQzQNZYqCT3H+7umGY01IqRe/5yhDHSxpwdEzHVj9I54=
X-Gm-Gg: ASbGncsrDeM93l1uMZRe0l36lPy26MHuuge/JiVwFSy8deVylq0v4vVfgjA8Ucy/lr2
	Kxwtm9G70/HOhCP2KJQwisVwLXfTvTjq1GJoFh5rChXiQFCFJX/VwMJBkbA7VCt+dqju7qeQJ3S
	iWLnpU4Oo71PjcLG4mbnkSRUq/ZKRXCzMR/MGpQ+/ITO/ztUz31uI2NqrUOC8xoNabvICjT9oVD
	jImACqDhWRNNAjEFSyesZszyTr2IyWmx3RjmIawfl8l6zWW3V5QrFmWxKyXjpy1mIK7rBOTiGQv
	meAD0ajm7kskuQDt+AvwCG3KE8n9W1b5ruLi/w948thBMsxw5Ei10A==
X-Google-Smtp-Source: AGHT+IE78MK18Cq/sIizJFaorgjRFVFZScT4NJKlc4SDdKfjlcTRgo/XX7XC4hoG4wqkNLZZYxJyuQ==
X-Received: by 2002:a05:6000:2285:b0:394:d0c3:da7a with SMTP id ffacd0b85a97d-39cb35766ddmr2963602f8f.3.1743970969681;
        Sun, 06 Apr 2025 13:22:49 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm115304655e9.0.2025.04.06.13.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:22:44 +0200
Message-ID: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 0cd4c36ae8aa..541517536489 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -410,7 +410,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	device_init_wakeup(dev, true);
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 
 	return 0;
 err:
-- 
2.45.2


