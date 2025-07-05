Return-Path: <linux-gpio+bounces-22818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB223AF9F3A
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 10:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBABF3BF173
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 08:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C84E28541F;
	Sat,  5 Jul 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGqciymb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AD22069F
	for <linux-gpio@vger.kernel.org>; Sat,  5 Jul 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751705534; cv=none; b=MC1vgJqvsQa34gqDSEWhU0s/wHNaDtzw1B/DGvI4OLXiqD2upI2Vlp+zeZwSDF8MMGPEYmkNaHQoByw7VPiEVvWNtnWzM502eocZx1nA25AWEpB5KhtmHFm4Q8TrY50OYwc2SFZ0mXxK/NhOEZz56x2Y0xpecYYiOaNIIJX41Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751705534; c=relaxed/simple;
	bh=AjKgpC4Io2DWBkbWPkG8zNoNDipMaCPIhaYJ1IqmYZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=azdsb94VBkICUdvYOdejXHaPLuiiEr+H5I1LGOlSYGMRO3NUNjKuyHKNJhNIEPtJDlYvAX+ZnCXlHCU+1F/sr+1fvlh3Lon7zp1+Nj0pOuKCI+V18I4Tjk8YrOPazCvqHLv6FQSS/w79WFbfj+x1gcfCoRisgefhlV+b37Pz0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGqciymb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso194499f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Jul 2025 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751705531; x=1752310331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=vGqciymbkx9Hqq22cCDJhqaVtKc/vaX4yNHk0lzqa8wheiW0kKJ2prW1VcNpDhQr8h
         nUeBblQ0QV2Su3hc+d2L42DPlIye5CSLkeFoITOIV4YsluBT0YJSt0gaglwqH6X2f7jT
         OvBrtxxeq2ZkK4SCbL5AJZgCMOD8+FqFYvBpoB1wsu5JtbaJrjYcJJp/cwuGmCecrW5u
         JJjb6h8++1ZHPixXa+3PP6fDgBJJeV4VL62UcLpk0zi6MxVSNzzauMG9zPu22bpKa/aE
         /APw/j57tGQ06nVb7wCxDenjSg9qsyZ3frO+BNdU+LOGeFInqe+x2BhOilUeXdIai9Mg
         McRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751705531; x=1752310331;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=GcMU/+ybc1CDZcjFg5EpITt0l0A/DUZQ/3c05QmUgh8ZvrfFX8T1i/rjZX20p+7Qqt
         iyzp8SqHEnh/osDDjbgePHYQRp8f8YKt6vQa7UARvnpi4D2kf5glzlNWafycsPqBlxT5
         AXeIb7eTTa/YbinfnZIiCESING7z7SGigpxrk/PuhZrqg1gPucnw15pmBRodxGMMi7Ak
         sxBnjjJXANC8AfvH/11BeG16m+fchvazgwJGi4ZtLVRz9cJy26nHp5FUhOgQElmDeMea
         lYeIkjcky/vp1xs1LWASR+J911mxKD8RDE04HLgyT91EHHLtw3JqQU7wsDKJjDtk4sOk
         YSmw==
X-Forwarded-Encrypted: i=1; AJvYcCUPiwP40hb5uqG3HlueZm9TmeJGm0iOpiajY/Awb8ok2Tv9xA/8ifl2TUMxhMPNjq/kCg/W5o3Djy8h@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcUf8e18kSqCaP/2PrTsG5esS3I9HMMbqv7EcO43L5EA40TcG
	1Ey4GRBMInBczDf4Bhw09Ga8yl/rBKUbSLNXIwFqKH8SccXRHgM1G3y2XmOL6SA0z5Yowd27Www
	bwObW
X-Gm-Gg: ASbGncuRUplNwJqv+GYRv5mA2T1ELlh7Jox2fFwrvCwCe2c2sQ3hVRcPlZPw1F+/8+C
	tbi7s6YYCCUebsFdbTG1ky84Ndot8FdFG9E1DGYQfN70DysLQuYhToHstF+xFAEINfbE3dBLKsT
	2dE+TfkyaB22GGXBBmXilXEFPePRk1RYcZaOSjTEeehPmBygbOpDgoggHR4J5p6ES+aPgR4EKbR
	v8Yp/i1fhHm0+gjMVxxMCCcJicFZJp53IaDFkoOlU+O2kLcO8PiXacQk+2lgT+l7GirZ/adgnwP
	TceYpSCKD9vWhyJbrnPDSF6ezq1AQAbkfAILEj0ZbAkaHLjza71uidJcjW67ruYaHbUeQiCX0ql
	I
X-Google-Smtp-Source: AGHT+IHKysufxmIYEaUhEZUWuBYxNVyIKb+YxnegutQsUA9aWiJMJC1+caAqnYzQR6tuQ9454ZDmhQ==
X-Received: by 2002:a05:6000:2281:b0:3a3:63d3:368e with SMTP id ffacd0b85a97d-3b4964c4845mr1539622f8f.0.1751705530869;
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b3542838sm83558635e9.1.2025.07.05.01.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
Message-Id: <175170552946.13533.13306736962764996194.b4-ty@linaro.org>
Date: Sat, 05 Jul 2025 10:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 02 Jul 2025 13:15:24 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. The
> result is that irqs on gs101 for the buttons etc are broken.
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: Fix gs101 irq chip
      https://git.kernel.org/pinctrl/samsung/c/683d532dfc9657ab8aae25204f378352ed144646

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


