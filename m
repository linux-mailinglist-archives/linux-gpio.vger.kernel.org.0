Return-Path: <linux-gpio+bounces-6285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96B8C113F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 16:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A61B71F231EE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 14:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434611E49B;
	Thu,  9 May 2024 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LDcN2Xgu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3DD15AF1
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715265193; cv=none; b=UIUgXK09u5i2nqPHGW9aG5leEDsrihyIbLnZQ3sUHDOazISJeG5B5CiQAAvRu4RW1b9YBLPXxgq+TM5ieKgHwkdawY6sUJ7f1TAvgwo/UInfdSN2gwzHRDGbqhgQhubLPuiItbaV7AzJdjJv7OFBVXnVZAuZ+wCtLEZ0lNdJPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715265193; c=relaxed/simple;
	bh=P6mHqFflZKhrnY8cFYVaTGruMo2tqpUT9QVYUAW+N28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWZhPMx463KvGUvAn6GV7bjIlj14io9aqWLh9IMkZvmJD8N+fMyawj9mS/IDpWUrC0NN0JeFUBPIMAetmwF3puNJmZ/XhRDrmzzLfSLtxsPwqMWH9VSNjwurth3zu+M7MGQ0UhUVs1uYyosRR7n+zhNtTN4rwLBYfeyDZ+GJYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LDcN2Xgu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41c7ac71996so6714115e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2024 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715265190; x=1715869990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kw10wQNadha+wOiB3zetZS2dCII1yMtMCe36bYLrTCk=;
        b=LDcN2Xgu2XMoJoOJi3B792nUBG45WJvFsU64sfmKiYLk5FoWS+FY4yu+VLGuZAP7ph
         5+foJu2Iq6Cx4+00jYb4NwaWMuV+XbHmdhld5iZwgaXeZGQKUELCXBQmn54CuWT9iJ3D
         KQC3WzKi8KpsvLzCnDwdShMVU7Bfvz2XRTi5aqwApP8wOMyPJOTj04XqWzgNiS9M906/
         wis+Ax5STcOLBPy8Yzyd2KQeTI+y9Z0bFXnrlcCuqjdrby7wV553B+rAtF1SYV+kosG7
         tBUMePJ3dZvDnulYBsaO7ihJT+QANIDgdEd210w+ofGvATI99RgebjTNrPPNZRGSGExz
         1cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715265190; x=1715869990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kw10wQNadha+wOiB3zetZS2dCII1yMtMCe36bYLrTCk=;
        b=p41zkQtBKnPqFWko26EJF262mFNz7DaNd7/UDGoqDL2JuZbyZT1q2zue6AGP+ovZr7
         fbo1VrhA/IkwFbPbBEDpBraushG7MJkIDm3s2B7DE2RnYL5EDZWdzPvJ9Y9aZWVT/bVL
         7UJiv0aHLupTYQSb4KBRHY8KkzSAqO5r6tSYtuE/DYlRXWrrsJiTHnbUBxl668ckS5MA
         m9iVZ5SZRsTlPv/drAm4yyXl1W/D+0dPc7KSfadEjSvkKXg8q5068O7Oi4+S/RGloak2
         r46Y7xJzRjLDnkyS8d9v1RXnsQq42fPKFQBAao9AmfJzk82T/mYWDeW2NdckuvJR+o9w
         Hh4w==
X-Forwarded-Encrypted: i=1; AJvYcCVcwCikoJMm9UTXS4czDNgeBVTivN5rdjZda0bZBmJYiWDVnc/AupJeVXtBHtWekP07EcVHVUnlIvTuoyZDFys9TybeO4HuanvrvQ==
X-Gm-Message-State: AOJu0YxMyTNhoE6r/+StilPizZgM5G9vT6R+M1zUwJ/Tbd5QCqhQ9yzX
	KetGBt4N1fZBd5wpM7HDxGn1gVjeImXHSc7IuCULxj1UP1CGMUibkyJQreWsnXM=
X-Google-Smtp-Source: AGHT+IGRWYCJCK2Sm01mEkdr2wy1cAmmKL+guyPIBQQCtljvyQ8DZJjBZD+CgylEWJdAO/c3jpcF8A==
X-Received: by 2002:a05:600c:4449:b0:418:d6f2:b0c1 with SMTP id 5b1f17b1804b1-41f71ecb218mr45842715e9.26.1715265189775;
        Thu, 09 May 2024 07:33:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5c73:df7d:ebfd:d941])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8fa6sm27902595e9.2.2024.05.09.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 07:33:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	warthog618@gmail.com,
	linus.walleij@linaro.org,
	Zhongqiu Han <quic_zhonhan@quicinc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: cdev: Fix use after free in lineinfo_changed_notify
Date: Thu,  9 May 2024 16:33:08 +0200
Message-Id: <171526518127.18413.18287613546076931026.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240505141156.2944912-1-quic_zhonhan@quicinc.com>
References: <20240505141156.2944912-1-quic_zhonhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 05 May 2024 22:11:56 +0800, Zhongqiu Han wrote:
> The use-after-free issue occurs as follows: when the GPIO chip device file
> is being closed by invoking gpio_chrdev_release(), watched_lines is freed
> by bitmap_free(), but the unregistration of lineinfo_changed_nb notifier
> chain failed due to waiting write rwsem. Additionally, one of the GPIO
> chip's lines is also in the release process and holds the notifier chain's
> read rwsem. Consequently, a race condition leads to the use-after-free of
> watched_lines.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: cdev: Fix use after free in lineinfo_changed_notify
      commit: 02f6b0e1ec7e0e7d059dddc893645816552039da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

