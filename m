Return-Path: <linux-gpio+bounces-8426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB293F033
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126E72834CB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 08:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4BC13D8A2;
	Mon, 29 Jul 2024 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qDnpizN0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84C13CFA3
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722243106; cv=none; b=GH5GX1AYW9rJNj1czNMZQ1Ozh3PI0qlJziwd1LVRi5ZGfZTjtDX3qIPkXxkHy/66te75XSCbxuHddirF525PKrMU0QS6kD448J5D1exvOv58vshpblydXRAiPG8tSIwwUj8+zDW1oz464SuzEcEFYJZyNx6qValQUYmldpgYW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722243106; c=relaxed/simple;
	bh=NdazYJuc+rH7bMB36mA0//MNRk22cVlqgvbs+4B4Ico=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XB5nvYejWeBWJFJiug6+rw3ytrD+2Nz6fH1iRnaOtf9UNVDFt9VumqxAY5Z8RzJmMFM+1uElW0M9pJjxK4l8ZIHc2ngBP+fHatSlCcTh9wlb0qnDBQPh0hNVg+PLATOS5JqahKz5IQfPQvz87N7J3s0BMYLPQj5cisbHFqt3KrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qDnpizN0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-367940c57ddso1306969f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722243103; x=1722847903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNuoBqoaDzxKtfWJLQ0aUG6vigei7g7AGIWBIZT/nAM=;
        b=qDnpizN01Aw6Q/ltnkhVXwbUXHUL89B17kIJE9ban66KviirwsifLKRGnB+kYs/uLW
         MLvob1I56islUwAtTPd7FiM96qocYXJzkOceiDAK3PM93hq6uZkSacF4VVe6UqPEhglr
         j9QOz4WjRfpsCT4x+n8K4jFdfvQ5jodes+YHUcdIkUCgDEDjDATG6FTZe7FKw7QoGiFR
         JR/JKTtjjeo3Ct0zjshaRo6pVErfT6Blj4q795CvNIxhWi6Ib3FDL+AG9JCc2wU/4e7k
         b0Q4ppt4B5Vz3Dr3ig4s60GlU6+0olfhYxC71j34OFKjgvwZoSca7SjMFPxZWGGzV67e
         gC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722243103; x=1722847903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNuoBqoaDzxKtfWJLQ0aUG6vigei7g7AGIWBIZT/nAM=;
        b=cXt+7MDNcJBvbCkITPgIMQ5mF+M7mc/0LJJ9yzE23u51wIPFSNu17nS9Gm37F3yTgX
         UeCXD+PGAHryrna8jXGo7RqSvut9HzYqIFlwiyJoQBdUQJgr73EphAN7ptNL1gOgRL4l
         5xhyijsv9rrYfsDWEktw9eIhHEF6ftkIODzBxEpnXhkXCWqkq1TCf3luFBaGjflNWdx6
         wdhOCxBRCPlMtC2JkpJAiH3Ny7CGeXuEdKIUfABs6O6XJDfEtBY8wA1kohiVpXDGbKUA
         mbjbrfZRW5bXhdLbZd8aM/ouDLft2tAkftDj8J5+L8jMYdGmIOzNs5ovMIUEERs1wqPq
         IaoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8gWCv2qMwk9JHwk91cSbearU1hIbTb37y5hZmjXxWbMrusRQxXztH+yxgoTW6yiFiCKxT0+4fw9JFO9ElqfhXnXE1mpj0r1ZrBQ==
X-Gm-Message-State: AOJu0YyTmd6dp4mnRyK+GpTnYckf9X2NbtDUPIZwlcV+RZ7rOCCSAooe
	haa+nolgB90BOXkvtak2JMOxMF7W1Yi5XfBDc+aQbWe79VkYKpyXvFyOCfmgBlE=
X-Google-Smtp-Source: AGHT+IE3OluGUrZ8VCxRA30a9RtdQBU0/eb7LuQzH1Op6fY5GZpdvgUrTmFYiUbrbf3FACsvRg1zIg==
X-Received: by 2002:a5d:6e92:0:b0:368:6561:daba with SMTP id ffacd0b85a97d-36b5cf24007mr4065449f8f.31.1722243102573;
        Mon, 29 Jul 2024 01:51:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a777:82b0:b20f:20e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36861b1esm11641073f8f.92.2024.07.29.01.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 01:51:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon, 29 Jul 2024 10:51:40 +0200
Message-ID: <172224309642.20832.5616880804986291494.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715194341.1755599-2-u.kleine-koenig@baylibre.com>
References: <20240715194341.1755599-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 15 Jul 2024 21:43:40 +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> [...]

Applied, thanks!

[1/1] gpio: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      commit: c206d6be8605e9b564ef99a7fd7dcc406e3bda63

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

