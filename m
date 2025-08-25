Return-Path: <linux-gpio+bounces-24948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58811B34AAE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 20:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6B02A2913
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 18:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5E827D77B;
	Mon, 25 Aug 2025 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oBmUIleK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DE27A917
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756148158; cv=none; b=McFEsDsKs+2qS6haWk8WnHIATsujZLfL/jV1/8USVDQcCuMfXH11MATrVxJwI0GqcKlNhQWM0qC/w1OU9hjKkNnIrL1L5mSCi+1j5Whpjo5s4njtxdF+u9yw3kYoYWUHy9oIE4tYkpHJWs5r4vODZ8DUjoxg6xwqSVX0qabBDRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756148158; c=relaxed/simple;
	bh=YmDbGVYBJ+9vMA9e2dBcq+2FxY2Q/1XKrFd+tq0bRVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZA6zBZdFDJXT5v4Khd2VyqnbT6u+ZoHH2bOmEH772CvyEShlaBVAbYsHBvDVghUdoSc+FoRSXwNJNMI6znGCVXSJ8HE1Tf1QGNivomUhYbqThpQLjb/QzDL0nR7YJ0s0zRYVPO2XswnAkwX6M2zKm7pMej+kaEdeBnXR9qZwncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oBmUIleK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2964562f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756148155; x=1756752955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOcjuqp2a+AQWa/4BjFDLaLGrGNoZlGDy0Dboe/tYr4=;
        b=oBmUIleKGXP6y9Q6IvAwolFCJ38mcwx3OxWJPCDs4xCZkHJ6j5Gu8NIAzT8hwpAMg6
         PLE/wHDgMic2ocCZZEohsrntC/mBPZcjnLclWYtNQzCJeb8OgoAnEu+vQlQvDcQyh48u
         4mr/4tReGaOHk4Qub9SHzD5kKZ+tWrK9ed7YC6Q2Tz4xgahAmZVn+gTEO/4r26MX+Jg0
         EGxm/UpKUgQzeY0joTnyvUeEsXvGVL3bXlH+6CPz0upCRCPBOEv1MoMC6G8ph+i3Xma0
         dx09uu92A7tV/+zSOWvxWpXNmKcsgm+rXWBU78vVJ6/+C2kTkFtVlOgJlU9bTBZgx2Yv
         Bs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756148155; x=1756752955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOcjuqp2a+AQWa/4BjFDLaLGrGNoZlGDy0Dboe/tYr4=;
        b=rbDs+Q4XQqfLUvbthe/mQCZhdGSyTo9WdUQ58xfuZMqIs3tjKm/nOEeBfg22ZayELp
         +xqFEuJ3HcnPbvTDZWLm8rOliNOqlqzbZfbkZ3fHMrykoBMplXUs+IIcJXrAf0gm1gT9
         UMtP+lH9+PU20oT6M5qb/1M+tEH67dG5DOpSWrA6MVuu0+DZlWGGwyWoHo8rr4hwuUIi
         qi7tn3Fo288pzyHmGcO1VZrKYodMEH9HMn7+g8CfwNsY0eMiPNfVq4czqTYKRJJ1xafY
         cIeQFKhTeZLiQQn03tK0VVnMuh+Y5KWorsuVRxaWDc3lSUy0q8drZVdBgI6B4dsSjyB1
         mZwA==
X-Forwarded-Encrypted: i=1; AJvYcCXJEeBol+gmG++UTRKk0NA1W1n2V32nlNF92vPA4QpNJO8RGK0zlBzYPhqahOl4WZE7R2Of1wMOCAqW@vger.kernel.org
X-Gm-Message-State: AOJu0YznwnWAO/HDOCw7kIP7wRg8YHpWyyE69qaY5h1jJcTF9ZDU/rR5
	2UN8bvSdP6lrUiQtHC2lFBRuPupLnvZlQq3w1erHUGJiCrDf92Ce865W8mKiCqBI+1Y=
X-Gm-Gg: ASbGncuCHuQv1dI+A833AzZLZnPgz1WM9qG0AzgKvh/r99SlGsZaJJUHXJkTporfeMG
	O5a9Uhs96lBV16ISBmnORmC5nx2oFfP1D8f/8kMiSEDd1AcqtIiPosnik7TGy7fpGmGlF2K5ZHR
	vuKIjS8mtqsNiN+l7IWAVNphvFJZd6eY+5VsX9mpZMCgzQWZ7RYTPUMkL2QRnemX+FILBkcRw14
	IrCb2u2jwq1MFyDLNk27HoLX0bVAGGa/rohC/bDuBJy25BspfZHK/LlwOO1RhPcUz2pXk+UdaYh
	osmGrUW/A5F4IikIXcNhnBCcYCS5DECHr9fNWqwjDc23pOwsDMN/6HfdvW6ZjjaAK3u+HtmfOng
	t67yd1m2QJymv0LpvmmzQJniVErwdlTP9uhWTSkUNksU=
X-Google-Smtp-Source: AGHT+IETHkwhkd+96DAgFu+2AKKBRYcWYpFOYdvJs3gDUctCwBERpoYuxxiBj5OEWAsSDDqWzul0fg==
X-Received: by 2002:a5d:64e3:0:b0:3c9:c3dd:769f with SMTP id ffacd0b85a97d-3c9c3dd7954mr3831038f8f.2.1756148155199;
        Mon, 25 Aug 2025 11:55:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:490:f8af:73b:7a00])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711d9f389sm12665109f8f.60.2025.08.25.11.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:55:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: don't use GPIO base in debugfs output
Date: Mon, 25 Aug 2025 20:55:53 +0200
Message-ID: <175614815075.9139.9315465514348100034.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250815111733.79283-1-brgl@bgdev.pl>
References: <20250815111733.79283-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 15 Aug 2025 13:17:33 +0200, Bartosz Golaszewski wrote:
> We're in the process of removing unneeded references to the global GPIO
> base number treewide. Use the HW offset instead of the base number.
> 
> 

Applied, thanks!

[1/1] gpio: sim: don't use GPIO base in debugfs output
      https://git.kernel.org/brgl/linux/c/a16a3cb07140a094ffd918290cef76135876b532

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

