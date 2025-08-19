Return-Path: <linux-gpio+bounces-24549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCCB2C2E6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E521B6043D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB6D3375DB;
	Tue, 19 Aug 2025 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEBOwid6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E2B322A32
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605802; cv=none; b=t/1pcaM+zaxtNREWJ4hga5ScUvDeXzLLjUY+dpORDJnK5JeibD6BMU5HoibBeBw0ylAZAQ/+QdUUovJUN/QL17s5nc+/8tr/iwpWTxcY9ImJtm3NBn5T8sCuDouICyaBN2/99uYXC2+jpJ12H4BXT9Eu9trYbEXHZQ8SE37txFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605802; c=relaxed/simple;
	bh=AZ7o1pFXuy79shNbYRISLiW+dg67/yXKYIew3DntoxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NewAcsPi31qz7QzneUVcWRWQB2CF/9d9rNOtREIhRLYwT2FzNb+o8bSu1X1YSWhZwF9xkkQK2VnPplAv6LZiyWYVG/DsBnNaCXZWATP34IodwZye2PCdhjSLAjRViKOVF2quUIt4ErNatB/tbV7h52fVTfuSHCKK6BfpoQJhS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEBOwid6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce521f77bso5275459e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605799; x=1756210599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mch0lPw3yHrhu7n4ZdwY7/Px5OZohbQnsGNaNJBBPW4=;
        b=qEBOwid60nPDCNFZzmN7fKGDe0pNupuDkmcYgvLrgoWJnrqD6eg+CHg4GVXxdB6gfM
         K/09Kjpb9TKUg7M4DFecmpcA3ywNZm4XCuW3u66nzi7G6QuDT36eHUBDOaNj98BsMz9w
         /W/cWZ2t0OBlTjtjLoKqMJvUWPTUTH3shvpd4jGe7tcpVmti7i7vKbp1PK3uO9WASHgL
         RSGAAE8njAEc2jXwj/0TxTO5q4Dt2qKCZdKzzDyr1JRLiT3Z4NoTFNUHLu328Ii5c7/i
         gL8rnOrbWQil/7lUB0uhuGMUgOHIc319Dhc6Fq51nDQnyS1c2TMNKrSD4vU2MR3PJ46m
         8j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605799; x=1756210599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mch0lPw3yHrhu7n4ZdwY7/Px5OZohbQnsGNaNJBBPW4=;
        b=wTDGhfN2/6Ap+SnB5cmJYjtFFiGr4HkMOXi4IJGsp1w/gfwxCiAUh7YAVKfK1VTSCC
         BQ7/P8PKaAsfksl9D1jD6PDOC7pVbYm9dgnsZsiiP4e3UVNz5qUD1f/f+n3DeEUpjfDR
         xKDRafovtR2WOkkPlVq2xTndgx/zLyXLSJsdtlTFHPHaGrv3ef1bO0vLL/B+HZDGdiZM
         JsBiWehRXDHDfqhIyebNcHgLcbFV8iyncI31qEDWHMitLMFeVJH7DHQWRiQ7bnb5DZ0P
         VLQw3Hb2zTpx3A32me33JZJSs9/bsTnTJbLY90B9XfhZaB9PxoYyU5wBoA48WKWtE4I2
         ZE/w==
X-Forwarded-Encrypted: i=1; AJvYcCV3XpfPTlzMH5TuEcyXBQVuXoS/QiCZWaD+/rpu5xr07vFS/AZk8okq4mm9ZMfm9kp+VJwcoU5/vuyf@vger.kernel.org
X-Gm-Message-State: AOJu0YyB4WkOqIn4saNp6/WCneniJONo5DpMbWJLiVbRtOnbNzx9MFHf
	HCfMPmFDYDpV/pQTGvitnKt4WH5ou42wiR2eI5q7DpsrL4UDPNlMElsbg7L0Jg84lBuMfiBKSft
	qnEsU5kwOw/ChLsVdFoSv8+7wdTwZaWm5nS9VeYFD31TDjwRWpGzMxPA=
X-Gm-Gg: ASbGnct82gw83U4QfCOKcWR3GhtoyyHUMtM+bvPGlf3gv3igjXBjMKnP8v89fVyL1hP
	/pNsOOhuIPKdVq1eL5/sz5sDIPohFi5tB88WYULGjSMeCm8YIv5Nkem7Fe2xywjv0UpUIxo0cGU
	JIlnwLqj18Wlg39xDnHUQJmiudZfbtwfs/uXWQTyrg9y6Lt3486zh64+sLDGcChQM6uoyj6bFPS
	NHsFb7yf7XJ
X-Google-Smtp-Source: AGHT+IHlQkTdSypEYCk5jHMFsG5gMHOSPP8bqRunKFnkCNT6Avg3FbiQixBffVyonHcFrK3FhreXz91XErM75OILoyc=
X-Received: by 2002:a05:6512:6318:b0:55b:81c4:5f22 with SMTP id
 2adb3069b0e04-55e00852edamr615410e87.47.1755605799241; Tue, 19 Aug 2025
 05:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814183430.3887973-1-superm1@kernel.org>
In-Reply-To: <20250814183430.3887973-1-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:16:28 +0200
X-Gm-Features: Ac12FXwnxcG8BcLpMnqVg15St2VyjeE-JDolWogpEgsUqurEowSU0zWbTKxm_ls
Message-ID: <CACRpkdba9c9FdJoAufRVEKxXRP-kk5QZusiqxmWoY6D-gK9tYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: acpi: Add quirk for ASUS ProArt PX13
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Mika Westerberg <westeri@kernel.org>, 
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>, 
	"open list:GPIO ACPI SUPPORT" <linux-acpi@vger.kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, Amit Chaudhari <amitchaudhari@mac.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 8:34=E2=80=AFPM Mario Limonciello (AMD)
<superm1@kernel.org> wrote:

> The ASUS ProArt PX13 has a spurious wakeup event from the touchpad
> a few moments after entering hardware sleep.  This can be avoided
> by preventing the touchpad from being a wake source.
>
> Add to the wakeup ignore list.
>
> Reported-by: Amit Chaudhari <amitchaudhari@mac.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4482
> Tested-by: Amit Chaudhari <amitchaudhari@mac.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Bartosz is on vacation and this patch series is half-pinctrl so I applied t=
his
and patch 2/2 for pin control fixes.

Yours,
Linus Walleij

