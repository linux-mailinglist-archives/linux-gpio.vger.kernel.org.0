Return-Path: <linux-gpio+bounces-27506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C8BFFC46
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 10:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFFF54F1E30
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354D42EAB76;
	Thu, 23 Oct 2025 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bB1cVHHj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781B2EACF3
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206595; cv=none; b=fLG6eMr/LNaIdDZFgOYP/7TceEVeufgmVZwWWriCj5UZDd+dL2Raj2gkm0qm3SarzB4bMXdNUQZ/G6xdMdoQXpmz4nvLm2iYkvnIGyKn8c7Kjv6VcSnxgyMM1XR7/zWxKmBjMfbdnQ2yOhK7z5GUwRPxR9XJLgalsM2iU9/VHs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206595; c=relaxed/simple;
	bh=Gk2ZKF5WwpmGjLCiYtkCo6oSwC0WUECr6v1C+zGJ3fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezsVFFw4v45lHnYqGWCQsI1PptG7NrESksLh45cOuI7yE1xjdVv0xVPZBmsSCdtyoWxiXPSUbGtVFqsdpvgzeLsjZCZ0CWhyVxdSi2H8Jptiz+4LpSs/Uyr95LvbqjAq7Es+Oiaip3lwmGyxm7vJIR2XvSleXx3X1BOYHaNi8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bB1cVHHj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47117f92e32so4167845e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761206591; x=1761811391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ7xq2RNbGmImC7ciBbnQIY246F12N/sN4XjVy38meU=;
        b=bB1cVHHjbyWGY1y0rmQThn7deIE6AEF8ATmHSBVFVaGXyg2WU/eeN1RZ2uMLYOarvT
         eLfjzS3YJ/wlCMOzyDUrbDXkQjuOcUPTToqGcef2SYpKOJwT4FpMeLCLl+LoFgcdw+q4
         QaiA/ZDS7zty1RxFH1Z2+9tsN07m9lGM6Wk46bFfhRC+nOuC6u2V1uTsRJYrcp/72W07
         1AZBjIOKT8e6uW0l/41UC+OJ9v8d9S7Bs5lMLMA5UmZHH3Q4b8+4IiKxVO+a9zanSRwn
         bijb0vMbKgZtoJMcjEW/0zqTM0nz2V5mxWAyz2xkKJuMxOkperX841PdWGEOGgpj2pN+
         AgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206591; x=1761811391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ7xq2RNbGmImC7ciBbnQIY246F12N/sN4XjVy38meU=;
        b=Oqu6vaeWSa43NXh3y3iEXSCslJR62Wu3GEGq7chaHjvpWN4uehAVYzbbyfUwjLvZRx
         THEeu/wMS553iCrV2fqHa0Duwi4vnbs0OWJ6DfH5dkCzLGSa6Kc2/xWQu/E4s2PzS2cd
         xeKyFpREB2zJPkRONPBTeOvUfBsgQrYO/6PYBmr0aZDzdnK0fXm16waa+Qw5rKED5iXX
         Q7URiYWmXScICbQTVCfzgYGLQ0FA0doKGDGNA1RAL+Yjn1FIbkFniLAyDYsTHVr+Y6Z7
         EqZii7QSnEnKM6RLHZSbTbjYNIWnekNq6tSPwX+SIyCmeccsUg1n4QQz/pQsF1/pCfnp
         5XHA==
X-Gm-Message-State: AOJu0YzXX7Kdi9Ubchx8fq9rIbvkCJ9QcFlMWUOrUU9SwpjuPnsMMLkp
	rDi3nhw88ghJdvVgqxR2B/z61vnN00VRb4WQ9/ELfVic5pliedgMCRGGWTPv1FnnQtnOkBRHEW+
	Db2iAOvK3qw==
X-Gm-Gg: ASbGnctrjq0ExDrs7DLKO4jfpZf1bm7Ur9ZuKM4TGIy3dhPzrT4nUjpTkHag9P5SGRE
	8P835g2mjNynut/6c5EBFFIbVNj5Fg00cc5wlvRbHbiYQabboTtFKKkIKTDd+eQMuL8KgnGh3fv
	KnN6d0GlWlGJo2U2nXr8Bg+rLmXbZGmgs18LX0ybDnnhMT+CMhPHOgEyGv3gEi77lNGjdYp/a3y
	z1fPPo2owUDOzcPLZl/S4DxymRZTGar48QsVFct0laCuQj/8XrkiXUPSX4JRgnt+jQDaZea86mp
	fx0twuFEZFUW33KadkwYIBjYqwMEBTvCE7ZnILX4O4GCx4XE7LVl9Jwipa54cE/etDq7H4ON8Yw
	y4UkG/FvJ1vXNOl9Ly2B2yXXhu4F1aROfS7RoXEUOodo9cp4ks5iYFbZAKMqwsW3ZmwikADoTNS
	3YziEhMw3ENOjl3Jjig2w+
X-Google-Smtp-Source: AGHT+IGrF183l/f6zNsjHiTn00sQb7XIgfkjEXcBfxdxPXgavyK/ncFd5bEjdGUSOoN9P3IGptgHpg==
X-Received: by 2002:a05:600c:828d:b0:471:11a3:a289 with SMTP id 5b1f17b1804b1-4711791c5f5mr165612455e9.27.1761206590815;
        Thu, 23 Oct 2025 01:03:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b4:e02e:c538:6feb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b5esm96268165e9.15.2025.10.23.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:03:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@xes-inc.com
Subject: Re: [libgpiod][PATCH] bindings: python: bump cibuildwheel to 3.2.1
Date: Thu, 23 Oct 2025 10:03:09 +0200
Message-ID: <176120656583.25008.16461459641014815027.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022160406.1810450-1-vfazio@gmail.com>
References: <20251022160406.1810450-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 22 Oct 2025 11:04:06 -0500, Vincent Fazio wrote:
> Version 3.2.1 uses images CPython 3.14.0 final instead of 3.14.0-rc3.
> 
> 

Applied, thanks!

Seems like we have everything to cut the v2.4.0 release?

[1/1] bindings: python: bump cibuildwheel to 3.2.1
      https://git.kernel.org/brgl/libgpiod/c/d62f3be0c47bb7e0284eb7b22ab61769e67294c6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

