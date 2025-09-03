Return-Path: <linux-gpio+bounces-25440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 845ECB416E3
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E08D482D90
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 07:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBE52DAFDB;
	Wed,  3 Sep 2025 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RKyW3rPN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F202DCF78
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885138; cv=none; b=ePHWLBVRpwROw12/G5LzR9hE0QPJiEDvme63hAkFEYkF+a8yuR8WuvQ9+JHtmnUNoNmkkX6CmaALtGI+DtlsnhfVesaMpOYbzwHCRMRljYIPvjnX2+OqLoicaSTY3WuO8iHDmrlK0wNr1ciuYMwaskZQzS22DpVH8vgOfpKa8tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885138; c=relaxed/simple;
	bh=5R1W8LWzThf0lefJvjX7dgtNUQ87EdiwGUIQXxLzwL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RP3GKjZt6VrpKMtnGpSPnP89hdGXsdMfZkJjvJGIWMcq+KiGRdXBJQROOqsWheAXckwegwGOCGT02ZP9UXXURMwnY2ITfKEAG+Ng1/mYhRp+rW73/ydQpKx6IHW7X9gRBA2kh/cAik6PEprMEbW8DCyWuH2CaFkCEXONVodp4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RKyW3rPN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3dce6eed889so382007f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756885135; x=1757489935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=;
        b=RKyW3rPNGi/Nz4B9jAeglCHRkp9TFvVoix3yKzjp/SGPL00lJe+XwBFLumtC2YpB89
         j634Iuyub94+CuOUABGVKQG3rjIzP4jiQ1JfdbS3yU2K3uQWuUjoXduL3/qDh1lLwGFN
         QNTnbH5OseM2XVNwNp6cLsw6qNmdjB8dcnWev0hyB92RNotodYpCQYSgSRqYlK2nRQOn
         A+RslbeQZMi3wYooTKd6hjQYT4y6uOs05BMfXjLtUbhfAqqH8KEeW/NLTeMWavz0igKv
         I3MYykytH8vkUAveyUO7pfSYCOf28vm1sA2JstNITLVGU2mcCngM46Y8hpRMnjHtm/0P
         Oxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756885135; x=1757489935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=;
        b=WMdj1DlqogPZp4Nb1PySFXN5Tw0CuWTWSHuiZdsZ21km9QGyV7AXjuMv+zr1HUJB+S
         jbraNBq8IHu308PvZD9l4MI0wezvDIYfVwXxgHr1ngMFDy/M5MBpKTFeXbbjbaDt15vg
         9MAf5HTyM0nXx7uiVPC7xnl67seJJNFccJuTbitnJeM4rGd23rCPsHxNAHdCdgZ283Qw
         DqM04e8+yKKyPE3fNWucTVtIQhZkF+oJsceWHIWqGqTkUiBVa3oLcq8OTHiAzxPmo+fm
         nto3qZG18zgBrjbkqW4WRjhUwpO75aS9b+zc0AlR/kCbLCBhpQSYj6uBsLtF76mKGO9j
         g3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUGKK4SyUsl0eQS7guILHhToAVCt6CeI0IALkSwvPBw2nmstOaOI/c6qHK93lQKKiuNEtw+ETISsIAn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+kseoZi86fD4NogsVmFgxJdzuOxWgb1xEK8VHYxMwqSPDfkJ
	2mO0neBKbQgAekJWXSSz1Q6sMJjGhfp1agEOB3+n4ixc3Z9MjN0dbOvFOr1wJ6H3agU=
X-Gm-Gg: ASbGncuRFr+vSgDHFfd3NGZSPhuMQxf6cLiv9NB9tLW1FJYlsptVRCfoy8N9kFYI7Ps
	XiaasHq9BgngcJeJJuXpOO7tZm58BETX5fzxKwmq0+7ep90XL0cgYNEpSMkQuhTkUfTU/KCyw4B
	LTVdXNkHdFuCN6iyKrrpHp5VL0jgg9oRVbU2AkDBOLQDDMc4QpLRnZBpNVGQWBtOCI7eraoQjMf
	fxgIVIyEpweR5Ew5VkPcCpPdfL9E5xYrugyiArlf0a8cvLZZClgYtVoIClEqcl1VXmXT9DoXDmv
	NmiOBeZfS8uPajO1o/Q+8EDGutbVY3Zx7kiSf7HZiQroZuHXICf//bmDuLB31Pyp97Sfr2eLWnn
	ddxxtBHXQtxc4j3c+61gybL0=
X-Google-Smtp-Source: AGHT+IFkZYEPWWCkKse2PQo7g1HVYHPWt9iUadycuLD1iYe9gFsnwRwmTjB2wHvwzo04UWlct/Y1jQ==
X-Received: by 2002:a05:6000:64f:b0:3d3:1ad0:e8b7 with SMTP id ffacd0b85a97d-3d31b2c7c54mr11268847f8f.12.1756885135098;
        Wed, 03 Sep 2025 00:38:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm13417216f8f.0.2025.09.03.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:38:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Yang Shen <shenyang39@huawei.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its modernized alternative - part 2
Date: Wed,  3 Sep 2025 09:38:51 +0200
Message-ID: <175688512868.10115.1073812305846607850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 26 Aug 2025 11:35:01 +0200, Bartosz Golaszewski wrote:
> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
> 
> 

Applied, thanks!

[01/12] gpio: xgene-sb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/38d98a822c143a4a7337d08f50968cbd7b701ca2
[02/12] gpio: mxs: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/d3332dd1f6e2cf82744dbab37d05857e2d028fa0
[03/12] gpio: mxs: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/c7357c8b6703d4bc0db6198782fcbf0cf3033844
[04/12] gpio: mlxbf2: use dev_err_probe() where applicable
        https://git.kernel.org/brgl/linux/c/7cb9086790a0de526ee40508a4deaebfd82a5bca
[05/12] gpio: mlxbf2: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/72fdbf35ec7273bb1c885696680e611c47b261b4
[06/12] gpio: xgs-iproc: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/6821e5d5877ca80b6989dfba2648a7ecbe3d9a64
[07/12] gpio: ftgpio010: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/cf0257d3ce05259a74265fe0a0bd7de063cc6793
[08/12] gpio: ftgpio010: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/3ff7ab070b4804aad5b1d3e3d82a793710ef1f27
[09/12] gpio: realtek-otto: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b9dac8251e7e6aa433f54a7da45cb05c66627695
[10/12] gpio: hisi: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/c0378e59a6af2efa470a384b69fd24d3f3f3dd97
[11/12] gpio: vf610: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/656dc0c6f725a29c9e48657ae3db78f9016f518c
[12/12] gpio: visconti: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/a6f03347debb7c2c6d04cd4be67ed766e19633ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

