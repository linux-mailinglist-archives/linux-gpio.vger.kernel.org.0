Return-Path: <linux-gpio+bounces-24305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50035B22970
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 15:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD671BC48B1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7812820B6;
	Tue, 12 Aug 2025 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sxvwzJEx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EE280A2C
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006126; cv=none; b=YBwjfo1AP0p3I4hB+goJINnCteWsrwjlDxiLk7kVRzxP4vGBTnQO3E1oZDv7FQsGf34ZVKGROB47+XJNiYenBZ485bQHY/DV6rUCZ0lLjChkNfvSS8tcfbi23crS7mCbrPdk7PWuFAEsEK81SsCOgpzhNfDNh2bdholaqhzEGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006126; c=relaxed/simple;
	bh=oa7rJuYPUogPuSxaDRvZAN1fyLFuPuWwWOOFmAdB4fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRYUAcFhT0osREOkrelClzmXtVqxqx+4mYsIWgnFRDlVUFuAX+UwL1rrW5VL1pdJQ7QtwN6+w/ibac4+Qn4bgRuVmbc3dCd2Utpj+fWuWQcIK0dNGDOp2X5nE36rljt8D4+z7xvGKvsLBIZC94+MA91HrT+muPyTNmVOUcYQ7Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sxvwzJEx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso36511395e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755006122; x=1755610922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSZ1PCEGP3pi/OH/Xi1V3U6pclhEz8nu1z3XblBVYXE=;
        b=sxvwzJEx8CzTLmv6f64zNL/RHMjEDdFxbddOXOXx4AExV4hMW7nv9aN7lrq0Gf9hWg
         r6TEcE2xTs/7hsggR/qYNbDVYZl1etkuW/8/72GTb0zeOn41I282ND5Qf3ySa3gYW6+1
         /RZBbC0whORl21c8FmvSlc3VFsZA4fp/6W4glTzsouO0VxAD5ViAi/SAxwp7lIsBOXay
         S4iYRT1ATbeSS1ZCzucR67pIHOJhzufrwAp64LbQ/IEyERTgOS/yNhVhUbii8EA/LUoZ
         mPHCToremv/+eGb8AFDZAftdB4B4wApjZMbEtR/8jXLor8HXjzUMskIMk/baYxz7tzDE
         whFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006122; x=1755610922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSZ1PCEGP3pi/OH/Xi1V3U6pclhEz8nu1z3XblBVYXE=;
        b=HL9LbCb4j+2k5wst1vs0HWgR4totjcBbk+q4tzwe9D0ZF2WkuT2j3nMXtDKNevxe9c
         8B8V/9icuSo7LGghVP91O6/E4oGovPYr744L6nRN8Rilfc/LIM0WDC9nrMp7bl3EU6wo
         1EL6JSVGalOwB+NLZVjV0s7N4FcOUH4YQrBW67sqRBt2Vz1PaIWofD//l/l+NjGOWA9k
         pQ6wjAi7cxltnGqrdCERWgfNQ/NOWg59YBroUe5OtoyQEt2LhWnAPTUZ5U/yKdyDUJN/
         2R9hBdSVO87LCSv6B80xm+psMLU685E9FllDeTTqeLGDDSWTRlNoP+7peW0OxUVeMfow
         2OBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJeL/2JYnnraIDQHp2WdIW1yQIOJp9pYmM8tIoQ0kdP+RQKjyj+a8BZaUlBOcdZ2oTs0CPLS4UG6ul@vger.kernel.org
X-Gm-Message-State: AOJu0YzbURDnZz19ycTOgaFo5ApAo+lxbsSfC28WhLW8B7GHI5peGagD
	UiZjXpCVXf+IL8+mZmLGraLvB9/ZNC/G5q7JCyoH3mX3x08+gx5o4s7jEajSphy/6fs=
X-Gm-Gg: ASbGnctLFnEKsYuovzltumni9st3K0Ssg4eul80C2qgCcYlp9adlwMK73cFehEAfJgl
	ngNP//q8AWIkIwu/rS6YH+WX/HSvJ9z8Iu1fFIqFAo6ZEk/LNYATNW3ACPcGjhzXQ57sTqD2ZyX
	GMJZc/HbHsQXuWDeDkXhdhwvYVNjsD15NCpUFQ2luEqhLssccqG6vHciVUnVIzQ95Rg7tQ9FeWq
	MJ8MhShSqKTfkPZzHSqAzsORHCjHkLUo+ktNUbh7ZyWZCHa6gzyCiFXNjOjh9eWGZfJ6ZtGCar2
	3+4bv9OSt4SSFlMkF1m925GBSqmzGCRXsHGagLqjpYuGUlztcsOeN8GafRVEM5JPdNW2xR0rWlb
	YJsyeAdCm1BCljGNL5+tw3w==
X-Google-Smtp-Source: AGHT+IEzn9A/H9lqrdqywd6oI5H1wCRV0u4fShJthX9iNne30DDuIMBEWGX7dCZuB0wcfBMPlkvGFw==
X-Received: by 2002:a05:600c:1f0e:b0:458:c045:ee99 with SMTP id 5b1f17b1804b1-45a10c0f75cmr28749465e9.28.1755006122265;
        Tue, 12 Aug 2025 06:42:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e585586esm318545615e9.13.2025.08.12.06.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:42:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	David Thompson <davthompson@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] gpio: mlxbf3: revert device name logic
Date: Tue, 12 Aug 2025 15:42:00 +0200
Message-ID: <175500610764.300642.9569950085828730672.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754928650.git.davthompson@nvidia.com>
References: <cover.1754928650.git.davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 11 Aug 2025 13:50:43 -0400, David Thompson wrote:
> This series reverts the use of device name processing
> in the BlueField-3 GPIO driver "probe()".  Instead, the
> kernel API "platform_get_irq_optional()" should be used
> to prevent errors being logged.
> 
> David Thompson (2):
>   Revert "gpio: mlxbf3: only get IRQ for device instance 0"
>   gpio: mlxbf3: use platform_get_irq_optional()
> 
> [...]

Applied, thanks!

[1/2] Revert "gpio: mlxbf3: only get IRQ for device instance 0"
      https://git.kernel.org/brgl/linux/c/56bdf7270ff4f870e2d4bfacdc00161e766dba2d
[2/2] gpio: mlxbf3: use platform_get_irq_optional()
      https://git.kernel.org/brgl/linux/c/810bd9066fb1871b8a9528f31f2fdbf2a8b73bf2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

