Return-Path: <linux-gpio+bounces-11518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCDA9A1E44
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36F711C26E60
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 09:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCF41D8DEE;
	Thu, 17 Oct 2024 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pu/YrOH9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7BC1D9320
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157194; cv=none; b=eyooyPutuqUCAn3+4Hoe/hdSwHzHRN0/4SNmpf7AjAemPXTqOLGMnbH2/RtezBQVUddytuSlEdu/9KQWts7IZA/F+kGpNa33Pj45/7vSl0Tvz+Y5fP3HmLLVJNCqC6GHhpYcndsy5lQWXtCP5LnxoREOKILw7AFyse1gwaWh32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157194; c=relaxed/simple;
	bh=YlBZ8ANeF6BBVWaTvCCXMU7vLWosqmEku101sALjfpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fF2hrhryf9xwtn96uBz/rJ6yDmgtOTm9QjJbSOQ9O8tH3kVPyF3INjmUTxC3JtubunvsrL4T6gg7XD1BHoJqcCP9JxL1stPbFRt3rvFKFgZPPKmsPgMKcPSrMT5PPb9T8V0W+QGT8+3XTQEQFVJEh+QkYqKtXBvuXQa3ef5ciXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pu/YrOH9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d6716e200so87489f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729157188; x=1729761988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfyIWnwV3lwGADuJG2fMylvg2BoP0K51z9HWPYMPYew=;
        b=pu/YrOH9JgpBiTYyOmEtGxwYYrBnwp1YhlJsju0Fcji2OQyZ9ggoFYogL2ErHqXmqi
         p4GLw2qhhMgkhLMd/Q3DrTe4JE7FTjMUdMw50pfixGYlLFyYt4ZAyaFq9qUf0gDAyLlX
         GP1WG0ICPGGtN/sCoLwB87p+Z0ggkue5hyZVly0QKm9QnWtPVR0zGDin3yPiogE41F61
         Qp9Jo5M613JKqNbJxaGbR3xdMiqKMrDBt2En7V8O7ymFZB+NUAk5FIGLDeXr5V81g/HT
         0KQwfLgMe0bcS/AkfjQX6Dpn/xAfxIz/n4xLTQWzi5bGaxSkLblg6Mn4oDH0U8w+Z9Mx
         DnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157188; x=1729761988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfyIWnwV3lwGADuJG2fMylvg2BoP0K51z9HWPYMPYew=;
        b=bueRr+d3szSdcRA1l96VGDqAYazE6nobpcysiekg+TKZBsFhaS2EdWy4ChTAC2FIxx
         HPETTU/BnmxJSBj/1T2oOnZbRu68lRO+MwX5yrI6YL48cS8nu3Ci1xBTWcxNBxQW7Xt0
         muMkHY9UGkT93hOITudUHNMg8+aiZd9Ses8bymz2SBMHqC/UYZNBJ1fuo3VFx1WEk+KT
         X2FGA3VgF3+K4S1GyZI5SYH38u5rGDtLaTZtI5K3BZe8k+mMWZ/QGcD0Gmu1mS4jqTRx
         79clCeM6cL4jW+TzUkkZLKDmn5E4oYQ2YuSTetM5MMKwiQpKa+b7cjCvTfNzE92qoqFe
         81MA==
X-Forwarded-Encrypted: i=1; AJvYcCUKft4CuWeWD4K3P1xGVmgSoBcfs9p/G7r8j6J2Lv3+RSXLOa9LI3/CD6awSUs+kU/+TuAI8N+/qPeF@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmFe+FwZIilWOi2BGdjPcPR+IsxsNWJkMhbm4IVhsYvIz+/iA
	aya+k1Dmrwl3D3mWt14fsU2dFJ9S5ag1LGAwRyxHrbG1MHqDa3bt4zMJqOsObPc=
X-Google-Smtp-Source: AGHT+IGOU6k2MtDmw6MdujNHCbudW8CfzZOST7qyTYi0VNT1WiG69IrJoMk6J1SI5CvMETooQ90WQw==
X-Received: by 2002:a5d:5889:0:b0:37c:df55:c1a5 with SMTP id ffacd0b85a97d-37d8af0e253mr1837172f8f.6.1729157188036;
        Thu, 17 Oct 2024 02:26:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a2a8sm6647539f8f.3.2024.10.17.02.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:26:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
Date: Thu, 17 Oct 2024 11:26:24 +0200
Message-ID: <172915717449.42475.12515160143106576807.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016154838.64515-2-igor.belwon@mentallysanemainliners.org>
References: <20241016154838.64515-1-igor.belwon@mentallysanemainliners.org> <20241016154838.64515-2-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 17:48:36 +0200, Igor Belwon wrote:
> Add a dedicated compatible for the exynos990-pinctrl node.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/5b653cb60275e1ad1a85f0d056a3084c4635623c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

