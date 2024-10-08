Return-Path: <linux-gpio+bounces-11016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE7994234
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 431701F26583
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F87A13C80C;
	Tue,  8 Oct 2024 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="clzmfAMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F21DA60C
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728374965; cv=none; b=vASPeR7B8/Sr024Doi6Nm3g6ELdkQ8jAKnWHpTnfZ3XqMdwl3MiWziLdwA0XKveKweFRGJYdORaBnoTn9Yl4tmfNWT3TCIxVd0QKXxcDGFksry//AC3RQ4tbPk8nAUwUjSroR2BVlVKtqf3hJt2ADf/cuIvx6wZAY/dkYH6aUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728374965; c=relaxed/simple;
	bh=zDeQXTiXUletPGiQ77lYmBtlj5Q0xqqvI4ZgDGlkPh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JzfNdyUhdbokMLjUE/wITis2FezGW27aWf/m36bW8kPjYMLroaS/ze0Bf+/jL5MRUSfgop4Dc7KjAcq7ve11vzlIwqCiDLYZzOLIGojEPuBY8L3dn+cplj5Z+RCRIAKm8Ud36QYfBMkrbAmOOK5sTXI3CQO4mnC1pQ41d/uX7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=clzmfAMN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so42397545e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728374962; x=1728979762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCi+bPFLApksSJh9xnndm615uMPRgHRJb3lAr7/SXn0=;
        b=clzmfAMN39lUN4ljEaddpci+Dvps3Rjux0F19rHGo1b3ZZSW6YPm1zWoWswVaTzNKy
         o68A3p6ZwXF+i97ANh2picAHVkoaQNUi2qt9RqtQSgxlDGG9scHSewaJvtGIqquSP3kA
         3mIwTYP8vVa0yqd0phSwuMnkbnEL0QoE6QGle+8MkOPg8pArEVOpceHt+ppFCtgtJOBO
         rtN3Q7iLKLte9FTJpfkUDKqUeKL6WQTZ34J/JbvH+ufAEqBrYD4pgTAqQ2KxspMwA5J+
         aBJ7cJws4HxZB8k0H6ywUx9cxvBY3ApGZgRBrXJWXzL9zYUUk/fI9VPyQBXegnGbuH9u
         Bzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728374962; x=1728979762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCi+bPFLApksSJh9xnndm615uMPRgHRJb3lAr7/SXn0=;
        b=DQCNAvnf0Mcwm0kgkxZGD4fNYefeszFVdNBruqKL/LIbZHBl4j2FILwTFOCkhsnK++
         hXXv1aY+Q0c+h8kaQ5EgLeLtJoP9w3U/+34SAZGYdo3Oy2s4iAN9z5pQkchKIKtom7hi
         DrRPz0I7Q5ghycMeMQs6Dt80V1Z5aQEXFHlAlG2c9fTaNdSCcWJednY+KXIzHbE5EqZM
         VEtAsOO/gX/MVT7WToRy2z6MMtndEHJvicxxKe1+j9HTkGSbf7CeGqXkJUVHYhlL8o4d
         6k9d5pSXDyihqu60ZDRfYvgQzvixmdIZ9EsebjSmFFfEatEKEryC5ax/KgBRqetMGv7O
         iW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLfo+ZzI5rLdo4MQ+TaN8ZdOWtg+NjHmQsRxlwE5gHhVPDgdxykkw53Bst8QA6e40A2/o3ypCB52/L@vger.kernel.org
X-Gm-Message-State: AOJu0YyEU1/Dljh3hf9Eelb6QWbYbkErgJm9rXzrEta/XQa9/j6/cscD
	PbwX78H6W0btlQjpfxSxtRr4zlIn7e0O03EfMTbSOsL2hSr6p7ZnUc1xbddDJCE=
X-Google-Smtp-Source: AGHT+IFlU/2l+C25duvKbhYVoekFXnHwrsiYUIeAd4dZPEvF9IjzIB5nHvVhIu2Fb8BcMvoC3vJEBw==
X-Received: by 2002:a05:600c:4449:b0:426:5dc8:6a63 with SMTP id 5b1f17b1804b1-42f85af408cmr93039285e9.30.1728374961932;
        Tue, 08 Oct 2024 01:09:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ed9833sm99982225e9.48.2024.10.08.01.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:09:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: mvebu: allow building the module with COMPILE_TEST=y
Date: Tue,  8 Oct 2024 10:09:20 +0200
Message-ID: <172837494532.17503.15271041414971057291.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930091111.32010-1-brgl@bgdev.pl>
References: <20240930091111.32010-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 30 Sep 2024 11:11:10 +0200, Bartosz Golaszewski wrote:
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage.
> 
> 

Applied, thanks!

[1/2] gpio: mvebu: allow building the module with COMPILE_TEST=y
      commit: 956ee0c5c969c9caf6744e166f5a80526be10c5b
[2/2] gpio: mvebu: use generic device properties
      commit: ddfdfe76ca54e5615a8e3eefd7dbe44c624ee9fa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

