Return-Path: <linux-gpio+bounces-16900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1AA4B998
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB1B3A8B6D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F21EF096;
	Mon,  3 Mar 2025 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrW0eOhy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574601EB1BF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991306; cv=none; b=ITofzLUknUBapuMLYG92bnwD5rVwZOF3E9X+OBKy30tOBKsapD+nDXY0ZkEbfjM2nzo7L9bYbUGTrgBqsCcJOM+BSSPZKVN58totB+313IIb0NiuQ6E7i1HGpNXM5BOnMIKUUuVb1fLr9tOnlQ9oPkdNTFXhGj7WsCgUYHR8FqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991306; c=relaxed/simple;
	bh=DwQKqMcLQDf5swLNOf368ASj2iVCZuQaLrhkTSzXcm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aIIE5e149zK7wvR74EAOrSLQ5kqqOKwL+w8X8lKqp6Dse7whXV95iHX/4XQmrTmXYKK4nGfnMmcDBsCN9KHCwAU8SIU5MfqKWq0DRG3kxJgQ7NvAYVJLJvKsr18VsymN8BM92oxLDmWyglUoqm6PzijDc2LALEzPdhrLFCO4gYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vrW0eOhy; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a04so42873991fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991302; x=1741596102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=;
        b=vrW0eOhyjHK3dnnZtBRatBCms7hHA0w2Cy+LrvQ3XLIfjFh21x8LbmKwLd3poHhlpS
         ybgj+RzpZmnzuT0o1gKKJnkgQ01SMt/XN90w7zRiYSOVkvoG4XS66Makesao8vH0+od0
         Iv3JSzQB/yoB+bKTahe4DGAvl2ftE7BZ4mQWPIgXwI3btFxYvtnelLuoNVtfeSwG/2zn
         uDx5SOdXDwfMJmYLbJ85Wnuns2SsUpQ1Mddl9ipoGS9SDW1LfUZrrqH874o/LhqtGg1o
         iiiznpC0tqVPA/txmFbOHIpteU1hs9jM+781/IBJeXZeDgbRxxDB4OYB+fNH8/8yW03T
         vOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991302; x=1741596102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=;
        b=KMR+pmuWECFTGbAQw5M7X6rZrbWmpUZuEbrDa5z837TYXZgXfzRS/myJTCruyo7Auk
         0BvRcZZvLrXWujdnb7BEXl9pw5mBX5x0b4OROPOh+mosLXrynTXFYuDFdT5heQQzADKo
         mJU1VOA3NFGbqVt34t4S0PDZnB9gza2Yfl0GMo9iMuCBmpu1zKMcKmT+jHD2cUbBnJ0/
         hiY6wnDlrmdHqkC9Vb2acaSbXijjxxBl420lPefr62EXUe3IUl4i6ixqb46z59Mn6ZtT
         RqHRh9Mq4Jb7jB14LDhEVGbXtg/LPtlNFuJGzUw5uozMfX9Ovjm8Nyq1qRFUDrHVh1zS
         ggew==
X-Forwarded-Encrypted: i=1; AJvYcCXdw8Q0Jlrn0NEYVDLR2SWOxpphx2Dv5UhwamB5MEGVirAk/lsf1+RCFMywaO1VMCboUHwkUm60e1eJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyuedOmQfOhTX5t9lqHo18Urr9PBoh2YsfJJJIq34l5xx6wNdRn
	0jmIM1fMUVpph/b8Etzfj2Dtr4fNNO+H8Uk35moqkUPulhXwRrewFypAP0R0/7s=
X-Gm-Gg: ASbGnctCeEtbaB5M3PKF1LCKyB8fBnB/T895QCRMQzqDB7eKv5gSrAY0WYa46mL3ZYD
	jeSBEuhOJLXsjt7cSlToXJyS27qsQnbi1W2oXI7PNwvRpkou8KOt5/6dFLVbIBS9LYTE6WkI3xf
	0qfqVlYIpxRfUeyDRf5khpwHLll+YFoW/VSNz47GHRQMu0YNUcSFGqFkgW/bpPcB6d5HS/CR6Ht
	zNduYfiG+Y4YWyJ8omi52eiRz+XxNvbJCoTLz0Agt85uW3H5LlebCR8os7AHrv7qvlQ59qeFBnQ
	aygN73IFfGj9aW/hCJf3udA+4syEn+5utB81Vt3NTtos0ACTM1A+RuM=
X-Google-Smtp-Source: AGHT+IHn6Tj7glT+a+fHasyXMm+tHoyL5R7gnvFAOlJhkpEYXGi85y3PLUTOtOvNOM+AGZKihutEzA==
X-Received: by 2002:a2e:9f45:0:b0:300:4107:6294 with SMTP id 38308e7fff4ca-30b933139damr42795381fa.35.1740991302342;
        Mon, 03 Mar 2025 00:41:42 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Date: Mon, 03 Mar 2025 09:41:40 +0100
Message-Id: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERrxWcC/x3MQQqAIBBA0avErBPMIYmuEi1Kx5pFFg5FIN49a
 fkW/2cQSkwCY5Mh0cPCZ6zo2gbcvsSNFPtqMNr0GrVRshxyx02505MTZdFa6lYMZkCo0ZUo8Ps
 Pp7mUD3sEYwRgAAAA
X-Change-ID: 20250302-samsung-codecs-6366e1b3f283
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This drops unused includes and converts one Samsung
codec to use GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
 sound/soc/samsung/speyside.c   | 37 ++++++++++++++++++++++++++++++-------
 sound/soc/samsung/tm2_wm5110.c |  1 -
 sound/soc/samsung/tobermory.c  |  1 -
 6 files changed, 30 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250302-samsung-codecs-6366e1b3f283

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


