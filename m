Return-Path: <linux-gpio+bounces-5936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB38B6C03
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 09:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 487E81F22554
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 07:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD923F8DE;
	Tue, 30 Apr 2024 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdXxaxXs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A133EA98
	for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462965; cv=none; b=o4zuBoodMg6iyFlMoVwyenpyZIQtsad1SNejUADwxGkMbscdSsxAgtVLh499qYmBdfveQ0BGOQlcgBmDHb7pThYNXwLihdZ78PaQnlSOpT2RRs6htW9SHFFCzoR+KkB0rmTxH4VB4aLiVdMyfoa36ZOrNIroko6sK3FR+oaEV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462965; c=relaxed/simple;
	bh=6rOSQeWbEhAv8MCLaqz4msA0/THApX/ROztnBEcH/ZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=auHKjPqw9COJpJpZKhej5HiQeUcoYCAbxyWcsygewVuh0q3kPIDXIF7peAmFqtfUxOKcvDGJKoHriLrLyTUnQptSvKptD/RSkWtDjJI3majTlxSPuHNk5gt7KFiQuGXfdkd9g6LvS1YceFjQXEUGMoLSLX3bm6kcNI1FcQiaSSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdXxaxXs; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51a7d4466bso587616866b.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714462962; x=1715067762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5p+Hhe5o0oz9SnrKznY0Fc+JFHlQEV01P0MQ+lMur0=;
        b=TdXxaxXsJ00JCbd4wmYYur+0wi5UWdEXowlZwsXZJTVUhOmLJbm4DchDvOG1A4e449
         ldyDHYDL33k3hVJPInivhD9pYDQ6dgoxmux0Ofsoga8pXHkTrDKgAVuNvL0SIc9jYxc/
         NNg2p6JNO2BL2z5lVkoVqfJ1ex2Y+fhxiULsy22sr1KMAObAxsrYwBq3tt2AxopMDB9w
         xF1fGQ8RdCPl5F7PzeqSKCMUu7T5WWUsTEwIXyfhwYIa8dGfAj0EnsiTbeI++Uw/OJEs
         21aZX2UCCjkD4jD6dKO8PNvwBAQ7fUqNE/qtRomTH1Nz1ArqwhNfvyIxCd43qu2NqECl
         4hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462962; x=1715067762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5p+Hhe5o0oz9SnrKznY0Fc+JFHlQEV01P0MQ+lMur0=;
        b=XELSUqHKkde2WtBBE0qpYhOG8Ta3OpTa81vl9D2JsklRaXXMMXvU/jKugU8oLAVWwM
         vM07rxRdXSqCPG1gryGWCBOo+B5UUPLew3VctL+6IIPBq9lRP9MCCvzg6i87RBgorsRC
         vQcfUWVNoHwcRKxt29CFaYDblS3zw3dzrZZFIeQASPqydvff5tfbKeajN2DaRfarnDyy
         mvKmrDCq33IBgclxy3Yi0KDzoqeSbCUmmFeYiruJl83iRvf8kBZnFMj72JY6l+XEgzl2
         UMXCvfyTvA38HvZffHk6u4I5r+KyiVbrgyc9Qs3D9kOo3htgkr/ur4aL2SssNlzXb8i2
         117w==
X-Forwarded-Encrypted: i=1; AJvYcCUxfrto6ZVEn8/+wlgS+lIsRCFegWOS3N87vM5WE1oBcwACow/ke2L0xhPZ9BLdbAb1WgI0CocCSzrMwWlH4kw6LlJzfJF9dFzCHg==
X-Gm-Message-State: AOJu0YyGX8AmHKlEfy20+g5CwZcIYK+cjdjFaRc/k22ZGiUFW758/1Q8
	0lMEOq0woW14zfv09ULTJtaVSaiQt4yeT89D570kXQ5MpkQCIZzNEwIIpK81MLM2Qv8NYeTRrbq
	j7pg=
X-Google-Smtp-Source: AGHT+IGBMuRm0U6K3jNaqA1YmMlR1gvfu8aRSrgUg/G0JYE7jjhY0WN5zoh6hbRFgw5euhqtv+xtKw==
X-Received: by 2002:a17:906:378d:b0:a52:1770:965 with SMTP id n13-20020a170906378d00b00a5217700965mr7467711ejc.42.1714462961803;
        Tue, 30 Apr 2024 00:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id p11-20020a170906a00b00b00a55892e840bsm13175844ejy.205.2024.04.30.00.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:42:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20240430060304.12332-1-krzysztof.kozlowski@linaro.org>
References: <20240430060304.12332-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: drop redundant drvdata assignment
Message-Id: <171446296047.37280.9740688458228801878.b4-ty@linaro.org>
Date: Tue, 30 Apr 2024 09:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Tue, 30 Apr 2024 08:03:04 +0200, Krzysztof Kozlowski wrote:
> Fix W=1 warning:
> 
>   drivers/pinctrl/samsung/pinctrl-samsung.c: In function ‘samsung_gpio_set_direction’:
>   drivers/pinctrl/samsung/pinctrl-samsung.c:633:42: warning: variable ‘drvdata’ set but not used [-Wunused-but-set-variable]
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: drop redundant drvdata assignment
      https://git.kernel.org/pinctrl/samsung/c/e5b3732a9654f26d21647d9e7b4fec846f6d4810

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


