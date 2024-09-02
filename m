Return-Path: <linux-gpio+bounces-9551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75421968497
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A12BC1C22269
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523A6140E34;
	Mon,  2 Sep 2024 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zWpfM74B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE7913D893
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272661; cv=none; b=Mza3qzTLHIZ4qr2FZ0qUDrb6aqhBdoA+ytCxnXijulkpMD7DcFN7+6DodvcWbO1sBkwDTVBgKVkQuGpIVZtM/TGdMNQ3ek3jq4fbJHc0Fo1EHAY9Ha7uU4gZRdp/o3QH7QlCe+IhrnL1GQ3XluV+XAAUV/fdklkcuQDNdLnulKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272661; c=relaxed/simple;
	bh=fy6Pir9if5sFnLNGX1XCCf2HTZIgUq/PxFYyeLZyqxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNZo0Yh38uam13Xmpe/qOKaXNTkOugqNwRbC2/LoU0ulZD8lLQg+AT1YT7Wg3b0PRMh3cNxiOQxsXQ8ywxDRRbcEWfqlWLKvPtjFHtzOkBS79VDDNFW/XjzRSagEeYuydA0Y54kovItXDzvfemxQK078rv61uNz6gnN9KqMVfyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zWpfM74B; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374ca65cafdso368695f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725272658; x=1725877458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2ismi451E1vYOHzwFvCZ8yOO6HU8Yjy+H9W3YfV76c=;
        b=zWpfM74B1ChsdT6nK/qLpjyg3YLrt7I1XK0HwmSpwsRgpOsMYYNEVpggK/Vu7sHFtr
         o2MtW4uLPO/3XFR+Yk1YCxqZMvadMwwzb8VUGPULXBZz1zHSPh+sJNp5DaAfchodrAN+
         BBdxTwwUDlj9Zg9Bqat8c9QfP+gAwp7edpNP5+3Xc4hwyqj7EAoIOGoskhkVW5ZkcwCU
         OYc3GtVHvKQxW+vG3OmjTIZ9DWcxRxbEIFPiIK0XjvNwGmccYpaP402z54wAnObvyIkH
         CT+zGad5lsnxCV/fK54KWcTfEs6Fr03PSlLL3oCpxNvqG0jIVEWkjW3UCkp+Rtlruidu
         DX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272658; x=1725877458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2ismi451E1vYOHzwFvCZ8yOO6HU8Yjy+H9W3YfV76c=;
        b=NlUFd9SZPUzfro1sDk/x7ur4fh7sAe8wIL1Det6dpW6OnSXoe0MxL3zoWVR3owA6Qg
         k/YG0CJws1AMdIeQzKaNie2BLgmlWLbCKIChv2uxraSzEf8Q8wJr2z51uHST1pKr6JcM
         Q1Hw9+3Gx1gQLjOOsJTW5Jole6YhBav4KgHz5PHnB7Qbb7Uh4hKIPwPr1ybM4pXKo+45
         4I9vW48ZEAEu8/t1sziw3AVMmpHFCMTMDAyfqcQQ37T8seGlKXyzOIVSrYSfCaeEUI64
         uVO9euc8iyc2/GzkxyMMvaQgT9qEllyf4Y2GYlM+QKEdBM1lHK5QejLPF3v854AQZ6Hx
         lxfg==
X-Forwarded-Encrypted: i=1; AJvYcCVyPUn55mBm6PPxiJRxO+DzWRoViJLCu2yL2DL5xCnZ4A/IgOvS9NLXeMblV0jeLWBga7t2lNS/P4m3@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCX2ZJgG/AzYagA7ARZSbv/zZTn8H2C7WPpyOSfbfAk2mZH/3
	UjAXQAG3DbQwKT+rFbFxwv7f7vF/GuUyI0YxtjiwT/hs3ZuKJLxDtvDcwdGjuSY=
X-Google-Smtp-Source: AGHT+IEIReWMTBWPNlvORH3H7s+IGrjuyArlNkenOd1U3BEWrJxMOg9/1S8MWXYJlFMXVkLcBP41FA==
X-Received: by 2002:a5d:5e04:0:b0:374:b31e:3b36 with SMTP id ffacd0b85a97d-374b31e5028mr5752679f8f.6.1725272657397;
        Mon, 02 Sep 2024 03:24:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4981asm11069810f8f.24.2024.09.02.03.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:24:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: ixp4xx: Replace of_node_to_fwnode() with more suitable API
Date: Mon,  2 Sep 2024 12:24:14 +0200
Message-ID: <172527265100.24810.8280590036998740538.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822223332.705560-1-andy.shevchenko@gmail.com>
References: <20240822223332.705560-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 23 Aug 2024 01:33:32 +0300, Andy Shevchenko wrote:
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
> 
> 

Applied, thanks!

[1/1] gpio: ixp4xx: Replace of_node_to_fwnode() with more suitable API
      commit: 24127ba3b4a16e0aebab248ca9513a15d323e6af

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

