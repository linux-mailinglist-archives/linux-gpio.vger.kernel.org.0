Return-Path: <linux-gpio+bounces-28577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B7C636AA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 11:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E108335ED66
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 09:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F3332939A;
	Mon, 17 Nov 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y3tXhjF+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F83164A1
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373467; cv=none; b=KGPxO4Wa3+1cjCMOM55B0r8dxF3FlnkYOPwacT5nw8XcNbBsJngAs9/0/yNW/JNA3dk9z5feDQWJV23Gek7UQAhXVKReeU0dXlJvRgXm4rVLOxOpDHNlErcMr2oByqEJpb+n39MImUrxeLnffeEx9y0y8IXvveqjuW6ZFsXRga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373467; c=relaxed/simple;
	bh=WhM+r7HRoc+mIOQX98cNC51HkLH5yqL430KXWpDUH48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E875dWw/nN4kMHuqh1UUg2hy7IeUlLtVPYi1B3JRVjb5HEnNfOe/B45PzcDG8bjLhcbRHDZt2iMcAmw2UcH2dRhMX5yMW8nxUFaz2dMpcmkJsgdgkRkunMk5QCFPBNgCCidLnGFN9fhu0/0f/KQumSOTUfyOWdKIhHlPwzmMZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y3tXhjF+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779a637712so10581145e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763373461; x=1763978261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+sr4MowXvohpr8tfNDqz4cgTN326yY7Nl5m0oWYROU=;
        b=y3tXhjF+AQ4/4v+8JKH9bsXv/4BUG5T5oEXCThFN0hwfXUymqOjCzDD5EHC8r4n5va
         dB68Mers89DtpFeZLBz1Vlk71g2bgDM+EFM7NkNA/OgSRnGzz3KcZrF6UoTcMYcn44SB
         fD/nzNir+4zqUogBiNVaeLgLJKXmiZDtR2m4FZvxLv3ejYV3LKo8gutFWY7I91pHKb3v
         Xm87ATGSVOw3vVh8yFiRaaA4HEkxDukGQzCQRwpd0MLbS6QRAaPqi1P/2hUZaHKmzs6F
         ewCbNTfBKIv7BDzFcBaI4B0d1wxPewijSvKbb6lg6YNQzMb/YYF6JnMXnutenwTa7bJB
         9/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373461; x=1763978261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+sr4MowXvohpr8tfNDqz4cgTN326yY7Nl5m0oWYROU=;
        b=h0ui0xZbLEQ0Zt7gGVjB1XytKhP1s5Y8c660hHZGA6qVgjw/+dVVItkjzXJ1j/K5Pp
         P8O/efw90imajepA5M/QDfAaYIqsnGCEKe1h19VD866jQ5Q/vhs/lZ0az0YLwcuNai8q
         pAWscuKWLsEfGzhhzwlcVvueRNPXFll8NTw1obLqHQIWp1ph9+dhBMBwyzIkrBcZu65Q
         BDfmphOnmkLJw7u+aCKX5uucPkEbJ62Z+7XE+MALyndCecZsjdpAU8WYWczwFlhYJMDT
         5krRh8rWLXcpBTRoWsEyX8PVkGSWv0yyaft7txSBEnOJLCRuJFXGsxaS9qts9gCROgUW
         fkiw==
X-Gm-Message-State: AOJu0YweHwsmQ9ra0waQzF2YQnrKwIP46tmHRVjjt4QjQBbZvLhBMxnx
	uT+C4lEYypKsFd1bz29qv/4Cg+2V1K2BGNq3Uz2HudVk56yGzoFiCYNRBqlW4UpMqKqnUDf7cOo
	fjgtwvHg=
X-Gm-Gg: ASbGnctvObUokwAXvoLmcm6Y/CvukLDgELKuBuqSfuZOMdYng+CrZ35QbKR2EWm3hFh
	1ININjd7gSoDAlh8g+o622+YrOGrq+JD39b4NWvnX04TJXlKUAbVB7r8iva5tFycygOGrHz3mn+
	0FAI+mzuxzJ/PY0Ixhfbz1mnbt0HUytSOthuzRQVbLOwV5f6Y7DocLlMWvMdXP3W5z4qQmpzhx1
	b4tq7BLmJcuYLbUPekgxtpTmWdsl+I4FXQUSoL/metfOPpXsC9WekFN3BL3B2WlR6i8kuYeW16X
	03hE/eL/BKzWRkN6T0De+jWrma6k20F6AlJsK7AQVc+bpRQtxo78M2imjbzCDt6fitwKxjindiN
	Q84E2TYZOCkAYNOZvHbQUwhrb5P9Gk5PtjzBRD6rU1VjV3FfbqM53cMgS05VdMKkbv4DCgOf1qN
	8UimWlSQhhHtF9j7P0Zew8/sBvwPU=
X-Google-Smtp-Source: AGHT+IGpg3LY6pRsl3m4f5pxStcCE2S/Gl/9ofrqK6cwwwtwMFziCSmc7LzSONkHC33gIT2VTU+Saw==
X-Received: by 2002:a05:600c:474b:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-477a21c2122mr28496025e9.5.1763373460860;
        Mon, 17 Nov 2025 01:57:40 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm138118935e9.13.2025.11.17.01.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:57:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpiolib: legacy: Allow *gpio_request_one() to die independently
Date: Mon, 17 Nov 2025 10:57:39 +0100
Message-ID: <176337345562.47181.13775173868103587660.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
References: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Nov 2025 10:32:00 +0100, Andy Shevchenko wrote:
> Allow *gpio_request_one() to die independently and make sure
> the gpio_request_one() gone first (before gpio_request() removal).
> Currently the devm_gpio_request_one() depends on gpio_request_one().
> Open code the latter in the former to break the dependency. Also
> convert the latter to use legacy APIs, so we can kill it first
> as it's not only the logical move, but an easier task due to less
> amount of the leftover users in the kernel.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: legacy: Make sure we kill gpio_request_one() first
      https://git.kernel.org/brgl/linux/c/61e1fd2abca4c551fb40afcb733a31de1991c656
[2/2] gpiolib: legacy: Allow to kill devm_gpio_request_one() independently
      https://git.kernel.org/brgl/linux/c/ade570c138a509c11b5d016a227009f2f399fd4a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

