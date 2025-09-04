Return-Path: <linux-gpio+bounces-25596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3995B43D98
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9921C85438
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8F9307ACC;
	Thu,  4 Sep 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XllKDlSw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F07306D40
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993579; cv=none; b=FD5zDbeK2s+5iNZlVlUb7+RL1qIwAw8Gl7V9Kyj1Sap3XHXfUWyPbpmKlUpspDQH3GCdv5r8yxxh8wio4LVUvk8qCCfWO7tDCUCIJYcoNDRbryfZthcPnybsR9yu98cqzqHNMZvpAaezUUiX5esmcw+KBZT5wdPaFH8f82Q9cLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993579; c=relaxed/simple;
	bh=exbALax/KRnxM/htU8cfFCENh4IpreCWgJhwJJBmuts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kPzrESa59a+ZVD3Cz94TLjE1zqSBo35lt21ZjeVgRPzPl4JfHCdOc7EG0NcFIO/c0PyZm2ZJRhAOi1nFrjJ4RdVLS2fREfQpXeVN2xFox1EydtyHNrykN1Ug07rn4IO/Wwk4rYm+viz6M36QzHqZ0508HkeCGpqFIjueH0bJH6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XllKDlSw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso14606866b.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993576; x=1757598376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=;
        b=XllKDlSwVYM4Dm4Eyfg6UnPT9NGYHhowMX4kzz7IeWlSwsiCSzBy66y1nfjR2iROfs
         KZ74/ywLobRVkbXPbBJNd2jAx/XM+T/tZbRg1W6f8kwWw1IDBhMydMM6m9XXN/rEXXY7
         mRJ/r5x3pMlF0ipbplmE6ad7ym53WYpeSuXPH9HmH2FF03bZ5kOG6rJK46teDxxyrh69
         RD4FFDxSsYdRZsF0JWGceHkOT2qjObiJJXhykEJ7sAvn22Wa8qV+cnZvtWdpeENARRJF
         6DmU9ST+6yT1x/1S1qqCwKD6mhbALNoC1pVg5ONceldmh4tkWV50hFFIF5mY8LLBqoYu
         56aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993576; x=1757598376;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=;
        b=XB1ZY53ZwVqK5ZH3iYlThaqxIopMhMA615vE+o6Ar7ODeQbW2GpttvNvr1SNEz7yoA
         VJtyxMITovyjO3Tk+nqDCyHQQ2a45rsC7ZXXLw8CIqoMFDeI3vYxISjpAI/vlh8YrkWA
         +2W8nAW89/WXTKOCoitc9qbjGro+4U7KTpGVWqw4+EqeusIPJf2lvSUOKlnCWyat7SFu
         mZ7F9mREO4qZEow9R2VCU3BxLUzjbq2C+yRbRHwkkQm8jvqm3P4usWHeqSImO9UASO8d
         v55DwA+zq9qpTbf30fjoS5AQ5p+ypXsIXD7M8D4QsKf+xjBrrEd/gDyWk8HQmNLeZxo8
         Tqjg==
X-Forwarded-Encrypted: i=1; AJvYcCUe6apPdPyWaCFS8IsCxN8D4yh7TJxhRaL81asOZhJNxQ33mwmycDeO8Csqj5a578AwIWiojm86a+3O@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwx+rZxp7su7GPYVOG4vu4Mx8rcy+ab4wTHuVHCfraExgiigu
	4YYfitM2Mko/8KrPIoDeOE4dr4ovowwdWVXIGxnfHpy6AA5z+AXCyYVON4IvSZQFSSc=
X-Gm-Gg: ASbGnct0eHbJlgNIvBZMUFOfuoi8wuUD64YizIN2b4ZEObl8F+btqtcewzWB55oK/EF
	6+NIi5od9mFaNPz05OypZ1Ny7FpFkbW2tdUjFwD++1R+ZwVwgoGSg0SJoWjVnDuCIlSWoNra0bu
	FmPvAL7cF/wnpZfiSFNyEGWiYfIL8xv4LrraaSbpTpI8BskPSWxrmawFgogIPfe243CseVHexav
	aE5H8JHnH3UGrFdZcZzovtnyOW7J1ERsgZYiTBEBL/VGO2BY/oGWC46yMGfT6a0tJEoaEYuYqC0
	D6dFd30f1KbKs1TvPYJ4HLfYzVL8xnb7zN2TOF4RAieAxLGfljx4ne5U4M92cE5Fayi18d8pIpV
	uzgeN+qN9lRfxIHKwAP6wzfS2ZsD9RxgVY8aw/brvYrPOZtmehA==
X-Google-Smtp-Source: AGHT+IFRjqi0rL8OiC4NZXNOIG4FcZYbVhKsdzHVKskJZtLsw0JBOE11012YrpNCw1Y7RX8De6y4QA==
X-Received: by 2002:a17:906:4785:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-aff0e28e4e5mr1209123966b.0.1756993575559;
        Thu, 04 Sep 2025 06:46:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-7-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41@epcas5p3.samsung.com>
 <20250901051926.59970-7-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 6/6] arm64: defconfig: Enable Axis ARTPEC
 SoC
Message-Id: <175699357327.171312.14592323274121562181.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:26 +0530, Ravi Patel wrote:
> Enable the Axis ARTPEC-8 SoC in arm64 defconfig.
> 
> 

Applied, thanks!

[6/6] arm64: defconfig: Enable Axis ARTPEC SoC
      https://git.kernel.org/krzk/linux/c/eca86a61aedaa40310135c8799b28187afbc677e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


