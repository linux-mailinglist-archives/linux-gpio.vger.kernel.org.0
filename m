Return-Path: <linux-gpio+bounces-16120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5DA3810D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FC3516CE70
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22748217F35;
	Mon, 17 Feb 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JF7R8k1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3A17E45B
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789896; cv=none; b=cgCG+gRXqvLPeDIjGSSXNuyO2c019eJ6swFldZZ/TgjoVJCFimiCrm95iFENxqIjO9dhLdqy6KlDmVEEdfEte4WPWYDUyidxNqq5PQselsZvPrxbLJGPeWpHOVh9ZjsnLJ6EB6g9B9dlLSKQbr9x/tUjXbhZujVknny6cyO5B/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789896; c=relaxed/simple;
	bh=QlV1onqtvhvc5G02Qzx4PNeXnX68ZjYZnnDQ515NXPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVkX4xgUKCg56bHGmpuBE1NuT06LA7KsP8fpTkPVx/mmlLswLHHzEmxcS78peZyHOjoYysqliKkwrjuy+mZid4uO/zJ5u5uk02zNi+qwZOd0JdjglsAJBxgMYwuyUvskCCZRL9RupEJvzR3Kp2cyfIDGO0UXfxI+r1uYMZJN2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JF7R8k1d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4395dddb07dso43917455e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739789892; x=1740394692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73Sppo4fAPgUj4dbjlIBn18V5uGur+WqEXMeTwL9IA0=;
        b=JF7R8k1dEkz7/D+qNc9WhHO/OC6TDFtGReLn5mC2/vABJjKOFo2B2ahR0dfW2BMy+P
         cXc97onR/SI0Efp0qKaD4R9LJz9BqQfBEqI8248jOa3YFCB2d/bcL5weM5PxdEI/YaTw
         Wbz8Et+Y7VSswzlDiDOtmPWtpzDMEIogK6XoVPguqlGH6gVvgxDV0yzUwAJPj287PvI6
         VZCWu87vmqdEyJH78JH5FWMjQbvXeyCYT2GRI4HVDUYfGV/Ubf/xNsISpfrt6TkJT5OM
         Ps7nxrWlzsTm5QKzJnSsPPZzl3fZCmbf6fWYaK/9tN+7u+lI9D0K0/EtSYr1sK05Kxci
         Ym2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789892; x=1740394692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73Sppo4fAPgUj4dbjlIBn18V5uGur+WqEXMeTwL9IA0=;
        b=UP2Zad/0lBYX8Fcq/GcTX1RDHeUCXHhAF66X0dByU0Bpm9jOS4nydEmeHRtNoCGeie
         /T4RsTq7JloSasKUv7WiWyTaUVdPBi6SZb7hLJd25vp2MyJDnhfy1KyG+8cRrkGyP9Dp
         I/MdEz+mu9wRsVT4MkL2nCnvp5l+CGAxQMyS+0gdKLbo2o5+irqYmGJQ7ioyKufkLfp2
         abOjacYb86jkfgO7UD+dcviWwGyceHAvFM+YnfvAmr27N68iVRvt1wZ4QzyQHhSMLJ6C
         DWVkDQ7zD/HWeAYQeJm6HnDN1N+Eo/Ozl8y4FuhOhRsOugAmrh/QkYzWpCPZQd+i3Mq7
         VoKA==
X-Gm-Message-State: AOJu0Yw+sRgXANeyGm3Oze7/2scoKpceOW6nHENzqHWMFlGT2z4wHHyz
	DJtJL+BmzfZBgaDhwCRg34fe8x3YwUT4PnsQRew/WATdQ1ji2PfQGHwBp9+ayje2GC9GSv2BoId
	j88o=
X-Gm-Gg: ASbGncvHfvaWJ3GJaH5lbkh2nPkIey9G3YJBUSFNs6ssyZ/zWln6df0eEd1v6t5jG5Q
	s7Xdo/QffILRNe+07X6KrxayMGe0BSkkzGQjOB73/s7kiovypxsc8yq2wCOYlUOGaP57csd9hY/
	o+rLsRabr5JwGKDMdZiMt5MVRf0s3qXEzqSiB4CBNZ5Dps1bvU1r0q0PHUq3u85JmzTFObf0v36
	lgaTk3WWPF0aAFHJfVV9uIWr7nfl8uTGijFx6sSJITy68j3I4pRJI5NqlMJR6w/wqKPIuTQYJTC
	3Qdh6p0E77m/
X-Google-Smtp-Source: AGHT+IGM3Mh6U//04TYGLsmJw9VkvXBzEAO2fYPN0FAP31FGFkYz67kUiU7fJq9Pu9G6F9SAwj0DNg==
X-Received: by 2002:a05:600c:3b1d:b0:439:59cf:8dfe with SMTP id 5b1f17b1804b1-4396e5bc22amr102934555e9.0.1739789892605;
        Mon, 17 Feb 2025 02:58:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm117431435e9.9.2025.02.17.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:58:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Johan Korsnes <johan.korsnes@remarkable.no>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: vf610: add locking to gpio direction functions
Date: Mon, 17 Feb 2025 11:58:11 +0100
Message-ID: <173978988690.154145.10452409236914036780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217091643.679644-1-johan.korsnes@remarkable.no>
References: <20250217091643.679644-1-johan.korsnes@remarkable.no>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 17 Feb 2025 10:16:43 +0100, Johan Korsnes wrote:
> Add locking to `vf610_gpio_direction_input|output()` functions. Without
> this locking, a race condition exists between concurrent calls to these
> functions, potentially leading to incorrect GPIO direction settings.
> 
> To verify the correctness of this fix, a `trylock` patch was applied,
> where after a couple of reboots the race was confirmed. I.e., one user
> had to wait before acquiring the lock. With this patch the race has not
> been encountered. It's worth mentioning that any type of debugging
> (printing, tracing, etc.) would "resolve"/hide the issue.
> 
> [...]

Applied, thanks!

[1/1] gpio: vf610: add locking to gpio direction functions
      commit: 4e667a1968099c6deadee2313ecd648f8f0a8956

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

