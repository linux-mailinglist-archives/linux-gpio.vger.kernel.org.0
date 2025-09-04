Return-Path: <linux-gpio+bounces-25601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F64B43EE7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25E527AE7AD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 14:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FD831AF0A;
	Thu,  4 Sep 2025 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R58V/fXs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6C3128CC
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996298; cv=none; b=RGvPmAglNQc8jFC7sX4GXU4LDo4tiMiGOCxdF9qjjcna4wM80GNQhd/xbrFuujvnWAlo8k55FHrzffjPfsbuc/5G/e17a0rEq7i65FVinAp/TkWncMbbZmqe8MCJtx1vCokzyGgEYg/mLc1creWD1N2yfcYiGnzG3/bCzGbvhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996298; c=relaxed/simple;
	bh=Jqv05BEur9jLVO6NaKp7y9M72ErD6pTvcjBw1BuFNBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQPIWnoBuhU6G6l71L18c/ZGGIr8aUm5xGUEaXc7nJRLXln6Z+XiVlPOnQ8xBWxMMtMfzk6ni+UKrCnJ1DtD9uv3vToy1fbj29a8YhrcoNi6fbDUXgZqopFhWd+vcOnFSCRfHk/ZXvqkbhTBMHTOXrMWOmHhuca/5NDDrhyzHwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R58V/fXs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso4129765e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756996294; x=1757601094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWc/c1a94HTBP6zFYRMkz+Dicl7/4365yjhzPWmzAk=;
        b=R58V/fXsG/bU+8Jj+szLP0FD92FSkIptWQFoUQFUUo/TPzLoTO6rWtoCK3H4ARxHoq
         kuVTh/gT1woUij1wr7+LfTyE4FZspe6g6gjTYOHyVfHvgmKIs/BDbYRIqDPry+wTv1dy
         Mryu/JKlyBtPvt/93SoaE9N1/BM4QacnJpvH2B0i+UmxMxa3Ecsie9fWZ5eUP0giOlia
         dyaQK7yAhjKCFXj9rri8At/HpV07cUzIrAEe2aQyVcsVr8+5iOnTftf0c6Fr8jxc474s
         0u7OUSWFqlMqqd/pB/8HSS/q6BWmvuktG+PZXcPSibOyqcxXhR9U/6E+OKc7dhSVecf3
         82vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996294; x=1757601094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOWc/c1a94HTBP6zFYRMkz+Dicl7/4365yjhzPWmzAk=;
        b=tHfCuzUxrAcHZwkQAY0/Ujf+rHkAdCbkHJC2QRRvpyjI+UhJHt+HCjD+r8+cBH5ZqL
         yExGWvfeDwf4FfpuJAGYLIxado4R61DeZcq/pEWwXhdlFYLLD1wW39iZ68L19aNtv3fs
         25pKNcBZP7y5RMw4Tygd5SvvcaY6GDPs9iBOp6Se0J/3zQw6Bjchb5UpuRxx59B/RTpQ
         esuzYPBBxzQZzV87UQ/Uw3+JBFi7W22/qvOU8e3ij3rn0Ep50AX0d7kAKml4dwKU6OfB
         V38HomW+NB7IkVIm00rCZwcHW8lIPvyPl7p5FEiJFaOuklBcOoa3NhYFbeL0nXqB/KqP
         9yGA==
X-Forwarded-Encrypted: i=1; AJvYcCVnIyCe6takBxqieelEw/W3zslUSpOFhhEygGedKGpBW1y+/+ZDNwRxNZCGN/2bkDDNiB4u+eymFxc1@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXASJhj95QjUgPnxhybbrji05sJ1a/EThcRaJrlpd6YQWo7Bq
	EKP0gvVPFsxaWE8kx3A02EyXn5R6sXrpDXlnJMTxixnHCM/fML2tI7Nlp3IbV42cEqg=
X-Gm-Gg: ASbGncsXbe42DF9+8ttsLut2ttJYypnh68d5UZbpcVNZhWK1N9Uzo8jP9z0/EcZLb1H
	Hvh2Ol0xZuOggdbKzMqIzQUvFaRnS8jPh3ajh1PFFMwf+j8NuhYE2rLcKFODgE7nPekIYT2RWgp
	5d7ukjoRSYZYPDa43tXLJ2uxLca/04Bkad7oKWjTwnFT4A7Q5oELQVdV8ckMdhMZpmC3R+sK1qM
	9ofmveLu1/rwLX6Dv5hNlQmHN5c3Zv1zWXn8mJANRxEY0l1YYhhAVdLdC3/nt03I8Z6gpOEs+Nl
	Sk3DnF6GIwCjHln2HiHMTBLRCbHAVwGtcjHMolz9MCswd8VwGOoR2tRQsSfoNMYf9i7dGzkB4ah
	+VAt6yOnn5Ybps0Aq9PhRX7Sro5J4XAy3AucZj6WKoihg
X-Google-Smtp-Source: AGHT+IGfdMUSy686Cb1BqOU8JAIe9bVYHo+twh1W9Pn3DRVe6Sxnh5hEhO7YHP8lWHvi12JNN11Fhg==
X-Received: by 2002:a05:600c:8b23:b0:45b:47e1:ef6c with SMTP id 5b1f17b1804b1-45b855b2b0emr155588755e9.35.1756996294547;
        Thu, 04 Sep 2025 07:31:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm319642535e9.5.2025.09.04.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:31:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: nomadik: wrap a local variable in a necessary ifdef
Date: Thu,  4 Sep 2025 16:31:29 +0200
Message-ID: <175699628267.79535.14392040407433836716.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903131903.95100-1-brgl@bgdev.pl>
References: <20250903131903.95100-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 03 Sep 2025 15:19:03 +0200, Bartosz Golaszewski wrote:
> The 'desc' local variable in nmk_gpio_dbg_show_one() is now only used
> with CONFIG_PINCTRL_NOMADIK enabled so wrap its declaration with an
> appropriate ifdef.
> 
> 

Applied, thanks!

[1/1] gpio: nomadik: wrap a local variable in a necessary ifdef
      (no commit info)

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

