Return-Path: <linux-gpio+bounces-27282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB85BEFA8E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 09:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5861F4ED107
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 07:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42842DA77E;
	Mon, 20 Oct 2025 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0Ypqhkgf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DEB2D7DC1
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945047; cv=none; b=Bx1jOq0ahSvgpp3ewGIDUdIdtUwKT4vnnhIP8/c36G6dRUETACLwXNIUltnIm2T8TD1grzrxfJdaUKPe0VVyEjyMAqOL0f9WXgI/kGAH3N08V/+tCV3s6uuBPslt/efzq82qDXrbUW4voGFXsCxLG51cin0VIdSVviT+czwkw40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945047; c=relaxed/simple;
	bh=LfI2d9xHsW2tVkkiUTrpMSXy8Fqflp7nkvdNzVka+zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWLJk8zR9k1a89vPp02wAfDy4xK0E+rCmem/1u8uWZnZiXgjrzlhRuzE2/8F/RiMKnX6DXdJwcEDlUF5g007qxkJlunD8wN6fL0pQ5KL2cDY6eJPUXPjau1fNz+f83c7lNWeo67mPsc3EDgEVuRG8zMWZwlfXQRclLoOSveBjus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0Ypqhkgf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-471b80b994bso18139955e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 00:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760945043; x=1761549843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNBkAkxjAwi7kSHSCpdGrBq3Sz+mlKhpy0dVM/BjiBI=;
        b=0YpqhkgfOLyVrClirJS+Zb4gztiIn/xAaHr/5BKRCqXeWZVOlwMrEzWnDdXf8dUMZZ
         vCk9awRuqDONddZrw/M0Aen/HXr26L+KErJq3WuIplgMBx8Qa5Di5SM/I87lYd6CiYnC
         xsvnsLQzqepPUoT+JRnKm6ffSs4ESH8Wpxrk3o5gay4csQwNMxvMA5FKxhbUIMdj2MW1
         xY0GpRV5Szhrbc5hy0uTMRl+xDZzMuphZRxr7Cla6U+KUnaitByngbGKOceZkdTb7hq2
         RGuFhKfPivXhd2/RpUGfxRQCoK7STdex/p/eDHJM+roD4Cf+03U1dX2Vv028GvT2WYD+
         YQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760945043; x=1761549843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNBkAkxjAwi7kSHSCpdGrBq3Sz+mlKhpy0dVM/BjiBI=;
        b=joSV3VDU1ce5ylNKBlC4o+ZtRcK866Gffy6iIT6YsQa87CVb+JmoBro4JlwfyOY0z1
         pLhdiFamr04jXJ78Y96mel6lin79tKvSrGDo6G/gGFk1SjHtj8thf6LGb2LMoDwhSkBx
         Z29Fl/v44JtjvJ4ifaSnb73y26vK7BIhkRP6dKPtTybyHleGsz0TXnacBgxVD/Otxb0l
         jwGe9uN6qtE1QQHz6vDIAsww92Cqvy1gVOx7rUtU7miET4IEJNZffVr7qrAE/Edhc8Vy
         WKpG6tJVvc8BiI7mGptztFTTIiHcJODPOutorwoilKbkmBv9YgUSr3esoVHdKd/zWpWo
         5duw==
X-Forwarded-Encrypted: i=1; AJvYcCWYeemSyFxLOA/0eGBAFNcJchGSevjHGfVd8UODkgU2c0UWmPhjB2xgo6fYebBzhvjFP5E/L6w5fQh9@vger.kernel.org
X-Gm-Message-State: AOJu0YzvI8cBlsWaFGHy6bO6azkMc/oovIKImwHGqWx2chIOeD9yS4Yn
	FXr9k279pUiPy0F/ySnzzW3xJyY9iPJNbjuFJVtrNe0OOC595DIOP5x4uEXc+9zdccg=
X-Gm-Gg: ASbGncuDXAXtMNojwJ6slqw+1itCGWKnd6Alwtat73NrgB13iZeIE/YiIaUC4BbcIdJ
	XW424A10FROwDblMdqf+zAVi2lg2VnJkNgg423KuIBXZC0lIbVjAMkR6vXR5XMWY/IpAa+Cr75g
	9ZjleSWBfS1apyts0xul9WV7hJSpCIl3A3AGWmU+7Bc07j1e12t8P220UlE+RPuyCZps9uAI3fH
	N/tbeWUW55ieyHrkKsyqU8ogZBo69gCW81UuQUrhVZ9skZWjJN1Ra7hJZex1+sRZXPgWs3OpB2S
	hJ4aAAzKBTZAc7tjBzvQ20lA1MLt7JiwR6qsV0riwnyqTwZqUdezTCjvuXyDUvAdKOAjASxDdXp
	v67E4wODusCQQ42QLLJ6pRtJSAQ4eyzn26KisinymhtucpyGmNAU2RarKTZei6XiiCqm64wiRy8
	RtW7PEF0nGrxQ=
X-Google-Smtp-Source: AGHT+IHXm5UtRkQRdhNnkMLXDT1OdBNCuioYx0cdaBRDBVm2QIZL2jEWwG0baXlFDuMg7LuRe2kDdQ==
X-Received: by 2002:a05:600c:524f:b0:46e:326e:4501 with SMTP id 5b1f17b1804b1-471178a785bmr84128255e9.10.1760945043239;
        Mon, 20 Oct 2025 00:24:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5b13:a549:df98:9c00])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a7dasm15028660f8f.25.2025.10.20.00.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:24:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	Michael Roth <mail@mroth.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: clarify log messages about auto increment feature
Date: Mon, 20 Oct 2025 09:24:01 +0200
Message-ID: <176094503872.21784.10106172878163279314.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251018101404.3630905-1-mail@mroth.net>
References: <20251018101404.3630905-1-mail@mroth.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 18 Oct 2025 12:14:04 +0200, Michael Roth wrote:
> The probe messages currently print "using AI" and "using no AI",
> which can be confusing to users unfamiliar with the datasheet term.
> 
> Clarify these by spelling out "auto increment", which is the meaning
> of the AI bit described in the register map.
> 
> No functional change, only clearer log wording and matching comment
> update.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: clarify log messages about auto increment feature
      https://git.kernel.org/brgl/linux/c/6f5976c0cc0977b1fd168d6ecbf3fb36cf041524

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

