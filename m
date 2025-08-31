Return-Path: <linux-gpio+bounces-25254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9CB3D3A1
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 15:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F28E18942B3
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 13:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4383D267B89;
	Sun, 31 Aug 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaNuscYa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359C265CCB
	for <linux-gpio@vger.kernel.org>; Sun, 31 Aug 2025 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646897; cv=none; b=LKLF8bsc47m8tsngnIygKhfjn+ur1sUjU8ONe8w/hxd+FDv6CSjkFJRs6JEkq0a0sUgpAY9wKZ7Y64KChBHMqUYh2mDu8ocaBGfpegbsvMvjJUB/FzdOJJWGY6yLsa0Lhr5xXDWhlZ5geL5uWtoIePErPwlD00LsPjtb1sPfGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646897; c=relaxed/simple;
	bh=4724Qznr91+tj8Y9/XUYmvNyXil/j8ZgBOQhRyA1BqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YJHiMGDJYeOhbsanowvfMxbLVF2kEiZBjqs5F5YS+V3gv2/ql4qb2ptaZAWB5mKdTqhSW+LOhOAJz4tAtu2EWNSQ91FE30ciExXuvNAHRHcN7Nh65iLQHho/RFUxbf9sR40X3/A3z05GTsIWvizmjxv6Ij1mK7JrOWsSQNBbCvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaNuscYa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3cbb5e7f5aaso499382f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 31 Aug 2025 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646893; x=1757251693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=HaNuscYaAfd8V7+N5pjuxFbkoakg48me+ZqYI/Jbe3/5ZX7oCiCYvCL7W0kDbxiI7S
         BIEmpdcmgyCuvrzWTE6tdkJqgS1uK+b5YlfA3sgEPbIZsUOL8TRjPl9Oh3XJL8/SQQEe
         GvgHzDwRw/BbKXj81qoKE6zXn1UH8bG2hlvGUp6wx51WZAjWzm6GfuW+VpZsh/NOQmPa
         tYbSJ085hnPQAdFUn9axpHudtVyalArUx/Mf1EEQKjqsAHTozrhz15H8TgNUOjX26H1j
         KI470sLMfNfHHd4UZg8LdxEYl+HkSgMozlav9qyI4ZS2R0M2Cw1O8Lj6DJl7ZYMioqDz
         HaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646893; x=1757251693;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=vFXchRvIXKHsyofN1I4adlQxwrgyuChzL8onGLk+PihfNaDl7bdql8DwVkqCM3jXb1
         d9HGUQQXBjv6iBLBLiEeU2NJ3mruSQvMY4xdrAHbAHXk6I28bM0JbUAfrHiev8EoAWRX
         c4cfZXZBEOfxZ/I9gQk2F3WwkViqq/dOLuyucsgIdsY0pgeVssn/1A7MfZJ+bZVhkoJf
         Cysw+RKqxZ6FYXq8qynyUmTztURTEp8TeJA1KZyD+Xoz/shoDfsQF/JdCqHDzNGAi6Ro
         MVYVDrIvvLKi30RzGRW+uw0XFQo5CUtydqurdIO/IUeI3RlMADuYnRkEfz60lhfwMs9a
         VRJg==
X-Forwarded-Encrypted: i=1; AJvYcCXx7h2tYebKXLn4AI4vSz5c1HrSSZM6X+azY9+iLAFMnVOQvWcOU+gnBoFYnhvbkV3mXDi44FHzjWCK@vger.kernel.org
X-Gm-Message-State: AOJu0YzSl+GEai5Qmmwue269a5EndqMuGSBrtFJ7GfILjNT3rC9Z0ghg
	hf0pFSefKqWwegpm2vijDJMtX5WdaaXxWwWQ5adZz3XKT4BEKTHfDOxAW0wL2TghKmc=
X-Gm-Gg: ASbGnctzBUGdxsYd0YfPVCKQCT68+w9fofhECJePn6aXgLVbkKVXe4tBxHsnNCGSnLR
	Yox7KUO7Xch/yv3tM9FFsM/NMcNOOTVll47ii01fxu8G3fJvHKfjke/1uMeClneMaXqIow1+/PF
	OWtWT8EsOYSCSsNiixtIwGI4OD4NSAz+cZxjSlb7vzNQio4cnMAn9HeYnkF2tT0OcLvWj7lTI1/
	MFt5jBTCjD9t+vE3i2ZK4ftvnWe5cUXi4GNFUzZ97sZsd2zuDoav+kXmLjmiRxfn23kD0hybP2O
	9tyw9RTZG3VcyfsgVQdKnO+MS+FGaEjUzNIeKsBVt3ZU16nzbRwqyZyIu4DiXr5E69iLZ8i/1Jp
	FxDCLJsR/TD7N6njy+5u4kNFoelWX7ccc1USGLxIqEtvceOiuVA==
X-Google-Smtp-Source: AGHT+IENOgSWDvrR5me5DMoY53wRwsPVCOq3Mq4OdX9AjWmXw0wgs5GSbqe1NiXMSDlX3rSsquKhHQ==
X-Received: by 2002:a05:600c:4e0f:b0:458:b6b9:6df5 with SMTP id 5b1f17b1804b1-45b81eb0a80mr30834275e9.1.1756646893387;
        Sun, 31 Aug 2025 06:28:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-3-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120704epcas5p37385c913027d74d221012c4ae1550c73@epcas5p3.samsung.com>
 <20250825114436.46882-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 02/10] clk: samsung: Add clock PLL support
 for ARTPEC-8 SoC
Message-Id: <175664689125.195158.15680456692339310248.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:28 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-8 SoC platform:
> - pll_1017x: Integer PLL with mid frequency FVCO (950 to 2400 MHz)
>              This is used in ARTPEC-8 SoC for shared PLL
> 
> - pll_1031x: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 1200 MHz)
>              This is used in ARTPEC-8 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[02/10] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/80770fccb7f60b0bc795852c154273e511f296a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


