Return-Path: <linux-gpio+bounces-21747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30FADE8AB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88DC67A68D3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF77285C8B;
	Wed, 18 Jun 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0eeadOwM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A032828A1D3
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242006; cv=none; b=lgYNyn0qhIPqegiJeFCnEHIBykXCgyTsXBL/l74ezyNmoGvRK6qfaxvX1CohklrNkI9leK9nG/MrXaj6FXD/r4t/4Ds5JuKTi0gvS76M2R9XHZkcBUxa3J8kRB7Kfcq09d5dxPIojK2eeGe6iS6i9e0Ru1ene4w4NUdK6kG1x5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242006; c=relaxed/simple;
	bh=2apbo1VAjiKk1lNm+FMr3VaBOc2YRMO+4YX9+P2Qv+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iU8zJrXyusKTRzoywF8zQIFC4jLIthxsnswxNU6PXFpfOeVLwCzH3CYP/drZpySQxYG/fDb98vgW7KCdZtRxjfiT7LmnF699YEaR8w3t0X/9IvCgBdLOpymq8WRuyrYIVI6JnIyoAwIOrch4QCyo2lHZcNuSz8Hg0+EThUMQfl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0eeadOwM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso4540450f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750242003; x=1750846803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW67+sc6Zc76DZ5vgY+8wp/a5y2xGeEA86576Qt6UlY=;
        b=0eeadOwMGhXqh8JDeagBhUi/Ig0wJ9DEQab98BCOQo+EJvdwzTy3AYXEH6fAszsRit
         AV6MN3wTx+j/l5v7Toon51oAVQQRQ6a1dPAktOr/7zKHliVvl69DN6bpNpTR9TOrXRnR
         D4VIpWADqHGya3c/RtL1XNN52Hub/AXyzO3XDBm4zNX6MZgLOn9dokPWMJleNZzUvGst
         lWZBzcvgg1SQX2NyzfM/bNcQ4s8tnMNPiqrFq8Dfaox6FokWpKvR1xLVETxBzIszWIlP
         uAJcmXhIBY6azfV+ujbYDEHHSuDw5CzhdIcGrUowsIgysSLhuOBFVy3djmUP7jJRy5Dz
         PaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242003; x=1750846803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW67+sc6Zc76DZ5vgY+8wp/a5y2xGeEA86576Qt6UlY=;
        b=dqi3jHESL/TkgUZ9F2JbR/4adFqArG8VFmgw0NcKdniBZcWz1s6NtpviIhZhzSSW4/
         rXXcWjaFVx7FTrAKpVBDJr3qFrhVtlXL9zIIBVuNEZnOPtZxdfc2x0iFgY9Dn3FxGGns
         /c5uedJVm2DbYUqDgUFulQrffAroLpIYCl3Ceyw/YaqfReCt7fIjulB80OaKSAw4j0mW
         EYRhFgdv3VGjrvb6tekxiiLVw7wNp+5n4jRGcQGAwgnonT9Ft+2L9Z1urD/1bnUOrcPx
         cp1m0X1G/Fls6nvBnaML6Sjkae8Us+J9mZPuuun2mENYa0a15gx+m7K19+/H47bdOMu9
         pHVw==
X-Forwarded-Encrypted: i=1; AJvYcCUkpsBXv00Yy2wiubWHN4BEgNLxzDanx3jyVtUj9MQM8If3NAFJICH6r6Ui+NVz6qjTuKRjoMq1hsAM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3odKKtYRdH3pGSm6zRY7sqzhBccO4OIrPzMGDc4pJbbPK0ok
	9EYyIxL/O2AXg8TtyVgOEHvGJO5HwQIglskleYiL+wy8ETWLFzZDwWRppCa02JxKdQ8=
X-Gm-Gg: ASbGncuz9sEyeGrdoYn0WHs0xf57G3zAp4y0lk9BPw20ARpANYDIpQn6Fx65VC5tOyv
	q4kX6DX9ikjfY6pawF7o3RcpMEtY3kJavAdU7q2ehs+z8rf6daMSjsqDHK5/uiPT4sMw55uu9oN
	p7xZIwfVw/FSXpJJ2vJHAtlqsuZZaav92pFbD8cEYGxqHOo1p7UI0mH66A5mbSEdQCSsDsZC7qN
	Y4AbpUQOeH9mLPRESNY6Se4aWSC1QgsXXQtUDtifNHDcITs4X1eORQk7E+ek2gPA+53C4RFRNPt
	mFwUv2GOxKQYaATJVT8e6joAtYrdmUqW9Tjar0KANnJljtuNI2ZGSRLvVHBRag==
X-Google-Smtp-Source: AGHT+IEqdm4+loHM0UpDpWUhxyzO7ABlLJ762PkFX8cWeo6PhmgbjvhCeqB1tPa2BFUHXqGRfJTlzQ==
X-Received: by 2002:a05:6000:4028:b0:3a5:39d8:57e4 with SMTP id ffacd0b85a97d-3a5723afc0dmr11313825f8f.41.1750242002938;
        Wed, 18 Jun 2025 03:20:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm16776524f8f.62.2025.06.18.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:20:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	David Thompson <davthompson@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: Re: [PATCH v1] gpio: mlxbf3: only get IRQ for device instance 0
Date: Wed, 18 Jun 2025 12:20:01 +0200
Message-ID: <175024199528.53110.13398795487748744879.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613163443.1065217-1-davthompson@nvidia.com>
References: <20250613163443.1065217-1-davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 16:34:43 +0000, David Thompson wrote:
> The gpio-mlxbf3 driver interfaces with two GPIO controllers,
> device instance 0 and 1. There is a single IRQ resource shared
> between the two controllers, and it is found in the ACPI table for
> device instance 0.  The driver should not attempt to get an IRQ
> resource when probing device instance 1, otherwise the following
> error is logged:
>   mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found
> 
> [...]

Applied, thanks!

[1/1] gpio: mlxbf3: only get IRQ for device instance 0
      https://git.kernel.org/brgl/linux/c/10af0273a35ab4513ca1546644b8c853044da134

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

