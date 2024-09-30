Return-Path: <linux-gpio+bounces-10568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F359A98A137
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5CB281E5F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904F518E047;
	Mon, 30 Sep 2024 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j7GfV2CJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AE18DF9B
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697291; cv=none; b=Y/A8o+1HT/SWL6NQbGehQq1NRa4zlOlHp5XXFfURvENPdR2o61ETbkfVH17ZdIzFFkDi2JTU7Hh4VseE3MYdgYrXlCWpkDxfZZgWumT8Xa9/SJSSY0am5zkYQKvF8yyPJk+xcTB/gDa5vDH686whVJWxDsAVJuNbvoCyAs3QlHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697291; c=relaxed/simple;
	bh=mNwqYJzLtN5eL16XNGqSAixV3zRsqrhuI5IKa/pJ6GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Km2Y/wIBNVpR+KlucsDimSYewP1gBo6ud2MzRfS0B1123V4Uu7neAQX5L0b1NiM+5vRoxkjhWJ5qKmziiA82uAufh9mOKWd9TzDaV4vKCRRoLRnY5TYeEhZ9iA3SZlrx8VdctRcJsOvPMTO0ei/WWpnvwIs+u4QzaLuzPXGc1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j7GfV2CJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so30970755e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727697288; x=1728302088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTlR8GM3OMlqQTYUcqotU0N7INFRb+pVscGx5OHzhZQ=;
        b=j7GfV2CJexnwy4T9n22tPOi+zHLGlUWT0bC5ztvoPRZGGcQAG8DqugITIVHROXO1k3
         GFOcMbgIrIVofvN+qof7JLUb/pzXDXlt1XBNBau8XiOhKk0t28spspk39I7z46GmMumT
         nRk9IvfNNixki34oEQrBzg1GP2/rLh8QkaImGwmK6d/6U7Vw35f7+WaGQ8NCiR9dnNEi
         huRSDdEuFZqmdZZvP0YEnVy6LJrrFg15AkIGqhWxlEO3waxrwM+3DUMjEg4bIY2IFYzs
         uf9O5+iqnNvi3LXbmmAetBo6t4lLU64bPDy5cxcXGC2Y6014wq4vQHtFGwJ7ERLYld6P
         gLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697288; x=1728302088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTlR8GM3OMlqQTYUcqotU0N7INFRb+pVscGx5OHzhZQ=;
        b=ONWbEZHyjOzYOSK+FyGHTuhuh3Jpy5sQOiay2GbNzqv1R+P9El7hjl/bff/DxCRQ9C
         lUju6K02ne3VEPwo33MFUFDHU2judJQ31iBlshtnmHV343Jn6+Z870WXNdsnq6oPDAJ2
         gvGFoRKwaLMmJ0o4IBEIfbPxPx+PeDE53LQhNNsTi8aq5vbyyiucfRVGYqwc/PG0jrcc
         MXBCwa+oZB+bp9Fv7hBZk/TtQsqzjKx95TNUzo5/nAqSrunRbA5dQqADsRLfSfSbiisw
         JzXIpS1fmea+KIBDiqe2Ng0C5YdhQ6oqq+toqanPYtmjZSw+WkqMEwq+UCjpTY/O7z/D
         hPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3eojR0GNyUIYxj74OG6FeQKFBSvkjXWU6eh2d3n57yI7Coh5WcUaW/nhmwWao3yPn11LYCpPVdLb7@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVNT8BSzQonZi/8wxloQ6fHVU934LWsZSgJ+KqTI7+dHyH1MY
	+EevWnkIC00lXiCM4SAy5hKmAmQH6sGVSZuJ9/8vSDUGbUj1vIcQaNpxjzAJZw3+gliYehk5s72
	o
X-Google-Smtp-Source: AGHT+IFNgcBeQKIXQJFnsznAUv8Zr+Mwmef9bf9T9eIEa8b3L+67wwcYC7L/VT1STcZx0/9IpQ//IQ==
X-Received: by 2002:a05:600c:5127:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-42f58464975mr98683375e9.22.1727697287898;
        Mon, 30 Sep 2024 04:54:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730ecasm8889189f8f.81.2024.09.30.04.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 04:54:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Parth Pancholi <parth105105@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Parth Pancholi <parth.pancholi@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: davinci: fix lazy disable
Date: Mon, 30 Sep 2024 13:54:44 +0200
Message-ID: <172769721870.54897.1079647441666615985.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828133207.493961-1-parth105105@gmail.com>
References: <20240828133207.493961-1-parth105105@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 15:32:07 +0200, Parth Pancholi wrote:
> On a few platforms such as TI's AM69 device, disable_irq()
> fails to keep track of the interrupts that happen between
> disable_irq() and enable_irq() and those interrupts are missed.
> Use the ->irq_unmask() and ->irq_mask() methods instead
> of ->irq_enable() and ->irq_disable() to correctly keep track of
> edges when disable_irq is called.
> This solves the issue of disable_irq() not working as expected
> on such platforms.
> 
> [...]

A couple hints:

Keerthy: Don't quote your tags as b4 will not pick it up.
Parth: Don't wrap the commit message lines too eagerly as it actually makes
it less readable.

Applied for fixes, thanks!

[1/1] gpio: davinci: fix lazy disable
      commit: 3360d41f4ac490282fddc3ccc0b58679aa5c065d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

