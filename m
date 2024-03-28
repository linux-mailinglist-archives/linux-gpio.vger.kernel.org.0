Return-Path: <linux-gpio+bounces-4806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 459BF890CD1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 23:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D91F21F2498A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 22:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B739013B5B9;
	Thu, 28 Mar 2024 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgrPeAsG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8AE13B29F
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663233; cv=none; b=dA6znkWKmainTiH6urBTSsMHqw9+Lx75I9oBh//2enKOGSrNqiRfUzixiT6BCgHSXRrABpQlxUs9XbinT6KMva616GJY0JEzy1F+E0bWEVhPaO8d5ZvcM9ITAOoaMEH4xdT2bneqttG0lexLVhCZHBnsZNNPVHD/18v/nDBCDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663233; c=relaxed/simple;
	bh=/5ShKS2I5HOZ+M86MaNNhos7tZdJ6tALgsSh5kaTARo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lf+CG2i9KQDCMcL+c36y71AjPCpXeaJnV6JNlrJrUMV53VvjwrXiKDLLdj+2XRKI8FibdO5d47Y9cPAC4myisLrA20Q+TT2XwUuZpS5GiCY8aw2AH8/ecjj/9X58iFnRiK18J9EeQMp5VKTkn8B6iezMoVTzRdvGLnkR3iSzBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hgrPeAsG; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1086345276.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 15:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711663231; x=1712268031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8LWmQEfer8ejO45BikMeQB8+xHEa60SulCja1mzY/U=;
        b=hgrPeAsGBtKkIDCkCtXMhYSeQfSqQ8Eu+H7YAAWg/Fyk5izhGNcvnLAftmN74pjalC
         qcyn4k7s5npVGrhdJKJ4A8/nqTaZ6tC6iYWktDmvcuupRTdgtOzGUuTCfWW+Nq5YTNi+
         bqekqUycBuwfNrvz130lIup8ghXdIYsTZGz8JnX9qtGkqc+kMrJ9z+ojDWZHDAi0xMeX
         iExNkRv/GFIDHPoJdvPbcCxwPXQAhZDEJtt2CO3uS9HPTql4SpUutETMmLrI00yx5OiS
         SKB1WSi5LFxhUj/sTLweNQ/KJ9O1IyYzys7Ez6IuOtP1ygfvvX8gohcEHGl1RVigwVW5
         Ssrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663231; x=1712268031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8LWmQEfer8ejO45BikMeQB8+xHEa60SulCja1mzY/U=;
        b=psgkWVv0y9UL8BYmNlOp20HA4NeKdgSwAGWKp3CpzJbOT1gyPBPELGLik/Jik7g6R4
         5RxvzmMfjrpxKu+Lm+GFQDGSw1tRlBAR9h0c7l4Z71HhiDSM6/jifG5z9nFmB6IHTVU+
         dqG/uoh1C77B8rBO/fi1Xt27DybaI9XJX/63Muu1QVteT6IxKQ+DyejBGTVoPT6Lvwyg
         oTxqsARTJDAhEmRDLH3lruHErz96ADrNcIJsXqK6aMzjm9MZL6reqLZqDSVQBw7+m5F0
         L7KiEozQrXRet8zinaCC0swe/5rCvGg3OALXHBdR7PvLWOp7hOAV/o03sF+st2qJQFOo
         gzUA==
X-Forwarded-Encrypted: i=1; AJvYcCXsy0f04EUDj+eavOzlBLlvPASdhwL/ecfmE/LjyTV6l1yrZqCx+2g4idFa01Hjh032tv7swZDoMvmUYaAYMwNJsL64Gc/3TMWchg==
X-Gm-Message-State: AOJu0YwUtd0KEEvYCxX9bUKX4PUfGSi6UBjqWYenJXw9aQfg+fQhmdXr
	Ut8Qyss1hlW2QhzKfCR29EyqsPqrHwjHQo/g7urzzlxk89blRr73astDQ91SVWj9E0kvy1nWdBv
	X8Gz92n+wNvGTVky9O3ELVpyo96Gczfy6S5apyA==
X-Google-Smtp-Source: AGHT+IFKTlhxo5mhLpmv4Enu6A4flubvBEGa1+sb99OBmJRhBVArCLejpOyDtntLufE/YPSliQ+4VUsczm9MCK+Nfvk=
X-Received: by 2002:a25:1184:0:b0:dcb:fb49:cb93 with SMTP id
 126-20020a251184000000b00dcbfb49cb93mr597178ybr.45.1711663230642; Thu, 28 Mar
 2024 15:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320165930.1182653-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240320165930.1182653-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 23:00:19 +0100
Message-ID: <CACRpkdYkh7EFWehDStQRpB_2pau9qNaM02U1=VBRxC7hsbmSEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Fix debug messaging in gpiod_find_and_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Stephen Boyd <swboyd@chromium.org>, Ferry Toth <ftoth@exalondelft.nl>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 5:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When consolidating GPIO lookups in ACPI code, the debug messaging
> had been reworked that the user may see
>
>   [   13.401147] (NULL device *): using ACPI '\_SB.LEDS.led-0' for '(null=
)' GPIO lookup
>   [   13.401378] gpio gpiochip0: Persistence not supported for GPIO 40
>   [   13.401402] gpio-40 (?): no flags found for (null)
>
> instead of
>
>   [   14.182962] gpio gpiochip0: Persistence not supported for GPIO 40
>   [   14.182994] gpio-40 (?): no flags found for gpios
>
> The '(null)' parts are less informative and likely scare the users.
> Replace them by '(default)' which can point out to the default connection
> IDs, such as 'gpios'.
>
> While at it, amend other places where con_id is used in the messages.
>
> Reported-by: Ferry Toth <ftoth@exalondelft.nl>
> Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

