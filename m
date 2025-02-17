Return-Path: <linux-gpio+bounces-16110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F7A37E38
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCE9188A0DF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 09:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA041FDA89;
	Mon, 17 Feb 2025 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZBei38fj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD51DDA2F
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783820; cv=none; b=n2WCQ+h3TE73sN2TbpXHwycN+RyWnS3Y+oR3GCRCL2wpy1GBaiD8GvlQzezGUQC/eY1tx0LAsHRuyVMuLX/De1Zj6mvA1zRlDXfb4/WTi+VJX3NfmNM77dUb1UpVff2MhElEmu/Zl+KhjKKCTOrJWExuYMxn/29pc0QljB4Ec3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783820; c=relaxed/simple;
	bh=5NcSdPwaDSxy0K8jFrQO2g/aDkdPMceJFH81spqBAm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9awtdcgnpKZZpN966mjeP2maKX6cgaBAuBkvo+5JaJdp4hwWQIXvLu/pvjEJSgBfBS3I1iVfNjvYvti7qwETunOFTCsCfWFVdgQbo96kZ0nXu2pCnI7OuWynzgSWaioqwTHbARLexf344+kGKH24VsxpxjRzzJacP8M++w7Dsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZBei38fj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4396a4d5e3bso25665045e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 01:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739783817; x=1740388617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOb13QLKsCH74JEJtceuqnc8qt+tTrisvJShPAz0XFE=;
        b=ZBei38fj6OJuEdCJVmKC/JWpKeaIknhbCReHU5rhCKDczniY4XQBE3yllaXSqVH0RR
         vIjDFLRbGrEV5FATzhz1XoCk+WhpQw+bY9l9l5EWbDUfXcs+KE36XStCZSnBDliI4iwo
         t7JalYk2zubzvPimnQbWPvYVi+CYQTasMd4Wtlh94xyAV5YcqF4JOLoSXkX3YD9S3f2a
         DetS8ykABx9fh6d2msr/LIDYCOHN7gcvkCZFzhmxYoU8OOKJMxBcf3PiwL+N4DBUeJu2
         GDznsbmW+e1aadoGBHYVNfzc7AGtTrbc6AbLlekm0INaNLHlm8DP0sDHACIGF1xhnBPi
         GSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783817; x=1740388617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOb13QLKsCH74JEJtceuqnc8qt+tTrisvJShPAz0XFE=;
        b=qLgfO7RSfbjvKZNGHiTYBZPY0vdz8Q3mPjivacZ4Ohnxp7ip1yPHYPEw4TFPBS1RKu
         tA6PNMUslh+fuw1lqLdnjddRlXYsaEsmkO1rVIVzu9NfN+dkKUEaq2UFcVWdmVky5yNe
         kuANrE2AmYUuW/20GJhh7n6rXiS48udt3Fr+XjaCzmDEIhHx6Z3EyBjYl98I6PAvuw7i
         CE4MtbgFYS5TdBJSo6hB6Tj9i5MUB9hhfa4gIg+lIqCCAJZQr8prxgyRv3eLJJgC+azW
         1V3guJhKGXMdlsl2qR0OiVwV8IJMn50AolcUu0cOhU58VTJAz0P6pZuhVqKtxV+7wciE
         RfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmwKlRDL46TJej651SrZAK8ecJzj/bGlG8bxZnIQ2uiKwuOZo3sI81teHgRRJlbxL6VIMi9CUZTWVr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9IrrAd3yqRTd6tEwr0XW0MyJNFeaWZlDCvU2JUSlw9CPeDRRY
	/U9LFeyrp5tL6LwEE99r5dwXIXKlrmuQyP6gBbejkHKeHwpa4fraSUfFW3TfY9BdE54hXsUuWUv
	CJE0=
X-Gm-Gg: ASbGncuWLZLpc39r2jvQd7ljIfN+5SsMsYLtFgKnj74L1bV6EFws/AODJkO2eLc6boP
	YLPpR6iGWMrqiRP+Wz3nloTWOou0W5UoGMNIJ9FjB73ybwImuGbP6DZJPzkTe8V3hJ97UqdtYe9
	BfamamP/ALE4tRRMx7byP3IPqOAfiYg6Dg0FyJqqWcHpbHh9W2Tw+N5xc+z7IAzMZAG1N0S7Bfw
	dSoHGB8l9PPM9+INTdPo0ongPLT4NDF1FcFuZyiYWaeCptPEdjzKpr0TQpAx04Oa1fBRiscm5pU
	7W7Y75ymefgz
X-Google-Smtp-Source: AGHT+IEnCyx+LHbjy0ZMEYdprGHbUfwDTXID5I94Zw3Rny+hdaPa/0DMENe+bVWLpWRhrB4s8kotBA==
X-Received: by 2002:a5d:6d8c:0:b0:38f:394f:d8c with SMTP id ffacd0b85a97d-38f394f9cc5mr5620153f8f.33.1739783817274;
        Mon, 17 Feb 2025 01:16:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm11689734f8f.5.2025.02.17.01.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:16:56 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: loongson-64bit: Remove unneeded ngpio assignment
Date: Mon, 17 Feb 2025 10:16:55 +0100
Message-ID: <173978381388.133007.7573157992934929740.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213184833.3109038-1-andriy.shevchenko@linux.intel.com>
References: <20250213184833.3109038-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 13 Feb 2025 20:48:33 +0200, Andy Shevchenko wrote:
> The GPIO library will parse the respective property to fill ngpio.
> No need to repeat it in the driver.
> 
> While at it, drop unused fwnode field.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Remove unneeded ngpio assignment
      commit: bf1b5ae5db4d817ed976784e5317acc38f037d32

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

