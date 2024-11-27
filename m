Return-Path: <linux-gpio+bounces-13318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E29DA829
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 13:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B52A167429
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 12:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D896F1FCF43;
	Wed, 27 Nov 2024 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P7XaYGf2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CFE1FCD18
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712296; cv=none; b=mGFavMHXz8IyMm5okOlxyUTSB2uIEqZX6xYsLnmfwc0LSIhAXUfzH3TBtN76gvr/jZf1UsWUsWcJwb+PnFSk93G4vCZX9vnftx5dcJTkD2Eqv7SMlJ06zgQhuHG8GgpPT9CiotMwQDMpNmOg8lm4galvd2q2HRmgBoURmZEZ/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712296; c=relaxed/simple;
	bh=i9Rrz7HUF9HaN0K5xTV2krlihovHJMAtmDnCN0BMjAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEo3sL2nfw6/S+rHPjSMNNsVHkLdDGDAi4ySGnBFzEJPC52p4SrVUbo61GV8++oedcKmkc36Z85bimdXlCnmiDaqvD1BJfxRnxoLeuZeuHsTCRyO5M0xRbR2cc2AeOvQTBIx4Lorg+1zVe5z8qU3PKA4S4ruVY9vj7Bx2n4pVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P7XaYGf2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3824038142aso4320944f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 04:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732712293; x=1733317093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6ITS2wzIB+zDhcV/tjCKkDXGcRyN8gBi3p+N0vfQsc=;
        b=P7XaYGf2newF1LnM8NaOkWxcdZghzgvcgCRpUHffvUf3RVwF67oMfCGalVZEP4dIo3
         vVDXp42Z60lW2Mbn8buM8mWokpjZO1ptHgCulSAWHOTuFhbYzsIxlP7BjjHQs0z6Oz1U
         fGTFZcEeeae42c9rpOvDBYtxzoneHwoLtBLKUklrVb2YhFKxMnBobrSCEapT8oEVe7d6
         p1hiQYSqXRC+irzuamZ1qHjuk9r2ASCDYnOTjYiGrrg8/z5cuCnZdn+WyOm9sHGcdQEF
         RIRuXghpjmrYUKZWmJwuPuCgOA5AlkRHKHd6goDvDNfnxC1/sM/5prH4nxHXnTetiSbr
         xAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712293; x=1733317093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6ITS2wzIB+zDhcV/tjCKkDXGcRyN8gBi3p+N0vfQsc=;
        b=CDdh2/x4vC+7vSWTkjZt4LeLxY/LHtU1Fl6Xo2NYolq6cRMafyd5EcpgpVuGCoUQUX
         FxZdBsH/+PfMakMEBYwMgB4zZrhWqwDaqeQvZclw6O3DHamzYP9Q8WxexDRbxe10SFkk
         avJTENIgX3ZMPCVW2xZDLXpFflNscs3nnJQA6koJ5Y8jHG04hFwVcAFGblnimISnop5h
         BvMTHJhYgFUU7XecXkYOUUyqLwYGTpiw3naOojQRrH6twn7+VKpaXFCmJ5usUMQCNiQA
         GzZX/Wqsna769J1lRHE/lUgAQK630Avt+WKVaTj5jjI3ISaQCYZkcjNm0Gq9kP/hwOnF
         WN7w==
X-Gm-Message-State: AOJu0Yyw1hRfU+s3Ypr72pqritUI9fQ5pmD5Nwbvmkj/nrmiXw6veNTM
	3CxvAgre1PlyvXWmeTeYkbxxXp99PGDvg6p9WWL8Gx8iKMSPMj/rf0vzcQaHOYh2o4ul9lriQGI
	C
X-Gm-Gg: ASbGnctT8KmoMJuPn/Y46aSjp46nbOcTc8qlp+wIs8czjftG/qMLF9cnPnAW3innuej
	NQNQacA1k7aW9bDE/Y2AS7+SfinEBHH5+LR9GPmfu6o3L1WlDSJw5B6Hu1wkhMyMUldDX6ro/TA
	rvPg3tjYrUeBkqf3mBXlz+XJHqiUbmqh2Ttx2KgnPQtCh7wIaeGXOJbTT8r+o4dDuwAj0ZKFEH8
	frzTsPU0DGHHh8G5d8M33qN9QYBK6jOkH7JDxm72VWYjLxByA==
X-Google-Smtp-Source: AGHT+IFjos4Xcm91J6x/0NmBmdA4N7PQxD8ByzW9BqDTY2mdg1rsbrMDtgYjvv8/73VIC7ofKL/BKA==
X-Received: by 2002:a05:6000:2d81:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-385c6ebd43dmr1501388f8f.19.1732712292968;
        Wed, 27 Nov 2024 04:58:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fecd:58cc:bc05:528d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedfccsm16170524f8f.101.2024.11.27.04.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:58:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@gmail.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH] bindings: python: migrate metadata to pyproject.toml
Date: Wed, 27 Nov 2024 13:58:11 +0100
Message-ID: <173271228846.89885.13306471897263094058.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122171027.762311-1-vfazio@xes-inc.com>
References: <20241122171027.762311-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 22 Nov 2024 11:10:27 -0600, Vincent Fazio wrote:
> PEP 621 [0] designated pyproject.toml as the standard place to store
> project metadata.
> 
> Setuptools, the build system used by this project, has support for
> reading metadata from this location. As such, migrate the majority of
> the metadata out of `setup.py`.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: migrate metadata to pyproject.toml
      commit: 1ee51f95c5258aceb2776febdd5cc93f6b2a48e5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

