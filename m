Return-Path: <linux-gpio+bounces-8252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCE93454B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 02:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9B4F1C21742
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 00:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2406639;
	Thu, 18 Jul 2024 00:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FTnrECSn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37548365
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721261380; cv=none; b=FEtE1Fc/6ThJo7Y9y++XfkAmuW7BxEieK7gceco33yzzkpKFiXup3omEtv7IaCnAm5RivgD/5/jgJeyyEolP3P0KXIXBHSSs/cfhXoC2ApifALoZEhX2YBEbHEQcNjb08TbxQ7232+DYdtxZhWnGlwslFgNxhigHn869Dvhmu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721261380; c=relaxed/simple;
	bh=uWED7BeiDTld7/fsLTKx/wTQtSU7SKZDeqo41IE1AiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UB04HNN6/bGvTwRSwp3FMb7EIiTI7BOf5huHTIE5K+gzGNg/R9qHfOXptgqNnZgJ01z82zJA9fM/iG9DE1zuRqk2mIVrFWlvEW9uEu/qXiZzQ9Au0NB11rCUp9Ohrqxx7q2sbbgMI0sv0n+c6EASZ1TfdM9Q2lgfXosDwrC+LBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FTnrECSn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70afe18837cso155859b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 17:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721261376; x=1721866176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwcOODaiNIPjABUgqnjMrLiYcWKkDs3876nm2eBWCtM=;
        b=FTnrECSnuklHPxxgIpnP+3hDfYodcMgRoIhEWRzi6/apx081gON8Ftb4OVX6SlKKMZ
         c88S2eEWiX0zAnbD7HZrL5r/Y9NOVB/KpNFS6tv8vK2xPGAYDZXp1JzA9ebQmlLcg2Jp
         HmNmrsdYMe7ma97XVcwf14iMT7/yu31WJPLmPBhgMvcqF+svjxlBHgkIwEsrj+xg/ZSy
         CHPKXh77MRsSH86TJ8qvg5KVDyFnQSIbV3VtWO7rwAnlM76EEZYaRgvOdaCfx7V+4NjH
         Hy+k2cpv3JPCCb75lAqOklv1Gap2vrvgD3+D5kXMZcIjSlHndfS+qBf7RlNwKHaJiVS2
         u3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721261376; x=1721866176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwcOODaiNIPjABUgqnjMrLiYcWKkDs3876nm2eBWCtM=;
        b=nsF2aQHOReyCUeFOB7SLa9D9uWgGImb2vWS01cj8R8k4ei8p00lR/NPwNBt89jTpat
         Nr7HxdnZK3u1ImnBGXtwKjmmx7NIHRMhkbFY8OpWjdQJHPIDvKJUHavPGgqitV4nNmiu
         c8yDhTexQzGrI1xeX9VDcbjLibD4NC8qlWhTPO7ZjBqLROXJinTIViLbYX2I5cy99lj9
         39zRW2KIhdw688uR8F/+XjGX+tmDryyXZbdWRj0KrrkOyfxupXXUldxudv1fnKzvHOg+
         K3glQVAyUuMzSl+LSyBnPQ85/D0i3uAqSVXqHH4rZBQ/EH5t5lDlGgsNZ1X6ZOCDWQEi
         SSog==
X-Gm-Message-State: AOJu0YyiEbAIfRh8ZoaT6V4UVq69CaB0dsa0Hig/84J1b8c4YonrM+1q
	cw0ggkweKQrM9zH/rkr2KQW8EWvSzCgdlwLOWgTAoe8+l9K0BELcdN+nG1INdV00eEDfO5SmvwU
	+
X-Google-Smtp-Source: AGHT+IHpAh4WmnI72A/J/NGgvzUVLyzzYouBd6LJJfDkIdYvi8ppmd2MWpLj53aHutllJTGVi4PFQA==
X-Received: by 2002:a05:6a00:1743:b0:70b:53b4:a805 with SMTP id d2e1a72fcca58-70ce4ff9136mr4221056b3a.16.1721261375983;
        Wed, 17 Jul 2024 17:09:35 -0700 (PDT)
Received: from localhost (75-172-111-187.tukw.qwest.net. [75.172.111.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca7941sm8733279b3a.157.2024.07.17.17.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 17:09:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-gpio@vger.kernel.org
Cc: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/2] gpio: davinci: improve wakeup capabilities
Date: Wed, 17 Jul 2024 17:09:31 -0700
Message-ID: <20240718000935.2573288-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve wakeup capabilities in the gpio-davinci driver by properly
handling the "wakeup-source" property from DT, but also by keeping
track of any wake-enabled IRQs.

Kevin Hilman (2):
  gpiolib: expose for_each_gpio_desc() to drivers
  gpio: davinci: handle wakeup-source property, detect wake IRQs

 drivers/gpio/gpio-davinci.c | 25 +++++++++++++++++++++++++
 drivers/gpio/gpiolib.h      |  5 -----
 include/linux/gpio/driver.h |  5 +++++
 3 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.45.2


