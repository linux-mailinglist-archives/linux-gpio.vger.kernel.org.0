Return-Path: <linux-gpio+bounces-6854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB48D3876
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67606B281B9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DA81BC2F;
	Wed, 29 May 2024 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TKXEKfAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD51CA9F
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716990881; cv=none; b=XxihNgWu3ZPdWhOiaPJkDe2TGPw+PmMVYsVISX6/S9VAPuVBnAazu6Siwm5z5hIxzIEWAl6q2+a8MF+NG0FwVh91PSLy4fwlOYsEljaqA+PIq5+1jjSY23z7K3oca1wPKIO1M3PwChKaREZdXKPSR++1oUi0xINFPCy+7FX9C1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716990881; c=relaxed/simple;
	bh=11Zh7dymvIy0ueaM8kyP1ZCJImodqwKxS2WSeJTnvTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XovjFsVZt6XHxNxr+6YHua3DqH/MvQ0S5OQQbJ6phhTb8wteRCkolGSY//sLAHRfqWWNuw4y9Or20FqJiATMgl6VV6I1ayKdEi+rIZwJwLpoXJ6BzzF2KgjHSZC9wWwKVD7MwWpQnlEmS/xXP88sLdHEFK298BTizVnOqu1PieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TKXEKfAl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-420180b59b7so18135975e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716990877; x=1717595677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cu0OKxrrUrCMupY71FO9BgTzzSaBF7qUn55ZRYc7CU=;
        b=TKXEKfAlXc2+3NFyJyveGBcjxI4wrhPPwYj/8v+T8sy1sEyeB+BX7cTVPnAlFTRMAp
         nAkDYvQdeFan0lPEd78HZk0INowYEA1ab1xjXUjpTwJp6LyRj7fU/8ggjVf22C3bbN4A
         3dX0jTPBQV6Tvi5yY4TioxSnX6NQvqBKOaQnjZBDD6mOTBqphE5AstnAo8x9hpyv9TLp
         UdDH18TPut2T1RgvOOkZzq6AI3/LQZr3ejjj6k3gRbYqC51iRXTC7886v4muvb+0lzvh
         CC5NpFqw29d/jnWJsVGsZ6e8TxnpdTZCiHSZ76+5z3mzr2VS+vBi00SFi7RD5RsW0/pb
         TRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716990877; x=1717595677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cu0OKxrrUrCMupY71FO9BgTzzSaBF7qUn55ZRYc7CU=;
        b=IqGXowl/jI3Cr85HiWDCoXDIbXJIUiQzYhCSo03aT+f3bEx7z/GnnsxnFmHuz7/fBm
         pi327PVPveK8iV3fQ/iNpggDpkBYkZSsoWlYhstDmcSNJPfePvmi4opMN0tgvKlHLucK
         GFRrSwPcpJKY7OHISd6hIiPeLCz1dMk9Ayr7oLUj3SbEwWxeJVJy6RT5Oj85oh+Zs8P7
         OMma0T3E19s3qPqCTV6p+hFchshbb+9fU4r28FWz1MRA8rs1+WnvVoeItGJrmKGkfVtx
         zlSddWLgFtcN4TCGmrnDPJzMB6SQCS0wqhFkQDC2r33jkGF2yjUzQpuqxMVX0MlhR2tT
         3xMw==
X-Forwarded-Encrypted: i=1; AJvYcCVNzWi6XsT37Ojz2NJVPoSGmZd2SPQjlXlPJT48Rfqvcbv1FC3Y1y+9abp0d5HOduHFB7DytZJBuFoWu1/GT7klx2y4MzNpc8L6aA==
X-Gm-Message-State: AOJu0YwceEbnUMtrgGQ2Py4km6KNnA9ALM1aao9fqQR7h/2ISWPfI9C5
	k35PSvBOJF0giYq3ffo76fVyD0Fc4Dyo0VHDB/mtwkjKp4/u+wtlp77DyW7P1y0=
X-Google-Smtp-Source: AGHT+IFUdeWc46YF3D93LD1v0yrBPmAVg4Nq48M0+cHWUChzwbXRKeoM06CnWlXyyTTXcpb/uwfOKA==
X-Received: by 2002:a5d:598b:0:b0:356:4bb7:b205 with SMTP id ffacd0b85a97d-3564bb7b370mr12873257f8f.1.1716990877316;
        Wed, 29 May 2024 06:54:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:f99a:a653:3792:fcc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c930esm14724745f8f.84.2024.05.29.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:54:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3 0/4] tools: tests: fix a few issues in bash scripts
Date: Wed, 29 May 2024 15:54:27 +0200
Message-ID: <171699086373.55540.8469156210776706848.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 28 May 2024 10:25:47 +0200, Bartosz Golaszewski wrote:
> Fix a few issues with tools tests reported by Andy.
> 
> 

Applied, thanks!

[1/4] tools: tests: use tabs for indentation consistently
      commit: 649b2baedd9042bbffa7f2e2847375b23c5adc2e
[2/4] tools: tests: use "$@" instead of $*
      commit: 4fae395c7c169e09441589ee64797cb62343da7d
[3/4] tools: tests: remove unneeded ';' in while loops
      commit: d75d591af73e2ebe52137221f4d87ce23f6c22d8
[4/4] tools: tests: remove dependency on grep
      commit: b569b91ce1e1749a4e4832e636721d3c05712593

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

