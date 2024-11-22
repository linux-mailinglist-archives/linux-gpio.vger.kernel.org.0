Return-Path: <linux-gpio+bounces-13200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4B9D6042
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 15:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 654E2B21E34
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 14:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514D17405A;
	Fri, 22 Nov 2024 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EC4A2+uh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4154B2309B7
	for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732285469; cv=none; b=NZuzXlshyD18wDjI+zrV+MA5QCJfsE6ieSfqDcQ0trc4VajSItNWjP18RZW5is2oWUrwt/2F55xdSpGda9s3UqXidw6YNUwuXHeRe3llfvJgxdW660Q49YHDJgZGnSwzLlj8tqwZ4mw8jOWS7/hyj4Lb2CVOsCT3TujpMBBocME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732285469; c=relaxed/simple;
	bh=SZrIbYqNJooRI/8mP+lYzjg7Ex28ZYxTZhOjMiHUNPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZ8idZ0yGwljer/11wzVfFMI6p4YLPgHOu4TElOn3X881BpQU5IzwNXY3cbFG1Us9WS/enlt/rCv7k4VQ1F8jL3hmwDd/bnhO6zDZycXAkrQ8Iz1OlYD35k66M8JGci4BVU3QmcDMulEplaNr5Ev4sWcMemZgu8DQ9dqWER3qhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EC4A2+uh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43169902057so18862285e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2024 06:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732285465; x=1732890265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Nh6Qm3+g7FvP2C/uBSg+5gQrB4CqmwHy+4OBt6kFZI=;
        b=EC4A2+uh64dTIGUT+8QIUvLnOQWEkhXvOFfncLcyFP+Gd8TNZkXX3GKaGy44KJEBEb
         EQvZb0hcASClrxmreGjVvNY9OYqiImQu0c8yxOsQhpQt2tozOYDuYXVj/VEulmmNT9jJ
         BKy4TLc7ane+8sOvuBQol/LDirhw/yE+L7mFnUPolcOSSWda1KZXb8QmbSki9CHETcVx
         kWl8ialId8mXqDhj5zbYDg1f27p/B3uMLWzF/nAjKQLHIG6wpquOY+qfuDvkL6y3ZKWH
         GnAjABsLfWlgQtcKcHIq8DAvfTtcxPlZFkdnXN7WfwFJXOxpvHSPDS5oXRbn5uQeVtyV
         syGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732285465; x=1732890265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Nh6Qm3+g7FvP2C/uBSg+5gQrB4CqmwHy+4OBt6kFZI=;
        b=UjowKWkLeE68u8CYzRHmfVXi8W8NAdbiN/2R9Ocd9pxokmHClGlErVuiP/OwzM6avU
         0pwY/hRh06abKInfPR6CPqNnN52ubDF0rqNgbki7h3+Pe+++nXhWFzZ+iDfXApWxADJe
         rKBIoOWQjL/pCrP99j7x3FqSS2YOtMqfg5lTeOSHIMPH0sCAihgVIve02E3MuBTU3JcO
         BO9lV+ydRK7Ocepv3XgC1GGVcdyZrg3Du4IyJz4QUpR+F0RwtlWmVFxfGVzhZdPUQ22e
         ROa+w2bfV4do1MiAqCvNLARs9uFPNCbxKAxyHDMHCoB/7Tma2budhoY8DZy0Ap8bMuJU
         1B4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnGWZbsOMKwIX+oWyUvMemtUBVMIuPk8rnAsGhptcVO36sVmmpkXnMcm7TtDOo50cpUggAsmpKLnDU@vger.kernel.org
X-Gm-Message-State: AOJu0YzVmdtAoavaMW0T971b1SGUTHCv8F9NorYDuiyXBiaT1mr9Z4HJ
	DbjTEErqVNNUncpaY+Mbtr1toPC7e7otBJs+fZiduubZNYQDAz2qgZBDK7DyONo=
X-Gm-Gg: ASbGncuDYuJrMQNleym7EIUZz0mfcsfRJGfY8kEioXQu+alrSaDuf9AoDIG4xYuCrnM
	+2Bc1L8+nzA94sSt9HwyeT65Woom8FQ2VaDhFPKe9qpsauT7MIe/qmiNWbc9i6rivUfXA0eXsOu
	d+/mkCTTr2v9scnoKhfrOTmmxqL7yuDBTtdk+BOR8JgTKZnl2boL+7foXR1PrlouT0e794M3aCX
	7F27Ual8+iRm5B/Cce9/3YVgNQUMk5HAz9U+HC0LeBY4LzJ9g==
X-Google-Smtp-Source: AGHT+IFIZ2iG2mcVpwd2xQ6e2MRIo00PE7xJ1mgrdA8y0aNVfwo7kWxoPIgftfJ9yBIuyCxe0iV2Mg==
X-Received: by 2002:a05:600c:1f96:b0:430:57f2:bae2 with SMTP id 5b1f17b1804b1-433ce4ab949mr23121145e9.23.1732285465348;
        Fri, 22 Nov 2024 06:24:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1651:6ba4:e8f3:d05f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4ce6sm91642195e9.25.2024.11.22.06.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 06:24:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: Remove usage of the deprecated ida_simple_xx() API
Date: Fri, 22 Nov 2024 15:24:23 +0100
Message-ID: <173228543205.96444.5329013618408854886.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <2ce706d3242b9d3e4b9c20c0a7d9a8afcf8897ec.1729423829.git.christophe.jaillet@wanadoo.fr>
References: <2ce706d3242b9d3e4b9c20c0a7d9a8afcf8897ec.1729423829.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 22 Nov 2024 13:45:45 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> 

Good point, applied, thanks!

I will send it next week with other fixes I have queued for v6.13-rc1.

[1/1] gpio: mpsse: Remove usage of the deprecated ida_simple_xx() API
      commit: f57c084928661969a337c731cd05e1da97320829

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

