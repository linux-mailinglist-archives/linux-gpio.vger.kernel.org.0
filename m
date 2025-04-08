Return-Path: <linux-gpio+bounces-18520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A0A815A3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 21:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889068853C5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 19:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826E624EA98;
	Tue,  8 Apr 2025 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCsWHMxB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587E23F43C
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744139213; cv=none; b=aVR0/p3cyOLD9LFoR2c5l0/7qdUSRarxa6C0443PnwJHoa88HqK92RLwFxwn0BKQjl6Hg4qoR12U5UqT/xlPmEhTsDIErb1RRkHRUoLmU/rEbbjXdSS/a6WZbR1h1j2yurGgD1SYDV1NoYgGhthSb3d6fmSfUhOlXeEeH139Hv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744139213; c=relaxed/simple;
	bh=XDO7GZgIXZbIuvcgx0MtmUVNnpEHDttID7IaGMbJf/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RGtuIJen1YKd+svSg0xEz6IHV98f1QGdJ1uf1ueef5ihHWhZ2BF5deCjux197tlZHaxIWf+i2GoYnYAI9K6NFSHUvNDz76g7q32ASbNoFSbL0qC3xvXR1LNRt3y5gikwKgSHTyJqt+BMTa3pGhhdSKvhAhWHFWhPOGI3jVRrCHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCsWHMxB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912622c9c0so581508f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744139209; x=1744744009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=;
        b=nCsWHMxB5lf12q3hAcn3iKQHC+p2PIBTwTv3HsESAajJeiKAPJOWxUFsd9DrebpWtw
         3E1tVyXPnfZgpSPM//j6H9q8oe2HPARv6UW4HzIwfCxG5xhk7E9vnJdMQKR+Iobs94/U
         XdhNLIJ5grTj4/KQXGGnMb+mS1B+O5SDMy0DjtR84rgIRTxyZP5knmMX9msQuGYWVi5C
         btVU8DFwbqQ1RrhbupRBZQq1oI+8SwwaF/wKyAuiyfIiZyO6QkwcNhwZbzTnMcW4eyf7
         D/Fj9HWbVsoDAidtF+Mcl7LEShs2vcxN782FDPaYG2KcUXCQrMJPgsG6+LrEmSA9RUEg
         EKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744139209; x=1744744009;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=;
        b=PyP75SIXpkJxa6sba/BMrwCFL7ZNzDR0pqzpKTkJwmh0MoMqFfJX6Dn9ehS4oyMt8J
         Ed+69chsNEtZN35li2zJT0ukLfWlfPwQhQm3U2ANDgWA+J12yOAc90XjffqGG4KYKJHq
         gGvljJpPWe6xobBnVYRwuelnHCbeOsxzCwpSulj4S2fdzYUHj1Dj/SiPxEOUzsYF8ICn
         SWUOffuR1/pkPfQUMGmspISecGHbBjI+CLY+zgwSrwnjj40X77YTBqJKJbXUzdEhBi7s
         Ioh2BA8y+ZCnafx1L7UJQENvHi1KfItyAedewgWBOF1Yi9mbf8HWySI48YqFZd5bJjh4
         8Czg==
X-Forwarded-Encrypted: i=1; AJvYcCVJo2t0/DpRnWapccNp77c9rYjpBqTRzXDA8MVsiWayHn8yRX63c2LiOJft1b0R9J6WjIOCbGbvGH4J@vger.kernel.org
X-Gm-Message-State: AOJu0YyT1liG2lCyA7TE4CVWfsLYTHcLj0DAB48gmJ668c/r1i7ACbww
	7oUqV499yYZmWbnBrC+CMSjLht/yzyD/w9PYwrFeSwK061aKperWw1FATL1JVTc=
X-Gm-Gg: ASbGnctyt8JUdhtRGVbZSEnQT69jYLptW90HXA7UfxHLiQFN76fUYBfTYn7vbgRBUxc
	4fwT7/svt5s+QhSdKjOhBzWydY4g9i9Hjbt4kYVad2rPB2j51ji2ttsxa+gVa6PLn21dxv+IMfh
	BNOIH0iyWZmYRND9nlnmMO40Xfol02U4iodc9yoMo1Shis6ebnjm/HJAXfYBOrDMLEsDy/0KQJq
	MIjVD4aXojZtCWe27EeW8wy3sYWeDi1USPeiElompu84j3mV9K2y3LROS+hrVpooTums9kfL70R
	QDzOXEuYxzswr1H0p8UCjYDxTLEVg7DOhMzP1oA04+GhR7av6fQNsuwBENmYofA=
X-Google-Smtp-Source: AGHT+IFEmj19Sjp6m7XUEA3vyo+E8QmKaZA1qZbfv2jh+SPPFex3IJzzYfOY3+icqIou7/aTD5sG1A==
X-Received: by 2002:a05:600c:a016:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43f1ed660damr1024815e9.6.1744139209570;
        Tue, 08 Apr 2025 12:06:49 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da17sm15853743f8f.64.2025.04.08.12.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:06:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, stable@vger.kernel.org
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
Subject: Re: [PATCH v6 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Message-Id: <174413920812.155881.15584409813277033669.b4-ty@linaro.org>
Date: Tue, 08 Apr 2025 21:06:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 02 Apr 2025 16:17:29 +0100, Peter Griffin wrote:
> This series fixes support for correctly saving and restoring fltcon0
> and fltcon1 registers on gs101 for non-alive banks where the fltcon
> register offset is not at a fixed offset (unlike previous SoCs).
> This is done by adding a eint_fltcon_offset and providing GS101
> specific pin macros that take an additional parameter (similar to
> how exynosautov920 handles it's eint_con_offset).
> 
> [...]

Applied, thanks!

[1/4] pinctrl: samsung: refactor drvdata suspend & resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/3ade961e97f3b05dcdd9a4fabfe179c9e75571e0
[2/4] pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/77ac6b742eba063a5b6600cda67834a7a212281a
[3/4] pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/bdbe0a0f71003b997d6a2dbe4bc7b5b0438207c7
[4/4] pinctrl: samsung: Add filter selection support for alive bank on gs101
      https://git.kernel.org/pinctrl/samsung/c/a30692b4f81ba864cf880d57e9cc6cf6278a2943

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


