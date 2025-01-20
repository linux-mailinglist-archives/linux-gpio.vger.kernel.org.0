Return-Path: <linux-gpio+bounces-14949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD63A174AA
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 23:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80603A0372
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 22:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B784C1EF08E;
	Mon, 20 Jan 2025 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU6cQOIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0716F0E8
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2025 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737412521; cv=none; b=K5rmyLAH0QnUBG/Ffr4i3E9a+vbdd26fY1/PTGvux5AH1hYXIVwZbFZAqhN6FfPmadxp8HrvcwM53g0n/fuvUB1AGqvZuecqLe6XvcZWkMIFDVA51F6yDpVmJACgHi5moQI1sasnHVJhz/269PnaqoaiUJMGsCnCenyO48C2RwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737412521; c=relaxed/simple;
	bh=p6ultcYuOGIaS+90ZuOgp1U3g3GGKtVgVLTtyGNHkb4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bI/stHnkPKgGoBYZZ7LoZlxRZlu2CypzUD7MG11ILvPpxOywsZAKv3JBStqZO1CgVesdnDoVA0PC2qxlh5gI4QUm+UWsUGbv3ZaGnGTGEGgezCy+s/kE2DwMpklb+aQQQFhyUAdELqaQpaNbIMWsTSfeYrVVN1N3zDebHiyF+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU6cQOIa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso4516243f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2025 14:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737412518; x=1738017318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8wu2BkrTWsrVM/jC7rXUdRwtSDgmdRo69fIzQbnk08=;
        b=OU6cQOIavB/2nPijDscu3sT/ix9EokFfjbp/JbvZVH+zyOgXV6PURhBlOde+cbdf35
         6CK2V1Fr2pF3QI2mIxIJbxSCs62TpOElIwanmqOJOt46CoeW9sEBDni3SBhAb3D/XDxX
         qI99VdwC9Nx/ZfCqkpUu+wwsk1U3CL1Qv4LeE6CrdU31Ah0at7dfGJTATLRIiZhrEYjK
         E2KyLn4XwhDBN5p26IPrUnSXttqQgBSm1+PzNTl9PPcu0d2ZpZioFr9opKi0F6UA2cLi
         BF9Sm1QtcPyrrCMPNE8MDYyevW2oKabEaF0UC2cKATjIHuq+xzH72tNMFh9eD6G9ha8h
         ftEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737412518; x=1738017318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8wu2BkrTWsrVM/jC7rXUdRwtSDgmdRo69fIzQbnk08=;
        b=lN2duAXd0xd8WhfXw5Bf3LAx2O3bWcbYhc9o2rkRhLurO1OzX+dW8kYC5WnL6GsOz3
         HET/E52ZJiM8uoimQNaX7BTMkBNKIS1TLvSoakPKvVIX+LH92Rxm2XeBBd7FGCXol9GD
         cRU2I+9Jd4WHlU8wLatH2TufveZEu3maoPlnRK1rN4KAm4hmybKex0/Jj5JqJjndeH0c
         zJhjf14UGIMHT/mbi9nc0i5cLF9TTU8virx20HZGr/bHQJ6BfS+trohxVh2RnOLcc9AK
         dz/LJ6VfSm3AIK58zq0zmupfiah8nQ8wan3yqE1ANRGuCcFi5ntp4ZCTA49Cn/gEVQS/
         C8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXziAi8ig9zzQWNHamWIw2/DErAtGzh3H9yK4gt64/hmQuGviLFC/ywmuCv6PZsfTL84RU9thsBwd4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mhwVuJ2Pl8hX1Rjyf8nL61JIWTqIUqQEb9YCihmUmstUimg3
	efWGXED/q7EOFzSBKzzi0ABTEGilY+EfFwblW3fECW6NXl4KMlWGlvUUQ1HS2us=
X-Gm-Gg: ASbGncu0ruq3uWRBYdZFTEn2DljSqF3nhg95oUPCi2E2rKjL+JKpcIXNabjpwPWeCRs
	CfQMCkznSZUoxguq53MJwQamJ3ZUUuGXNYHt8ssRp0DZLUkiqSruZkUhL27heOljqGstD/vpHxp
	6/3+ASNqBGc+22ffoW6GU2v0uwaiKPjSTx9FjgB8IPWv8/gk4g6WhbUvTTqRQA6xQgpiKfVVXhw
	fZrKkxe/9A3r8aBhme04G6FZyutk/pzFHxSmRdZLrQe1gPoZW3wjATILJ2oytMwDY78WoGqsqm3
	ir/HDdbxl+/xpOwUGBXDINg=
X-Google-Smtp-Source: AGHT+IGjA+UZ6VbJB1NhP66f0b8U22Yqxx053HN3nMFKIp59HvosUtcTmoxMU8ZEOp2wVF7sdQd2BQ==
X-Received: by 2002:a05:6000:1786:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38bf57be11bmr14588226f8f.46.1737412517766;
        Mon, 20 Jan 2025 14:35:17 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e19fsm11889267f8f.93.2025.01.20.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 14:35:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/3] samsung: pinctrl: Add support for eint_fltcon_offset
 and filter selection on gs101
Date: Mon, 20 Jan 2025 22:34:52 +0000
Message-Id: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzPjmcC/x3MSwqAMAwA0atI1gb6UQSvIi6kjRqQWBoVQby7x
 eVbzDyglJkU+uqBTBcr71Jg6wrCOslCyLEYnHGtsc5gYglH3nDejrAL6qmJJKLz3k/Wd6GJDZQ
 4ZZr5/sfD+L4fR8B8wmgAAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=p6ultcYuOGIaS+90ZuOgp1U3g3GGKtVgVLTtyGNHkb4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnjs+jPcUF/omEh0iZxoatiVZ0QBh0tMxpn8fEx
 eli4RojWgOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ47PowAKCRDO6LjWAjRy
 unZjEACM3Q+inY9K8M9Tp0UGpnFBDb1Om5fcxGoH+8e6ZyTY9OUcbJULx8z+0WQEqcV44nvO5nA
 NcQ+v5P7NnT9OvnmDkuok7mlCiAFw9P9A2QGi63McQQPUN5dodeY4/rQFoGqNH/zn+fBS9dvuOC
 NVvk6vSAkIRdPWUq96jTKLLDwAVXcDAAZ2s8oQj/A8sSsdSnpfkhHSkexTP+wuB1sFwEEN3t/q5
 6uOfQaissUXDtii0hyAA2g6sGKk7WW5HeRBmUy9rRBMA81lsfhQwTEC9klChIDLVwhP1AX+5rut
 6EB4XL9wQY9Gjqa1rtLB3GKbBiJoWFLGiNzOVtKR/XQyd0vFD6LlMluik5tEhyuk0IeW9Gac9rp
 3Qt783KtavMg9+IREI1/khN1oiLcT3bmBzijk999FRtRo9jbJwoZ6dVWffWdXLDI0Svt2IPIE+8
 NATM0IqvlZzmuDKiiNoE73fr8rhgHiWe4GgDr71gqrPP5Pk0r2ENbK0wixJ8ekz2f4c45PsH9mz
 8eMICLF5JvZ/vMVwylujyX6d2m0/PveI9UvACrS93lSRjiDk8JB877w3NGe7TVzAWAQsto1zB+T
 qTfKe1JxShfo5PZ8t0X0eDhtmf58NxffPA0TZRrPyjDrwb1EtMDVQxYcvoOePmZtwMhkcMuvCRe
 zseNbj++u5vbapQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (3):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 318 ++++++++++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  39 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  13 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  16 +-
 5 files changed, 338 insertions(+), 198 deletions(-)
---
base-commit: b3f72f6c7d65a8953fd80ce0b376b47fa263e34b
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


