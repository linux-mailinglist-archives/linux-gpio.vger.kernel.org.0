Return-Path: <linux-gpio+bounces-16115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310DA38002
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 11:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E702C1897821
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3E6217737;
	Mon, 17 Feb 2025 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgbWDzl0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AEF216613
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787543; cv=none; b=LuBujY6U6W9r54NtAZy1UgNelk5KVdCPK6k1GHlHllZtIdA069PTenYwNmTxmDf63E0VXAxpr3OkzQS5JAwx+aZtAFFQyKeAxbnC9URXW2unJXz98qzFZFrBxte6kagmWd0VBmkaaBTfhff/OnwaiyW76YrzQiGBO7v7PLJbX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787543; c=relaxed/simple;
	bh=6aGtaVpBLW3kX82mTVYH8G/6ueq7kvdSb7JTLpAZZLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LcEL3ayET0svL1H8rRn2s/BMnNxUjnH/Zzq7oYbVUbOx3QE0XcFq5jYjOLr4ymj+5E4U6uZL3a1xZbjPHdiGJVvxNA2tjRNnsGfraO/L12qbT4iJM61n0KKv0MNwy/SU5YSzTpyVjobREVITExic6luuw+ipDbt+oiAaxwIqv90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgbWDzl0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4396a82daf5so26916085e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 02:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787540; x=1740392340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I16xu1ecVLtS/758jqaD8vtXmxaLQ5I+Y1leyu/ANx0=;
        b=bgbWDzl0YMN13FktJuVGVCN4x1e4OQk4q605e0tnV+NHr8DMp8x3r8EP++thgdcgz/
         biCxqVMH4kggn9jnMbmtA4EgMyAgMLJ60VmfB0qF3zH+VxqP7sjZDu3P3HuYorNJw4TN
         9wkwEi/C380Kt33h1fvFWQIgckv9U5TiHwae8k0AKjoQvypnI8GNcGpXFy3FpcHs50n9
         NoEQAYZRvC1vr1iiIOPCC8DLI4HHTmZLxXY+9KlDzw0zgbgiCVrj3pSg8kwTBIy8nd5S
         wQ6LoPpxy0ueRrbBGFKnS/N4z7szEmtcHRo4M7yEmohz5/M2an3sTJdWoPLHh4Wr7Twh
         IzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787540; x=1740392340;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I16xu1ecVLtS/758jqaD8vtXmxaLQ5I+Y1leyu/ANx0=;
        b=GPRCiVMnF2ArUm60Bev6OAkekhVZUvCCawb+wlgetj6fyLyN6IYvO++oVZtAjbXxQJ
         tZ54z9tbZsxJvvfRV2G3U+nYsia/7BaCZvuX9eeSEDgzDNP986JQeqUG0Xea2B08qpay
         pZ4jBFFOdyzbcwRqdKukhKgAK9X0V97QUBEKQeYJt0CgvbF7R908H+Udll54dC1nCKf7
         hONCOCqPdiP9dlHmP8ZwHxBUupHMWHORCbJqQFRHD1ahQXhekhcThGLEgtXzRJwXPuXQ
         7b296nLNVra8W/Hs8uOQXzeVyJEqG0Ca/8UI3eiVXB0daLxulFHZnctdPJHobwmBVHoa
         odCg==
X-Forwarded-Encrypted: i=1; AJvYcCWQCGRcLY00gc0HdSSU1Wc36hZn+CoRu/+gV/iSmXB0iXL+ujzoUur6oK8TQaYCHZQh3mTPzg9GOb7F@vger.kernel.org
X-Gm-Message-State: AOJu0YwkxYta54ovaAiHq2Q525QccofCNCyI2In/23j6vOv0Nb58WcOu
	CK55fGMlVKf04t7QXzzW0UXmdM0ST5H53cJYdeFMq4HLwGESP+o6lQrO6SrKvkA=
X-Gm-Gg: ASbGncu46uTpU3wvhzUuejdY/MWYOQ39USrjHXQP00vNbkD1oRqA4P/8DXTZ8CbL/YF
	eOl60CPV+PEdgJiCO5k+0k1v675RUhU2E95SJ/EuXRs8bFdO7uzBA9e/ZmQSJ2jxhf3AEWMXfVX
	D4UlYtgfXe6Qo4lgw/k6N4IknigqaIkGH3OQnNAhrJkj7GccSozqahZUGukB9Df00UyXKND59O1
	2NOuSFtQ0q1aOM6Ct/wh7/wxpmA3ry99385+YFK5c8eIxZkBtArp29Dn+NOasNHioYiJLGapYLF
	8AQL5F5l6mfO8gySM2hOt0XlWZVg5K549Q==
X-Google-Smtp-Source: AGHT+IHCqlAmBeWIh3RQpDK/wqa/aOOAMFIkBi6CvjLI3mDlej3LMKvDj2NLspjgKzRYrxIEx1isLQ==
X-Received: by 2002:a05:600c:3b0f:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-4398c6d7da4mr9647825e9.31.1739787540052;
        Mon, 17 Feb 2025 02:19:00 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43970c8fed9sm35658385e9.0.2025.02.17.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:18:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 Daniil Titov <daniilt971@gmail.com>, Dang Huynh <danct12@riseup.net>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
Subject: Re: (subset) [PATCH 00/10] Initial support of MSM8937 and Xiaomi
 Redmi 3S
Message-Id: <173978753882.27418.10124969396742370731.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 10:18:58 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Tue, 11 Feb 2025 23:37:44 +0100, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> [...]

Applied, thanks!

[06/10] dt-bindings: nvmem: Add compatible for MS8937
        commit: 07d914dd683f9ccb62a530fad76c36d5d4e6d894

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


