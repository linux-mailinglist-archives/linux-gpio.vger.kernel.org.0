Return-Path: <linux-gpio+bounces-17599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6EA60E3F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1129A1B609B7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D6D1F3BB6;
	Fri, 14 Mar 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+Nj03o9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886D1F3BAC
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946909; cv=none; b=WGCCya8JEF5QM/secrQTStqBG40srvzw8YQ7j3bp69WylzvFESOELKJtHKqK7QcTfahSLBl9m/xxkBE4Kk1gbEDSDjX6JDRMxTKQJIPa9vgfngHy5M2mWKN9hZina7Jh6+N7/MLuG1ot6fwTkrTok9KA6NEkRgPwsLWouB52p1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946909; c=relaxed/simple;
	bh=Gt/9/LzPfx6RB2Ri4REYVqp1qcpJjg1U1nS59zQ5wMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STifCD6WOs7cyam8RSkHnGYFlAjbCg1sZcxU8ZgcWfqzUVU19mPb7i6Ghy8eNEyJqDDEItCjEbIcoBzG8tHjSlNtJxm4TmqoLvGxz6A7XWVbiDiVHi9gIX/weVfoaZNicGNckdAtO3DToJYQEPvtCkya79cDQhPAzX072ydPlTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u+Nj03o9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfca745c7so18260251fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946905; x=1742551705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt/9/LzPfx6RB2Ri4REYVqp1qcpJjg1U1nS59zQ5wMY=;
        b=u+Nj03o9/G6Q5npypn/X5zXy0HE3LmSGtyjbWd8mdYRJwrtUgqLSPkec4dEGk/ACXL
         ooVyGaQLstHEUyYoMlCEPiIbwqiJkc7qzgG3rjA8vZ/YnO7kXSmmoJLtP6r7G0dcX3OO
         v74t5vheXTEpJbyLqpCBGk6j8eW7cgRBxv8xqQPL5KP83OqMDNpJf38npIpc63XVfEkQ
         z+HWsgdDwvT+plIZ55k7EoNcEEaq44AUxIYeiJ+O5/wU9MdyGNrStIe5r1okuenYV9OS
         tXZE/87lJTJ1IOoO2ra12tfpLsx3CbJWp2p9PrMwF1Grv3lF93Kgm3kzaitBHGnjzFit
         2d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946905; x=1742551705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt/9/LzPfx6RB2Ri4REYVqp1qcpJjg1U1nS59zQ5wMY=;
        b=ccw/t5A9KzQz4amJZMHXMUz33DtmSpsvRXvo84cllo/q+qTFYxNg55ZfN+2AYBPm0U
         1CyClanbUXr462ICax7T6eTNHdaR7D5UvF7KM3Q2y1wkPc61rQ/np93fLkO0rRV+9E8z
         JgtGzKQkHuKK5utq/3Oh4Br9DjT2PvFW34SHMp3OIsfZygUgmqHWlUtbfDGHtERX83KI
         xTkCETN8kmqmQcUjBmIoWAWKD5hwu9gafY5+bVy55BDMuoOFEzaKHG4k7QWULgiaD28i
         QnWXQlswhcpcU0dDjJdTMOVipGymicCdVKZRu4wu66WdLt0Z70kTumrNacalFQGCDY3a
         QAbA==
X-Forwarded-Encrypted: i=1; AJvYcCUTdUfgXKbHILBNrgQ+qAGurE8oEZBEP2SbM/OHMl+WKNrwzDfghP/WG5QzGU9ou6vSMHmPcwz2kUYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtypu9Pjofm7SotMho32ri0Xn5ZfcJtbG1ytUq3G4DLr6RjjDW
	IyCw5VKRhHJfw4ynOEKZl77S/5QIieqSxvnar+8gvE1XHpP6r5mO0ES0RSXnHKWHvFtjHxSWbzM
	cDDD8IPXPS22NBqageahiYVusCYu/5dK60O8Jdg==
X-Gm-Gg: ASbGncszs27yan7Xq327E9yOE7pz8Ndg9CqY82gwqiGbACCVc0PkSPsJsqNcld6eTtX
	ZBB6bfOuxn4vHaquPwrLCoi69jxui3GKwvIikobtRW6SiHd4sS6X0oH1BgOI0YLQBVKxJ1hxbYi
	AUl+vVA7tSrkoFOwMJxLKY7bc=
X-Google-Smtp-Source: AGHT+IHJo15rlSs7Va08NHOofodKMD1H1XNIRjRaa5BY0in+MTDIERdp60qoDZO21fZpfDmKsEUFpvdk8Y2VP5vuLUk=
X-Received: by 2002:a05:6512:b94:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-549c38fbccdmr671564e87.18.1741946904682; Fri, 14 Mar 2025
 03:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1736522006.git.Ryan.Wanner@microchip.com> <821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com>
In-Reply-To: <821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:08:13 +0100
X-Gm-Features: AQ5f1JqSOmT4FHz5UOAsw4lJg3-dP8L_NWpCJ5kNHWtjrkJLgD54yy-3c3bbVqU
Message-ID: <CACRpkdYYeC+2G0u0LYSUjAX_ex7MjWLhEcu7QdNXudj8BEO4PQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 2/3] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
To: Ryan.Wanner@microchip.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	Dharma Balasubiramani <dharma.b@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 5:03=E2=80=AFPM <Ryan.Wanner@microchip.com> wrote:

> From: Dharma Balasubiramani <dharma.b@microchip.com>
>
> Add pinctrl bindings for microchip sama7d65 SoC.
>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij

