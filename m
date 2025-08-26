Return-Path: <linux-gpio+bounces-24988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504BB359F5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 12:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930897ADA77
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 10:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417A029D27E;
	Tue, 26 Aug 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DlwsE44T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D32820DC
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756203476; cv=none; b=eljoVKRKPVfmSEYqRNDQDlqAANTgInttpznfAADwnKRhxGCfs2QrJomwIgu5r9+Ucc4xcQbTRcoMJ48wO0jZd5mT0U18mQTDrh2cxuXd0RDV+vtsTsN1uuvGIWRX6Sh8Qld55ZE2M6W3tiAvA1ARxshDAZk6AT8kxJRkrnJzhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756203476; c=relaxed/simple;
	bh=6q+vuTcUXvVZNZ5e9dFqPX9cDauBBESomVWRf3zjxYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQ/7havw1TvjHYnD0m9qE0EhusXzVXiJVy/NT9I0vrNG+fW/+XZe/UXdP8iW9k8jpeq5k/OFD01W3wjeKxyaNbx7M1LzrN2CsJ4Ux4dbmI0yAMOhH3fznV7D0VPHiL2SL6cXZMM4a4lQMHYcppH47Nai36h8l6spmR4j1xL1I+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DlwsE44T; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b4e5c3d0fso11701305e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756203473; x=1756808273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyBee5/lG0iyjNbfsN6MdpA5vjiXdFs/oW+uOE3oHX0=;
        b=DlwsE44Tp+JAQybWAtHhaJnau2L0skxO3QVhxLf0d2CHhxwct7bk/c93UIy8C8laZ0
         R6rAVfqvM38q9kk2JfQbAtLB2b3GvJotbGq0FQI+LD0JfKPx93QbGibV7vQca7eYviJL
         eWMBvEZ/khPxnm8cqh8GerixQxICu4d+CWE7ToxJdyrhBcqX1E3m5/VIwkysuMfZgwtD
         yQ2kJ4bUPdgYnB3qgWGv9jz1gysOm0j8oBbCJssaqakG7leXHLoMHMVCz/SIvTB+yTtu
         Ap+rjHrv2SAxp38I8scTUJXDPxb0nZjEpKC9A5Prg1Bd4Y7ozeCGrQW7oFTFJ1jLwa5p
         3ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756203473; x=1756808273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyBee5/lG0iyjNbfsN6MdpA5vjiXdFs/oW+uOE3oHX0=;
        b=BcVQbnz2lst9zaGE8y6SY38doDu7qiDZHpgtNrfEoTtp+ndSKzC080P9m7kioZQz8X
         mFcQ7GT33CtJV7iac9yvVewu2v9sFjn9SxBc7vpt0HO+bWu13wTNUd9jJD2Ms9xDW28b
         v91ygvCM+QaNuYErcF9E/ySLsBtKfrGokFyQIZSAXGt5wjAj+umRVGk/0J0JA8y/e/+M
         zJCpB1VYmtWzwsvjB+4Q8hKkwfWn3NkR5EAZGjgeHwGvPvkn6Ht4Xf2RF6C5yCYxTh8i
         TKYfXZHGZolMvqQKR04FE8nqriyl+Ywwz0uqwMd4hwhWK1V0rqHRDRQ0NWlXCnf8vdss
         SiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSeoi17YmBJUFFEAU2xT0VnOOs4GjbQMlHHd5Es5LY1+ui9EkSwzyNUAMWkQSCR9y0Yhwb8ZdwFZD5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Gtz2wb5ug4xELDG8ll/ItDyHb+W/kExujbUnEamYyP4B7Kxp
	ViQ5Hi+MQnT8CMHMJOaJRJVaByRwH+xYdiuiRnI2+7vE/Q77dvCjwxrNgJXSLNzRNcI=
X-Gm-Gg: ASbGncu49Dc50HWDBouzAZeAVdTXqhApNthufuI+5ZMH5j4aM1EEXDWWSokT2/cvhVi
	gtZkyb5N6j6MYa9Lt9/uVSZEUd5PBhS7StK9Zc0H3wGLX+bIfQQhCKEkIvVeQjx8zbGMR+MiR5E
	emCsoFnyyCjLQ1EcckorPZu3vCOCwkrnAAlUt/7uJVGevA1eSSR5JKB5JFyI4gCY3zLWaPBUu1/
	EcX/41hOJt53TRZhCDRk8qUdL4ENz2Z4LGd0zp2Ia4awR0bqpHqVd9Rv0ok0BTst4avKs8JJdEH
	HNHjGP3e6xANQAGJyCs85diifyt4V2kA2myF3ePR7PAVc/dt/yW4eVRtZcfMzgWg+z/qRSaT/Bz
	GJjYlFMveWXVukd/XtlsapfKZ4AvIMu6KhD4=
X-Google-Smtp-Source: AGHT+IH1baQ8dv50QBcdonum2RD5GCC5lK6g2hKYNq3INEU13savhIHkHrBcxJgVeloJtotIPnwysg==
X-Received: by 2002:a05:600c:46d1:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-45b5179d088mr179725745e9.16.1756203472781;
        Tue, 26 Aug 2025 03:17:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70e4ba390sm16286582f8f.12.2025.08.26.03.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 03:17:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	mun.yew.tham@intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	adrianhoyin.ng@altera.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Change Altera-PIO driver maintainer
Date: Tue, 26 Aug 2025 12:17:51 +0200
Message-ID: <175620346857.22769.1782746483858887988.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825071637.40441-1-adrianhoyin.ng@altera.com>
References: <20250825071637.40441-1-adrianhoyin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 25 Aug 2025 15:16:37 +0800, adrianhoyin.ng@altera.com wrote:
> Update Altera-PIO Driver maintainer from <mun.yew.tham@intel.com> to
> <adrianhoyin.ng@altera.com> as Mun Yew is no longer with Altera.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Change Altera-PIO driver maintainer
      https://git.kernel.org/brgl/linux/c/6fe31c8b53003134e5573cfb89aea85f96a43afd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

