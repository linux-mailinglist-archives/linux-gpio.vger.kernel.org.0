Return-Path: <linux-gpio+bounces-9581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD6968843
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6617928311A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C505D205E08;
	Mon,  2 Sep 2024 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ioTHjwJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA8200139
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282101; cv=none; b=gLTRkgKPFLryFZLFpCF2lCTvdxuXKumIWvt6xvA87lDyjzkaZpFF5a5Gt/tCZIZPG82z1UO8TAqlB0uVjgNatPJQW9HfFUh/pMPcbLLkEovLnZdbjt2Zq2D5BTn+qqnV6FifC/UtR2IxTI8bdwisEUEzehuYL1DtJWe1NwTHoW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282101; c=relaxed/simple;
	bh=r5uarkLcoFmEl4/2vGWhczhWSSpL6WEUmdZUwJjXRJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFR+/hC+Vg2+VSYqX8L6VvlxuSD+6lPDxPOc5E1IPU5SQ4PzKpCfPTv+ymP1LLBHujKR1FdALCMokTdmbWBtdV8JDnbA7e4dKyv3nxJ2kg34i39bvIFP8zDZxk/Ig/j+9lS+myW11jDz9hLo8u8VJ0oLPWSdSsGjYS/DyTMBwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ioTHjwJe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so35215895e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725282098; x=1725886898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnCcCenS9Ior882QW8Q9FauSpfEAvwPsWAEc2l+uADc=;
        b=ioTHjwJeNE4aJJFOxL/3uv+Zk93aX4Ap8SYBHXDeLm1wq1k7kEbknLnCMsv60IDB7r
         dXQ8i1bTpjDo9yegyw5VKk/3L6BLtK9xZNqdk1n3gRuBN/uR7Fs+USLV18ZzavTXpKBI
         zRE706bdWUA4dQW1K72Pe/cEvb5QRqxQ8xSaPXu7OPPxSqn873FC9amWlB4uM1SIdYu9
         cMjWrWjFypyuBUsqhKPlJl3VkRyGVe6lNXOouo+jsih0nheMUGtvsK2phA+RPgr/Vtpp
         3moPXcWfdcK/TAJ3l6iguHMZKQ2pnj+bRkGZ24+2NXQEbiDxvSV6yCdn3BSBI2Qh/fJe
         nSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725282098; x=1725886898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnCcCenS9Ior882QW8Q9FauSpfEAvwPsWAEc2l+uADc=;
        b=t2++z7944O/KG2leYjLjHqvXai9m7uPAgtyR/OhRWZ38KVy/44AxG0YBHzoG2Frcww
         m3y0CXa8F/pFY1KJHlnICBbXZhk5MNZbVkw0JKbQOvQklI9AYzZIduzksZ0+2Iy/YIJt
         LNUcH5TrThGrREBv6wm3w3tc+CkpIO/iD7XEaVJEXtzIoVgCJx5BVC2GTQNZlVisPZb0
         GOhyo3KDa0fJzKCfAyzimFziZCBRgPt24zQMn7WPpGZvShDjY292iwuC/Jy2o5YSe8gJ
         DfXjcWhRrViVZ8bBCWo5GOLPWa/eOcjkgXSRDeg+HBDlr9C+b1jFqXrhSY6IQtntzmHv
         QhLQ==
X-Gm-Message-State: AOJu0YxWBpsagByTc0J9VvssWXw67po5djcEXgKo4p2YhAWtRiwDHmQd
	v21w/EuAH3GZuxJz0ZnfuBZKzEYATN5Q1zUKh0WHN1ZiOxfhu9tUKmlGVlaoSE8wBo6QDmtEgpb
	H
X-Google-Smtp-Source: AGHT+IGg9U19ullb2NAFIU5g3gXDzFgsQPGReEWDaoBWezdD0xlnbgCPv2nZAR66Dg43izQQ2F6Onw==
X-Received: by 2002:a05:600c:3ca9:b0:426:6220:cb57 with SMTP id 5b1f17b1804b1-42c82f67431mr25760645e9.25.1725282097309;
        Mon, 02 Sep 2024 06:01:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba641db07sm170484905e9.34.2024.09.02.06.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:01:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liao Chen <liaochen4@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	michal.simek@amd.com
Subject: Re: [PATCH -next] gpio: modepin: Enable module autoloading
Date: Mon,  2 Sep 2024 15:01:35 +0200
Message-ID: <172528209370.32205.2474872138444087655.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902115848.904227-1-liaochen4@huawei.com>
References: <20240902115848.904227-1-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 02 Sep 2024 11:58:48 +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> 

Applied, thanks!

[1/1] gpio: modepin: Enable module autoloading
      commit: a5135526426df5319d5f4bcd15ae57c45a97714b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

