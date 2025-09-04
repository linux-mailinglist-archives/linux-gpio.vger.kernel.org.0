Return-Path: <linux-gpio+bounces-25593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0868B43D8B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DCC716139B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116793043B8;
	Thu,  4 Sep 2025 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="syF9QHH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCA2D3737
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993572; cv=none; b=Qv6Ai5+jFSorGPbuT5obPyH2ohl5NwVpN9v07lYZwlRO5EnaF1p467CXclOX+35fJ+0RPotFcf4XSK3IqkY0vdhZ/g7ejtdBd4g7oLP4S3q4/x+KA5d3DxSWLKb7CjipqIrjq+yEf7Zo+7XRDQ4AIp1d8qvgfShfzfYMEKtObh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993572; c=relaxed/simple;
	bh=YbXtY+bB9UCcFJGSj880JfkrzUoWKkND3HjhqJeIUYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mdk0rwA4ZvhfRzHVWixooJ2gifuIti04zIMM4vYbcUQtkR4IoUly6CrP3U63Dt+zAtFWBPX7/bqqUMvPbmXMXaoL4awRfQ7fWGqGHZn9n1cCufkR7xh/JLiOeOt6qUoWeuXW2GoQb/tuPrZeX3I4r/37BgURYJw6kLW0z7+s4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=syF9QHH0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b046869a6adso11961766b.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993568; x=1757598368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=;
        b=syF9QHH0McR/jqRpSI5sBRPGCPal/w787PnnRWyhhNSuaENu/RSB9q0FV3cCQhMA9b
         f3E1+sZeqdPvflTr1EsK8/NPb5MsPkWpzdl3U9AtWWbr1opm4lW+jNvhfG+mFW2h4AFR
         qqhSghMzBh6uKwtc0NgYkPU/V0SwpM1o3APoxDYWsWuhcRjcWwW9p9jPMFWh9yCOsICS
         g2y7nfhntRbBLMPyAcGE9S5RzL3IiET8Z2CeeCxjpW19zEaj0Oo6b0IdQIxCz4S06GKN
         EqIAscX3Zx3iV/4NQDArKC2Y9LLj0djfPzl4QS+QPbypbPyPX87BMcIIjWTlhP3oTxnd
         BaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993568; x=1757598368;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=;
        b=pkqE6SkTBrjMBy3HqJ9fvXhndMbpApI40uBo2cGP8BMyP+Z7nI2R/CDwGYfZ5AKwHL
         G/bgXaWMsWf7kmxUe6mQlYZ8Kl/TX0glJfSo/Vu2Fz4rEXJI0yTfiy76C1f6tOVaP/+O
         5ZhUSknX2t6JJ3CnxLuQ16g+hY4UNisHeZyC+Bh3QT/DO3UARDRUm3TuqR1diQ8mw4Fv
         LI2c300PFm9Td9GnLtzlK2uT4/2cXXZhFuWl8KPY6NjFlDinhYRE2Qilzk3n8cT/eAVJ
         fGuloz/TxwUMWqn6dkx9xQeAfWStkZ4jlAdTMQeS/vZbawsNDipvLMryiDEIfO+whAnS
         AxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMaWqabhpNHjoHSq/0ereZoGfVDBdLtF/6ATJolfou2voHXUGKZaOCEQoHYsJZocELB/EQ1cSnpaxT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0OzH2cYrfGG0sXesP4FlqKLusajHvu+/VUPpRMFrsH7FZL5uV
	LVjKY4xwSbptc0k5AoMeN6R5WTCJtsWwnAr+kjiQ3bjxjVzQOKpOA710BkXTAuAX4n0=
X-Gm-Gg: ASbGnct0a0VtPcp9v/kXxVx3Lm6x/f3fOUtgSlSBIrcSCpEK0cAFI+6kFRX3+LhiPNB
	osfb1iXTj2CmkYzbsLwZrO+LQoEPgN9z2R1zzApJD5oqYbuNwgQ5uruhinsHl1AtiVCQJHRRJVP
	FrnAukaI4RXy3sGduuxNquC8gzuQeHl+vzy5BLgt2oZSZJLQa5Yunb6DDfmpTIVUbHgqohvQnXs
	FTde417JJidGLpafo1UqYq7Z/WunPgaQHaHuFPUI3YzeliiLwj0YqRNYC4O3yFqoKMF+8VFCdcX
	aXOzaEOUBBqDIJG3mfx9FwIpNkF9rS1mEsiIrA+bIuwTPTeWMHNluk91Xs8GvT5uLzAXiucmOK6
	JeJIAB1GpEAQMMaGXkUuOAu7GifhKleND/6fK2XI=
X-Google-Smtp-Source: AGHT+IHR5XB2P+9jpNOyHwbkAht1wt06oHD5IV8g09IEd8azHiDpTqXuJszFXYr9m5Jzcbq7eoSIFg==
X-Received: by 2002:a17:907:26c3:b0:af9:3758:a85a with SMTP id a640c23a62f3a-aff0ee81aa2mr1052139466b.5.1756993568421;
        Thu, 04 Sep 2025 06:46:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:07 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-4-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8@epcas5p4.samsung.com>
 <20250901051926.59970-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 3/6] dt-bindings: arm: axis: Add ARTPEC-8
 grizzly board
Message-Id: <175699356578.171312.4960170053878609185.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:23 +0530, Ravi Patel wrote:
> Document the Axis ARTPEC-8 SoC binding and the grizzly board
> which uses ARTPEC-8 SoC.
> 
> 

Applied, thanks!

[3/6] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
      https://git.kernel.org/krzk/linux/c/604a932fa924e7b15be47c6208a305f289cfa309

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


