Return-Path: <linux-gpio+bounces-16670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63128A476F4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 08:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE770188B76F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 07:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3A7221DA6;
	Thu, 27 Feb 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LYFRcNm9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A561D213E71
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643101; cv=none; b=a/WtxlMzDNZxBn9ZT6hbcjd6bEQEDxKFwELle482jLBiTrBtd/rt8NuZz3GC1ZjaC/by8ueEKUGQYnTtYl8HUBdb+h/TjsErNOgP7nFBHLoHItW0oQi/AUU+5j1nSnwDWLxHBaqHK/vITBXRfajQwUjDu43TzSszKf1oaZfOqZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643101; c=relaxed/simple;
	bh=dBUoo4HkdPsPB/a09rol8wF45I3Q1kMtFXdsaoK/dik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rfNZL+8HF/ztLoXa38zfEqHAsI7QA6VN2ntpZRuVjAA9Eb6kwIzGrXlh0Uwkc7s3GBXt+ha09ZBaLJ13ME0Qdd4vDVdFLXVoyZFTjqgHvaVYpIwwtQkbyaG7O0UG97jprC3xjWi4up/9hv5rAj5XO65HGZPSDI7RAZSeYqwQO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LYFRcNm9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a823036so6330535e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 23:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740643098; x=1741247898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN/1+Dvy1pIWqRV2HfuQkQI4NcLTbUVzevWMjjLr3SQ=;
        b=LYFRcNm9wKn7KdMsUwTk1BfGHE4RNRz5m8k8qCYcD3tBfbA9qlJqwvfwl5VyNhhq3e
         58g60rrXZL5xMLQsYRs4MS/TINoPmgbm3oz4n1GB45Cq04FFLcFhPF++GGAJHJqQgvwT
         meWdFKdK+EPPskCKIgXfWIvXsmFRaywT5JBFC5dAlPjvvSTOKU3qM4KJ4Y1F4VGt+pJ1
         avjvyXVhe0Er6fVoCh6WjgxkY/r7JBqFKffjvaJmYic/5Em38dtfJ1deHs6AVtEG1UnK
         TrmwRE3L5BEae3FpohDmsAbwC6pEyqPJRNzN0wQaxg1FniGaPqMtjUNf4WzZfyN3EFUD
         +Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643098; x=1741247898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN/1+Dvy1pIWqRV2HfuQkQI4NcLTbUVzevWMjjLr3SQ=;
        b=iiPnXBebKpiXNVIJ2y+l9Z+IQGCWcNb5uTy5bG/sk73AGXuNjE1LUbYTb/ggO5Y+b2
         UdRTLM/xEqOuH+2QC+IdENN232QQsjBA1tNLbcBWOnocZvQ8wWgCClfqva+srWqTckfZ
         QdmlzZjr58aJxrmW8SHkXH1e5m5W/PqSHKm/iyWdptwkwRapt+Xl77lbCT3TCnSDanTO
         uNB4vDUkiK45IpEWYk5z+p+hDwzanN3L2gz+/nAD/wmIRNAo+d1jEsTIzR0bMl8sdhID
         1i3jJse9I1S/YAyQ73QkPV3K6PGjMzeTFOPqOqxS+pWC/EciM1f4EZlwjncPWddhNCr4
         d5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUvMo7X/K5eHdRC2AywliaUVQ9uXD/wbcN30DnpHx0UoVjxHnRbGgylAJ207w1cRgImmDfSAnLgBugT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23tZQV6b5ejk6RiZP2w4kc/TRtjLedq007u94RCqcLfAAd3Ri
	TfHuuMkXrbd4swlnDtnxa4xT+foFF0wGk2bpAOD71jBXHSenKt+QC/E4m7ZqPlI=
X-Gm-Gg: ASbGnct5aDHezJHvJrbuJRUV7vEuHdEvdDX5ShyN8idzhWk6W/nxuRt++c5gVcokFPX
	9nlzOcRjeY7lcftqIDR7Jdj4Olne3s9Y/8LQdsIeMxyXHmF6IJgegQO3HFNp9FffTHDhY2JlDtP
	Ii591LE3SCynlMHorVZuDTZBnKfbAys4ZF/7P2ZPkUqtCmrQvDEciVJgzwayyFWTrRdAiqINZc2
	rD3qm/it17MW6KoaHG0v5gajuZIG/+18WUc8axjHqQR/QzCMaQeHhWgOd4B1X5TOnQwSkpMOz5Q
	w16jy0nx991YoZ8m65/t55PO6A==
X-Google-Smtp-Source: AGHT+IF3sBOLZBtF2H3ra7eCA0+civX2mMDDIXML6HJy3fFHHapQwfDiYWARVRPHDLlUQvdKc+mSSQ==
X-Received: by 2002:a05:600c:5489:b0:439:86fb:7326 with SMTP id 5b1f17b1804b1-439aebb5558mr174988355e9.22.1740643097826;
        Wed, 26 Feb 2025 23:58:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b50f:c403:bf52:2dbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b947sm46155715e9.2.2025.02.26.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 23:58:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] gpiolib: fix bugs in retval sanitization
Date: Thu, 27 Feb 2025 08:58:16 +0100
Message-ID: <174064309353.7700.4012102526424090624.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226-retval-fixes-v2-0-c8dc57182441@linaro.org>
References: <20250226-retval-fixes-v2-0-c8dc57182441@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Feb 2025 11:12:28 +0100, Bartosz Golaszewski wrote:
> Here's a set of fixes to issues spotted in next after queuing the series
> adding return value sanitization to GPIO core.
> 
> 

Applied, thanks!

[1/3] gpiolib: don't use gpiochip_get_direction() when registering a chip
      commit: 9becde08f1bc2857cd66f847eca2aaec3fc05c21
[2/3] gpiolib: use a more explicit retval logic in gpiochip_get_direction()
      commit: cc78604fd4799a8e8e9d23ea4898acd6b605982d
[3/3] gpiolib: don't double-check the gc->get callback's existence
      commit: 8a5680bffb2f681688b5788751c767fc380ff9b7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

