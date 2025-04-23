Return-Path: <linux-gpio+bounces-19214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF5A98876
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 13:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 667A53B4C46
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC5426F465;
	Wed, 23 Apr 2025 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h8sdvKIc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E91FF5E3
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407493; cv=none; b=C5zGW2ikUZT6NRLv9WCieY2o69WjTjRagDnXas1rFxEs1U95aHm3rjKrB9yI4NKum+24PXOiuAgp9pBFQE4z5AFRXqy5Y745VRXqRnTOmJQpmKjLcPjUmAmprU8AxBcCI9eCsJAXY7Gtx7oQ+QCats2gwjksPrCvQiNTszUH1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407493; c=relaxed/simple;
	bh=cHFBuV3l95HmlX0HRQehmp2u+wdgt0YFS9/N24j7r5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5ROdYWhLLjYEFa8ajKjELFhYRikLKK0jja5OwvGdaZ7Y7boL0LjeVmsMYqulRzTXzvhXHrmSoOM6lr9HsdjRWMNCXxfqrBN21MslK4IQEeEbccg8KxyjNZW9hq9bX/KYPgEdAwuSIjeq8ePONG0c+xAKo0KItuEG4WwNKFGVos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h8sdvKIc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a064a3e143so957115f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745407490; x=1746012290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D5d0p0+CzfBNxQlb58oVQd56QarzNbrJ/V6/Prm+5U=;
        b=h8sdvKIcgr5C4YSudpWmUayOWdWNFU88hrrTyO5g/CLh5M0xQPhhUQeVLxdi+ePnTS
         cIql7fbEXB5omiUilzIjnKjQGPeiWEgqqFwJwky6/TiPMlLve0nFIRT8ou7c3PS7seHR
         MqpfGQs4uX7Uk8C+hSB0ZUn9sUoLd8ayBd6inzEJhu+MGbTAZQdyN/P2sNT8imd6sdJk
         NFvvl5w6tEILvuRio2aJgJB3xIdt1GJwPJjmAbsBCNOJHp9GkuABg3VVkBAr2AdNB7eZ
         rExlu6dUJdybG9H3WV2UOzToNi0eobDNPqlG9S80/dQldTUIKJJnWwA02mkarCZpHOlX
         GfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407490; x=1746012290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D5d0p0+CzfBNxQlb58oVQd56QarzNbrJ/V6/Prm+5U=;
        b=RpYj85ZLHDCr15bI4EHhzCmTbY9+FO0gvNj+uvlAfA38kQhZioDE/pPaMa5GZ31vm4
         TZ/f+zO3m6vJSI5VkwzKYBWAkd7u3vESj8CiSRgXgM1N943dD/SsLPsfFgisKs/6YY1K
         nWa2XqWl2CjSkWvzI53ftNghpEHq9KwJ+GQkvEmRsV3Cd28S38GsKItFfvUkr+esF54r
         JdNY3oaNf/bBhBtxYPdNTIFEwD3GikQFcFfoRVVN1g9ToqXquAgUlqg48mRIRrEdKbd8
         g9VtfK8b43/Hdg3na6RVVADgxazGalWizMljnx7944xJ0Ehq/fpwi14LknPfuYd3TWPW
         Zqjg==
X-Forwarded-Encrypted: i=1; AJvYcCWS7Slje+odBVQNxJ15buPr0LbJSl2jwaX/qRat21tZDSl+P1kAkyHe47vjA6LVDAqPXp7foAosloMY@vger.kernel.org
X-Gm-Message-State: AOJu0YympjEb1pamrSvGrwiDKnR/Yq/mvXqqbfgRSZR+MnRwebOg7XFJ
	5HjFW8W5DicnXJDmoTng4ZmuGRjJLR/t8hnCUjAFh9xMUI1P2WAYj+Y2NuBTb3Y=
X-Gm-Gg: ASbGncs1HNFVmqqMtBVg7dENkCjV+84u9PSI95cgJzCjQixe7a58dmyUtIEcYeOjuMR
	A3MukmjzPJ13VTKjd4yU8G0JDzqDZh/vSCLvPnnN1iaGWdXoSprKXCEgBpYfS1AeNzGDydmAEd2
	aWuI5pSKf9LPQwT9D8NJGojyXWuSpJlsHQNc3TYevLqz2Gju00/2uyqifc1ACifYAzlJWqi8ktx
	nnAwc/+KNYZFjE0nhXOr54bQCaAZ/sdxJrHlcgiZJ5vigu/I7M0pI1VgCs/7SzsD/GOEQWS49il
	lXaAxoGJSItRSzzGGGpobYD6FaqsUIykexjDIOmPpmK7KyE4FTM=
X-Google-Smtp-Source: AGHT+IH7LpfNKj8aX2Yg/QnFauc8VJEZNqXvYaPiMRWZExQMqNqHNpeTUn8yHI5yDNGhSuzAozUbDQ==
X-Received: by 2002:a05:6000:2408:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-39efbacdea0mr14910057f8f.36.1745407489715;
        Wed, 23 Apr 2025 04:24:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433170sm18245595f8f.25.2025.04.23.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:24:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Jindong Yue <jindong.yue@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vf610: Allow building as a module
Date: Wed, 23 Apr 2025 13:24:46 +0200
Message-ID: <174540748240.56202.16807732358191356818.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416062605.1948856-1-jindong.yue@nxp.com>
References: <20250416062605.1948856-1-jindong.yue@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 16 Apr 2025 15:26:05 +0900, Jindong Yue wrote:
> Support for building it as a module for use on the Android
> platform, because the Android kernel(GKI) doesn't contain
> board-specific drivers, it requires that these drivers
> be built as a module and loaded into the system.
> 
> 

Applied, thanks!

[1/1] gpio: vf610: Allow building as a module
      https://git.kernel.org/brgl/linux/c/73dc041f8a60279faa1109957891b00d52496425

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

