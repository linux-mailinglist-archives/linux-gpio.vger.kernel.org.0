Return-Path: <linux-gpio+bounces-12574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB99BDA0D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 01:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD134B224A7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 00:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D77E653;
	Wed,  6 Nov 2024 00:06:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C361173
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 00:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730851608; cv=none; b=Gj91F/vnyMb81ItNkxE+pyAlsKj2el3Q4EnQOmebMWUwRE8+v85hpuw1OhBeq8P8OhSOTX2oWvZf07PXTK62TfqrS/FnxNGERNecLRazmUXRMLqVIUWhx4/8M2nKkPqxz/e/Tn34lgXYCjXkYQyMFV0xz/0jft/fZMtN00vkK7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730851608; c=relaxed/simple;
	bh=+iJID/0K/KasOwTpLpR4XJKYN4rMSxO66SLic9HxW6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=On8ZF6+O0NtivW0UVNe7U/3JQyYfhLBe6jr76+/gtKz9h5STlzKkY73I/a2uHAVhNsSYA2hFHE5twzi+LX9GGAEc8VGYV98jh0ENDMOKIEpVVKLjdF3wfylG20Fy3Fh2eQu4G1UPpFGZWEuD5uTKnxflfAw3vJesQbdqcY2ljgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so4328249a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2024 16:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730851606; x=1731456406;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gpxbqm68LJQ46p8jy6SSwPvqm4guZpDNWNtKHjTy7tU=;
        b=BU9SPb4rzaGBGlQtE9rR90KwJGDepFXAjaBGEKq+SMOr3arTN6Hn4OEEPUaRZ1Umsq
         /vbuk/PuV8s7sjpAIMGTmfabT1qs2jWro/MJPsORoW41jca0VmwhRfAEqbqCi2/TbQs0
         29JDoJR1guptwElcXONhZVozq3KQ6q9t2QubRDbtjLyXPgh2giomNCaFXJVKQfKaLHpx
         tHa4iGs7Al69jC22oAG8mzqng25yh/h8w2WrIgcEoiCQEK38DbbVwgeL3Xm7IPkqzwAk
         KqfKVCnUl8MrvMtQjH4yS/Zp3k+n1OKoNWxt+aFvm9O3J0B+VEWH+6PPNbXAcfDHoAXB
         q1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVzwQUH0PGmH21gY7em4c5PvyjwIawQuAu7Z2uJ83bW7/bNS/Ol34SKPGoV+MI7SoAK9MwXd9AMBWKC@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0s7puRHWc4RR+lO8wWgTazwUbrscjNPUEvDbT+tXulGtbddP
	BhUwk0zh1rGZmpRS6qwLbOiWRw5zI413A1fLUnnefZr7SnOloob8uSeZhJIUo9c=
X-Google-Smtp-Source: AGHT+IE9eRsulH8cpjXGO7rVfrMbZI2XkHJeWXdq3TUXvQidK4aPFSF5njxwl9FhW4xyLO1oH9euXw==
X-Received: by 2002:a17:90b:5448:b0:2e2:e8a9:a1f with SMTP id 98e67ed59e1d1-2e94c2c30famr26322573a91.13.1730851605690;
        Tue, 05 Nov 2024 16:06:45 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a584e68sm129403a91.32.2024.11.05.16.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 16:06:45 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bin Liu <b-liu@ti.com>, Judith Mendez <jm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
In-Reply-To: <20241105190005.cg6dpeedbirgflqm@iaqt7>
References: <20241031145652.342696-1-jm@ti.com>
 <7h5xp7owmy.fsf@baylibre.com>
 <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com>
 <20241105190005.cg6dpeedbirgflqm@iaqt7>
Date: Tue, 05 Nov 2024 16:06:44 -0800
Message-ID: <7hy11xjkdn.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bin Liu <b-liu@ti.com> writes:

> On Tue, Nov 05, 2024 at 12:47:58PM -0600, Judith Mendez wrote:
>> Hi Kevin,
>> 
>> On 11/1/24 9:29 AM, Kevin Hilman wrote:
>> > Hi Judith,
>> > 
>> > Judith Mendez <jm@ti.com> writes:
>> > 
>> > > From: Bin Liu <b-liu@ti.com>
>> > > 
>> > > Add omap_gpio_disable_irq and omap_gpio_enable_irq
>> > > calls in gpio-omap.
>> > > 
>> > > Currently, kernel cannot disable gpio interrupts in
>> > > case of a irq storm, so add omap_gpio_disable/enable_irq
>> > > so that interrupts can be disabled/enabled.
>> > > 
>> > > Signed-off-by: Bin Liu <b-liu@ti.com>
>> > > [Judith: Add commit message]
>> > > Signed-off-by: Judith Mendez <jm@ti.com>
>> > 
>> > Thanks for this patch.  Can you give a bit more context on the
>> > problem(s) this solves and on which SoCs/platforms it was
>> > developed/validated?
>> 
>> Sorry for the late response. Patch was tested/developed on am335x
>> device BBB, If you feed a PWM signal at 200KHz frequency to
>> GPIO, and execute gpiomon 0 12 &, Linux will be unresponsive
>> even after CTRL+C without these 2 functions in this patch. Once
>> this patch is applied, you can get console back after hitting
>> CTRL+C and then proceed to kill gpiomon.
>
> In addtion to Judith's explanation, when the PWM is applied to a GPIO
> pin, kernel detects the interrupt storm and disables the irq, however,
> without these callbacks, this gpio platform driver doesn't really
> disable the interrupt in the gpio controller, so the interrupt storm is
> still happening and handled by this gpio controller driver then causes
> Linux unresponsive.

Excellent! Thank you both for the detailed explanations.

Kevin

