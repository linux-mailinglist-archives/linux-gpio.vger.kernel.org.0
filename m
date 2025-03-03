Return-Path: <linux-gpio+bounces-16906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255EA4B99E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B73F016A354
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739B01EF393;
	Mon,  3 Mar 2025 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXBtwCvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0A1EF09B
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991314; cv=none; b=pv5l8gv1FPQXVjTseZ+uvhdpEfGsRgzJ1p9DcYC/97ZPy8ZEln8GTQEEOleRezs2iylVzGUxop+YN8vNjxdvg7kRDgTuLtvH91Un7MjKmCyLiQ0l3h+kX2nmtKarLUjRlR9/kTzlxGhVmB6CrB5Fa7+3FL6ajNdr3y3BOW8vAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991314; c=relaxed/simple;
	bh=5i+jXXjbAPwyvykuwjYpX3ZtCAWwTAbDIZdDjIPeE3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+LKatJln8qO6fNwgvQhorx6Nrsg+JBhFCyn/1gdBRU5UY2DM0/ZHYiyVm9+iLpBnnjU6U5ecsOWQN0jTfCTbit6Wt7ulVxr00p8Zioa98VvQoCcfLrZF7Wq7fLpe+ydGExRCBNGrilr1PhDdk0Sq9Yq5zg1mWgOVfkfPgirykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXBtwCvq; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bb75492e4so9411531fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991310; x=1741596110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=;
        b=iXBtwCvqG/zmJ5EWaNp7SHFfJn411NpOEjfOZRd8qA+0tUkNESo4K/HdDCQM0MsUDY
         3w1pk5761w+Q8NWFQq8V7ygu5EI0HvhPcCV+66lc4z+lOS9h635B41NfeoEifQlfNoME
         5E7Mu0WN3ILvYVDOsCLHdzh6xRlEQQNXJHgNf6Haw3TiieUeCxW9KaBUiWbwqHPmgL8A
         PshaRYHytDzh/dxOEJntMdH4aP1pwWvHh2YDFnoneEMJHpiCCgj7EOJKNL++POKQalpt
         EuSAACjZRvINUv7TzwywcjIsVGxKAQihF/F3gyIoVrumYf8LSe1Lc/1D4VW+OVuZO7IZ
         G3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991310; x=1741596110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=;
        b=GUyh9rubVAdmzM2G4wgQJ9IJCxAp5+Cf8gnzLxXEZN1bxiwVBe0B8TwDUXc3SGt5AE
         1owwuaAcAoyn4J0nKCFEQl5/Ea/n7ajdUrPNzfrguQgXpSPLyxkkNqj1vwmCuiezo7k3
         MKObDx6dmJ2JyOx7f2NwaOxDQqwJUFbgylI06PyH8A9/STTPGz2ukerVWHR14gyslw2Z
         xjf5Dtvuzk0ZJxigd2AU3neE5rPjOM+lfPD2ntkV+XSy0WJDG6am4nV5OT2lZZtuP8wz
         EAQQTuKW2+e6rLS5JqBsTSeUwy+OxjurAkjpJ8in4kuVJmBs2Ehxa2XKnVV7+i8nMUYG
         NOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkgim/MwWv5q28o87CTdQfrjp4EBr9zqN3dPAsZSEV/FLp0YZjYCkpVA7ApEp1pZb1zTunufMOj52S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5F5MRnBfa8/dW5XVc9E/BQQg+COwJMeeEMBW55apmE5Yg728z
	X0q53cSHy2t1XZl0/37tvc47EiD9YrP1iyJYxrCT3HazIuEouKbNWyUr5EnSV1U=
X-Gm-Gg: ASbGncttzajeoWLR0IFN4sIGp0MHbLU7A6PwT5KY0B+AwIR5FPEy9PZJs4EcfQXsSU6
	zIn3vpL0nauxDZQr4hMpA7eVVzCvglBFLx4RLy5bJUFzkVCuKbrR3WE7JnEZ4PRe7CCd761gVAV
	9P1nsYn0bv7sze/8OuF+lEyfPyZ3j2ZYBMeXE1bXH6nQ+6LSSgvJz84wOm8NfyfpafTYFDTNBlp
	/LPgCJPRVKQ90E/aprf8FWg++DSresXlTsmwME4OavXAt8YsZBtroJDJCyeswc3LHqPZmV8n3lb
	GwXUV45bq3q2ASgBGTKbsEOM9EilkcWGyEm1aKYiJuDKlo5pOwT6bzA=
X-Google-Smtp-Source: AGHT+IGGU3RCEseQiiJjdkvq8zg4yqcm1ewTmddMWoo37YSveo5ACFl0sVfwHB6fh77iqxJDQ5B/QA==
X-Received: by 2002:a05:651c:1541:b0:308:f6cf:3619 with SMTP id 38308e7fff4ca-30b931fb851mr39880601fa.6.1740991310492;
        Mon, 03 Mar 2025 00:41:50 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:46 +0100
Subject: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45acf9a28720fdde158 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -6,7 +6,6 @@
 //          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.48.1


