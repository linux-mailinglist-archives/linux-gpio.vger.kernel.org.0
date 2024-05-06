Return-Path: <linux-gpio+bounces-6124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 358608BC7F1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 09:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87851F22032
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 07:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B704F88E;
	Mon,  6 May 2024 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzHmiEEb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966348CCD
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978976; cv=none; b=sJdQ7PKN2sWWaqHelts1K1kDvFdSY4kzL5e509t6Ro4yoYFiHkD/oVmgoB8Rnjq1yWYubmCgtGuzmSmRee/766Sp4RcbG8oxbhpAbuwsYxZ1rzHq2fi65K3P3VsGe6giAiLzXx883pUapdQx3AkL6a78ERBZgW1Q45ka7tcEs/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978976; c=relaxed/simple;
	bh=NYKxmjhEK5HSpifkQRGiqKd4CK8jfRZY1uzdIZFdU88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+leiqTh2XKHZf3555UKlHqwryWGZpykfpZq4r6+w516mXMedH0TPLfvdnekGW1pF74RAd+cUHZ8piRR7PQAZ7AF43777repJDcKPjQ4GQ4Yzhw49ZlfYPV9qA9iGdjSL+IkxmLsTjfmgu1TRxVeDTzuKIeeBnP6JzSvk9L+qts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzHmiEEb; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-de5acdb3838so1601764276.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714978974; x=1715583774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujmpE8nsBx9O5Y+yM4N0U/YJzFF1IJ6DtQyuSomEaaM=;
        b=EzHmiEEbcxpBXp4FqDG51xsIlgvuixGjYPj0XQQND//Treg9fdfi8MP5SNJHY1IiM1
         XwPQrNw/uvlbP6Kp9+ir1d0S/KJbIJuWwZN3L7YiNZ6b4cPsjMSoZ3OV9YufQz0ev0Cb
         5/LKoviVaBoHHeb7M5X4VlEcWiO4J/3P5veWm8hT11Ri7TbzD4rr5VSLn8pJI9N3iMz4
         saq1NaVQ9PhG4EI+03keZTb5aQW3vCD/3SoKzybI7BO1979bU7ewoKPqgBvFx/YDIkc6
         hnWkU5FtIYr0viA6jq48Khxf2d1kMW+RP5unA5hgNuwD+TnO2g/Id1l8Uex9GZK7SY6i
         EShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978974; x=1715583774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujmpE8nsBx9O5Y+yM4N0U/YJzFF1IJ6DtQyuSomEaaM=;
        b=ZxgBDmrfhgTE3zdg3MjzWwOqncjaLVT/JkAqt2jsgaS+Xd98/Q6b5x12s47fjIgaNv
         VCR31yTctZZrbtsW09AT6WF3xy6rggRS7VABM1BZE9FwY/jZxrnICEitrXfB5f15NWrq
         X1h3Z8gLwpzUmB+F7hpKjccOTaV6ekHquPKbSe18kPO7EZssr4xLqu+3QwCbVb6GfSt6
         AiDh4tLRGxXJYZ+kPj1WEM0EiuaeeuF0M6wRZ0+tQJAHI5T0/WCFEDZ18CY4wPPMnkKa
         QniFBdOmj9PHXFxADsBL/CMlyIE6wUtzjWS9/ZAPsij4wNmCoVMwO2egoY4nFQPofHZb
         Q+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFtmadAaMlFfDLDf3LQXPYFRXXVYFZc5qE3VD0S73jYuIEQfTGY9SYCwUO6sRaSKkcAxwNlH5p6/oLnJrvWVEo1xpIomG5XtW5rA==
X-Gm-Message-State: AOJu0Yx9YZZLXgKIRQQjieHhQAGFGw08YGn0/IRqzWlmTzaAFcpW8EeL
	R82/jZSwzFZ5JS4qi994YAx232dPFCJYIRvNMP+3erXgBE+/F5K1+j5fMmx0SPyO2dt+GLrnmfB
	awzzcTKG3ZaMY5KtujZ3OYmRd5oDTTqnF6Y1Bxw==
X-Google-Smtp-Source: AGHT+IFFB5t31W/ouKwQvnxFwTxW8YL8qTVyJmgo8B/yHcKDGs+CgIhRR+4Jp98NaMT4Zum4DUBpiT8FCH+8iJTlfFA=
X-Received: by 2002:a05:6902:1509:b0:dda:a608:54bf with SMTP id
 q9-20020a056902150900b00ddaa60854bfmr11521091ybu.56.1714978973691; Mon, 06
 May 2024 00:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424185039.1707812-1-opendmb@gmail.com> <20240424185039.1707812-3-opendmb@gmail.com>
 <CACRpkda4v6Nu8V3MVamDpfs4qnc89e8Vd8fSyaNsqJQ40GQqZg@mail.gmail.com> <45b7742c-9cde-4238-9c2c-c75dfbe9d8f3@gmail.com>
In-Reply-To: <45b7742c-9cde-4238-9c2c-c75dfbe9d8f3@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 09:02:42 +0200
Message-ID: <CACRpkdbW__DuyqoCO=DaFuoyjxa0fnfd-Qb6RC-FNBHYVsiN-g@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: of: support gpio-ranges for multiple gpiochip devices
To: Doug Berger <opendmb@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 10:21=E2=80=AFPM Doug Berger <opendmb@gmail.com> wro=
te:
> On 5/3/2024 1:25 AM, Linus Walleij wrote:

> > It rather looks like you are trying to accomodate the Linux numberspace
> > in the ranges, which it was explicitly designed to avoid.

> The struct gpio_chip documentation in include/linux/gpio/driver.h says:
>
>  > * @offset: when multiple gpio chips belong to the same device this
>  > *    can be used as offset within the device so friendly names can
>  > *    be properly assigned.
>
> It is my understanding that this value represents the offset of a
> gpiochip relative to the GPIO controller device defined by the GPIO
> controller node in device tree. This puts it in the same number space as
> [GPIO controller offset]. I believe it was introduced for the specific
> purpose of translating [GPIO controller offset] values into
> Linux-specific offsets, which is why it is being reused for that purpose
> in this patch.

You're right, I had it confused with .base!

It's because I missed it completely when this new property was added
in 2021.

Sorry for the fuzz.

Yours,
Linus Walleij

