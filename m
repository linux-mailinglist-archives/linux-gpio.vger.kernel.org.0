Return-Path: <linux-gpio+bounces-27360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A7BF5A3E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B55919823BB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3E2328B68;
	Tue, 21 Oct 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LoUIUnBG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC42F25F2
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040213; cv=none; b=bpig+VKTAk244fUshyYcRkFgnjl3RLZyjoeeR9nXSOajvQ1SBSe7JmkscxthV6MSmFGwopkxekgTjp7caRLJgEBdvqaA2BgK2SG2KImkiAweY2cPXrKOezj8gzQsa9t9aIWlCHIgetGfvN1d9HRnMwjdKMEHAOOPCy0Ckk/f0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040213; c=relaxed/simple;
	bh=w8Oc5CXQnODol2Z1aBao8r/q0Wa58FCcym4zOFLDd3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CgjBmmwP67sqVSkdttvoBskcW9WM7pKCpFTOnbz5n9t1aVLXLMhAWfz04bbKRCBUjq4kRlsx5hKYU1oLOZaC0QM4kuq3616uWJD00M3c3QQX+YMDINbHrpbvbKxaGi3TdeqT2zUguZXwtixoLq6jEedQo35CpF4KWvxUqpzlx1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LoUIUnBG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso4997700f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761040209; x=1761645009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPNz7PQsxK/vD4wJS6lZP5itb6jIXQBhqBzv0rdeEmk=;
        b=LoUIUnBGuhzf9NIy5fs35FV65Yd8r2xi3lQzmLTOpReUfsGWeGfiTVwqEbahS5QK+2
         P+EPPUlDpIxZK6aILXyz0ZJmUdT9645fjahYp+zHHXOKRVUlxFb/WtlAIzblEZbXPH9F
         VV9wQR+znM0QnBPta1Q4r2HJtPHNLbCVsscS8hXUEyt+PImUiJLOvKENNAXg6kTVJ2Bs
         K29z3Z8eu2hrW9WDykzHoU8s704BA9d1dQKzT87xDYaHltTmw4cg7T/vz/X9/6pgjHEI
         ZE7QDX7pTZzH9mCfrZr7A0nndzc7FDnkfIWe8+mcRkbXard4ZmNeeDIpY+u3RQ4XWC0P
         JZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040209; x=1761645009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPNz7PQsxK/vD4wJS6lZP5itb6jIXQBhqBzv0rdeEmk=;
        b=hrHvhfXU5sIVMDWj9yBFMvHoNJzhUwZ6N46uhCyNOu9vH7arglRlKmjler+aGmZ5Ss
         CXSPLwpk5umSxCByWaQ5WoWGIfZuG7c+b2ZHy74ELt9cURDlgERRJR1/7nTWwbAq/5L5
         1g8BJ9Gl9bf8iv4g57QQwwFp/wRto2l3RjCUUN/fIPp7jrxodYZ8uoe/3vzoRdmpDlLB
         d0pXp7gaAHMbdwhS22fgSqw78l2XwkoFJnP+U0qadpJCnzJLw2R5QvxQpG+rdOXOlOno
         nN8R87DlZJyT7JT3E+/eIfWuUy5OeOQgHEp77ZHXDseHG6Q6rR1KJ1Rw2tKuPc3QPKXW
         RpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbJtmViwbBsQixENjdOJPRcXqZj+G8yWgfG80lWQLpBZos4wYWX1Hj+xBgqU7VUkhNKPiaQjkqmGHO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3yyZIjfwBhaLT6VqUq24wvc82zfc45f8rRoitgeh0wQCjffVk
	F+OwwUs7clbaMDmvPAcFaZhm5JGsoAS0VoUhivtUUW00YUP8Ao42Xvw2EBSAsv6jtgg=
X-Gm-Gg: ASbGncuJ2DFyvpGUUe17YD+ORqwojE7kgQfmu6QRsCiVTDcG848brSsWQU74+mBdDI7
	mBLVcNvVLtFqtik7vU/r8iPI9gqxaOS0ykDwD8nZs7UT/Q9O4EPisW2m+qmVF+z9edIFWAdBvkb
	C/lZzZ1Oym26217hSqCXMp7dpdn6RZsvJ/hGCwvYalPy5JWA9JFP31UN9v3ERqcIWFAT7vgJ/ng
	XDP1axSbYQPn7dFUhu56uWMBWtEneuUdczJiJVtfPQfn91n1Cf3Baca492WB1YVG4O/2HOx+IOU
	+6waktnNy4s7kM+RL1go7miyu855oRVif3O38BqAksnk7Pd+GQj9S5k88XQPXkbexxSQKv9iLUc
	ZDvlDjf8TYe0gZkg/H9zokar+hrxOc/9eJduRk1tEMK/1YfDxJ3o8Ox9270YHHY2JoFqdr86tiS
	kU
X-Google-Smtp-Source: AGHT+IHPGkc/h8Jiiqko8Gw+upkQmqIHT9O+SKimr6c7jtn4O2FqbpYyJAxT0Ch9yDXgoZBek8Pn1g==
X-Received: by 2002:a05:600c:37c7:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-4711790b56emr98878505e9.23.1761040208871;
        Tue, 21 Oct 2025 02:50:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2979:9ff9:6677:97c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471556e1892sm183880295e9.18.2025.10.21.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:50:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] gpio: idio-16: Fix regmap initialization errors
Date: Tue, 21 Oct 2025 11:50:06 +0200
Message-ID: <176104019221.14444.5245953247967826732.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 20 Oct 2025 17:51:43 +0900, William Breathitt Gray wrote:
> The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
> regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
> modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
> utilize regmap caching and thus must set max_register for their
> regmap_config, while gpio-idio-16 requires fixed_direction_output to
> represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
> regressions are provided by this series.
> 
> [...]

Queued for fixes, thanks!

[1/3] gpio: 104-idio-16: Define maximum valid register address offset
      https://git.kernel.org/brgl/linux/c/c4d35e635f3a65aec291a6045cae8c99cede5bba
[2/3] gpio: pci-idio-16: Define maximum valid register address offset
      https://git.kernel.org/brgl/linux/c/d37623132a6347b4ab9e2179eb3f2fa77863c364
[3/3] gpio: idio-16: Define fixed direction of the GPIO lines
      https://git.kernel.org/brgl/linux/c/0d3f95740ced3acb6171cdec8c5bef336b0cabdb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

