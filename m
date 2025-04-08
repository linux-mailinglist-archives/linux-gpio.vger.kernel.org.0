Return-Path: <linux-gpio+bounces-18471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF0A7F8E2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752604203E8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B99C2144AD;
	Tue,  8 Apr 2025 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NVustdQq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F6219A8F
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102621; cv=none; b=MGGnB0BZlY9rJQ/giNPTQjI9iJQ/JhkWnko+ZCfAIzKFHOLy+/pJbfNJ4fv69Jyg7TUCxWilHQxKt5l3fRXTL728NBHn2wkci2kjE4RMb3HXKcyPjI8LtIUK71UcZCZ6ouoPHmbYq1Qk2wf1kRQuW7pahummVIr2DRUJ6yYN8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102621; c=relaxed/simple;
	bh=mO6tgaOe8Z5JSxtKwXL9kUbbLucxdFSgSkaOgFnu0ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h64A81rYukOkAWuh4okxP2F6xVYO5Cvn/XK/4+lMMqf94wfPkzw2STeJlBx0mpagMcvm8GLgihd+Y3nGC3AAMaZLKzRph2nTxYcg8Xin8Miewt3Hp9alurAgkGX4PnxqKRaTjFXU6G3gSCqkAyAy7H4oO4NRohpm1feeU5PkqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NVustdQq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39727fe912cso2286327f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102618; x=1744707418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=;
        b=NVustdQqUcbzsDgezdlU1okpXJ/hRuZd1MIxzTu402R+uQM2u998bWr8Cm7u+u5bME
         zDmSj/3aiVZtbpcGoNWwb2HtZWeX925zv569sTdjBKWnk1uYaLgW/xZCjHf5A5mfa/8t
         rqa0t4/baMtmJuHaOWEz3X1hv28mFT3oW1YKe76OdawwQlNJZQgsN3hX2sRpJfWLhlSv
         dOtsvFoowlJjdgquN/wMHf7ZCB5IF5n54KY1AW1WxJPJG/eeqtqxk+WBiuxh5ggEY98V
         uq63FCzpI5SjdlqdOI7PXLvxFKEi5y9ePYQRoS3ovUqtIN5ta5GFtt3ZwnfuuR1An3qt
         flYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102618; x=1744707418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=;
        b=khQ1dVYSZaxPIy+T8LCWKJyIiGEQCgdl3QY4FYI8RF4sR4EfwIUVEkBw9WAvBOEafG
         GjxvLWbC1Z69IfyfOf6uMCiXkfI1jReu8m1iQMbfZxpPnry/bE67b9uYKaSoCRqOP2+f
         d8Rf+nStp+EYFZoYY4MA9w8SuA7YbKP5B9CvSU+w0sqo3fjDFkSRJ6QQz9AVNJepzPyR
         eT//9dmn2C1s8yA10cgf44u8ld+qu7I6Xsm+4O24BNJI4vjqodpXBKuyNa66YzlRIFpy
         PDvsju2UOKrn7+Ihv/GicIrKXQjQtPFHwDN5wTxNQqWGf11XqhYMGhF8MCx9/D7hpYXN
         sx1w==
X-Forwarded-Encrypted: i=1; AJvYcCWMwoJfEX3wO1fRoosAPqG+W0NjHGwcXOSkfQp4dZFqZRrEDIa4J4H7eoaDbqj+J/qCckmM+DS7tr8X@vger.kernel.org
X-Gm-Message-State: AOJu0YwVh8mTtQwBYk0fd0lNS4UJbiTJ3yn8twTiJYPrItEArTNe/RVj
	TouCC23PBa+CHd6pbq9rTljgvHsR/pOXqQSplZuHvROTMUix9YmwiTbu7AMMoR4=
X-Gm-Gg: ASbGncsC8H3LijNzSgg8Rd3WlDbeKxeIDN/O8Euf6RShU0RvaZdzzUB6VX3ptDDFDTV
	r/PHHlDi4RxSTC9A6O60W8jx7GBLxpsQVvdhU+jtoGHbWPKf2WIN85jdUeqnQiay97Is0B2+7Fr
	Fg0tJXnFovVqQtejHIxTYB6s5azr5Th1YYetyazYRcJsIqjxsAATBo8VN3YUXJXXj9m9vOQpBpb
	tiFP4fh7mMMp+EAXrlIgqlOL8i0noN2RsprOeKSesDNqDi+BWbIUEXr6XIQR/q1SO9NzZuuvA9U
	EPGLpU++dDfWCODbwx7MPWTt/FHIEeJasmZudOJWpAqP
X-Google-Smtp-Source: AGHT+IH+3XHGTXWwLQ8aHwnlELIPNmZTRMwkmMqzpY2GuqnkctbVgWOC3EDFl2D0p0YtAgR3d4+z2w==
X-Received: by 2002:a05:6000:2287:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-39d6fce1200mr8698026f8f.40.1744102618452;
        Tue, 08 Apr 2025 01:56:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d66csm14778725f8f.63.2025.04.08.01.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:56:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
Date: Tue,  8 Apr 2025 10:56:56 +0200
Message-ID: <174410261480.40984.15525439488118757533.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
References: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 06 Apr 2025 22:22:44 +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> 

Applied, thanks!

[1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
      https://git.kernel.org/brgl/linux/c/da47605e43af9996eb46c8a060f259a8c34cc3c5
[2/2] gpio: zynq: Fix wakeup source leaks on device unbind
      https://git.kernel.org/brgl/linux/c/c5672e310ad971d408752fce7596ed27adc6008f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

