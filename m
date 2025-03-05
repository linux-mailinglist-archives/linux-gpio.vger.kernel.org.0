Return-Path: <linux-gpio+bounces-17082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2961A4F802
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04AD73A9E2B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CDB1F03D2;
	Wed,  5 Mar 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcmIU+6o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D1A13D8A3
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160359; cv=none; b=SMgjKcf6wfTcVBxkJknOnjZZoFAClv107IikFKu3+812wQfL5BLmRzDUzHf0h5PmWp7VMyxFO2n+smDQJbLERqc6MiqpWwch3oym3xQmaQDU0lckk450QohXRGdn4PIi6eU567luqeakPQV48tnpvOLuwRXv7jcSzHgNR0xMwfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160359; c=relaxed/simple;
	bh=q0+S22WPuElk/jcAtxVYX7JIk0wQaEUy6YQfzqxUpAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mwjzt0se95wRpaJfYa4yEWV67oMkJylnquHKtm20SSs453dUW31Gxi2By6v2slV+dsThU8TdJVoiMRVWg61ALjBYLYYapbooIyc6k2qiuqCa764zPmScrAD1JK6n/Lt/G899WxLmm5kKmmDZUSYy1priCwR8ix5XDFjCZNJ+GWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcmIU+6o; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30b9f7c4165so38718311fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160355; x=1741765155; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=;
        b=LcmIU+6oNkqq2pgT+NXIm5en99t4d2egQhCR89dHdDVkowu3CseSd/84xC5EXMg/Er
         GF+whD4fAKQToZ7Ep51fB+rQIs4Yt5QxotNI6hD95HeHHSJDh3vqnq+lKcpMXmbAl5Fc
         AhuXrWPsAYygA+orp7PXeMT+FXCnAxAoGjxpuTJtYQ1udWX9MbJbRnYhrwMCiTfmpb30
         srMZ+QOOoAAUkahxT7tZfucEgnnSxzwbUViWLBZkagiZ2llPeHkHP0lDjO8ZoEPsbMgt
         +nyncl8tmgE4Q+DWx9XHXT4RRubu0HBY3eYdFgg6jWiuEj/OgQpEpmrDZM/6QNAUiNFu
         TdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160355; x=1741765155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=;
        b=Ik9qyzWZjyZWpAw9YdJlQLpdr1Nq3o9LG6PfHQXAMfdB7bG5YcqSjP1XvjuAp/LNmv
         3Zm7DRCOgLOqODtjJKG3OhDt6ioQK2XIJW330CxUOMVB5BcS2u9TXH1rF+XFaJ4X+44K
         btPCtLkITPzqmG8ivfdSrEOk27U3iyAwL/6DOZPieQg5GCLnZwzMsRw96xgruPvv8QvJ
         iV0zEIuoHfVU3rPV56lLyKZvifJ9HqpwQjoiH/NQQrsWOWb+AAlrJ8GaU5Wr9V3+F8Ps
         ZxkqQu+EToCymZrSUPerGtoXvenHfeCJPoF7dTMiOW8BpGoHfgXV9AA2oRTmkOjfhLh+
         9clA==
X-Forwarded-Encrypted: i=1; AJvYcCUt2bS7UfTcQrD8O/dE++rfu9bp1G+k9bqBp8ZmUMMO8hZE8CKBjT0O2pHH4OB+e1xoe/w01yLyDqDN@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUA157RE9LPzRQg1Bx+4O+Qnic9pN6wHOo4prT+lB9pNpT7u/
	FgVEZzhr3vc1Bgu3KbVSTLYzO/oEin4Ck6l5RDKpbzP95d4nE3w7OImrGoyfxR8=
X-Gm-Gg: ASbGncsXfA5jKW07j2uJFy6wzsboqGG//s+gyYDHmu0FHgU5XH9AzaGgh7p6txRRe3h
	wZn1x8toAZYmX+hPkji1LUCydzAcvc0lBH0vS8XdLmuwucCKR+Gj64G3JeTE7Ny+LeYB8abzh8m
	EUdhhJAdjUHOgF/asmcy7rzpx3U7S+wOhqgXrLqLycgtaFbB5FRTV66cYSFndKYVwkIy66EMIw/
	d5BIrRZHQMXL95wZQkPvC0TV3j8Knq6rItYwz8mD/mNF2fmf2hjyClqxOOnPN+4HNz2q8h2tTf1
	h0tMth6pNgpZdAFK3yMSWN7yoldEXrXRxG0K+Ed1uzfENlhVoxFVrhQ=
X-Google-Smtp-Source: AGHT+IEyQAzaW4gq+8l1Jw587sTvvOjYY8IgYjgeac3pSvj7GEl+4Qb0eshDTUKdJvdxEf1rchKeSg==
X-Received: by 2002:a2e:a7ca:0:b0:30b:971c:96e6 with SMTP id 38308e7fff4ca-30bd7af6208mr8775671fa.26.1741160355350;
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/6] ASoC: samsung: GPIO descriptor conversion
Date: Wed, 05 Mar 2025 08:39:12 +0100
Message-Id: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKH/x2cC/13MQQrCMBCF4auUWRtJJzS0rrxH6SI203ZAE8loU
 Urubiy4cfk/eN8GQolJ4FRtkGhl4RhK4KGCcXFhJsW+NKDGRhuNStxNnmFWY/Q0irLGWqovZsL
 WQDndE0382sF+KL2wPGJ67/5af9cfZf6ptVZaNdYhdp33HbbnKweX4jGmGYac8wdF5AK2rQAAA
 A==
X-Change-ID: 20250302-samsung-codecs-6366e1b3f283
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

This drops unused includes and converts one Samsung
codec to use GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Collect Review tags
- Add a devm action to drop the gpiod table in speyside
- Link to v1: https://lore.kernel.org/r/20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org

---
Linus Walleij (6):
      ASoC: samsung: bells: Drop unused include
      ASoC: samsung: littlemill: Drop unused include
      ASoC: samsung: lowland: Drop unused include
      ASoC: samsung: speyside: Convert to GPIO descriptor
      ASoC: samsung: tobermory: Drop unused include
      ASoC: samsung: tm2_wm5110: Drop unused include

 sound/soc/samsung/bells.c      |  1 -
 sound/soc/samsung/littlemill.c |  1 -
 sound/soc/samsung/lowland.c    |  1 -
 sound/soc/samsung/speyside.c   | 47 +++++++++++++++++++++++++++++++++++-------
 sound/soc/samsung/tm2_wm5110.c |  1 -
 sound/soc/samsung/tobermory.c  |  1 -
 6 files changed, 40 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250302-samsung-codecs-6366e1b3f283

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


