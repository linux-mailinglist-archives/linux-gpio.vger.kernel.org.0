Return-Path: <linux-gpio+bounces-19822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD51AB0C99
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4190B1898A20
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F74272E44;
	Fri,  9 May 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tr9h3Lnw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708DA26A090
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777992; cv=none; b=EOfyxco+rVthV7M9bZVAruj5ipJ70cmgJ0pZoHR6o+zoRroldE4vH0Y19aGEKWF86QL1ZrPcjv4gV+BGq3NONAjV09EpF33p8Ry3aouuywJ9Of9fZeZWG1HGGPx+WWC+YMmBolgAzDirENT5gv4/MOABdf+Gb4q13KnrrVOEu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777992; c=relaxed/simple;
	bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izuL3ukJJBbhItL++Wq1+5sIXc98iPtKNZLG72z+NE4X4SgD5kZh+i6oZ5prYerQfSEmWyYafCrCRJtju872m6IE6HrzdHFZeAEgDf3oMi1QXjTHgLdtm3wdbzT0Bg+uk0mTX8bLM21EqQLpA7AQIGOiJxkQSkPwwDJn5oEZZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tr9h3Lnw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso60690e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777988; x=1747382788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
        b=Tr9h3LnwHQFDj6CAjC70dFBJAKj/pon5qK9zjvhHG4Dwvwu5DxEXzmLf6ZpR/rxVkd
         jngebgO7GMMJu6QeunF6/lvNhIlauNGvGVEGWlRRt0MKJtGOFybkS8JBSy3NyN6fXSvX
         F8TeJoZdrbHhJl7PJzPXMo5hhLFl4A/wN/Z1db+Oo5jDMPrwp+WeK0XCjG/tiyh4ck0O
         18FjyQVygEMwmoo61DVZXFGoH18CcojuXUX+Q0BBurHsTJrkWHAsUAFbiASTE5dgFLII
         6KKfXtdQWq1IlpAWw5oKRkYJfgi2hoV6gVL64bFXhOgl+2EBiOOn8iWXeceQSgCGcO1m
         EaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777988; x=1747382788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
        b=aysGBKn/ex0dUrq4heCQcQfRk2++ccaDsd7zG4aBVlwrHESAsgdf+s9CXWNDUQf0zi
         MbHKHRrU39MADFmOI0fCDH+sovAdojvUyp6JevywLEdy0/fYEAicNGoTKMItIIfsHEre
         7QnAbsXk8KICCi5hZRp/UcDpMeK5p3YJGc8M9VZAIYdEkTt8bXoJlmCbI7VSAcIfLfIA
         dvzZjISWeiJmZKVG3r9U20+/fiK9HVxhMkBrTbNN/6qIxspISIDb0jvApDJGyZ5Jsa8Y
         oB5Dw7OBtxRt9FdI6xohHpFArrr2Fkj1Ydml3ZAzMiSf1lR9inK7fBnJ0VzGvnmKAQqV
         HJnw==
X-Forwarded-Encrypted: i=1; AJvYcCX+/sKBMAAPvx63Ll9PcWMNyblbyNlDYEKCHJybEzWWdgPb39m2rFygj30Q1IE31L3avvBrxsjKviOl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GJ/Jz6XLmVo4ZTFYjtYdkohY3gAuC9+yOzWfdhFlNTVZTp6E
	mpko9fWLTx8ePvvOV5W/aNd6m5Zpp9hQs35Mtd7TEndE4WjLPhvMczgnvgvo1WRsxgCtpoHsKIU
	RSFmMm1IqRag0Wdg3amTynoSQYWMKqtOCz7VinQ==
X-Gm-Gg: ASbGnctBY6RnKw4knSrgA7U8Oh+Tga8mN4fKgY7ivumsY7Nc9p9RHsk4BR0hvRDaBR3
	iothL+QVyHF9QVG4fA18CTVyUwfGSYrxZbdaBWKUzNYOpg2/fEJfAk2DEafEPh7TGlZfhE5CFFB
	YG40Xdwtu9kIfbRYZc9HGxCw==
X-Google-Smtp-Source: AGHT+IF/OaH6tvPTnpWGCU15yq3VtPlZCMuQXSmIR+VYN20W07SffN7TF5F44rEgRUHfgjiVA1uoD+Xl6WIttmOvrl0=
X-Received: by 2002:a05:6512:1382:b0:54f:c31b:aed4 with SMTP id
 2adb3069b0e04-54fc67e3490mr781088e87.48.1746777988424; Fri, 09 May 2025
 01:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:06:16 +0200
X-Gm-Features: ATxdqUFnVH5j_K9bIXCXJ7lpjCcn1ZQxHRcfa3pHCEiiJ5CP7DDqvtQgyMgegYA
Message-ID: <CACRpkdZmePbKDE90WEhLgqPrgN5prSo0K1B4_2zS1i=1Z7zHKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: bcm: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:08=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the broadcom pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 3 patches applied!

Yours,
Linus Walleij

