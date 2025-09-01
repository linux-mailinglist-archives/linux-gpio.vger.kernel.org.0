Return-Path: <linux-gpio+bounces-25293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D9B3DC36
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02BFE3BFA01
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73DA2E0917;
	Mon,  1 Sep 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCxIderr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D024166E
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756714875; cv=none; b=AirtmCHez3wdgdUNzPfi2i8ttW7u8nTUEtcceEbCOEsdAUdZpcZ0ZzF0UT9d5B/g0NZI9l1yH3v0sOOg6wBkdqsZ+8MSmBdvYYNVZ/7xbNwQWMb5HaNCSpWdnGi1abVIC6tIoPKKILeJ+H/v5BzNyjg4GjPXxF3n2NycP/ECt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756714875; c=relaxed/simple;
	bh=doa7boRfZzmeMyQLHEC3XX913QTwfh8FzsRBnVndqFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGWjvhSRZD9+cdRx7wBPA8HqtrW7u8YrezUFuqtN/NzxmlJyVpADV6SY8JVwbkAZeAikaA804WXB/WFJrg/4HceTN+BaqQHmejcQtFtOmuamR19C0HHjvHUq/qxE4Scw7Xr6xVlJ3ALpGfFDnLc5DLlgc5AHeYCs2ZLoFFXKtek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCxIderr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f72452a8eso1677936e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756714872; x=1757319672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtzxvUr8vZxd8BREn+bPHHNBP8tJDJJwcdr3v5pD4CU=;
        b=jCxIderr8GYyJTxNUKUaBQess0VM8IOl53ks3tiRAe5VYM50jBSc/aR0j+tXfY/OTo
         Nq12ng7ecuxw77Rf8QynOnQ4xdC7WNpxvSOks19E8fZPaDG6VQnECRghmo193jzvsXSl
         4FEbbt0LWCH4u16R9ympRnIF26ASHfdsEGgxZeCzl35zPRyx4A1FQS8LSz93zTFnfZ+E
         tOOLz49vZ4AiRX8837W81ZTi6Bgr5xL5PvV7L7vlSd1Xid4yeuxpLuOhLIK0Z3UlCgKt
         tLWFEO5T50n6fnKiZVKKXUhNeFAMhsmIKXQ+lkwPadiO9CIuNuznmpEXBLJgz57Eye+w
         bjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714872; x=1757319672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtzxvUr8vZxd8BREn+bPHHNBP8tJDJJwcdr3v5pD4CU=;
        b=pA5oqf916UoCCUM0s8MdV9J+boCJFWicZqC3ow7f6tO29e8d9UX0H92KEIQn9DOlUj
         oYtf5VtwP5rCcWRzlyBA0FZdRRY1WkdbC1jriF7aog7FHXBoa6EEI65NnqlupG8/lbP3
         QoVxd5RU6G3US3Kb2HmKOLF3J/6zAZdT7tTlayf4jlLrgU/cA6ej6wa98TtVa09kzFtZ
         OHwoRSQbvaG+Rob0OQICblGTo3szAYFsWoaoY2b4IUn8zzZ1X2xdPXOLT+84mv41tkDV
         SDgAiro/ESy3c9kreYw/jpVm6L95zDymIsdLKBikAFDzS0+1dP1XqfkAAyohVSN5fzAK
         7ORA==
X-Forwarded-Encrypted: i=1; AJvYcCWzSw9+OMRgci0Xc9RZTBuze9TIvbkSa+gnOWNIDIdPY+0SvF/4lf7cOi9vM9J3TCV9jpdMwW0v3ePU@vger.kernel.org
X-Gm-Message-State: AOJu0YxBr997SeDf8CKML9qaYMIYepV5tMhnR1oSpJx0dw7JDz63Zo3Y
	JwZCs+5NGReIzvW9S4VC4FL8J07YveCE6bF8loAq5SoeRQyHQd25ndUO3jbXid9QKctauS+gpwX
	T2KUMjbg5zk/YzCAZ3BX+iaHjv9nQfjzkyo7NM0Ag0g==
X-Gm-Gg: ASbGnctvZbdTY9ZSWQ2qW0+D4vBPvGpjdfXJ5GZxefJeWncf1iar5N9smpps5S8n/Ne
	DxXeQ63JYV1vMYPR20kCNd772jScq65PRrSIPjfN43dS/PYOKG5cFphu3u5W1b5CCtPz74bxzQf
	FNzLzT0XxgEUFCqQfR6Xf+zpTloxnwTwxETOq79KBjorFLcWo05TJwZ33gJDT3+dRM0WgopmUzq
	cWBtwGquqs9KUSNzw==
X-Google-Smtp-Source: AGHT+IEaD5coQULhIexfF1mqVXsJQC24MaqrNpPKJTVWeCuhL3ZZFklbo3Bq+zdNZ4cv+ZlQPPiJygTUgUeUbhR6Jvg=
X-Received: by 2002:a05:6512:ba7:b0:55f:68a2:769a with SMTP id
 2adb3069b0e04-55f7094fc5fmr2092828e87.41.1756714871924; Mon, 01 Sep 2025
 01:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 10:21:00 +0200
X-Gm-Features: Ac12FXxXum4wFPneUej-Q8PgTeyjRANYxjsjqL1ILL7wHJ70KeajDhKxosakvEs
Message-ID: <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@bro=
adcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Overall this feels merge class, I am looking over the requirement
series from Bartosz to see if we can merge it all today.

I also looked in a vendor tree for the (by now 6 years old...)
BCMBCA driver, but it appears to be a completely different
beast, requiring some magic 0x21 to be written into a register
to "commit" a pin control change.

Yours,
Linus Walleij

