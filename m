Return-Path: <linux-gpio+bounces-25594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B4B43D90
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A77D67BE11C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650D13054D2;
	Thu,  4 Sep 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWM/I8aQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FF2D6629
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993574; cv=none; b=Wwm+7QTzfrs/kztU6BfLc3xq1oSVQwZpq6lwZhxKwSyAlyArdbsyvVthLiHgguErjm2JGqbiD/zJ7KO+Os8jt7yOCEEeDqgVdbapKYVP+902JGmKYEjANd5n2aFC3oT11PWLb2pCj06u85OuXq+pJyvShIEI4qZ2WuiwoFF2+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993574; c=relaxed/simple;
	bh=tzrZdWUmau9Ko5Je+ScAN4BMnTd/A6L4sx0uQaFUKWw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gYQXURi/fj9xYsbmxoDHM5O6V74QaFWKuko6n6B815I+FOwLaADKfUaizoZc7GsBZEroQ91GMN349NdRe2i1l2ADspmOF468yVn1nfvPm854+L0THqIe+D+FE4BLnJzcau0ELWExYauaXExj+CeL6Av97oVLun8wOsmKgIUvsUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWM/I8aQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b00f6705945so10589866b.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993571; x=1757598371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vateX41qLmBe78jZzOt63uJFfCVkgcgyVW4UPJkHk7I=;
        b=OWM/I8aQzkazJJD8u4OG0BnAM4ka1XpiSM4N7jpxoap8Lo7EWM88L6dC8qMlyTN2/8
         Q5JvlidA1hit+HuCP1Wbim9vgQbOGZOJK2Eun69mon1PFjg+fueoelzBWYQwfoZFsl2c
         aP2ceuB8TnflzD1uK+OMxgXx2JFcO/B1s+1ZGT2tQWnzVexYXi6rcfphd+UQMHK5/rRB
         us5UNNl5rvI3AUQGYmh8PqA1umnqYS/pbIMxlgiRriNlM1GjpMoFcbmH6jRnz6neddFt
         ViBAW8zcrWOs+pqMwvrj5IjSTQWK7IP0XA0SPA63vvGn9V9ZJt6JtNtApfEkJ698KnJb
         e9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993571; x=1757598371;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vateX41qLmBe78jZzOt63uJFfCVkgcgyVW4UPJkHk7I=;
        b=jOrmxuBiDLEsx0dUIb2PHZig2M5JOVFIY7/0Er9pT9mRlWZ8TFWmvfWYvCqoaPFJXg
         oolRb0uAwQdiu3ZWHwi9pa7EoM/ieLOeC5f20F00fFMD7WF4kA9uCPlI5HhG/p70lM3v
         N6QaNkMa3WHyznU5HBMqKMQSO3EJpNacwrRE06cxqDYPMfxW2bhc1dWbX4Mmp1NbWQLh
         bl6svUzZakM4gfKjxA7UtNvKDAtsufvtXXhiPBMpjfY50HyZNypC5Ym2Ul7hcRQdEndJ
         UjtiwFdqYh1i4/5U+nFUI0LI9uwjvQqhl/5u/tEwUXc6G2A2kUztSSL7Ua+SVmsQqIUw
         6+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW45iPyRI+i6LoS2OQ5w5cGUo02E2Txv/E0KCSbyhd3uCMIGCyCBx+oYts7REWVR4HvdxwQ+5izKDFG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaa9Z5cDYaeyyab9Pz3S97v7pf4s5MBNwl6QFSFNVP41Qp2BUl
	/Kvp5HodV3JSrX+9AytrZYwFxFXmV/aE3yA3Zy6rKpd/9OEOTzPp67kYF2TSKZxUHlU=
X-Gm-Gg: ASbGncvhNRrvQFvzd8INK6wsBI+Hqdgly2dQXoRO7wkeidSA+c2fSyMQqxRyXCnkWxU
	iZZRMrGylDDHbSjZ3i4UfoEGk6G/Gh7vhPMmW80UAgI/U2m0DNgwhiSSvPYUeKWlSvS5g5cxR+z
	wfUP04xvMIppO8hlpDTA6GJif65JtU5WlT/mCIcUXw9O9yW3ohyRVK+hQsFcdgObjKXbm3hkpth
	Ei5JGY+jEQqw7qXklvrcyddnAVPWSGdEo/CqeQvnJhkgDm/hpVg4kzlxn1fpqw6TVBmf9kvdwhu
	78k9VC3heVNNs99wuWzQI3pc1l/mcTEWsGEDPe3X0FK5muymirFapeNSp8LXwYUEaMZ1dq4Lqpj
	SDAZlPneQnvQtgqMKf+5aP6C+v9o6wp5BGQ2UzgvooCEZc/stNw==
X-Google-Smtp-Source: AGHT+IFvWV4hrMxiuD4s72RuFmU5dC8uJSFz1ccYAGwp5WTz05lim7XPN1obF/dY5Raugo8Ut7n0LA==
X-Received: by 2002:a17:906:4fc5:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-aff0ee1dcffmr1098615466b.3.1756993570841;
        Thu, 04 Sep 2025 06:46:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:10 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-5-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054254epcas5p24db87bd64fc57a25b17c51e608f15e7b@epcas5p2.samsung.com>
 <20250901051926.59970-5-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 4/6] arm64: dts: exynos: axis: Add initial
 ARTPEC-8 SoC support
Message-Id: <175699356858.171312.4717453350737707503.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:24 +0530, Ravi Patel wrote:
> Add initial device tree support for Axis ARTPEC-8 SoC.
> 
> This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.
> 
> 

Applied, thanks!

[4/6] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
      https://git.kernel.org/krzk/linux/c/2b48947f7b03e0fea32ea2c6841a0d8cd67e737b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


