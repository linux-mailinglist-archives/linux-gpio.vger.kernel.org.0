Return-Path: <linux-gpio+bounces-14650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612DA091B1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200AB3A6C20
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB86520DD56;
	Fri, 10 Jan 2025 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zhW62oLN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E75C206F14
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736515204; cv=none; b=p3GnymUnUI20OAzWxpacwBf/6ZS+eqp1Ds+XHWs981eBzTZkhxA1Fe0cUCRHRQF1uRSDFv6Zn+Di2qaaqSbVDcDyp/zEhq3RvGlTV3w7OfS244V7rTviU+BckigDqoFC9mtBiBYwMyJthg/mdLYjFETZZYkpfTUOh1xIoBO6OTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736515204; c=relaxed/simple;
	bh=P20bwvOa8IpBqxmwV/qJ910DllN73SykSLGlq/YI+3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twfmI6j0zEDGzoJeJdnEFKQldVW9QE1uamwq5d/4hVTtcFunB24sW8RPlOkrxW2KiBqCIvoki48Vlrs1+QgVNKec1OAoOIvq0TPNXSSpGHtzjSkev5UYfYrQzSnn5YKRQOYnjTHWjQjySleuqP3IdrZiwGJAQTeE+JQtzolJ8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zhW62oLN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df53e559so1627979f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 05:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736515201; x=1737120001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbeENdTwT+0nklHd7BH7ZjvMdwfM9t929OraR/EOl0s=;
        b=zhW62oLNsUp7RB2SF88iIh8rXodBvRMLBYOOv0lk9T3c4l5Pc9G0WKvyjcoley8+A2
         FIOgDcyPD2MzWjKS6wWS/h6+C6DbH/27rMrs1oOwvPStaKeXIcAINSWdfOw1YWfA3oeZ
         NBLfyhHXXL4xOha01sK7/E4LP2cHCQFLlHCWUd8SDLzbi4aOTlz4sppkoFnY26k6bjvX
         yDmQvDMYr39qetprbYgDyYmRWyoHDQjlZiw9BYrNG5XxJWAP5A5USZkhcm1wXTRkIou8
         OeZyZkje+mAp04BJZVNFaJ+40YQ5bKH2sAsmtzcgXQYpR990TIIMtxXtd4KgbYXRTvtB
         E3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515201; x=1737120001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbeENdTwT+0nklHd7BH7ZjvMdwfM9t929OraR/EOl0s=;
        b=r1Eoki5Lk54M1Bt/FDRfEUSs6Xrq1sRmdecScP5ejb5PdCQTkqJhsOZ7yKeBiiJhNu
         2SpcYMQV3jXV7BL8vYuL/5Nr/76nSiMVdPgu6TW1VXkkvyQc6RESHig8uiaHfGQRZHyQ
         JlNekMfPsvEfpiZJsirzlPF4BJIYiltEWQjaZc9K9YrI16pFshk4F0bC32iKWDs86soH
         ex48TWP49iEm/NGBPwt6r9NN5ffPTz7jAFtYjG+/bb8bAzIkE//QlWkVIiFATQauJ4+w
         PBTts5ayQIU+Nse7qLTpPQtPKGX5HWOj20mfrLK1vyr7kKf5na3y5WexQxGRk/uTWqgP
         JTkg==
X-Forwarded-Encrypted: i=1; AJvYcCVPXDNI8DjgFhrCn4vdLvzOm2R/o9ER/4NGxu1rtOfIYQ/Sc+gQla9p3NEbOzqmB4KfKvGsH81JoVOg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzylz2ftjR8yuZGaBiYLJZAu7kyVgOrQBjglOUpPIgXk/wZ1ieh
	Z7LNm8tkGyi3dKhno/er+fz9t/5HekuNZe6VV6OSRpWC2meQc9IEpSY6KIbxxbo=
X-Gm-Gg: ASbGnctgu5Q9BZXeQncNdUKs0CYP+WwStwcUcYkri6zpXA7Z2LtH8OXIbKCJFMy2Ttg
	JCrBPjyN+iQLWAz53UIajARvuFGNJymz3H8YE9YWu4od6XM4D1tSaqd2Q1I4nfERsVDnBs2m3AG
	W19RnaWrmClXQ66TsOPV8Xtf+vfnd6s3XP5tsGE1MaNJMkglENgKahLNYAlaFLWMv5dLy6V0wIR
	97sD9QRZLxqQv+VWKJHNztndwLZCP9wdxrwxlY/O4rPPwwPvDES0KU=
X-Google-Smtp-Source: AGHT+IEMn8UUxcKwoUCCclFeoi/uGQ2b2eWk16U4eVbzPtZtBxyoPQuiLKgiF4GJlvSw+MIhhrB1aw==
X-Received: by 2002:a05:6000:481e:b0:386:37af:dd9a with SMTP id ffacd0b85a97d-38a872f534dmr10140659f8f.35.1736515201119;
        Fri, 10 Jan 2025 05:20:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5581:e96f:97e:b3a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf65sm4491539f8f.49.2025.01.10.05.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:20:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: altera: Drop .mapped_irq from driver data
Date: Fri, 10 Jan 2025 14:19:58 +0100
Message-ID: <173651519217.65575.14005749458266679344.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109090802.3763275-2-u.kleine-koenig@baylibre.com>
References: <20250109090802.3763275-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 09 Jan 2025 10:08:03 +0100, Uwe Kleine-König wrote:
> struct altera_gpio_chip::mapped_irq is only used in the driver's probe
> function. So it's enough if mapped_irq is a local variable, and can be
> dropped from driver data.
> 
> 

Applied, thanks!

[1/1] gpio: altera: Drop .mapped_irq from driver data
      commit: 03b5e4901d063dfcb26bbeabb40154a275bd8bb8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

