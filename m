Return-Path: <linux-gpio+bounces-6927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748478D484C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1469D1F22160
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552C36F314;
	Thu, 30 May 2024 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C1N+N03H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CE16F300
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060909; cv=none; b=KO8kL9Vvjug5t901Ez6kSg+FTXOQuwyuscpOb/CcmxYuzfuonVFuWMGl5cYoP09Zqn9uaRUeWxtG51clAI5ZBwUEgwLAG5ypZHOn/XhiJjRzBKgZM0Hx6gepcfUDUWAJuv94ttwkcPBEuuJhjtg6cn0eE/Yc59s6wnoliHB7J3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060909; c=relaxed/simple;
	bh=LOuk5ngQgDvwGWmTqF8UHa1uZEIcOdoIOKhJeBC24z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYA6Ey/cb52ZKuBRr+uXnJ+CodBDTwfZI3+sxDVYiZ/XwlbBelKhomv6+RgKev5eeQKl30/VJ7O7frseKPFHy8FuY+U8FBM1tRzw58dKldJnUCgKq2J1KS07z4mcnAziTlHH98sJND3Wj5P6j8gAWHJvP36dO/+jqhbgcsTTYG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C1N+N03H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso6441895e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 02:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717060906; x=1717665706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2NdMUTFKCND4TuQAML2rnvjKT/jKwjKz+oofuCTZRU=;
        b=C1N+N03HSClTf7HDAbAg03esAG0+Hm8TAvrIXn0xEH5owaeDI0RbU8q4kXwKvam6YH
         6rJ25m5X9RKo1K1EwEidkD4JpcmHehhR3FabH2EOxdr7aBtp/vEiD0wzYkrgcO4HSGRA
         gKvs/fZ1Cf+zJJDnvOLovhlC9TwqeK0vtppkz6ArotbeipU1Am/gsSuBZIpOnLIYZcPz
         Yx2squZ9tT4c9XLq1T1swEm9+fYB6X7re+6inPYBToqzoiuiJuDx5PFCMiw5St/bhrbm
         yygowueKgj/KrRX7pqC55WDPsqKeiAWcESt0Xy6l3iKjpZxqM/OasJU/xJWUpVoVw6V/
         qsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060906; x=1717665706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2NdMUTFKCND4TuQAML2rnvjKT/jKwjKz+oofuCTZRU=;
        b=TMJFbAJ3thRJ8GE/3x5zxLO9hdMv8dIWfcV+2oHdr1sfEcKG8RvO5U1i/75mXGIcWD
         XzrjQS8Jkd582HgeI0tCuTVLXRKoftECqOVF1prhx6wmtmzd4fHl4CAMdKvqaBt36sQg
         CvQn31yGB+jG+YhikqTP3LJUwhV8ay/jhYX6UucKF7RYs8NhR348lvBU/BYaIPVKCRTD
         CRJ8FlFZC7Aipc/Ihkq8HtEaydFLYJkJAy+LbgC1L38UJq2XiKEXIZWt7i/t40Lr+X3H
         H1GHR32ZdHsMAKr1cHN0WGUfVxuoxx5rxQ7SFZNAc2imDe/R6ddhoTGG8MjjaXW4ymcr
         PNcA==
X-Forwarded-Encrypted: i=1; AJvYcCW6J/HWhFruZ8DUZqiD9pgDjSMQEB3b215pNfH0hRh+IkgudJvWPby1SwYSXLQOKGHXdi0aWYMGwqSkc19Q8jLJRDjsicgYg8+cOg==
X-Gm-Message-State: AOJu0YxCJhY+bFbYk7/gmcs9o9mx8IV9iTFDdegZbNK5anemqb8Bydc3
	dAyjCnzHgY91nM2PG0LzQIPO0hZVtnpELliv3oz5EdUXviEbMFnjUt/aHhk26dU=
X-Google-Smtp-Source: AGHT+IGvEkCdARfpYJn7j9uuA7yNxUbgpb8AAl+3ZNngODEN/Wqw/TiTEIYw1nqx7Q6osL9EIgQc7Q==
X-Received: by 2002:a05:600c:154f:b0:421:b79:93fd with SMTP id 5b1f17b1804b1-4212781b4a7mr13857215e9.21.1717060905592;
        Thu, 30 May 2024 02:21:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:aae:8a32:91fa:6bf5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706c46fsm19043935e9.28.2024.05.30.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:21:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to errnos
Date: Thu, 30 May 2024 11:21:43 +0200
Message-ID: <171706089866.32720.4484394923188699673.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 27 May 2024 16:23:44 +0300, Ilpo Järvinen wrote:
> amd_gpio_init() uses pci_read_config_dword() that returns PCIBIOS_*
> codes. The return code is then returned as is but amd_gpio_init() is
> a module init function that should return normal errnos.
> 
> Convert PCIBIOS_* returns code using pcibios_err_to_errno() into normal
> errno before returning it from amd_gpio_init().
> 
> [...]

Applied, thanks!

[1/2] gpio: amd8111: Convert PCIBIOS_* return codes to errnos
      commit: d4cde6e42f2eb56436cab6d1931738ec09e64f74
[2/2] gpio: rdc321x: Convert PCIBIOS_* return codes to errnos
      commit: 9a73e037f4b5eb45c9ecccb191d39c280abe7cbd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

