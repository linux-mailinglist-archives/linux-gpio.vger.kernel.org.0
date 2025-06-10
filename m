Return-Path: <linux-gpio+bounces-21139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FAAD2F9E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041C71893BD0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3903128369D;
	Tue, 10 Jun 2025 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VSTJ3ZQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5199C283126
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543132; cv=none; b=ISbGZtT1c0mEHrwX0gY2RZ2hGCYM9gkQ5A7stYfa0r2WG5v7u7EpjXWsQqnq52fadJw+mQiDkEckRXFfRZQIvAqCUTmyHSQB8NMMHJc9sGrb3sfwtX3MGs4rb8ZAHpq3S067lRgUGD6hPOuN9wHi2RoNXqUUD8fdThY1tD+kymA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543132; c=relaxed/simple;
	bh=oJYRsQDIZIFS1gyuxKSeATK987ZVV/SuTaXBG/5waxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vw1UGtm5yDpgcpeLifroXR+fmexlDNWa7Lsr/rm+klWHgwijiIaPkAOpvlEUTzmNwUoPLmnahYBHSpF54bT8eC/B3D+9XDmsmRv7dBjsOJC40vaq50a5FfAaKF3yFt7xFfK6CiXUWXCIu0quOSEPFjb+mmGvfCT/rKb9drIFIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VSTJ3ZQb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2094266f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543128; x=1750147928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQOikj5+hOjYofyjQTxrgd5Ve5lIEwTQk5A2jm1d/4w=;
        b=VSTJ3ZQbLKJ73vDbsJTxvlGnM+HqfKpGH/byEpyxS+kwzYNjznr83uVz//Gf1Low3v
         DGZmfprQp6kN/SRATd/Y1UwanZrBqX/dppygYNtAUIa6QifJG65z4k19NbyIH14x4GLK
         J/kVAHKF/wm+9S9yp8+R6L6G1MYklbKtZB5SfV+IBDSFcLkom/cpPDgm+bOwvOLfTDYz
         F6oxtwp4tC7Ip7GH6dUejzYZb2QO3zRiovCt0YzbZu3akdee95l95rpj2IQU89hcSGOB
         LUit1EHgTVi+ChscFqOxeKGSLlkFmLxE57jILytCM0eHvxDWGbzno7jdMQQ7+l74P8R8
         /fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543128; x=1750147928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQOikj5+hOjYofyjQTxrgd5Ve5lIEwTQk5A2jm1d/4w=;
        b=KPV9TXTkp2lIA+KVgOvamfnJpmVThLfDQnKUivbJrbmFHzZZNWXQmGSl7LHH7Ea/tL
         U92VKYoU3C8RlaGCFOKD7heWa4jgm44Vt24PZfGiJVUlpWzAKnjsdPhDC1mQ8+urHOsV
         dPfPR5GwqQVdsBk9roJPI0JcOBAivlf/IFPcOkdnYR2Nsk+zZYj5SL4csmTKKD0ZVk9c
         kBWwXT0/8jy27qci6LqwF3MtE0dMBl0F0PxOHppDw4GaPQ4V/LfCw8GVr+gk3olpA96H
         l44CbZaKTK717zn+zQb5M6YAyFVV6fBXAWd0FidQW9rKQcw/kN8sLtROrHmmDCRax5ch
         T1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX4kUcvAAGNq8PK0vgimWtHBkkLohkC6sX8rMHlyaX8zB/GYVKY8MywzEcXjeg8O6psYMm36OUK2OUb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hdM6ZKwMIn0/zB00BWvp2zSoRxajTiIB1DJJJJOW64467iqj
	cVAE2rth92iamrr7DUNxj+0bQ2twm9ov4Z3Cs/5fyRujAMxbzPfcJnYYW4s/K1LRkuo=
X-Gm-Gg: ASbGncvHEzR6Zv6iSGFtoZ1uw1G6wiszs3jK8nqMWnde5cBWqdAtCOmEQ87rUOE9h8D
	E/BcuoGcZMc91aT/pgcjVsXmjcSKOHN2NVl83DCsKuf2Rx7kdw6ZUui090QbVtJO1TQ91EG6p84
	78xeQ8V3UwAZb3kZD7vr6clEoWlvTy/hvZmympihejiDEhqkpwDeL4Su4lhMp0ya47AQEeEpUFH
	ACB7+VpjUN9frJT3kGleX1NbKElZUBNbpTrWpZFMUCXdFf9AMozmvZFqNlNjdcvEX1W49+IkkZy
	+CEfrOerqfZXXkHa3sD5HcYCTYQDoW+CXbSIIXLtzw2uuxoVizVgAAW/YTwc
X-Google-Smtp-Source: AGHT+IHeh5JOUa/6DesJDFgxEXglaZaNBYUlWKW1tsF1e+6vqxndSIUGrZ0XXtHALOHyX4qbc6zicA==
X-Received: by 2002:a5d:64c6:0:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3a531886727mr13057182f8f.31.1749543128214;
        Tue, 10 Jun 2025 01:12:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:55 +0200
Message-ID: <174954311123.28634.14290388105456519016.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250604144631.1141430-1-Frank.Li@nxp.com>
References: <20250604144631.1141430-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Jun 2025 10:46:30 -0400, Frank Li wrote:
> Convert gpio-74xx-mmio.txt to yaml format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
      https://git.kernel.org/brgl/linux/c/0e3b7b8759a7f3597e64fc12a8a017111edbf777

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

