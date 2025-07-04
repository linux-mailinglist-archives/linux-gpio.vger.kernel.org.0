Return-Path: <linux-gpio+bounces-22787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C84AF8B52
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78AD1699B0
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F44302CCF;
	Fri,  4 Jul 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZR2yBu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4713B302CBC
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616400; cv=none; b=UL+PflvZa0Z77jjyeSw7nuof0gcFL8DOfsKwYk/xnfp5dvxEQSTUUQ99H7tUF8A2GKItaS70pAZLj6qx66WobqLoyNo6nCJE6ZjMjZ7IiEFqxnoc12NAfz1H785Kg/55iDZ/4zzbsGgZYjwqRzvhfmp51pWLzn4iCOSSp/vYPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616400; c=relaxed/simple;
	bh=haPM5d9nRm0BfnEGI9y7TX96tZOk0od7CXgU7Gv9538=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJVKLzXcIFpp+hn69hDm9Ew0E6mqlOl2ufV7A0N0MnQe5HbLwZZczyaWusk/Rh98GyM1abp4Q5RytLJuolvMP/j5C9NiN1DZI6KGgbSXKni1WQHm/ytoqDzlGxOw+BX+ygQ73ejADm8JlKJZDaZsVVr47smug9bXtv+fMJt8KEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZR2yBu8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5551a770828so690997e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616395; x=1752221195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haPM5d9nRm0BfnEGI9y7TX96tZOk0od7CXgU7Gv9538=;
        b=fZR2yBu8qhWQr3O/5yFWEsVW6Ibch76DHawY+AK5C7y/xRC+UWca64kd0WDcJmbXGM
         ik0UOwJXWfUn8CAQZZ+ZvyH705VMREmrwglBwKp07XooY/+nPn5R/pNwzSWX59ncjUuD
         chBWN4xDLyF7geJv8kttxKF/eZIe1fNBVI+V/nZ7wdnqfSa5/+6od6Eu//svFQdQaUP0
         oufkjrFtcBHSAOiDDFAqgVVQjurAAJnGEr18uF8aOxXMqe1zXQU69vm3OK9YEXUQG3QR
         HxXgX8p7QnPdYBi56cr3y9S/JcbWrF6s7Za0ZwSeGV1IvXKBxr2q/nVvV4rYhSr87Abm
         FBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616395; x=1752221195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haPM5d9nRm0BfnEGI9y7TX96tZOk0od7CXgU7Gv9538=;
        b=PfB9gcRc96xYAWoeAWaFDfDaW/+mXZPamo79yBu0YzTUjKVnUBN07L4gJI0u17qTVh
         +wCkhhmhcm3nNfgk58rwtvwOCvEvU+0KFJfRsXXxBRvXoUBjRmZOvYS2ktJz3SMHc/Ig
         YlixwLRUQxjJCT9nv3kdo4fA+EPQ7e2CZ7n4xQlO5hxt4LOv/3gtrX75zOjIacCQxb0f
         67NWtHtQhll6P4b+lk/kciWaVT3YNZoYNP2eON4BFSd/MVPY2iSNhzqrSRHreSz4ALVE
         jVm7T4O6jpCw9fY29OEqOlklUoiAb/2IKK0mEopJMr74myKs4mlKSgcRe4QhhHTYKZFV
         TYDA==
X-Forwarded-Encrypted: i=1; AJvYcCVVoAuiBmxftbuw8R0tA5RVLm6FrI25uMedKeoHhy2EAaGeUHOLge4w7h2sf7FIyYVsREw7xjGMgOzN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzno8+gOIWCKRT4PwJ006XCPckJDnu3Bp8utWVt295YdNrq7RzG
	gydpKC3L9DuZGM1QYv75WmawoIoaHuAm+KYh0N9AqlETd0luc58fos647CIpusCzx2d51+ELH5r
	S6KkMTI7CH8goqzT/zdJQzY3cLmEfKJlr+rt//W+Ceg==
X-Gm-Gg: ASbGncvnVX6F2JHhSRjvPMdBa2q4blfeMrkAk52lWAjqiwhLlwQlZli7nba6dCo5vlH
	m5YySMHdnmpMM6IFp8yW00nIcsGOo6NGwuRM3ZNHxzXPy9MXJPJFhw/5qQq59jCTEqmSfV18nu4
	xp/58sPd5kcvWJknhP0fVNX9fho210iRdp8uan5lNo6xA=
X-Google-Smtp-Source: AGHT+IGC1fZ7WIxGc1PZ1zqnEHx/TJQOH6gUMEBs/+CoI3+/ybWH75w6tyx4y7Q8INDVFcOmggBTnADBF++JnbcaNGY=
X-Received: by 2002:a05:6512:2353:b0:553:d122:f904 with SMTP id
 2adb3069b0e04-556e7db8361mr376377e87.23.1751616395273; Fri, 04 Jul 2025
 01:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-8-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-8-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:06:23 +0200
X-Gm-Features: Ac12FXya2RnPkR9ZwCspK7Y7sPSs3R6LeMQXGe9usMIglLbpx0bxESo_7ca8_PQ
Message-ID: <CACRpkdY-Y1c9-YTqM+xEwkWqU_uhQOPL8mmuLeJSmYy=OjAs0w@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] gpio: sysfs: export the GPIO directory locally
 in the gpiochip<id> directory
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As a way to allow the user-space to stop referring to GPIOs by their
> global numbers, introduce a parallel group of line attributes for
> exported GPIO that live inside the GPIO chip class device and are
> referred to by their HW offset within their parent chip.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

