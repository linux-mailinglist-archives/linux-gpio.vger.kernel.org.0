Return-Path: <linux-gpio+bounces-11226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF59099AFA5
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 02:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B76C51C2112E
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 00:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6938BFC;
	Sat, 12 Oct 2024 00:20:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698944C92
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 00:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728692403; cv=none; b=JtNHXQM0f8UBbFeNB4NwGb83QJFLIG1kYDJN/kParU437R8qonpgFR0q8HZ3+qxKmuE2tOb4GKRU7wh6t6elOk/1YHMj9PqsDy/9JAG1U5P3DnddDM9Do8VBJT1ndSocLF2kosAbdLtpi4rqrXguQRb+mMsH6QixByZuwMUkqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728692403; c=relaxed/simple;
	bh=L5PU+USaOpUc4MNOsSFRpBsple5k9TASXKc5I9HuBD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hjj/XbG1a+9Cf5h537d1l704xalWJa/rSLNd+Hlg/+sjVofbORdsGOQ5zpOfNMFs2YhLhI2Qzygl2YQLsoG6P+2A+tOe9GgiuA2S2dMv7uDW1q0oJvWobC2b/lo1yMrHJTbuq0nWkwAT+xY7/1I36tzf+YMtyXDlgQZeOi145F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20bb610be6aso26933345ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 17:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728692401; x=1729297201;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5PU+USaOpUc4MNOsSFRpBsple5k9TASXKc5I9HuBD4=;
        b=OGi4AtNtm//J/e0v0BjBaaCJuc791/qwj1cqlnsF0LMHDpbjLl/RF3Sqd7H2h9XY3l
         h5lBKxVCZlZNLTavYh9vo8NjgWtpka/JCsqZaskpJGmrVF7bEsMeH2sq4Mod+AhCuUFG
         34dFsO7W0zZlVxQ8LBk1MgLzju+FnXl+z85XEE23k2jBvLBiuC4Jc2vzNrhZCSvMb4kJ
         +JQ2yhq3GcnO1Uynl2hAFbIPfJJi+ecl76qt7QuMwotHDNIIj0EXVBlXY8yuUgNgWbXO
         U3LRk3YMorp28Stfigy8GyT8yuvkrySf08YLGOsLt4jFvfWJlBl5o+JGTn/Hm58/Twlu
         5eOg==
X-Forwarded-Encrypted: i=1; AJvYcCVSvu1LdbvOjpqPXklvDYYI5214BXC+fqLXqPU298uYYB1Xv8Je/4u8SH4qtk7Z5M7ylwPJtHHWH9un@vger.kernel.org
X-Gm-Message-State: AOJu0YzwXiB4LhYCQNscH+rxTaOdEZl9ulHOhq5rEiwx5yQQburOIzIF
	PEZREwPrpW5R7ZTEaxb2xI4EvnkXUU4hoLRXV+ULy/xpof/Q+tlBjSi9cODw8UI=
X-Google-Smtp-Source: AGHT+IEs1zl3G4UJRzsFyVV8DcKwya9B8nUep2J3tP9kwAe7FHxNrwhmPuHfj2Ge9TUxqZRjXCuS8w==
X-Received: by 2002:a17:902:d2cf:b0:20b:8325:5a1e with SMTP id d9443c01a7336-20ca169062fmr44133455ad.36.1728692400833;
        Fri, 11 Oct 2024 17:20:00 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad99a0sm29023455ad.8.2024.10.11.17.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 17:20:00 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Judith Mendez <jm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
 linux-serial@vger.kernel.org, Judith Mendez <jm@ti.com>
Subject: Re: [PATCH RESEND 2/2] serial: 8250: omap: Move pm_runtime_get_sync
In-Reply-To: <20241011173356.870883-3-jm@ti.com>
References: <20241011173356.870883-1-jm@ti.com>
 <20241011173356.870883-3-jm@ti.com>
Date: Fri, 11 Oct 2024 17:19:59 -0700
Message-ID: <7h1q0mw4sw.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Judith Mendez <jm@ti.com> writes:

> Currently in omap_8250_shutdown, the dma->rx_running
> flag is set to zero in omap_8250_rx_dma_flush. Next
> pm_runtime_get_sync is called, which is a runtime
> resume call stack which can re-set the flag. When the
> call omap_8250_shutdown returns, the flag is expected
> to be UN-SET, but this is not the case. This is causing
> issues the next time UART is re-opened and omap_8250_rx_dma
> is called. Fix by moving pm_runtime_get_sync before the
> omap_8250_rx_dma_flush.
>
> Signed-off-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Gave this a quick boot test on am335x-boneblack and am57xx-beagle-x15.

I realize that doesn't really test the DMA paths involved here, but at
least it doesn't break basic boot to serial console, and the change
looks coorect.

Thanks for sending a fix for this.

Kevin

