Return-Path: <linux-gpio+bounces-23436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC18B09D07
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400A63BBA33
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AC1292B47;
	Fri, 18 Jul 2025 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dlz1dSUU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DE290DAC
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825378; cv=none; b=C/fC+vQgtBri/lt429wh9jyItybhPtH5pVRETLVHUGnShi9nEKDez5cOqHGifBrtQXdMQ4p0DU1YuA5PtWjtq1aa/crE2T7svZ+LbLAd4flIZx6jq1C5qb2IHQ47GUviRGHnAhK09KUIOAJeJky6VaMbViOx1VOA6vdzHHX5ozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825378; c=relaxed/simple;
	bh=+qkUHJvAEilgpVRYhUfskqT1Bk/EJIdcav8BOc/v64A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ky+rznYhm1nrqb0Sa0hwia4ebAzDb4X6t/Afr2+s8eoHhPSdEc7kixFKrGNhZvgAHgPwry20/6Z+ZrQ+izvGBFf7Uz05stoCsXl/AvsnfnV4fjst3zC90Ia3zOg4dl38wVfr4O8OuhEVF/K1TDPQiSC/UQNMPvt9THPrD+qmY8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dlz1dSUU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a51481a598so923078f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825373; x=1753430173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlC/cGH8r/vDF5PDog3srLxzz319gJBwl105Vt+1xkQ=;
        b=Dlz1dSUUMRiJPrUqW83C15ezn4w/jIi9PbhNmUl9NuzOoiyCIEOYf7EGp4KTFWI5Hn
         QCnLiA3bwt8YXuDoFQeiDuMdEfhqUWjca+kABnVrPuVFWKfU8OaYbDu3/BDTwpZ1d/Tq
         iAdEYQqlPHNUZ4/A18leT//RiLz+ROTm7lSm53wMQR2Fq0p4NvscVcchvBBfWveQoib+
         kbsU+UQMRYgc7pC9PBQsknA93nbk4YHotCXq5w8UraFOTt6xcgG9I99RJEXtLTgdyMt9
         o5LIZWtWpdNSNC9/2iVv241QlarXfBDjXl7eXRgxhKSc7K3JVh8zP9obftfEDjLZGAsK
         q6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825373; x=1753430173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlC/cGH8r/vDF5PDog3srLxzz319gJBwl105Vt+1xkQ=;
        b=AsALfUQb45+KlpG5goOB4DS5eSkGR+ciJGUyk21hIJ8nQT+LDorfcpHEKYiad+jYT0
         tDr08QHbr+UH9E4+RNyjM5lLRAHJAo5/sU0V0ururWYF+m3+0QlOXbc8K/F71ZKETZ/7
         fDvOKO11aKTqhuJ1KI1jSDRQ8hsVqtX9MkTT0JxanbjluA86iZ5vD9+ttWomUggbWFwH
         sa2D7hk3KVYBC9kAMOelszQmMO3ZD85ez/yJpPF066iJwLyuNef9bAnd+HdAg8Aqs63w
         xJAskiO9bpWLowmItRqgz4hJSSwPOC8ojm3x8nKNIW/Y7eHaba1OylGcxVXprjlQc2B3
         /qLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUzM/qoe8XZaJlMMGq072PHr+nOCXzF9ogEFlC4rukBJZ0PMrbB9rPPvgnkClymVgNUmPZEjoPndL0@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCX8k3sKXlLs8uK8bRezVl3pOuLv8cjf+t0qRQJXJpIvvJ8pO
	VhsCT7gjgzLcYjvRf/IS1lzIN8oXUOr75zfHbRHEXK9P3QEIVDXcJ2CI88lw+0wvYXdbAFXzXIK
	2V4o85VU=
X-Gm-Gg: ASbGnctP6+v7Fk3jzlW7Q8Pc4djSaDQW4p4SnzNSeNm4pTTz39dBBThLAenRn/eZsH6
	V8w1FMVVnoiBwy6zv+fhVH4t2YsPJR+/O1vJLEupuQuB7AFKj/x33OncW/UWBNVrRPi+2aMd5Cp
	0smiuSE1l9Hp2ACfFElUhlLUAq2UW3pF8sMIhq8V+U0liwpfm9x797Zltqbiie/QYMIa4Eyln6l
	Bhme8R3D4DSt1uaY5i7CRI0Lxbkr7e0/AfKZZ/6cqU5zoY4zn/FHZCIKBnNd1t/u+I1d/9vigXe
	Jad/OFYyCzK78pIzI76jQOWHtudsSg3q+NEfWnQbHxaVFl9M+f5K1uZQbCHDrkHmOIMnI0M01+m
	d33uaaNJUpsm9Dqe2uzOX
X-Google-Smtp-Source: AGHT+IH1H23FhlLxPI6sqqcyCjliClT5k9JiEMs2k853A3AuCQaF/Nt5CiJR08HNe0hbgbDcZi7/Vg==
X-Received: by 2002:a05:6000:2c0a:b0:3b4:9721:2b1b with SMTP id ffacd0b85a97d-3b60e4d1de9mr8619991f8f.9.1752825373425;
        Fri, 18 Jul 2025 00:56:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] misc: ti-fpc202: remove unneeded direction check
Date: Fri, 18 Jul 2025 09:55:45 +0200
Message-ID: <175282531507.45055.14440894670985365034.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717130357.53491-1-brgl@bgdev.pl>
References: <20250717130357.53491-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 17 Jul 2025 15:03:55 +0200, Bartosz Golaszewski wrote:
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
> 
> 

Applied, thanks!

[1/2] misc: ti-fpc202: remove unneeded direction check
      https://git.kernel.org/brgl/linux/c/db7897ad60fd7d7bf471bc1c49e3d01fefadade3
[2/2] misc: ti-fpc202: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/74896eae7e040e1b2a381efc8df0c839023dbf16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

