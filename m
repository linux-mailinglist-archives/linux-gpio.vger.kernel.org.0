Return-Path: <linux-gpio+bounces-26436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B2EB8E53D
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 22:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF1F3BEB0E
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 20:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC88228CF5F;
	Sun, 21 Sep 2025 20:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4eB9xT7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11232367D1
	for <linux-gpio@vger.kernel.org>; Sun, 21 Sep 2025 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758486392; cv=none; b=LWCQcykjXa7k5oJj3jRmv7r46yOmT4xF2ZC+JcD/GUf/kJtWe6LSJelEzEvmlEHZ+u4Gw+DThVnVPWGRpqLj7uRdmHNQ/9F75mhDh0jPnOSW4qXrMY2gDYVIHQC9qiEjz7Yg3h8EcNLeneoeOYrGEI2CWAHW3u7P+Hi8w1AQ2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758486392; c=relaxed/simple;
	bh=gka5bKFW2cHv0ZLSZ7B/QH8eA3YDoxbmOhwKKVhGU40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhGPpH9tW03UWgfiHtnLz1Y0fLK961RKLmmKPgIRGHTG3ZS/yYMBalFL+SDwdHRLbHBX+wdkZaOyaf1KsGox9ALb1j4NkLg3DWndC5m5cit0t8MGt4yj9KgHVRpe33XrKWN6VtMw+C2DaZt9RR9AsCagnpjGkWMox54WrVU7UNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4eB9xT7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0787fdb137so559917966b.0
        for <linux-gpio@vger.kernel.org>; Sun, 21 Sep 2025 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758486389; x=1759091189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w1uUC+fzd5RSRP1ifN1bHpVu6vu0MYSCszxUPTV56A=;
        b=c4eB9xT7FVW3MmNDaExO5Zn7IcBZiagj3xMoby9q9msP1t7RoxWNR8q51VuR3SvEVq
         PM9G6qxxc7BK+EGwwPtts9aSr5Ft6ZlpXjpyA0WI02xBhMwIsM/Un+uTtBGZZsMzJzZ6
         +m0q+L7Ezbv7X2FGNd51E1w5Kt1S7aLXsxeuurceh5LNZlWEo0p14kJp4X2Bk+bMfq35
         sc9W95XF+ugnu7+SoWpnT1t96cBNniv54nOMXQg8RWuR2FCrOfah+oLYBTswcPFgMWZc
         U6pKunY/LtfY3EKx9MCEanadjBlOZEq5wUWj8NJTppvUJknyTcDaGkI7EGe0GtBEx+1q
         jISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758486389; x=1759091189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w1uUC+fzd5RSRP1ifN1bHpVu6vu0MYSCszxUPTV56A=;
        b=laqCWCh9dGrHeZdn24MVRB9TPUm1USHWA0IjaO1Q4yJ8kbmppoNrzCd/kIOG5CbLXV
         7M8gqE+C/bIa407xBU0iNiT1UF2rZljHRC++byj1RpjYIH8JXTly3fxjLDNKWTxA/4we
         X66qb20IxVXzi9WjWBdr5gJiZ2nfi37lYBReJYy9XfjGfufyE5d9roZEsnXm0CQ2zYqq
         3SghVDpMVZOzktEwcAz1PP3rJ3R9UQ+2gA+Z9W1I9fNkRH6cRx7j1FERMB3B9PsU2hrH
         4wY1UtrFL+p4+QcTfXSYmcYOyRTtrBlb0LAlRtv6aaWBdeU6SR+jj4OATd+bvySy+HJr
         I/bg==
X-Forwarded-Encrypted: i=1; AJvYcCWTQ6k2sYEMwTGLMqvX80ABbyNWvgPQ17Qa/q4Zu57tiXD/fTDRJBbTxZK2nUHgiennuMJssvESMkQK@vger.kernel.org
X-Gm-Message-State: AOJu0YyruQhXn0LIyeGsxaB0reihB6XUXfh/usrjD3q1wkqus+Cv2lAo
	M2CEE4GTf1OkXTx39Eeye9ZGK0NBKGoKNjI8KQ/b/k+XMHOhh7TT3qcOiwUlVEbDIvr7qXFHdQ3
	yyBMl6p3cPkhCg4cXAZoE9fs9Zvv5Vtc=
X-Gm-Gg: ASbGncsMd603HQ/OO+I2KYA3/SQxYdpFIJ6oAjgLcjKtvYQ8mXXBvNwuIvx0MexmWfx
	PR396137FAhpuxGxqCLXCmsuURJ2kfUEzJ/RPMAq5S8Dl4k5p1F7xHZV3VcItdJOJw2DPSvzgcN
	FE6/5PNMtDTnDRli/vv72Z1Y08lSsnCNGMNztJ/ReEiqSeKb7/G94RZEuUOVJ+zNd0CnRAgz8XU
	SHKnuY=
X-Google-Smtp-Source: AGHT+IF+x1qG5m/7YpKbUllg6jANfb1pA8Bj2oy/e8nNAFxVGPMtNlfo7K0pnij41IW9pVmeCBnwxf9u27zs5M2RfwE=
X-Received: by 2002:a17:907:741:b0:b0e:cb5a:3dc9 with SMTP id
 a640c23a62f3a-b24ed97e846mr936786966b.8.1758486388984; Sun, 21 Sep 2025
 13:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920201200.20611-1-hansg@kernel.org> <6d9e13e9-1e93-4e39-bfd1-56e4d25c007f@kernel.org>
 <CAHp75Vf-MMcVGDt5xAMB94N866jZROQPKpvu5dZ-nCEPA9j-pg@mail.gmail.com> <f40ab4a5-1b17-4022-9539-37e470b7a175@kernel.org>
In-Reply-To: <f40ab4a5-1b17-4022-9539-37e470b7a175@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 21 Sep 2025 23:25:52 +0300
X-Gm-Features: AS18NWCHxLhQYf5FvuBq3VuISPNUQRlCd8-oqVvlkccsxjdBicCTMbzlcdEWgvE
Message-ID: <CAHp75VfaRcQOLjrd_pVK4XYPRN_4yM=acyVsOKThV3oMw1fB0g@mail.gmail.com>
Subject: Re: [PATCH 6.17 REGRESSION FIX] gpiolib: acpi: Make set debounce
 errors non fatal
To: Hans de Goede <hansg@kernel.org>
Cc: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 11:11=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
> On 21-Sep-25 9:03 PM, Andy Shevchenko wrote:
> > On Sun, Sep 21, 2025 at 9:09=E2=80=AFPM Mario Limonciello (AMD) (kernel=
.org)
> > <superm1@kernel.org> wrote:
> >> On 9/20/2025 3:12 PM, Hans de Goede wrote:

...

> >> Looks pretty much identical now to what I sent in my v3 and that Andy
> >> had requested we change to make it fatal [1].
> >>
> >> Where is this bad GPIO value coming from?  It's in the GpioInt()
> >> declaration?  If so, should the driver actually be supporting this?
> >
> > Since it's in acpi_find_gpio() it's about any GPIO resource type.
> > Sorry, it seems I missed this fact. I was under the impression that v4
> > was done only for the GpioInt() case. With this being said, the
> > GpioIo() should not be fatal (it's already proven by cases in the wild
> > that sometimes given values there are unsupported by HW), but
> > GpioInt() in my opinion needs a justification to become non-fatal.
>
> GpioInt() debounce setting not succeeding already is non fatal in
> the acpi_request_own_gpiod() case, which is used for ACPI events
> (_AEI resources) and that exact use-case is why it was made non-fatal,
> so no this is not only about GpioIo() resources. See commit
> cef0d022f553 ("gpiolib: acpi: Make set-debounce-timeout failures non
> fatal")
>
> IOW we need set debounce failures to be non-fatal for both the GpioIo
> and GpioInt cases and this fix is correct as is.

Okay, since it doesn't change the state of affairs with for
acpi_dev_gpio_irq_wake_get_by(), it's fair enough to get it as is.
Mario, do you agree with Hans' explanations?

> It is very likely too late to fix this *regression* for 6.17.0, please
> queue this up for merging ASAP so that we can get a fix added to 6.17.1


--=20
With Best Regards,
Andy Shevchenko

