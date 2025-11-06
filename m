Return-Path: <linux-gpio+bounces-28211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E703C3C656
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684985601D5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1344A34E74E;
	Thu,  6 Nov 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LRyBhmop"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03383303C85
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445799; cv=none; b=Y3Ci0mMA0C5RLEYOGITAn79LhT9teQOQhWnne+4DwvVdZmleSQIg2fI0BcN9reeHtwSZEgY7tkGbGlr4Fs6T0ymcperKYcw7HyOaoXGDiMAp9M7YxxfAcO4Ekkn75HwsdDSLGlA1x6x6DH9yLwTQCEZjwlRSMUQ0Y8ISdDDp4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445799; c=relaxed/simple;
	bh=m+62ZdK0Lq7jNUHc6LhXJD8r2Oz0NXj2Wf/sdNqZaZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y5zlcPfWn+5SGZS2DShRYlxhMhSJbIAHg3Gdn17MBf+YIHhFA8N9bJ1LcOaoG9X3wpoWvWFYfoncSd7RsN8mPXqmMG4y0bWiyEb85/IppEaLBBeOSFc5JMk4pSyjuhpRyPjsucQYIhp3Z1OyyJHEWI0t6T7bsMuoBwiR6MRFf4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LRyBhmop; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64093f3f7ddso203290a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 08:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445796; x=1763050596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/cWESJHLQuQfZBepHMhOg3dPVBwhTpABUd40+CP0cQ=;
        b=LRyBhmopWy4spnFYHZmVRlmUodonDK0TuQE99e3Qwa2sYiqq2yA8n/q7fyryrUzcXz
         1rEbYBgOtYrRZNd42GLdJL4IIEe8GZBpkXREWiVYeE4JeMmfCFIMkQqSKI5btjoBJ0Q4
         u7dsuuRfM5F1QOLvKHGpugDtrNEodcXeUpPiughq9IEsW/kmjbSmYVJGphM3FpvM+lBX
         WTI5VJsXdAm6lizwt4VVlzIhDghPL08ZkCEyaClOTK00arYedwqIsxGJkPT/l04I0zXx
         V+TkvqNlnsKUEqG7SIISPHDFcQNhSL0LSjOcITZPXE04VOUJ/JyI5ho6TwV08QdP3MYW
         6ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445796; x=1763050596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/cWESJHLQuQfZBepHMhOg3dPVBwhTpABUd40+CP0cQ=;
        b=ksrWEMDsDwpMKYnMfaC/xJKPldAHqqNO+NFPsaYB8648tv0xB3+f5sq2jZQ5Bsp4bv
         BJATtCTs+y5pkCWyMKSBwCH6JoGJddlpPE4HtJEtPi33l+SVTIaQSMQhkEiN5cAmzlnZ
         tHSyJUYaxx5nvEV5JKXOdC38hk/f+C5FH32GK1ZlOugZkLKm0t2UJi68mXTuZ+qtKmKW
         7f2Fy+0jg5IyoL6N9+P1D+pfLJIyixz9wEFNw5eCla5oiIpE7zhYalEeS6mra/AqMTDA
         VKlmp16DzriypQ3AmfkCniPSdjLpIqgAlEkGY0z5/9BLcTMpMWEP05028mS9HCX0Gtwp
         FUuw==
X-Gm-Message-State: AOJu0YxDSLtLlesMlGPB1fg7WvW1ulZ8YZMq4kzqOexFke40Nyis68oZ
	gpprinHCeNc4ovsHTluRuFf863w5wAoLhD22Kgh18N15B1wLF5DOe3ANqC9snVmKWN0=
X-Gm-Gg: ASbGnctSgimwXxU4NeP/foHkVlHrbXPtOF2bgMZnupK4lDSj5tNJFfdPEbwiY/ok6Wx
	V1ZJYkRNycfZPRYRNOQY/UzXHp39FYXShW0yi8M9FVWgBoj2zHALG1Q6ozRSvqzaJ+g9qbLTmdS
	hwIiEa9OW4KVuDug3/El0sPyCSC3moPtz8lyvfH6iZZPRL8oRfafH4E1xGspQqMZRz/B+APw0Pd
	wCwR43F+r9A3vNLcPQEi2Y4EMEnl3z5/wAgXiyHoj0Uk0pXkSqUdsrq6UrMW2Y7xRGAwLy9mTf8
	wU3R4BEr5ukoZaC7fDj9P9YoNu/H+mViFSLzkDqAifg08d2v1AxHKYBvMHYcpUPdQloYBFOPVOZ
	iCqRvQ/Nq/mKcV6wXD5NFsQY+cF1UqXKNJDAq6bDDORy4CljmzGlhNgFHlCmSRy/fUN+gWTdNFt
	zCQLn06ETxLD6KzjA7u4DIyglUZVI=
X-Google-Smtp-Source: AGHT+IGZyiotRhhgwXYn5kLA9144yJt3CqLXWRIlBplyMOGLmU5g6JzMcGZwLmbbAR1KDnNe/CJBWA==
X-Received: by 2002:a05:6402:40d5:b0:63b:f26d:2eab with SMTP id 4fb4d7f45d1cf-6410588c64bmr4342221a12.2.1762445796238;
        Thu, 06 Nov 2025 08:16:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] gpio: Simplify with of_device_get_match_data()
Date: Thu, 06 Nov 2025 17:16:24 +0100
Message-Id: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjJDGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwMz3fSCzHzd/DTd3MSS5AxdI+MkI5PklJQ0AzNjJaCegqLUtMwKsHn
 RsbW1AKFqXdpfAAAA
X-Change-ID: 20251106-gpio-of-match-23b24cddf063
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m+62ZdK0Lq7jNUHc6LhXJD8r2Oz0NXj2Wf/sdNqZaZ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMnawcy7CZrgSJdmsX8aGdzbZJXfoTmd5wcte
 EXUkZPJykiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ2gAKCRDBN2bmhouD
 1/GKD/sGaVw4KqMnqsuf/Iq4t8i+hgL/3lnY0jK+9SSHdXboQ7EJfgk3Sm6wY52RTR+tUedRqHb
 KgFgHA/5ybPQRwhsYIiMvznFthIaKAJQOyqKUk0EoICVUmcd41lh1MD19gMi8bXpb3tdhoMD0k7
 c/ssi6l4uvZwgGAsZlS5xpcM45nHBvnKd52CJW6DphNkNEcv6mznj9RoO4xwAw2YNkPUXcVyTOG
 /Iz/TKqD3SC4b4ckdDh/LHlBACvBtj9Ouh4a5kchOc7TvE5K8NOCIstjaGA+VYGTt1gRiqOI/+l
 GQhTiL2jKs68Rxvm8cnU/28TKbJq/Bw9/SAaE3R2zYyzd/A1OyqrCHb7kIjtg1T3G4jVK/nX0vG
 UI037XTHkPBuQj9xet8T8YsCEgsT8xyeyDe8LnAmiXykzytmOzkEhUszveFit4ZBFp/JOdCMSpR
 4ar2NyVFBRiYVufNe3lzr2S4DZPoinPKdKdRJfZ7twvu1E5rN3Ptry9kUlKmFnc6rDTTJA0zGwJ
 wcvX7YTxJiaMdZgmLN0y8Wh9a8s37KEQWrJAWQqcPFFA3o9MwAsGR5QDYRHuagOmkCjj2MmP4QG
 9giy7q8+4GvJ7VWK3iCZ1y37exP4A7BdriM9cp5obCaixlPiHoWi32+FRChQSaI4HfZ0l4XcZga
 V+lfSKqaELeCsBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'pdev->dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      gpio: tb10x: Drop unused tb10x_set_bits() function
      gpio: aspeed: Simplify with of_device_get_match_data()
      gpio: creg-snps: Simplify with of_device_get_match_data()
      gpio: zynq: Simplify with of_device_get_match_data()

 drivers/gpio/gpio-aspeed.c    |  7 ++-----
 drivers/gpio/gpio-creg-snps.c |  4 +---
 drivers/gpio/gpio-tb10x.c     | 19 -------------------
 drivers/gpio/gpio-zynq.c      |  8 +++-----
 4 files changed, 6 insertions(+), 32 deletions(-)
---
base-commit: 5892a3d1e4764f041ce756d8f8b321d2c92f653a
change-id: 20251106-gpio-of-match-23b24cddf063

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


