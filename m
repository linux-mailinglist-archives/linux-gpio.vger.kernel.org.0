Return-Path: <linux-gpio+bounces-9532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E7E968379
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAA828198F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 09:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91301D1F79;
	Mon,  2 Sep 2024 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a+/TR8fn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC215C15E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270094; cv=none; b=W7ZQBVFo0156Jqt2DezQvd9T6+d5jyjq0qCtdH/ST/edfSFeB2kwOqn03fQST/0JNsawke4ifmVvMOywBz2rp03LSo+A1+nHTOZxf2G1RGDGuGvBqnD41iWHLHF7+HPJRo/1j5e4z57qr1yeKEFcB/eyehZcO+Sksh737DpS3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270094; c=relaxed/simple;
	bh=7f9NohxoKYVV+JcYuwzUmeYnZ8BqcMgzeGi4H9xfJBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ToOye147Cgk8YbHIgdlS3qbdFP5zKaSuU4pOw5D6a7123hYySno7JAZCDlmjbq0YrwV/8GX0Eo+9AueB/Tb3B8YuzWGmVDuweBWct73SW0HguJU8x/C9CWKUVQUWTYO2W9wPkBr4bMxZmh7Jr2/f5w5kreTWj8z0D4gKlpGSbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a+/TR8fn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so27982635e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270091; x=1725874891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7EhRLl1axrUIsWyWDb3JWNTr3sPA2EDqw2uAoCWZ4k=;
        b=a+/TR8fnwp6KtWtkey4yhp+XFmyObDiDYFNxjs8fmuCo3SWZhbNGFfu1p+H2yaCLHU
         oqUDl/sjSE4P9+dErTfqkCwkVKQBssNQ2SUdufKg8/J359STpZhvy3WA2r7QB6wslDe8
         jN3rLr7qPs4K4s8CWf+NENJc4HGc76btae/PASxvtqpG/YZqc2Hpfk4KkzXvzkqJEhC7
         Ly4gEpP7TmBVNdAH6Jxj4OMvf05OGcfGnWcyIjpe29Z31MmAxt7C5aZQs8RoI0W2EMFj
         T/yYFhTTD6cJWNgG6fV2eiPPAJQvr+mXLofYipxANmLT/UfH7XO78MZ1JA5uvly4JEyv
         TWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270091; x=1725874891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7EhRLl1axrUIsWyWDb3JWNTr3sPA2EDqw2uAoCWZ4k=;
        b=mpgNSKWb212kQEHNESf3tWt+yBHzji4wqBnQDDru+aWTQ51hcy4YoQe9tcV3xguwa2
         kw31JFBXt2RGhm1vtAASJGBRojik2z/nSYA+7VVI/DsOFnuJPWsvCCL1+lom/ouSylRS
         Wf7fiT9/iP8kjs8b19O1mQLd55+rmXSPkOEN18okW51ib9Spu8LwrexGIGalfqIZ7Es4
         NXVYdpYHA8lbGpVoWq7qEc4jDSh6KDIDnqLo31xOkXc76d6OoLzwKlzPLeo2awz97SUq
         36VCPbgvu6xF2plZ5Nt33I3/fPVJiENkk62EYVpYSeimwfYEJauYhp/mlf5E7lQyIEhy
         3ayg==
X-Gm-Message-State: AOJu0YzkRurVi/p8OqLimWDetnnrTUF5otECV4frqyL+XrTK1q6Px7z0
	UJybYIJBogMql+OB6NnHkIb6BR8NfIQSF6pfUBitn7DIaOypZugw3Ao+sWQC1HqZpfasl4B3oUO
	O
X-Google-Smtp-Source: AGHT+IGd5U51EF8urg0wHHh7LUfrT/h2JyBqzsu0NjQ72lbwy2e8CjJkI7Gvlnl9UO/EqLYT/E77Lw==
X-Received: by 2002:a5d:5e12:0:b0:374:b3a3:3f83 with SMTP id ffacd0b85a97d-374b3a34035mr4922669f8f.53.1725270090183;
        Mon, 02 Sep 2024 02:41:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c23d6a38sm5273938f8f.38.2024.09.02.02.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:41:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] build: fix HAS_GI_DOCGEN never defined error
Date: Mon,  2 Sep 2024 11:41:21 +0200
Message-ID: <172527007905.20851.4063706700024610685.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831075212.147812-1-warthog618@gmail.com>
References: <20240831075212.147812-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 31 Aug 2024 15:52:12 +0800, Kent Gibson wrote:
> When building without --enable-bindings-glib configure reports this error:
> 
>   ...
>   checking for help2man... true
>   checking that generated files are newer than configure... done
>   configure: error: conditional "HAS_GI_DOCGEN" was never defined.
>   Usually this means the macro was only invoked conditionally.
>   make: *** [Makefile:440: config.status] Error 1
> 
> [...]

Applied, thanks!

[1/1] build: fix HAS_GI_DOCGEN never defined error
      commit: c701785717629ecb609764092414d1f164022d2a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

