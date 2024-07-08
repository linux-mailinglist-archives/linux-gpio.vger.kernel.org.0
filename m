Return-Path: <linux-gpio+bounces-8108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C292A94D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 20:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB4B9B20DB9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 18:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B33514A4F0;
	Mon,  8 Jul 2024 18:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vhb67Vdb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B714884B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 18:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720464798; cv=none; b=Dwoi626w+JmwCb50VF5a92MYzhxY+bAYAigta014LwYddtoehcYTm6DLEL0BXc6fiQ7JKwFkVLkHyQ+pnoKYkr32NfpeuR42eAf8c1RvEE412T86h4w7ngfK/QrD9JfbddMnRXYlpHYfutG8rOnOVaJWof/5UnPj8zUnnT0bXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720464798; c=relaxed/simple;
	bh=IJ20DTAJVfUJ73KLk8Pxznpf7Y1xDRzeSHWXIpxTVBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIP5JRBqiY7gq8su0n4KBoOCtf07FgFXkD/w/leqB2pwmVmI33VTv45oMifvfaN4jQixhQCXe+Ez3HIK+Sh6mCXCGIrLLcFueZQ2RnnzBLc399zzWgH3sakC5tKrKv9JCl/pDYFli2x9Yv1cDoBLVc2eMqJ8pRECESRosIjiswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vhb67Vdb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266bb98b4aso8967155e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720464795; x=1721069595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpgKAozghv39EbBYnbB5Rucq7iQ0mH5NHNBY8wjVKFU=;
        b=vhb67VdbiZbNgpeXarUmDpQwzpSJFRrr0+jJb7BvtGg84EOSegT3OQynJZCoxo8Jos
         7G0Aqz4p2rbPOIm/mC8Y8YpYfUNjz5ZhcxQTd3QBHrXbiTp00KBk8pAXn7AjopdH0vUB
         KNhunAmK16Waov6IuG4+SJ8NMf0dgtrqE2npL9hIco/J2p4eB4mh/3jEGPUegSZ1EWC8
         HcTP6xzI1hOvhBWnKweH1jruLo840lNmAU56AyO5/w/eWcmeB8P34DI4q4aXaLUwKdrU
         2t0l3PHMt7YS2lZwhgo71riFdVRBLEK+rjb4/t0cSxOAooQKmZs7MrHY+1onFJOzmhp/
         q8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720464795; x=1721069595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpgKAozghv39EbBYnbB5Rucq7iQ0mH5NHNBY8wjVKFU=;
        b=tktDPpfCd/N5RszTLmAZeq7bnhAtbzFeZuF80RFZO5KQN0nFbiC/oD9161mbBHBlqm
         ilf7duBk1eJRBfLydCA0j9u4dayw2qBM4W4KTT9C1T5utKxquxySeoGHiGFeZANEwMNP
         VSHXC17Ny6pXeU0Cp47plsD61blqxRakNIG43r5zthXBc/0/pVL2EGfFlxiOE5zi4sOI
         heu+3lA7SXFp/RChOFyliIcZg3a1+rniV9E7Z2L3+EbTL65nMA3uIzOIDSs+c8iFaDNB
         Ts5GJTTZQXSo4GmFsp8/IW5WM+PYZ/8csbTnyBGzLc7xMAOJJLREy2LFe/h67dight3W
         HFpw==
X-Forwarded-Encrypted: i=1; AJvYcCWdPoVvSJBbwZZPYj0l3e+TRHpDve7D6nvwDxPxM3P0io4qlAnvfB7S/dUqSDap+vIcY5FP90v4VjOsVPNz+fYEK7MDS5N1fFysNg==
X-Gm-Message-State: AOJu0YwGcqhM2EbzE2T/ILfIPB6vK+F0NrOYU3z8pr3rf+kg2tkZolNJ
	8g/Ujicq+FSt1zKM3vuS4rsFQ5TGNP/EuB2dh/600MZiXPhD3ZK4z/botTIuWGI=
X-Google-Smtp-Source: AGHT+IHL2HhZOJZbdrlzmzVr+L7WRSAYkvYsJxwlVxyz2NLzy5jCh6J8pdCUEDVbcXrfpny5mSsgQA==
X-Received: by 2002:a05:600c:4712:b0:426:6416:aa83 with SMTP id 5b1f17b1804b1-426706c91fbmr3891275e9.6.1720464794974;
        Mon, 08 Jul 2024 11:53:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d69d8sm173548095e9.19.2024.07.08.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:53:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: cxx: tests: set direction when reconfiguring lines
Date: Mon,  8 Jul 2024 20:53:13 +0200
Message-ID: <172046479108.131648.11523171939648569123.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708094827.84986-1-brgl@bgdev.pl>
References: <20240708094827.84986-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 08 Jul 2024 11:48:27 +0200, Bartosz Golaszewski wrote:
> Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
> without direction") made the direction setting mandatory for line config
> passed to the kernel when reconfiguring requested lines. Fix the C++ test
> case which doesn't do it and now fails due to the rest of the settings
> being ignored.
> 
> 
> [...]

Applied, thanks!

[1/1] bindings: cxx: tests: set direction when reconfiguring lines
      commit: 3e224d885b1de54fe5510b9c5e7296260a1a4507

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

