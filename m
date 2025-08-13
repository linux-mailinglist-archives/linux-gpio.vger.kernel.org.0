Return-Path: <linux-gpio+bounces-24340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89740B242A0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE7433A66AE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E322D5C8E;
	Wed, 13 Aug 2025 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K3RbWvwU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A52C1798
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069827; cv=none; b=U0oyw6k4uF6fjUdPxYt8ZA+tQ9rUQOxJCtPKmXhR6ngcMwoYzjzfaxrtEK8EgBy8KNrjiKCAB795xwyPWqB0p2IW50nE4Vbb/j0OEIHP5HXxpI/AkjI5/fprJoFfjqsSisvrHUaHheK6CTcTHY8KzHnZzozGsrvn3mi2OtDxukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069827; c=relaxed/simple;
	bh=bv6DYqjwN2D0DlDYGPWLKAAmU2xcLODMCxxOZH6IMlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8iusFrJO2apU7LpdlM2TB7k6ekdZaI4wJTIcit86lhHXvl/GsUqKK+aEL//mESIe05484fbO4+7figKcx8YJxbe6ru5C+Dk4XKiIq+d5pfNWLlDvepRjL43reRNlvA1gwcfUL9fEr3io1HWjiQXUB1nnwW8Cp6kU9CJtuKrZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K3RbWvwU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7910123a0so5565993f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755069824; x=1755674624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WATivFrievb3I0TcPTJrTrvyez6QlhkHAEe8TBXKLU=;
        b=K3RbWvwUUe8d3b1jowxjvceKbI9g+dzxeqo1pC7qbUpHA6qKtbV4FW7akwL18hmOM2
         37jgdCdruRysdghvmPBKViC6uPdiCGzXWEj+msMcodur8LpKGr4oUOjadb0tLzU7Ma/B
         ur8mbLxBsb+mkmmaI00J6xTZrIFXQTEOpDKkP64A+lrsJs3fYwgWeIN5r11LhnASP4vn
         LePMpDryDPHs4XR+hFAJ0gDVlyMxB7NA/yrTzAeJbuS0ZC/jkJ3AgoyNxE9tXg/5vZkN
         z7GkkdQDv8MljgGPAQrv47nVOQly3HSl9oS4+FC1CqE0vDzh/ozDoHRQJIVtw4LhG07f
         ESAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069824; x=1755674624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WATivFrievb3I0TcPTJrTrvyez6QlhkHAEe8TBXKLU=;
        b=jVu43EXFiDAq4jtV2XXrE4MAO/CX+3iwg+FaAxdRRr3SiZ3kqiYKVmVQ0+RJ4ZLFHU
         e6MvGpNs0QoG+suWS9aQihSwOF0JfsZ0WVdCbRj1+yBUnH/AUJB0imV2DqkUUU9mQHAS
         9FriD14fB3neHNpq3L5XuSMrg2slL5Yxuudkr4DIbzXmd8WCeMkpEoqUivemVyxkamN5
         g2hsLyLiXUhnVA5GW0lT7pvH8C0m91q6O0SINYs92XlTTHSzlq17Rdrb18bOEYPXF4Zq
         ttTDV/TfYT2Pxtm6ppEWjp3d+ixRVRjsov45faw9p1PZ5qv4PondZGJqGsjeHY8pDch6
         lqsA==
X-Forwarded-Encrypted: i=1; AJvYcCVbb91wmUgf1XiLhyPjBt/PIydy9iTN5eUsEDGyFaJBokGCRpjpNF6B9DACN0B/zTGKbn7k2cjqh+3y@vger.kernel.org
X-Gm-Message-State: AOJu0YzgmCw/wS6bEiI1mN/hFAAQhf8gNYVYP2cvpJ0iNADSWG6C9KOG
	A4fPHVHydL8DzharEwzHzbxQqcDw/ptRNu5G4qFCs6h5NcfjC75KxzT5QEFppwDmCnk=
X-Gm-Gg: ASbGnctrs344NpZxTEmHOGrhQpOWEiBSC6MXtkLPXCexH5Ih7TwxZhXDFr9c5tw96Up
	EV5dj1J/mhLpjarRfc1FCPq+41g2Uj1TiIKliwNaz46Zr7lTyOTjwUr0ViwqCoGsJRh3BHzpr4I
	yYXRZURTFo4jgk0pNEDO7bq6An+MEvrCT+L8h9b34AyPeliP87mts9eAWfhds2fKIkhNbLp7jcM
	1Lu44zix2tuHDALSJejfdW7iJz5MKF3V0rTeudcZ+F8DzyWDBqMtNbVN9kGNTdD1pciQCSlfdNo
	O4qfRpqr30xAUqxUb9WFJC2u5CqlYqZBICTZ578l/gCrF7fdtT5BA24RYFr3UvAlPvzAX6RA6jj
	5bSyIft2mRBJBR+LxmdTzhBPy
X-Google-Smtp-Source: AGHT+IF1MjcUvwgYnjulLvHKgyfmZ4E6I3kIjMN9y8mrIIK3WlP8h9WdbRGmZ0ZNF9dbobExy36HTA==
X-Received: by 2002:a05:6000:238a:b0:3b7:76e8:ba1e with SMTP id ffacd0b85a97d-3b917d29ae3mr1458813f8f.11.1755069824008;
        Wed, 13 Aug 2025 00:23:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:74d7:9082:2b54:5348])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac51asm47740936f8f.1.2025.08.13.00.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:23:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
Date: Wed, 13 Aug 2025 09:23:42 +0200
Message-ID: <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aJwk0yBSCccGCjX3@stanley.mountain>
References: <aJwk0yBSCccGCjX3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 13 Aug 2025 08:38:27 +0300, Dan Carpenter wrote:
> The "> chip->ngpio" comparison here needs to be ">= chip->ngpio",
> otherwise it leads to an out of bounds access.  The fwd->valid_mask
> bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> same number of elements.  These values are set in
> devm_gpiochip_fwd_alloc().
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
      https://git.kernel.org/brgl/linux/c/148547000cfc1ba8cec02857268333d08724b9cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

