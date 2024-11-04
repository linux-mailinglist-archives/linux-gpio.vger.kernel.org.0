Return-Path: <linux-gpio+bounces-12495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C39BADAE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B74ED1C2124E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C756A1A0BEE;
	Mon,  4 Nov 2024 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NYHZWuln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FA19ADA2
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707709; cv=none; b=IJJVW8QuyPO1FxD/pPenOz/3YmjyYTXRzD6MWJ/8fRTowJjQLO4ZMUI//AZo/bbpiUDTmYZg5fZMOKHi2JgeMhod50qMNtDIRGiVQgMftDnoa/PmJMxCjFxyNSF3+DejUiUCunkMg1wsk8dlJ/kPQLlXLKgZztzVVK1ICgftWig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707709; c=relaxed/simple;
	bh=3JEIP3trdWXY3OhYKZ9hDufFF7JwJ4CbZGyMOu7x8Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfP8NqAOCkQE1RZC4VqAwYRzuXDFIVpdx6/PShkvRexDZBxYsrp1mYZ3BdAkQh/Rk6BPddDUWEva44GU1RLYeQzMmAIGJRkI6AhGHsUpUvILi9665lQtvg8CE9e08vtXzn2+ipGVcHaL0cULZMwstebydqzjVFgVgYyhs4np1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NYHZWuln; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d518f9abcso2677062f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 00:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730707704; x=1731312504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouKh0m/U67plJMM8f2yCQV/CR0SvwhGX1mh7H97wvBI=;
        b=NYHZWulniFoS35L4/IGFC6jdA6kKvu2fGSSWwGXypGkVeExPCOZKgKkdAr/Y0/EO0m
         QEBPATlUUu9vTtA18DGiwP/FU2oj9p5N6rkxVWGL3uumQt5uuQemO8cSeaID5Ywes+vx
         hCQh78WctHb5tvoEXB3m/8jR9MmONuxG6ejOR19BchdppWi6BV15sSM+RIL2JiY7VJJ9
         JU7tlLXXdNmBaggd7Hi9at9Y0Q4I3AmWmcuFzkiEXxKI8cxG9OjnkW9FNfKuwJuuTwv5
         n1Axo23Kr3Olm/o4kHBgcJ/smGS2U5T2BQuBR8nPEss1I8z3H65zGMOT5bu59ZdH1JGQ
         v9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707704; x=1731312504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouKh0m/U67plJMM8f2yCQV/CR0SvwhGX1mh7H97wvBI=;
        b=umayRO3QWFYY8LA6hXfWUx0xPCi52t3OWPB02fsRyWNVTw3u+V9KjGNxkpliNL9wVm
         rN1oeNytmtzC6RfP6AFtuLOqFD828QhfK/mEC07eWOk0YbjgcbicYAsze639ZxcftgD/
         AAqLsBHUGdDkfQCMM7PBVICuxt5dCp4/tEMk6blba5Tiqy3BnwtRsez3hNhY3mToyAR3
         Vb8kzW6qqMp1BKSbOkULmfj9OqrOAXDbGrzAAg4yrIjgxxEFo2PgRiiW0VlE7LGGGiX2
         12NEXyI+CcljcrK9/NwNtBDDHkXP3mVIbV/mEFlQabPFQTUilYoe9tVvx2OJoL/uF232
         R+6g==
X-Forwarded-Encrypted: i=1; AJvYcCVzJkIctbVzIPS+J/hWpRXG07vOG+QKD8eXP5Vp9SDRhnyx6FjQxcIxYxM7tZnjbGdXeanf2bYDjbuB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Xy3Dx5OlhvC66evWfCzTP/YqLV2r3j7m5w9fZpJzgbdSLFoR
	Pjgra+uAsYYncoBnsRhFLGhXSDc9YhKUwamEqhfdtzb1dlvJqv2lbREUzTPF6MrTN8wA3SNOU9i
	l
X-Google-Smtp-Source: AGHT+IG54Q34UUUKQL4iuFFh1ouFPZXXkdCJqKConmKoPt8E/v5DXrBgiqWt4jC/95WRoUFI72oSZw==
X-Received: by 2002:adf:ce89:0:b0:37d:476d:2d58 with SMTP id ffacd0b85a97d-380611e56aemr20304274f8f.45.1730707704225;
        Mon, 04 Nov 2024 00:08:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2603:7936:7734:a187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abf3sm12492563f8f.101.2024.11.04.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:08:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: don't report GPIOs requested as interrupts as used
Date: Mon,  4 Nov 2024 09:08:22 +0100
Message-ID: <173070770020.10504.9321463955414503988.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031200842.22712-1-brgl@bgdev.pl>
References: <20241031200842.22712-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 31 Oct 2024 21:08:41 +0100, Bartosz Golaszewski wrote:
> GPIOs used as shared irqs can still be requested by user-space (or
> kernel drivers for that matter) yet we report them as used over the
> chardev ABI. Drop the test for FLAG_USED_AS_IRQ from
> gpio_desc_to_lineinfo().
> 
> 

Applied, thanks!

[1/1] gpio: cdev: don't report GPIOs requested as interrupts as used
      commit: dae01ec714fbbf3a71947668cb61cee4cc320647

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

