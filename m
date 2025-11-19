Return-Path: <linux-gpio+bounces-28762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51225C6F34F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D0A4A4FCBE3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5D2363C54;
	Wed, 19 Nov 2025 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qa2VMQg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F235771D
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560806; cv=none; b=sxSMC3cBQhH9sqICfxJ+VQ9VqUxUT3zl8Nk6MqnWGpOKTBDk9BsH0vn2/oIbxcGE8RJjbgS0tzTigaAcLZQ9Fj27oqoyBLjUv5yDCX62MRaUd/G01dFaxbL/M+iZdKcaVq/VeFRppOQQpAghaan+L4uX/yKtsEwaW31BbUz8wR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560806; c=relaxed/simple;
	bh=tgGUW/G2ERvodoGXwXOyVk7zbU6cf9GD6J6Su9SFwYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWddR/na5c9Zu7u5hrlBUvskrRcVZp5IOQZDtA6kqSQU/cBzd/vj9wncfLOLNSG6N/V0A1MErC4SP1KU/X2/b9NB6fPLtaXf8gTHJDj75f53D5+O9IayE5ETvR0ZKfpMNpc3puC1llYKjskUm2vVFn1PruPr5qgw0FVyRUFhgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qa2VMQg1; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78802ac22abso66751067b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560803; x=1764165603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgGUW/G2ERvodoGXwXOyVk7zbU6cf9GD6J6Su9SFwYk=;
        b=Qa2VMQg1RPm4qJZJ8D15QvFTRCvHVxlw9xowTaBjFMkCaTWKNRWuzJOUiUmRl03t0j
         zYx9PjQxU9LEQDSS9pmptOknBxIY90vl5pKS5CA4YBqvATjAJLSguNPvA3myQX1k2phU
         CkJjP4ALtrImqz1sWcbXvH4ZccvOeZMEL/O5oe+hcZxncZ1ykVQL0417zkVFd8DgpMp0
         YnENBtEFn9Nzi3aG54OkZr9BeNZ5gCcOwTzc/HdgG3gtd8dsRQCB3tDNtt9eaHsNsDBk
         9Ut3h5ATZLOI9EdpKmYHtU/YRmfUqewjN0wRDeMhTirDZMbBU+7YV1ITRuxzRcpzETYl
         DlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560803; x=1764165603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tgGUW/G2ERvodoGXwXOyVk7zbU6cf9GD6J6Su9SFwYk=;
        b=tRbg9HvNBnsUllDiFlRbycoS86mWuQ3std463HY1hfB2Cqqu9rQ12npHSOS96F6MZ2
         RASRGUPJNt1/TSHo/ccb2oUIKOhAKFTyfut9dO5aPLJN82zWNKcjmTZn6EU1m9sBsbj/
         ktLRTSJ57yEQ1x5xHd/juXb0+bnUUYCkN84b0zm8qpHO4dBodrrG6UMAQDRnC8GY1MmU
         YkuhpAi1pVozV33ZO6nESCqs6s5WGKydLbnBkJ8NIVrbA2iMk+4s3mxdIzb/3mDxGmxv
         bKb5sWb9CjlFp9XKdK4uH2HBo+OLBgZj7I2FAmp65c+UMcxmsIqdCFrXqnyODXLHGOvV
         RLKA==
X-Forwarded-Encrypted: i=1; AJvYcCUPFP3+vZ02mtXI5Sy1m/iVUq0UfjlJZrNADG28Um5ZwJn10VAsOfupM9L7q6/NsqgVKAS2SmW4IeOy@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4Gevf9yJOENE7kYWUWAsx/CAGwyoFXXCKVOUDR/cX6BPZUsV
	e3a1uBNPUXHzk1ARnpPgagqCU8+NFxThSwtzj0Bf34W8E++Yf3JUEb4KWvdWuYQjoKZkMH8nOJm
	qieeN/i4LtsnW7Z+wtc7riN3WpzYe0MA6aj1VAFm0Bw==
X-Gm-Gg: ASbGnctScV8euiwwzMTgdX91wVcJ4+8EYIcvMn+ezPmYVDvzjPioSNxf5m8DJx1sNfI
	dim4UaZiEMvOfa/DOOka6QwAorxs1Er6PeU/BwTByIe+BXEe+P+m4J/plT1E9TaDLUOhSj5l9KU
	B/ldhDq9J/YgjDiaxa6mNSX+Sh0w3TR397R3QjTJqUltike2kk4w/SZnQ6dktBluzjusP0Ez2Z/
	ayFXR/QOlybvkRQGbut7E8QknBS72AeaZGoOdjAGEquSsScLJD6PKbyZ9a02orseVICA089d8l2
	Rrn4Hg==
X-Google-Smtp-Source: AGHT+IFby5ovUEEkg/kEZ/NlZpWzBLSST32TuxBsC0mFu2Wjo+qaO4E4CpnrVaFCPwquoGoft/usYgk4VVssDH1Gf7k=
X-Received: by 2002:a05:690e:430a:b0:640:ce59:1275 with SMTP id
 956f58d0204a3-641e75f1011mr13146860d50.32.1763560802780; Wed, 19 Nov 2025
 06:00:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117091427.3624-1-antoniu.miclaus@analog.com> <20251117091427.3624-3-antoniu.miclaus@analog.com>
In-Reply-To: <20251117091427.3624-3-antoniu.miclaus@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:59:44 +0100
X-Gm-Features: AWmQ_bkdEjgk_Xzh0Wa5r1aJAQB980HPTc2Twscs3UA0kT8xBN9Unko52LYr0K4
Message-ID: <CACRpkdZmHbYY3kCJN7d0-pkPmHs2xHHgF8VzarPFjL2kMmVm=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: adg1712: add driver support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:15=E2=80=AFAM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:

> Add driver support for the ADG1712, which contains four independent
> single-pole/single-throw (SPST) switches and operates with a
> low-voltage single supply range from +1.08V to +5.5V or a low-voltage
> dual supply range from =C2=B11.08V to =C2=B12.75V.
>
> The driver configures switches once at probe time based on device tree
> properties and does not expose any userspace interface for runtime contro=
l.
>
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> Changes in v3:
> - Remove GPIO controller interface
> - Configure switches from device tree at probe time only
> - Add 'switch-states' property parsing
> - Change from GPIOD_ASIS to GPIOD_OUT_LOW

If you do it this way, as Bartosz says this is not a GPIO driver anymore.

Create drivers/switch and discuss with Greg how to proceed with the new
subsystem if you want to take this approach (and maybe eventually
create a userspace ABI).

What I've said about using the GPIO subsystem for this (which may be
OK if there is some consensus around it) can be found here:

https://lore.kernel.org/linux-gpio/CACRpkdZf9D2PH5AR46Pwi8UoyfwumKS4P3ncJ=
=3DRN4iu_cJzZ5w@mail.gmail.com/

and here:

https://lore.kernel.org/linux-gpio/CACRpkdbZgxWaf7B7vwD3n-OSbt8h8vGKQ_CmB_S=
NjDG6aXHayA@mail.gmail.com/

Yours,
Linus Walleij

