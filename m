Return-Path: <linux-gpio+bounces-10718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ECF98DBFF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5ACB1C21E92
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAC31D1E9E;
	Wed,  2 Oct 2024 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lgdfa7EQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9111D223A
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879482; cv=none; b=UQsHzDLAfybntXMlvKVAEyw5zJGiV29V2ntm6Gmh1Rd5LR8UYrNXNdsKxpp8z/+Or9JAEnpxdVZuv2eYT9h3ydZn8uY9t6hWBS07zwWVMRfdn/WdgQJ+Qf2Cp8sNi3FB1NWDSySaK3CKGzu4Grza6WFb1vI4rowsUDN8yFHAnOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879482; c=relaxed/simple;
	bh=ykREyh9x1KTRqr/wwS4mnOcV19SZx/ki8EhNgfVLqEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=beDl0srcwwh5uPKccVOVdoY94wDskFdu52/tMDQnKJaMf/Y7B61v8Hd1nsQqE+HvmEBlGD4OPu0aIG+tL6As6Bo/ONcaXtoyk+bD+tH5x4B6WRsRe2DGYNJMxPhsw0OKrb5zAgVV8kArJ6dY/3VfJ0B1t6H5dn9VGsSHI9KbeP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lgdfa7EQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cc810ce73so3916046f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727879479; x=1728484279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjQPzS/MJrLq46eXqQ4aNscS+M0LeyFOPUBd+2rGedc=;
        b=Lgdfa7EQ/1EodASBzaq/nc3PjGyweSxkT799ycFS1aYDfddVyuZJtGjZKFBWEh5acI
         40Y5AKawYMoQOsluEJE40BHSBXNiwajLATSPCrc7+Rtjt03HtD0A8dTDQiTno1NXaim+
         6bUmE+xdd+ynibJlbjJObkRxQ4CMwmm+Rkb+UmfAH3PVuziLj8CrIRJnd4Tqa9h/LV2s
         gk2p/QKSaJh0ipm4bYX0r9h4Zk0nPIbU39EJ3AL4l8TtTO5pooVc4UbVQtdcLMbREqwu
         ZJkFwA3t+yhBRT1/oVazWIID83AGGj96pGOecmPu6mRZRKAOTbp4QmJdMi1yy5nueoLh
         mPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879479; x=1728484279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjQPzS/MJrLq46eXqQ4aNscS+M0LeyFOPUBd+2rGedc=;
        b=SWrnx90PSxb4tkcWSE9x/ZaWgcZ9MtBVXJoK2zsJpvevaKVOK5vMPJ6BvL8JbD0a4L
         dSl6qxLpzEofK5+A0aBlshsu+IvQKWiwjIalrHzavcc416m09XYv2A0k+U9yGcodzJDE
         +N8ADnTDLVqlZmPwxKm/xSk0TWotu0eDf6kRP+ObHygRbfYw11uOTn/mxv1+n6A4MBjW
         wQcFAV5+qpSIj4NWNpps09rqjyYY/uj65HK8Ugt+m0dhI70XVy4165nipbGPSrHeoqQz
         gC1XBKadeNg7qI4vIfMf4qK2Axj6cRl6mWcoCgEA+64z5BrXXB7dKFcV8ET5yk84CJ0H
         MIxg==
X-Forwarded-Encrypted: i=1; AJvYcCUiuMqs+C9ITKL1/qBw4MWkOPrr4BrsI5bhPLivLUWSSNrBXSV+e3OnAP5Wnbe9YI0l3PQ7vBs4ckIg@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPRxmzoUzNk8aXTzKcpVfejQvd60cFAGyL1MOyPqeloklfYQ+
	Lb0bdfphWPkyf7UsxmFe/4v6RNWbbWyWAcMqS6vQqZ/aFotSSCHc1og303XXgIE=
X-Google-Smtp-Source: AGHT+IHp1Gvw/6FyviP/oTIn0IWO/fydl/1lUDVPvRPTvDJXp4kOuQepN00CeUQY3ohoht4U6jSCkQ==
X-Received: by 2002:adf:a344:0:b0:37c:d12c:17e0 with SMTP id ffacd0b85a97d-37cfba0a3a9mr1963179f8f.56.1727879479132;
        Wed, 02 Oct 2024 07:31:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:23c5:7b17:f5a4:f41e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ec0dfcsm19937005e9.19.2024.10.02.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:31:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] gpio: sysfs: make the sysfs export behavior consistent
Date: Wed,  2 Oct 2024 16:31:17 +0200
Message-ID: <172787947380.72758.5168669615595836836.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930083029.17694-1-brgl@bgdev.pl>
References: <20240930083029.17694-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 30 Sep 2024 10:30:29 +0200, Bartosz Golaszewski wrote:
> For drivers or board files that set gpio_chip->names, the links to the
> GPIO attribute group created on sysfs export will be named after the
> line's name set in that array. For lines that are named using device
> properties, the names pointer of the gpio_chip struct is never assigned
> so they are exported as if they're not named.
> 
> The ABI documentation does not mention the former behavior and given
> that the majority of modern systems use device-tree, ACPI or other way
> of passing GPIO names using device properties - bypassing gc->names -
> it's better to make the behavior consistent by always exporting lines as
> "gpioXYZ".
> 
> [...]

Applied, thanks!

[1/1] gpio: sysfs: make the sysfs export behavior consistent
      commit: 700cdf7ed00f0cf20fdcef33d56e862768eb1008

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

