Return-Path: <linux-gpio+bounces-7079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B338D8492
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 16:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00EE28B6E9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B521B12DD94;
	Mon,  3 Jun 2024 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z1hOUD4l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CB115C3
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423502; cv=none; b=EsQkFgop2beL0yOCm6YH+TDxC4zcSrJvxOHFTfrsNsSu+TK/lz12TC4my/kAtsxilezqj5Y2D6QBhFm8zrALficTmmbd45YQZ4ZJp1JI/1nAuUWokrZ09Yw67EHP/y3RDkA4ic87rw62P+OZHBwGnku4AA90iZ1eFnH+FFAsZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423502; c=relaxed/simple;
	bh=G4f+2ZW/3ucBMCoRsBpjGOH5yW+ZaceG3OT6WS8aXPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqe8MfEYEt5HHakpgaOydNRpJ2N/pQ0/BIFuEo7liak1oJzIfj3uXNWO/q9odiuE83VR3rdx9s3jeir2Q9Wwjxf8/TSTWV+xJAqbB2O4V0BjhA0smCaYqF/jX5kvaNr7f7ezvYrHwSnXUFyKcO+3TZa9nRLhO5SX0q4gOkv8Jvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z1hOUD4l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42108856c33so25771745e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717423499; x=1718028299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHHrkzTNHT8Y9v7Qdrd00FyKMnY/+AxED92FiKgka+c=;
        b=z1hOUD4lYXClijK9HnSgQoAWu70Il2QxYRYAD3ofoT5vRpmLVpwuo3ndcOt49NBJLj
         nwVWk2XH9z2Mbae819dO0+BF36aPIP35etxSZXwV9kGnA3+ENwgZLrTzFcqQpn7plzl3
         HPGylMcGAA9ExoZJOwLLKCP/IkaJs8Hxuq46TjxjxEF0QTCszIAbtUL64SInYGhI7GHH
         KHBTHTUO1NQBmBXBP6lg9e7bcrRSlwQWCvGcw4AqFxdRFT4TkBlzE4DFM43PMU/oGMSG
         k2a0SJVu8Gz5e62RRZhXN0yY36f7gPPooVjZcHnDVj83n1NYiCd88DuCs1Gp5zgwtbZg
         YmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423499; x=1718028299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHHrkzTNHT8Y9v7Qdrd00FyKMnY/+AxED92FiKgka+c=;
        b=Iw/7vziYSgKkwT+ISrAmGsHhIIP0h/hU0uBlpaSEVJIt/Qfp3XxTvyme+70cMN7fwO
         Y0Fdh7PKYtN6TneBghAwffdSNhzgc3T1mOe9ELQ4qzj4YzO9RH4mXFtpGxpu/Ti/j0JS
         wG47Q0ZcK2daEkFVk0mGxssqOFvIB4tubCQ85SGTJQA/5lntUZcAhNjSmp0Ou6ckIz0s
         KuCSLMWwqwyQlkovkE4rCQvJHBQ7R7O/qLmsXqG3vMdGM/b+Qe9iKgF5as1EiBUel5Uf
         A9gzkl4yamig7On/jXwbPVjirfu8SRJcy+IBjRzFJxJTyJuBJ+sfXD44rWDVwStOvJ35
         cT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+7Z3wfNnLjjN+eWUsfMujtza71RjgU7RzVv0bVEn1gjIBK2AH4L7JanczF1iWSp4+md3w4M2c/OfGTmbIHg7kHf0ogWDRuk55Dw==
X-Gm-Message-State: AOJu0Yw62WPBuPRYGVdxlw7GnNFJodbFlousxVIz7CYRsZDw09ASIT3X
	Om9q22+bThdGFsB7ElfOkRo8MQwRTCteQ+FPy1xT+YUF1L234Mx4fl5VRjL2n5Zh/gWzLwx0tIT
	o
X-Google-Smtp-Source: AGHT+IFlbwh5NxoDD1hH1ceOedwpKVlOZmjCr5/6w7TvnD/6TGIJomsMmGHXFHQtocav9hBqytBkCg==
X-Received: by 2002:a05:600c:4f05:b0:421:347a:f0a6 with SMTP id 5b1f17b1804b1-421347af365mr61281765e9.3.1717423498758;
        Mon, 03 Jun 2024 07:04:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b858424sm119321375e9.21.2024.06.03.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 07:04:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: make gpiochip_set_desc_names() return void
Date: Mon,  3 Jun 2024 16:04:57 +0200
Message-ID: <171742349210.67219.629258607780165404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194613.197810-1-brgl@bgdev.pl>
References: <20240527194613.197810-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 27 May 2024 21:46:13 +0200, Bartosz Golaszewski wrote:
> gpiochip_set_desc_names() cannot fail so drop its return value.
> 
> 

Applied, thanks!

[1/1] gpiolib: make gpiochip_set_desc_names() return void
      commit: ea95bd851068803eb37693b2e32111b88077c901

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

