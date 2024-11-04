Return-Path: <linux-gpio+bounces-12492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59B9BAD74
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 08:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0960F1C2097F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 07:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64AB19A297;
	Mon,  4 Nov 2024 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RYzRsKHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E97818C028
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706701; cv=none; b=RJ6jtRvke5lA0Ya3+Uu154yD9LFjJ0+SzBivNshSWE+WGVRHpHPHB8J8BmXu3sDnKfkveNnVzwOnrngAt8jC8/ltx0rBwwezu6iy/qgWEtSax2VcdvADvFRpCBPKKjuAEeEeczg2Ur9ZXKkZFdstzx/7437wajUZo3a+ytxf7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706701; c=relaxed/simple;
	bh=bBGXpkxQq9WwlvLIylvI4CcKW8asZCBB2u6tYpzX074=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/6YkSQLEwAyTkHi/i5+aT48/idMPCLo8LQbAcVpnD6e7a35XL5EEd0hdc8mTZS7ngr+nVWNF/W+jJ2v2T3j7INeO5T7ol6RMblXaVNxwG99g0G/l3R9QWyT9xRAnNcaRynCtOnrdmopqlKbzIkXAPZcN7xGxMUHs1f74T7mAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RYzRsKHL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so33472235e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2024 23:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730706697; x=1731311497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoHoUe/n0ru6RnR0s9GjYaOv8P/qZ8/wVvXDim9+54g=;
        b=RYzRsKHLuHWouVtoT2MWj/WlrwlThtOsYPgEezXwvy75/wPPw683M83s4CpmxwlxF6
         aivBqTsYzHjVY68jTVEcruaysC3ACnvhYEF/BSpD5szQHJeak2WPMu/Vfi3ekLS7TiJz
         2F31taCJZ2dwKSiyYObtqJwktM5MnaPZk8T4S+xMahD9D1+TWwFHqFtSoG2juwAgsPrA
         UeEHqUB9z7fyUPYZrGV5RiHmsXcUsCBy8t7rPyAMv61FeO7cp8R4LPXfXxYrCOXVJW6V
         8R/qMu5yvkuRVm5ePCrLMH3JCk2DoV5AW5fRBJRZvco3lXKYLcknpIjqIOnDZ0yeVPGq
         m+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706697; x=1731311497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoHoUe/n0ru6RnR0s9GjYaOv8P/qZ8/wVvXDim9+54g=;
        b=FRl61PJT4bphTDru7dJtU4orlykUd0tn+ZSmbrz/pp2ADf/YhLOvZf2j2+7F857sLA
         RArrw5x2IubetUq5jiTwkaMOcQ9ICDYCc5aY3CLPf2aynwlPl9TTuIuNa6UrXoYpdXb8
         P1U+dbrZ47XygHMa82zwbWwG5Ummzqcn1/ihjx6J9scWDJ4O2F2nyAOEYKu9msLE5DJI
         /pf+tRUUARY0Eaj704EgbAfhoA2VfcUGVpYFLA6Pakylxp8c7Xn1tC7L3SWDG8hK7OuF
         OMByoCtI/p8v0NzYYq68hfXZEOUCH64MC8jN0KzbZBrkQQ7rv2XpSJQvZE5M33lH2bR4
         9egg==
X-Forwarded-Encrypted: i=1; AJvYcCUzVrNfDua0MWVbsrT+eRV1erzwJJMJLlxVnfxIkflKBA3xb2IcWIWLBuoUSJ5OioDwhlW2ZrrACax7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdv0MoV0EmsQ2D+JgQVhKBQzh38GSqa0mBgQfOrsqbKIRzyZC
	0pUeRRvqcf6ZqRlFDBS3Nlap7Cm0vA3+akN3vLyKe6IVQjBNuQZ25s8GvsE1jXT9KUztI5NmB8Y
	C
X-Google-Smtp-Source: AGHT+IH9u8iJgfbLJ5vR9M0pvby1ZgK6XMy0sElhN4iol45cul9j18O0oeCBL0jZGJfR0IJxsoeagA==
X-Received: by 2002:a05:600c:35cf:b0:431:586e:7e7 with SMTP id 5b1f17b1804b1-43283242c8fmr91040355e9.1.1730706696763;
        Sun, 03 Nov 2024 23:51:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2603:7936:7734:a187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf4e7sm144136235e9.15.2024.11.03.23.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 23:51:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpiolib: fix debugfs newline separators
Date: Mon,  4 Nov 2024 08:51:34 +0100
Message-ID: <173070668557.8706.8349521309370832069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028125000.24051-1-johan+linaro@kernel.org>
References: <20241028125000.24051-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Oct 2024 13:49:57 +0100, Johan Hovold wrote:
> I've noticed this before on some systems but never got around to looking
> into why the gpio debugfs newline separators are sometimes missing.
> 
> On recent Qualcomm machines with 10+ gpio chips this can get really
> annoying when a third of the separators are missing (e.g. when verifying
> pin settings). Hence the CC stable tag.
> 
> [...]

Applied, thanks!

[3/3] gpiolib: clean up debugfs separator handling
      commit: b9b7e4a67de1c9d40138f89e86c92ee72e631f47

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

