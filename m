Return-Path: <linux-gpio+bounces-20019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94396AB4FAC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E52F81B41EA3
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BE7220685;
	Tue, 13 May 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I80yEN1F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81654220696
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128228; cv=none; b=pHJZdEk2kSYXJf+/4wIoBpcO4+KRZ+z7cooG0nSUFaux+1DsUWH0yZTtV2RY1/IbgFinztVWz3i7FmY44MTqaVBvyJo125/X2p4zXfcQc3I0ERtU8tqh/Fqi0tJMEPCscefikYmEmq68DLtnugfaM2jRdSTvylMRpm5OiObAOGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128228; c=relaxed/simple;
	bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJPEb6UiLqbrd6SMe/5TbbUP2GrPSJC+NYljJ08Mg4LeL9Mn2l5pfxEV/pcHOTZQLh87pCWOP6Co93iF+/dSy57yQjXCI0mvk5HDK/7xzEAcyLOkbDEngKWFB3liAs7262v1hUMqUejgkGpIpsLKrsDDlXT7P6VHAnc6pTokO+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I80yEN1F; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso52278401fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128224; x=1747733024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
        b=I80yEN1FiPn+nLZLd9/p+FSh1/UlX+gcdmy3KhA1BC2MNwVa4ngu2xnEUvjmpU3ezq
         pS+xfbg3upBeUaZ3KjM2Gofu5lqIER0GN9zaTPMdFaPgp3zP15ehAKwvWkTT0wJfZy1u
         S3xk+zxw6bA4WDk7yKLoIEluPk200kbnPhtY7V71ZqWyLbYjzMjnPj6uCN7/KGgtJSxF
         NcT57G4eTViY0KGvS5sjRb/z/LpdmtaK+IoeS3Hjq9iBAJtrj+0zSyZXm7XBJvatTOBp
         TmTfJvB81LdTv6X8LjfaS9IkKyT3m4C4yI4yhclBDEVECxi4zf9xYKJ2zppwDkisBno0
         juTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128224; x=1747733024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
        b=BV+Dz2Vla+Ld3dNDrbOyRApjDmuEDQkbNg3V5GEfvVeli+oIHe1cSKDWmSzqsEtDZ6
         bJJYdMg30RGJgkXVn59bA9kX7cOL3GuX97XuKjWI/VByVheaE3rTAheGa7PxbPrLjKbm
         LM9VjYPZXUQRecEcRPyEnMYeN8d9ukkbUi/wSoXkveVORSlz5PuGZZbBck3OkdFL6Oe3
         Ohodhv3d7GBpbxfJlemgcC08JnK7JctPJ6TAmAvoUf3vyYri1giqMsyGNQMs8aJXi9EE
         TsswNcRO5pYYgxza6yrb1hdzOf/iGol8HCyJlKxsDpOlNldxzPOH/6TdOtJLA+0zuYF8
         JZWA==
X-Forwarded-Encrypted: i=1; AJvYcCWpQXvj/YG3JtlsQHa/wt5GBcI2ACj5hclMYFFSW+vgsQoxYF6e+8GnFHFVBRbLUv3e+JfHsIGvbjQx@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKK8Sx0m0cJofkjbXGG9ZyxzzPwm7rCUmgEf9HpUU1Gwq20dm
	B28mUL3C5c5nk4FmAQ/NDxMv5lWWEGXWO/557kuI1tLRCTEtoVs59zAjb1czft2k8WrDHU6HOWx
	EzE8IDDF2WjMbGa8naVLK5PXe0gKd/BpYbbJ1Ew==
X-Gm-Gg: ASbGncs5t0aVjG7qwU+BBzX/mBpmjgoM377n9H777oUMdsoCN7qF0XS0GQxuvZejaFf
	JLvOV+4NjrG91qLXZoVy4fYaBpggXgf33lRsl+EeFHpBsIuipIJfo6rSvxzAyBzEWANv275S6mS
	J2Q/z3OM6uWrTxBJ45zcVYhjXkcjh1hqs4zahE1oPy598=
X-Google-Smtp-Source: AGHT+IE9sGnGDBaDyOnYm93k9UkhcaHZ8PfclbuY4E3mgnB6Q8BTRsZWrBuS2rmfUo74klAfDLhA1ZQzmF+YltCFggc=
X-Received: by 2002:a2e:ad10:0:b0:30d:895d:2fa5 with SMTP id
 38308e7fff4ca-326c457bbb7mr53536871fa.14.1747128224539; Tue, 13 May 2025
 02:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:23:33 +0200
X-Gm-Features: AX0GCFt9vVmetkirZ6Xw9vmZM_a30I_l4q58kXaT1ovnCBgyKNlng_Y20L--BQ4
Message-ID: <CACRpkdZjGNxjhgC4X+e4GsMpc8qphFkHAdSvmXg-ttrVJgN-UQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using
 new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

