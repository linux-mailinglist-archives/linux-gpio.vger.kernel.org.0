Return-Path: <linux-gpio+bounces-25353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA58B3FC8A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83BAB4E3567
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 10:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5039128466E;
	Tue,  2 Sep 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHlSbO4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DDA28313A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809184; cv=none; b=SZAHbQe+MUTEuSC2AvpaAW6gvBSWM9DAJ0AYhza0XnFOPFaGgpvH38Uw9ibQfq4Q8qCa1NwnquM9pkc1s8Lf9PqYn85nys1kNEtp0Y4p1F6WIL8yX4wARuvL+eW3Rbv8l0/tajBnmWzZmzwnlMl/YNnJk3j9d7SScgD7bq9zOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809184; c=relaxed/simple;
	bh=D6kMRVNdjTsHxomh8Umwb4E3q6zvSzEKkpefTTT/TzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UcYRtn7//6g7t/C5f5KFHNKqQHWawCzUxmOxWUMS+C7XcgJF+IjmrfU4SsGL8DIv4CjY8CG2ohXkIHm5J31I99KbgFWU7ox6uqd6lWHgr8huiRiW8VgzgNDXuiecVFeO1DJEii9SP0h+8kOVb2vx6DLV3rRwF586HYB/+23c6V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHlSbO4n; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb731ca55so97287266b.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756809180; x=1757413980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=;
        b=fHlSbO4nvFRetVrpPRB6bgLDTOjU/qdzNl0rZ71B3InipDSZ1MMMwMdo0PGcfEL5fs
         LFcViE5hQl7oi3c1I/H42PHnYeiW0RuhqNAB5gBMg8GmrETEHccPan1j+rJbMaGascMK
         iKCzMW4cWTyLr91cs1atbLg6ElGZxk3WSWlILzBttnb9qbrHQ1vOBbfwNU05b1Yc7NFu
         MybDLmgRpIhGt7xwGNl86t/MBneCuXcCAA6indKsJqmAb2qxeVk5NCbjQuzqrXzDVBQy
         md6/0xArDSxaVZtTZgD3+dLVg3dnnldtBI2PxQur+Ids+bNhFw/evhQ349llSXscnzJV
         Itwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809180; x=1757413980;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=;
        b=WgVpka6MrfU0FtVH0iXg3XY3Chw3GUfElrh6HPTZchUJC7AgRrwQwpOAACW3c/oRqJ
         I2fpnOB58GSn0RIXIbXqrq43uQZ5rLFhO7S90cgMcHkDngWhITgH3IZCTviIEkXCwpkx
         qSNiuwl/+sTxs7VVgpBOpmYh/L6f1F2q3+KpO2KrU+sWKDj3KhOn8Nl1NOCnXsg288O0
         n6+3ZOh0kfO6MNjkoA9yMPV42NkWsKVrOvkOsHO7u+6ajlZYrhro+MJQRgqzBjfcGYAu
         W3Co9c+VQFY3SPVVnI7sxDF4IRjgO3jdcF4xAQiPw+KiwsK7skz2AsrUoUuAVSR8kC8q
         28+g==
X-Forwarded-Encrypted: i=1; AJvYcCWs0UY7iy8BFvKgy52FHE2nra318v37362ksyIaQjE5ThzpR8GiT0h4dRUcnVjF3Dz3ETMVcBPcisbM@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQCg+wiohhXIxRi4rS0vjsh2K09lL3evhZWpViOkwBi9kpb37
	XevtsBG+sJT3gxVAJoG87yrqsKb3jenwYwho0U9ncEvZ0v6K3ImWvQE0CL7riZi/YpY=
X-Gm-Gg: ASbGncvd8blRSX58bAIz9gouwtmeJc0T7odwqwnKY7vWc9+ySLn91DhMFgUsLONEskf
	EMwXlpXz48u/i8mr6vZf4lCBgB2W5x6mhuu8p/rDHSea4IugYYqeh6Xntt6ejYAJayTKlneXogU
	XYAwOmZOdfJsHW8CSwYxZma8V+813em4QWjNoBriKqVdFKQy+38oibRULkFKkjPnSEq5DZQtuMi
	yoVOiMbe5NSGHKlUtCaScHpQHrIHAUZVo8nr7fBr/c0trEFJkx8scFWATPev9y/AXXWd06QMIxv
	SucY/dsZcsAs2FNaRLr/NbZv6sa2uz6CNEuphGYyZqTTIcpsDUoifHxwwjaZNVhAUMH06vnuDE1
	UFzkm+ILoXPh32jAVFPD/mKG6AjX1VOODVZGcaIHjLd/AMjYorg==
X-Google-Smtp-Source: AGHT+IHAsN/656NaYDyz43thubEPzcHhs+/jF4e7qFvC7WKngX9lMBJC+gCJOclV74lgolxYOi8bDw==
X-Received: by 2002:a17:906:690:b0:b04:1457:93 with SMTP id a640c23a62f3a-b04145702d1mr390858166b.3.1756809180009;
        Tue, 02 Sep 2025 03:33:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0423ed35e4sm516431766b.25.2025.09.02.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:32:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: samsung: Drop unused S3C24xx driver data
Message-Id: <175680917816.135692.16731223900572881206.b4-ty@linaro.org>
Date: Tue, 02 Sep 2025 12:32:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 13:16:58 +0200, Krzysztof Kozlowski wrote:
> Drop unused declarations after S3C24xx SoC family removal in the commit
> 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support").
> 
> 

Applied, thanks!

[1/2] pinctrl: samsung: Drop unused S3C24xx driver data
      https://git.kernel.org/pinctrl/samsung/c/358253fa8179ab4217ac283b56adde0174186f87
[2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
      https://git.kernel.org/pinctrl/samsung/c/d37db94b078197ec4be1cadebbfd7bf144e3c5e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


