Return-Path: <linux-gpio+bounces-20850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F792ACA020
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 20:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DC01173252
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 18:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B535722B8C1;
	Sun,  1 Jun 2025 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHmRVDnE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FA18A6C1
	for <linux-gpio@vger.kernel.org>; Sun,  1 Jun 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804187; cv=none; b=NCKVaknGkRSlQRLZWraaswp8hTmRys3lPVKvHZjtuG3Aeh/iwNIaDqUzZADHhzTNF+2YvlYa4I6jt24vdkF+UYTqAYF9tsCkGfkiGYHlTLa2NEYTzYaJ/iq6uvnUAJ99i3mD7a8KCc08eDFBiA3e9GbPhyidtQ9LPbZNp60U33Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804187; c=relaxed/simple;
	bh=yKnYzLcAwbSM+H0DAr4L+rSEPNniOcTWOxLYiYmCBtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8iEkM0wqMrCUCLAITLUOYYeddWLFnyNuojHjQ5DE4IpZmZ8/ERggn0/qB6dAQ5rCL1vncE/8ZA2QGt32Dj50Pz3rKHIMcfiCcrT6xxPSC4cDlOftC3XQXZeEUqNs+M9G9/THIjQTEg2m4t7g4QRPLuDKNqg9Z7k7ROWZGXUw/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHmRVDnE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso31760221fa.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 Jun 2025 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748804184; x=1749408984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKnYzLcAwbSM+H0DAr4L+rSEPNniOcTWOxLYiYmCBtw=;
        b=KHmRVDnE5BFNv6flLMNgKKB2PfKVdpnBOFP4NbIHyu0KPRCtrUIHHfvGX0shCoJ/ke
         UflGVBH/T8rPJpFK8OQVp9lVz2bbhSeNlI6Sr74SgPOjSv5tCNtiMUoE9It7eAf7ZjVu
         cIm633vgQkiOR8B0Qf0cN/YSb4+FCulV4JFJx5eGaMPiPI4dfcqBg9/qM1u551wtnwfI
         /fZxBeQeuDvJ4vS3pvYAPVxXbDJTr19TVhBe3PZGZRAAreLiwIAXRw8njdWMo7VNMJgu
         gylEKz/4B3Ei9OMztM6GafDf3ZSwfVO0XaUWRoaZ6O3wDarmKmo5B/I7R/UEzzaMO93a
         4aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804184; x=1749408984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKnYzLcAwbSM+H0DAr4L+rSEPNniOcTWOxLYiYmCBtw=;
        b=qNtuEiNt/6fxdsVjGV4ag9tNqN5PwV0RhNG/LT4q+sUbsp8QxtDQqqZb8Vu89tcKC8
         sAfd/j4Trl0JVT6xr+zYPqdOeZ6nYL5QKcLOuF4dWHGfExqKxpmLxm4+rdV6+9xXfAiy
         L5m1l89jjpFfkRGESDFU1vxUyzpRGiaus9VB3Mx/62MAPvQRCc/pmV9PnWPEPoXgaQG1
         JjRTzAwTFrjCZwJZDOZTNZrLhTiATHxg1gOH4yJiWkyNC3faKZ73sUt4xlhfhlZimznr
         uUbSyMTVxZ8jgqstdWCRliL+ecLbtiKVNLMYzeZPYVkEQvn5wXAYPLQ5vU8uJBnqOyk+
         oG9g==
X-Gm-Message-State: AOJu0YwJPRWUKCS5K+hjyPzqOEizAv0f3LqcO2Aebd/pn49aa6nzXcNU
	sDduuklh+jcXiOkCOV/QEZpafus3AwMms97/N7P0C9B29suAe+aYW13Fk5uL9AKgMmNwAR/fMfb
	P7fUhI0hZI/4uvIWfdE9H5ZtEcORa7pfeAiMGa5xXlazt1j/X9AbT
X-Gm-Gg: ASbGncsVBl8C+H7lGiKG6+F1OIXSRp0luImULCMle4NeGD0E8WdHkLA/qrCPzVzDKIa
	210gnJRpyTOdc3YM8eEjU631vlFPbdBMqKGTzAzqXR9fjuXq+nCiIu6dyemFCtviP5Tr7D9lEeG
	KzkeMhTntvk2kVjUbxiZOedK2ph6ZYZARD
X-Google-Smtp-Source: AGHT+IHWugAFf+Ripj3VUOZJLnmt498bht889QVB6ArTYpEoG3QYd+TfDIDQfLIYoH9of2fvyyRVVS47ydzCrnVNivA=
X-Received: by 2002:a05:651c:1441:b0:32a:8591:66a0 with SMTP id
 38308e7fff4ca-32a8cd2ea22mr42333001fa.1.1748804183642; Sun, 01 Jun 2025
 11:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527111353.71540-1-brgl@bgdev.pl>
In-Reply-To: <20250527111353.71540-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 Jun 2025 20:56:12 +0200
X-Gm-Features: AX0GCFsnhGQ89VhgXgySprlvtnrpAVgiC01-8pycRScH7HJ4gi-FEvnTKbvX_3k
Message-ID: <CACRpkda5UOqav7Ew-UJ4zPH6xpmrDNg4GmHawKfNr8Cf2rJANA@mail.gmail.com>
Subject: Re: [PATCH] gpio: TODO: add a task for removing MMIO-specific fields
 from gpio_chip
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 1:14=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently for CONFIG_GPIO_GENERIC=3Dy each struct gpio_chip object
> contains the fields relevant only for gpio-mmio users. It's not an
> insignificant number either as it's several pointers and integers.
>
> It makes sense to remove these fields from struct gpio_chip into a
> dedicated structure but this is not trivial due to how the bgpio_init()
> function is implemented.
>
> Add a task for tracking this rework.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That's a good TODO.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

