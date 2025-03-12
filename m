Return-Path: <linux-gpio+bounces-17502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2FA5DE05
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 14:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 063327AC6F0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 13:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FA224418D;
	Wed, 12 Mar 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtNLR62S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9772AD21
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786320; cv=none; b=UtLPskPOkgwGouIXyFS5RnEYlk4QTHzDo2EwOQwBNeHhBVWSS+BOSjcg+2p8TDRcGRi2NxbDmwToSmbZ89QenXwdILcNtSuUXgUYPeMN5AhGYfjCZU8cJoEqfHQJ+VHAKEzeau6MeIiF5M+YlM4sEUDBjRK09g1SBMu38BoLWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786320; c=relaxed/simple;
	bh=56Y5NLWpHAfbZjKvZyFHNFC8eMLzlMMysHPeP5iaDy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p2bREd3qhtCLf7HnA5TXer0HfJRp2F2w9/cpmN7PpE6sjlGSwSyBDZyZAftiS2uf27+hbKt9m0rUdb3jpBKwpY0tWo2beThMhYxL1xHLLMtzEE85UKFCwY7gfYhK2UVJ8zM4PQ/08dVBW2STbNd+Y/FTdk8TtzXgPnmTiI59OIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CtNLR62S; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5497590ffbbso7470500e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786316; x=1742391116; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGyN1OdCDHn55um23XvthELP0vLmRMF58m5afAMvpIc=;
        b=CtNLR62SF6Ox4P0lUefWfSSJdCPudwtOxOOfMvmSWKduEd92hWd/ObwbxM/ITYLDjO
         2hWDhp4gEhYtyiJ8FBuf1ois9HGFxbMGTelbyUMqWm9woW31ukme6rRXMXRzfspn9027
         vnMUrOVs1vm+vlfK1aHj4OO4X8t+fjBvscfpabir6TMdVHNt5A8XucdaoTHe3UoqwjnV
         W2HFApbl+xGFkV6kas2J9ITAWyy4Tn7wRoMMkJ81uenfKi0cJf/LjWzzDyWjQFaL/p9N
         pTUd9psMmrYsXtr/Fp1IZ7p9JEgrpuFvBEHtSeZpcR993oBQyvVl9K5OfMIrlVHaPtKz
         KpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786316; x=1742391116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGyN1OdCDHn55um23XvthELP0vLmRMF58m5afAMvpIc=;
        b=KE+/UrCwogsjWLzo4XWEnjgqmXl++TB0BbVCIMZMMdszhxjDroEWMSiZ0x2lX469yC
         auMJHY1rb+scJfZchveJj2Hbb2cV2Qo42pYkEjgeM7l6bFRh2XLGtSyTBMZNRl/WWFCJ
         /qGeh21CiEXpz8f+f9KNO2f7fKFae0fvFcfRJJfzGZvSsc5NaSmjQr/z7fm2qaLpX+vI
         aAD+pHS/M6DtocOuVRCJFLrIdBBTUWYPBbmDxNL4slGTj9/Q9uDfe9fSFf9I5ygpmZIJ
         QE1M9k2T/hAl5hmcwObTdx5vpEIXhSbPZR5ZU8+qHNZ0pR0TtCKWBfBLt+mk+k2oxvPd
         vNDg==
X-Forwarded-Encrypted: i=1; AJvYcCUqxiZ+CcB6YjD7S0DHcs2YdTR+5ky5ooHkzMCANMy/32ApTiWahZMd1R33u/N37p3o7SXwhgkiOznO@vger.kernel.org
X-Gm-Message-State: AOJu0YzkplevNqsPreRiNO75roG+nZNlW+lDnr9eb74rq0p52JQ75m96
	M4cxnBosEqccU6FlcdTwa1Fv7YxwMEyt7KzVN8xkBdxj01uNVxWjOolO6AsO0kI=
X-Gm-Gg: ASbGncubk8eV9jXYTKvu6GdEGgBbjQWV46LgPLZqnlQrtKUDrZ58isOcyn2eJNUf3hw
	gdo7r0gA5FK5OxbMLISlIe88jhK7i18RYhhC5WmKHD9TkYPEhyE3chy4o2jLud+aFZ4yezyYVvw
	LDORihB0NiBlLDVnE8pCWKtvnm3m+EveJkbWBW4Rid7IuvQtTprEQScGo9ituBKa8TLvse7rV2w
	bEJlfdAl2kbfy6UTMl1IG6e2WDiS3li8ojsLMJzyf81cz7ad1jgdRhVSgVnNbbAPCVMu/Z2n5T4
	JLRKEuFmzl/GPGiUWKJhjsN1BvoqxHK7K9yHXjsw50dejBL2Yg1hCJE=
X-Google-Smtp-Source: AGHT+IFYGDBXUYA0H3In98EVuITrxJ9ljuAhQqGGzBSiKqK2nMLcHZBMFwIc/zW2li1pfZPQUHKHaA==
X-Received: by 2002:a05:6512:1195:b0:549:78bd:6b8e with SMTP id 2adb3069b0e04-549910b6127mr7823054e87.37.1741786315985;
        Wed, 12 Mar 2025 06:31:55 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae460desm2121858e87.24.2025.03.12.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:31:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] ASoC: Convert PCM codecs to GPIO descriptors
Date: Wed, 12 Mar 2025 14:31:49 +0100
Message-Id: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWM0WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3YLkXN3k/JTU5GLdVDMjkzQjY7NUg2RTJaCGgqLUtMwKsGHRsbW
 1ANxxO0ZcAAAA
X-Change-ID: 20250312-pcm-codecs-e624f236e0c5
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Three remaining TI PCM codecs use the old GPIO API in
different ways, fix them all up and move over to
<linux/gpio/consumer.h> and get rid of <linux/gpio.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      ASoC: pcm1681: Drop unused include
      ASoC: pcm3008: Convert to GPIO descriptors
      ASoC: pcm6240: Drop bogus code handling IRQ as GPIO

 sound/soc/codecs/pcm1681.c |  1 -
 sound/soc/codecs/pcm3008.c | 61 ++++++++++++++++++++++++----------------------
 sound/soc/codecs/pcm3008.h | 19 ---------------
 sound/soc/codecs/pcm6240.c | 28 ++++++---------------
 sound/soc/codecs/pcm6240.h |  7 +-----
 5 files changed, 40 insertions(+), 76 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250312-pcm-codecs-e624f236e0c5

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


