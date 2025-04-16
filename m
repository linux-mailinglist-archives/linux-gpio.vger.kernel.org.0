Return-Path: <linux-gpio+bounces-18971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD4A9081E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D182D3BBEDC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 15:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40E5211494;
	Wed, 16 Apr 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AoU7YEwl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E52045B7
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818996; cv=none; b=OAgpTM/mdZaWV9XI/tJh41YzeH/fnQlkKNsJXHMFh9ZHq5Zj199xxpLJQ4rw94sznOZfbOwIQtrhdpMiXKdlMYC+wbP7j4znr8BiW8B+gPqZcTUM3hJyv8FkkpkCfpeL92NvhMC7oOYCwVo49SsfCVLiPyLk9WS41u8fI7odp9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818996; c=relaxed/simple;
	bh=zq9fTS+ACAxKSl0s2mcc8GxghLsBfz3pnTM9Iuqgs7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzFiW4pH6Vv7PTIP0kgFXN8Lq5jf8oer8LL3hSQ4N5kUK6kqwnXBq+kvN27wrInGPUEUXXU6Iqm5xkfEpxrpsloSljhO19GuoQYtwlHiiQh+UwlFmRl14gj7Bpu7+28ngI5yjNX/WwLziBxQeLdXCE71NXRpqrPwesudr4IVKuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AoU7YEwl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso36132005e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818992; x=1745423792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9YkWFmLJl20Npik27xkHa0wtGlZoa7Us/OtigKWito=;
        b=AoU7YEwll8GbDhRPxRT1QE0/m/ypqNlodZYrzJfJ52ldoayFcXOmo6x+nyTWDMwH9z
         rXxBvGNPiPW6z+F0Opk9DCRS7eM4M1gOvIPWJ8Xt1TA+olHxDUTVNSEBErCEafLaWkO+
         Q3QjJ8tQnimgOcTLZyYoCYGcVyp11R076DCcYXFKFoTJGIKONwfEdpFe4s2YyNWZSqFs
         RNu/qlz2E6glrevWZhIPioEca5HOdYb4xtnqsnXL0B1jURFB0N7N4aW1kdj5vRXiuxg5
         6em37jxNl4ZpqF8hJX5i/M6s2jDeliKUK1kr51fWQCzVPVd/M8R4WHSdTH07dcMproUa
         lgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818992; x=1745423792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9YkWFmLJl20Npik27xkHa0wtGlZoa7Us/OtigKWito=;
        b=YkmUc8REOK+XLuT/9Abwj9+pWx9Vt3f0cL+FDbZaUL5AKGK8ujFUj4paEtC4JpRpx9
         xB9dJidt6Y/YYBxIfSrHKOi1mB6RmZVRYuqHCU3dfnAkpxhqoUfmEOyFwWg4IYLo6SNk
         /Jpbl/pfkIzqKSTbwURkvvOrOj61slSGB9wcINV+Rs+iCH3FT/0aF47I2Gw5LpQhC7U1
         q2sh78TvYiTchfR1QL/vB/hyDPY1VXKGm7Dm3m/VFh7tOIPVgni2FByBMjQWn4HpsSQf
         O/J+kdo35D3onFifwx1bbYwgwGMY3o2mZ6WHkhOA4oUMnX2iLMwUa7J/XecuNTr8PQTG
         fWUQ==
X-Gm-Message-State: AOJu0YwWnGqdOMbvLZRc+V6JQk3BtPmrDglDC2292o2lxGK5RjIJrcUd
	0NloEvR1XG2Jr4zpMvNhT9HMMX4YyY195Sy/Hg2Epf54vcr5kI3Tdfp8jF3qAJ0=
X-Gm-Gg: ASbGncvDz/vkXJxgXr7RNV0jC5+1dYwkphjPHvuCZQ1Y+/ZyDsL7usIAKcBTwEVLlyv
	q1lcRpGbHrlIwYUsj8eIdTzB4Gwj31f0qfDKmxY5eH6Ja8CWxKryLHvwMVaaocYuMD29VSNl8kF
	Bsp0i8Xzt2S3L2h5MZ0MIO3RV2CxPb/cTi44ovz1amG2npT3eTb/vcfAs9DO6OK4Qh6WPSB0b4P
	sKhWQFZemH3e1Mcr7kGr3ya4hhsrdkyzCmsd4W1hkNioP6/iJy8yKVgEotwz2xzXmQ+UXwJAdKP
	3LrbSD1TPBwbWdM0D5iFFDUpECJbOKFcYu7/2mza
X-Google-Smtp-Source: AGHT+IEY5yoj/LzpPEAeUque3+hwbzLjQTdj57zJGOPor/+PkJpSD5MS6ys8unkVVRQeIz6asUlZAw==
X-Received: by 2002:a05:6000:2484:b0:391:4189:d28d with SMTP id ffacd0b85a97d-39ee5b35c8dmr2343871f8f.34.1744818991880;
        Wed, 16 Apr 2025 08:56:31 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/6] gpio: extend build coverage with COMPILE_TEST=y
Date: Wed, 16 Apr 2025 17:56:25 +0200
Message-ID: <174481898217.8191.5994115925573733265.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 14:59:00 +0200, Bartosz Golaszewski wrote:
> There are some drivers that aren't build with allmodconfig that don't
> have any requirements on arch/ headers so make them depend on
> COMPILE_TEST and extend the build coverage.
> 
> 

Applied, thanks!

[1/6] gpio: zynq: enable building the modules with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/27cdde96fd1eb38cd0675c6ad4be769f852b3528
[2/6] gpio: msc313: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/ce4f4ce18e162c15d7288e78383e9a5000cd0b61
[3/6] gpio: pl061: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/e40952bb8c6c54efbb1ae1dc8dc8ab71e17587ca
[4/6] gpio: rtd: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/27747874cd90a5b61fd50f1df7f7af017b42f479
[5/6] gpio: tb10x: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/90d80a3dc4fb24446d9d423c1c8967a63f136b0b
[6/6] gpio: tn48m: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/a5d8e0cc96eed600a347bbdcd125a9274a92e187

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

