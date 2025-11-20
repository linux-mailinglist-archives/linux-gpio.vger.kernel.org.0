Return-Path: <linux-gpio+bounces-28900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA6C74448
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E494C4F444F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913D833CEB2;
	Thu, 20 Nov 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VbtbBJMy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA8333D6C5
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644928; cv=none; b=YXJg/sNZayegjqaK5QTbW2e3qxcLIDHzCGKqj83+SI8RZENKFXJuGhcYRkAtWkRRn9BB3VrTcKVKTRksWLqoXHNlBaGIQpzOakGrjJnikJ/w4DYyYg970Chxe5kMZOIqJsl9EqqDz+Z0f9SkSR8QIQ0f4b3D0gePLPAcSi8UDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644928; c=relaxed/simple;
	bh=9SLoYVkeT7Vaqzez39MXACrVADfhiMgPtZqxXaDffqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JD2fhYKcScGIW+bgh8E/J2EVfIAmvQJbA2koZD16BRgR9pkTHwEoEWChcBNWKbNp7UbUSEPy7vOkIi/DtFbMRx9IdzgMsBJpmYKfI8CGOxBu2nhfONLEvxdRcoUBGMcM24Pze2dqkGfx0X18+0ipWa3R+wPvaNmre88Ut+Mdp44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VbtbBJMy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b91680f8so7340985e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763644925; x=1764249725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Rmdeh2/2Ihs421LpTiSSh+wFT2rV0DKI39D1yc1ycM=;
        b=VbtbBJMyIrLPTo+2aCSLUQ85U8SXzTkDjFT9pUnVTPxQNpH049Mjs6fIG9pmWqjCzl
         MbMyQ0QbmJXHw5OlGsOcmILVoPL0SEpps2D1JY038lYTaG8wLK13+qGacSViQ9+DuSBn
         S5mn/Nsy8NZds+P7muI8H55gf3TsmRo1TwiS5y7rznXw7SzU5gP5WLtQ3tYlzIHLuL9P
         KnuVMP+pVtmHy3MAxErr89F4lhMR4d5jkcoI5XPhh1F8oTi4epyIzdmNZw4WUo8EDAmm
         SoX6X6QJKE6KK/G69tdZirXDlG6ZtVq4B0NP22TCtikXXivfsrlht4nj5kYyHfUvRU98
         ix4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644925; x=1764249725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Rmdeh2/2Ihs421LpTiSSh+wFT2rV0DKI39D1yc1ycM=;
        b=fw1FgNU93jXOp2R4PJ4Uyg47KUhGHNMFAeIrxeioYHtyG7+zEQHHbaYI3RaPRnBGAW
         gNr+nbkaO3diAb/m5ypuSOya2M6VoHbg/BIvT2rZv6cvFvnCwcYmc7L1PEkAv2mnaCrQ
         PGQmmHPyohY/WCjIM+dJIFIs/LpovNSQ7fa5Qn9wHw/7vTNNNmVLduSmmD0Df9sLnOc5
         eZhDuF06LkyS+7Bf4fIJgbQ0MMxW/DuatzfZAhfm1FfbOUJn93XwZR+/XmskiGicEU6J
         421uvQDApfAcGo72nr89i0N5ibzZT9fViiLcx8JWIXrBi4lxGH4BMsnm+NVrbF1JaFx6
         07fg==
X-Forwarded-Encrypted: i=1; AJvYcCWa2ne9+gzPyqkSoYbGCIbJFrQgGlYz4toETuvuEeRLk7OjCN+TIphkdrzAO445BJsAT2niVOk542hN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf7Ui8QwNIJsaWQCrXN8V+PpZpCxzkQPQvjvjOsGvAzLdn/h11
	mLLuTogv5tgSdeLY2VDRHAVnVmLMLXVsReRC48yttZw4R2pVpdJHpQuKxEJi7dmnlLs=
X-Gm-Gg: ASbGncvcmolC69ScotMmI4aqNM3AW/5UlDFk5Fw/DEIE15T0KTkfv8t8BUva9pJ8HqZ
	k50D9sm5sogxu4C9ZK4zuJziBJlna7KMCGfm2cGnLUjMdsAVNFPRD344GdrX9Z5TJtIsgsDW1KQ
	3JAY0MMtnwvGfPT3JyguMCIYVOu0gWBzC/5iPhvZ03iT0FgdWmhbLtWC4SUmjaSuDVk4OENpc2I
	WKyQu+y1p929rSxP45dorVoK03lgBEoSUL1QeICfvDfpuc8/35pG5Kq6/7xUDjnVAxEzp1L4IQD
	LwE1yc7VP++BN6+2heDNW7MBwWtKWEDuFqT1IzgQbD+iSDpwmpiyNqzvnjOcWhR/e0P/6M9nG4Y
	/kGr/Uov1R1lgYOeEdlPHJqICSE/yGRIoRNxj31bu2SejGlcxtwzEpVCt6usnuyHQHAVCniJHh7
	T7vVYv
X-Google-Smtp-Source: AGHT+IHfTdFM8rjs2JC6m6F4tY1MQ8xaSXyvNAU4z9XRyP1bbxBs41tUAXS8fMT+3RBaa+jNDhbgJg==
X-Received: by 2002:a05:600c:3146:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477b8a9d74amr37736185e9.31.1763644924477;
        Thu, 20 Nov 2025 05:22:04 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc6c4sm60668925e9.2.2025.11.20.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:22:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers
Date: Thu, 20 Nov 2025 14:22:00 +0100
Message-ID: <176364491497.19561.866498823647775083.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118083115.9545-1-dev-josejavier.rodriguez@duagon.com>
References: <20251118083115.9545-1-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 18 Nov 2025 09:31:15 +0100, Jose Javier Rodriguez Barbarin wrote:
> The 16Z034 and 16Z037 are 8 bits GPIO controllers that share the
> same registers and features of the 16Z127 GPIO controller.
> 
> 

Applied, thanks!

[1/1] gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers
      https://git.kernel.org/brgl/linux/c/5dd9332c618473dee7c94946e482604cf095fbbc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

