Return-Path: <linux-gpio+bounces-21649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5DDADA9D0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914C81636FB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946B91F3B8A;
	Mon, 16 Jun 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rwr5uj6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDC20E030
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059942; cv=none; b=gvUkvdrKnWszEPe9zetRLEr1gVfxoV/cTIhYQpZD8uPPoQ/cl4E0RfX/7B8/i9qNAm2utT2AhiYSzh7Y/7sY2pOj7JtrOza9fi4/wOPHJGKa1/tcSsNJO9o0Wv2RmzrlIQZVp/drbh7ymRbZFqaSZBzOsWM4uaWjleDZlHOYPTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059942; c=relaxed/simple;
	bh=emuYZRRsAsbfW8dtLwfIHR1XhI9Ti0TeclpaLXuKj8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLviR7UzMZ7/U4ylRULfNMha4m9MAUevcVCGT/8f9EqfR134agvCTfOdDNaT6NuHa34WGbvUeUPhIKyZbZb7v/frPYJLVuHbqPdpl2Pk0IucaqwOkhYFizTQtuX8W1yi6l0nwHaN/205tkVKlV5cKXol2XezdgHkYlC7mCDAQzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rwr5uj6i; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2766536f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059938; x=1750664738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkcvPSidlO7p10vWDcll4mLBY5FWBOj4Z5ozH1tkERw=;
        b=Rwr5uj6iG7+A25+ymEVrEZn9F3u5jsC6JRLVR7SNXGU5QCK+i3GObrIW0VCEfcj5vs
         hT8e862H5y9uxoIUYSTsRKAeotcSV0HJIemrpN28NFzPvI8J3mbwGTmaGeqQ8sMVsN/Z
         KUyGmd0XNuNaDHaWVqizcrtRm7YMDS3CDWqggq9jnlH/DgiMhkyUax5lm7xivfz7+Jk7
         HR/+RPYLcGbGC/V7sGkgwQRvkXWGHcIPyg5POIE1rvXXeZIZe8bdj/gzCpfGe6B3Qs4h
         i4+uP/3nxDtjSqKfu//B7TBUedStmSttiOeeBQFDmHfSWy7WMgbSs0DQxqc5iaAlkQF+
         uAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059938; x=1750664738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkcvPSidlO7p10vWDcll4mLBY5FWBOj4Z5ozH1tkERw=;
        b=wrWj4O9JfMazt/Zg/QO72CtmZAHcdnDSyXs1fG72K/39IfxPbRyJFFMSUspLFR7PyD
         SfZGIJqvVf3IoaT4xPB2r6f2+lH7nXk9MciS2peSV2u04HSkBeYe7M46Ex5Pr3yPXsJt
         l07pHHqa+tUccs5TiqFmZXqA9nOWX5tlRNhUSYvrHi3+Z5zvuPeLctkNXGWyiaplwF+L
         7ImPwhOlesQycK0JN1XZbDb1ihT8nt9FMqjVlFYrDsk3fH4t6XV5P1fxLB4TCAk75THl
         RGzR8z9qBhuszTsu9SViu/X0MPiLzp2HPAOYXJymjl1r+rE8mEn7arYJOCaIIwIj77Kj
         eJUA==
X-Forwarded-Encrypted: i=1; AJvYcCUWnCIJiqnKaX5XtlHfF9QFYhlQ51VO42UxfSN+taPDKjQWBD+kA13ucm+yZltIKRJO0DGHDZCiK2z+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Z0tWhzQ0i4/3wfBrD3CEeRgxa2ZCcEnODkafbeOnk0i6VeCp
	zccwbaowXvNrC+GfU/F/VoGXJ5wP6XFctRkvCi060omk8cbhsrqiRW6klVQQwVh8Tuk=
X-Gm-Gg: ASbGncublTMvQN9gvkJfu7ds0hIn7C2yuJ+PY6hXnmQ2QLn+rBE2DPK+u2MRIwOPVrM
	SB1hszwSHpPJkynai1HdXOP07eJiyzF1BcQ8MoBNc9S7+3diUqjWP8GdMBe+0yHRSr5I3UTE71p
	GAxfkUnWNjWoW1qZ5MAVjefwsjjbLqGclOHGuF7pSrLjky3BVgenhJfzE/ojkJaTDzpZJvI2g9U
	GNt0pTsmAnO7QHYqAJMmPWfaJ6QgfmNf9ic1UzBvm9QyYOYPk1dYnDtTPJW4UFa4+RK/Kxe/st9
	o0sVBZjy7mir6Dv9QbO2JHum9Pw5jpEM7B9WvKNBjvD3P75dlTbm9//c3vnV8ns=
X-Google-Smtp-Source: AGHT+IHa3z0ZuONg+scxBHZPdfzZc35NbDeT4H9xI2j2Jv9Zpz8bLhlsMxdnKEUqdd/SI/I3ccpjFA==
X-Received: by 2002:a05:6000:2289:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3a5723a3af6mr6913868f8f.27.1750059937840;
        Mon, 16 Jun 2025 00:45:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2b113sm10297163f8f.75.2025.06.16.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:45:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping
Date: Mon, 16 Jun 2025 09:45:33 +0200
Message-ID: <175005992380.16166.15596259788808709225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
References: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 09:16:28 +0200, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
> 
> 

Applied, thanks!

[1/1] gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping
      https://git.kernel.org/brgl/linux/c/bddfad9f7ef3fc73f0a6fb05996719adcb5082fc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

