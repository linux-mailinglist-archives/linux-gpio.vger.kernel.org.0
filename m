Return-Path: <linux-gpio+bounces-25288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654DB3DA02
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B04C189A222
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 06:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E78D25D202;
	Mon,  1 Sep 2025 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUH1RrNn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62755259CAC
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756708404; cv=none; b=RRouRXcLNxG+4S14Yz1LxSUFPwR3uMVvCQTfqkGNyHNSHwS9EUluK7UHPgYzFVKgUvyqYmxRCl99ETLQ8n5f9+duN3lvrCcGcGxJ+xlCjCJzeOaan+HQzmks2KjmzQpseqMdMhX/ZgmzffmGIX7/VtSnErhWfepPJ/VT8g/aaYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756708404; c=relaxed/simple;
	bh=+CeJXa+e4zK/6sG28nGzvsAwOcZbN6tT4ayz7cnNcJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dRPqNkJsK3dvvlBHkISU+L99tsa177qGdel0gN8HX3MVirQpuzhB9v6tl9OGVqdFFpqrl0sr2R8SofMLUxM+XjltsDUywKfr5TzJ7t6i1gPUjVpi1Kq/zm+OMMQ3AvtGIwzAJ3Jy70Es8CVgqcbUT3C4r5VPk0hjp1qMhAx31D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUH1RrNn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61d1f60aac7so472967a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 31 Aug 2025 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756708400; x=1757313200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=;
        b=PUH1RrNnX/sGj0uVxSftlS47ts2qMTvfJtWGC1Id158DGBvbma8oIXFMxW7/2p147c
         0TVzzBq2YelCPXRGg9x/yFVpbIj1M0lssPuj7cBc7SZCTsrodalpoq/Q1r9OO+z0mwIq
         dxix2dgQ5Wms0deyjI75QDkwQ2l108rIjJDOhaH4LQf5of9yX/Kp4r+fOuJVRA1nSIR1
         1D4aG1bmBuiyLNDZjdRr3qq6diAlR7bh8L0o9XAx+bvK/3BO1du3otBiDokR5tB4KvF+
         bA23umEJJtg3etLSj7GavtHHNSPbqEBd+ZA9uAVoFt/2zgxX8AL/7Ofmm/8tZNvMZcN2
         to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756708400; x=1757313200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=;
        b=uszAqm0Qk43bjl14ySk5fOWv2MH8QU2JiLe8GfLDcGK/cTABvyNbHJEa4Utp5sLhu2
         avHi76Lf+xPASuopjL2rxhi/38s77gqk+xaBcnq9I2RyNWSoavvG60VrkLRSfqiVwzrs
         wWyBOdxm6DoX3Lxw51jzxyMMf74BqlO3T5OtRAKh/djRv8Obn87DuW9rkhTiGtP9kMX9
         RDBMdDYWrFBZNXmnE6M1Pb0x5lXXPI3UMu9NjwLzXGjJT/BoDRfOn0kmc59HoLcecbj9
         ceiHbak8ojxBI9mpoIMTxojg4SBkLDdSelMKQ9u7eMwe6SXTLHi6D/ia+iY0ifuEZQaW
         nyGA==
X-Forwarded-Encrypted: i=1; AJvYcCXnMr02BcSNVK1h8bQxUxZXfIQnKG5LaJIk395oCUrVW33a5rCJz2RhJGZmCOin3uV0JXlSBfE+7vfT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83NARvz8CrqO+dtaWqBOVoRJ6mjfomYJqKCLWZPmeAjXrAlfE
	fMZcDi4sYwtBEzv7wsXHLgvwJLMZQ5lTxwQXBxi2iwjxx7DhH7w4ZdARSHPOLXm8iH0=
X-Gm-Gg: ASbGnct9wjuBzgEgkmbn8wrTUnzsAc0Q9CScWScR41DpQGP4oTf5efKL0BtmwyHR8Gv
	CgtIPRSRL78kHbkrPfWJvtvzR8Get8HRF9dcudykpMexBzv8+8Olf5uJV4HO/TjiyCQdldBtZVm
	V46KAEL2UbN2BwhShDj0ADtgdkuLoARoCT+rvzGkwCED7iQeXFQehcCZ7Az7ONq1puSRcZMKEuv
	3nJH044mTEOWseEN6zESwLDVyF7CzkuBOw5AnYGNNMlqAEKIt6zhX6x+sVXli20kjym9NpasuRc
	yv5ZdwMEyaY+eZFEVH00y65lZpgtLeCYFxj1jO66ZpfceCzX8NlQ4iATMNP8XY19HAHUGUmRK3H
	Bc7b3aAcfax89CqexMEIFC14lXIw1oDs2CMPY9nM=
X-Google-Smtp-Source: AGHT+IH2EH71GqZysZaHULgZnawZA/ilqSzMTKNSHRHdyGYISzSRl8kS8S+lxJ5IgYxfEUW2K8qFqA==
X-Received: by 2002:a17:907:3cc3:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-aff0edc4d6cmr519702266b.1.1756708399621;
        Sun, 31 Aug 2025 23:33:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0420ec9787sm266471866b.72.2025.08.31.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:33:18 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-2-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9@epcas5p2.samsung.com>
 <20250901051926.59970-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 1/6] dt-bindings: pinctrl: samsung: Add
 compatible for ARTPEC-8 SoC
Message-Id: <175670839704.114610.3984450537189054873.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 08:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:21 +0530, Ravi Patel wrote:
> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> which is similar to other Samsung SoC pinctrl blocks.
> 
> 

Applied, thanks!

[1/6] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
      https://git.kernel.org/pinctrl/samsung/c/03724b3496cb0272a5050a989ebf2494b1ff5a55

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


