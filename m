Return-Path: <linux-gpio+bounces-19864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDFAB15EC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAAEC18957BD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B18E292080;
	Fri,  9 May 2025 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c51lr94F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16870289364
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798767; cv=none; b=FeAFIwGgsuhskyU1ehq1A/nBgu4TzHyVHrsaadgPKx8mmuKvpvMkWS+6JfgdLoLEBCVzK62VG9btaI9Y98rUOIevF7iBeNkPo+2x1qD1NDctZGpudkl32e8DOG2lxAko4X1yqv4NbRne+UD/tczT9htJyIfzbzWwz3N8IHo6IWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798767; c=relaxed/simple;
	bh=MGubqGeYpC0ja1MkjjJEf4XgAx5U8n0/6/HTY5IM2hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=if+LIOEYsU/BMFNhPz5++HnLrwp7/ZjLW+VLKbgjPXdt6jyNoAG29sXkiM1Nuh3Bu0+e09BTDIL7o3QPx5g/baBo1h5mYuWHWRu/IwlXpXgmloWor9gY5xGlQ47EbY896iw9mSlcbi2QCT3bERtdhOYcMcrGupWOpbS+TBNYoCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c51lr94F; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3fea67e64caso1941638b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 06:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746798765; x=1747403565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG/sdowqIMmjoKGncX6ih2QtRKdIX5Cx2o9iXTqzu6w=;
        b=c51lr94FojXtkv6EESidmhw8j6pGGXwZ9OPs2q1Oi0BjUEiXr2N1aTmMkqgGYkjDyt
         yMWyTu6AAlTXzqW7ESqIQ+GrHF/8E/8t3Pph6vDd+EF1mSbv4G8yWZ+PNaUvI6WwswxK
         GMa5IEtSeyHSxwSZDskM/0fAMVYMsweWTtwmYYnNrnqQEcjOSmRwNxd5mSnfjQMVT1Wc
         yhX3eSnvtQyzl7MCmcm9ecAHuLfmmnccU61aqoayXUzHznU0DLN0BkmJjdiGeqNh4Ekk
         fk1aQqPOjir34L01IxtWtK1QFpnQDSDmIp8xmBPeMlgfWYLMOIfMrwIhaiRKTFgLgbfw
         J8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798765; x=1747403565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG/sdowqIMmjoKGncX6ih2QtRKdIX5Cx2o9iXTqzu6w=;
        b=i9iblo69O2a7Hqxr0uCiE7MLJOSpq8mN8Z77odZP8UrQ/BPia339l7NwRL0ncMn0X+
         nwSZJ90HDIyn6sQFN+6JZ42OekVnvxgCOG+SIw1C/8TRmzED6rmK2srVQ8eM2A2xj7KR
         KfMlNfCiSHfsUxrk8WzWEUlzzLsFgdAcqFhhpAESDX/30gXT1SQq2ai7Rc3H0bv9yeZ+
         G14HZ+2+J2IN9KZNpdBWo3PhnLtPwWyvLii6FXjL2q/Rxa038ztYZF3cWzzLy2VY9ibt
         zqTm9sc/eZGtqTLeN19PdtsBrktCBIPbzGmfrygwUT/Lu72cAwtNIhxWH4+nTbRW7d31
         otjg==
X-Forwarded-Encrypted: i=1; AJvYcCUUv4U5MdPk5gRZIu+bI1kg3G740XtZvbIdZwC18lH/joLqaCDFf8xwduMqgIJvNKohXpOpsy/4s83Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6VjRH5lPdi6E8GwJxw3XPUkdJsGTTxzcUMJMRj28LWY0Ki47
	i5EfJt45fEVefRYyfsSGboj4l3lzJUm4u/xX/yDemQ0ZfkBZR+D8/sFI4MLZYb/gEXvY7WnUr++
	1AbFAt9qjxFl8EJmdZnkqnDuorL2XilQ7T7KzMQ==
X-Gm-Gg: ASbGncu6fmdEIXPgZUptEAzLLFKpPJavYe6O6ZA8Vp63uKi6AJjkP/hnZY/jxpVSQPc
	IWliPM5NrpxyWLnDQ0ZST+hoQY4P1tKgEPfueC1BiKEX0AGMBofMSUONZLRg7zI2UAhutk+SM+S
	lB2RMyrNK1lbKnR8e33g9DeA==
X-Google-Smtp-Source: AGHT+IGfTYNQXb38Qd3XEblVwFr61ZWUCt+JRdOJ06/p2uEstoNfALhHpSjlt/PkHSMkxNxM78UZKpOwOfIpsf1xSn8=
X-Received: by 2002:a05:6808:23d4:b0:3f8:c486:9b27 with SMTP id
 5614622812f47-4037fe522a5mr2143056b6e.22.1746798764909; Fri, 09 May 2025
 06:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
In-Reply-To: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 9 May 2025 14:52:34 +0100
X-Gm-Features: ATxdqUFUdIagbNNE69FQ_bG89w8nhF65-rjxSwOObUqDQgd3C6_gz2Uofy98FnM
Message-ID: <CADrjBPpZseD+9ZQ8BK+++VH=Zsgnn1fbjpiMKvC7XvD0wA7Cag@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Maxim Integrated MAX77759 PMIC MFD-based drivers
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, 9 May 2025 at 14:22, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> This series improves support for the Maxim Integrated MAX77759
> companion PMIC for USB Type-C applications using the MFD framework.
>
> This series must be applied in-order, due to interdependencies of some
> of the patches:
> * to avoid use of undocumented compatibles by the newly added drivers,
>   the bindings are added first in this series
> * patch 1 ("dt-bindings: gpio: add max77759 binding") also creates a
>   new MAINTAINERS entry, including a wildcard match for the other
>   bindings in this series
> * patch 3 ("dt-bindings: mfd: add max77759 binding") references the
>   bindings added in patch 1 and 2 and can not work if those aren't
>   available
> * patch 4 ("mfd: max77759: add Maxim MAX77759 core mfd driver") adds
>   the core MFD driver, which also exposes an API to its leaf drivers
>   and is used by patches 5 and 6
> * patches 5 and 6 won't compile without patch 4
>
> The MAX77759 PMIC includes Battery Charger, Fuel Gauge, temperature
> sensors, USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This PMIC is used on the Google Pixel 6 and 6 Pro (oriole / raven).
>
> This series adds support for the top-level MFD device, the gpio, and
> nvmem cells. Other components are excluded for the following reasons:
>
>     While in the same package, Fuel Gauge and TCPC have separate and
>     independent I2C addresses, register maps, interrupt lines, and
>     aren't part of the top-level package interrupt hierarchy.
>     Furthermore, a driver for the TCPC part exists already (in
>     drivers/usb/typec/tcpm/tcpci_maxim_core.c).
>
>     I'm leaving out temperature sensors and charger in this submission,
>     because the former are not in use on Pixel 6 and I therefore can
>     not test them, and the latter can be added later, once we look at
>     the whole charging topic in more detail.
>
> To make maintainers' work easier, I am planning to send the relevant
> DTS and defconfig changes via a different series, unless everything
> is expected to go via Lee's MFD tree in one series?
>
> Cheers,
> Andre'
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

For the series: -

Acked-by: Peter Griffin <peter.griffin@linaro.org>

Thanks,

Peter


> Changes in v10:
> - collect tag for nvmem
> - rebase against next-20250509
> - drop already-merged bindings patches
> - update a comment in core driver (Lee)
> - Link to v9: https://lore.kernel.org/r/20250430-max77759-mfd-v9-0-639763=
e23598@linaro.org
>
> Changes in v9:
> - nvmem: drop superfluous max77759_nvmem_is_valid() (Srini)
> - collect tags
> - Link to v8: https://lore.kernel.org/r/20250429-max77759-mfd-v8-0-72d72d=
c79a1f@linaro.org
>
> Changes in v8:
> - gpio: switch to gpio_chip::set_rv() (Bartosz)
> - gpio, nvmem: replace MODULE_ALIAS() with .id_table (Krzysztof)
> - gpio, nvmem: drop previous tags due to above
> - Link to v7: https://lore.kernel.org/r/20250428-max77759-mfd-v7-0-edfe40=
c16fe8@linaro.org
>
> Changes in v7:
> - rebased against next-20250424
> - Link to v6: https://lore.kernel.org/r/20250325-max77759-mfd-v6-0-c0870c=
a662ba@linaro.org
>
> Changes in v6:
> - add one missing change in core driver
> - Link to v5: https://lore.kernel.org/r/20250325-max77759-mfd-v5-0-69bd6f=
07a77b@linaro.org
>
> Changes in v5:
> - core: incorporate Lee's comments (hoping I didn't miss any :-)
> - Link to v4: https://lore.kernel.org/r/20250312-max77759-mfd-v4-0-b908d6=
06c8cb@linaro.org
>
> Changes in v4:
> - collect tags
> - mfd: add missing build_bug.h include
> - mfd: update an irq chip comment
> - mfd: fix a whitespace in register definitions
> - Link to v3: https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627=
d42526@linaro.org
>
> Changes in v3:
> - collect tags
> - mfd: drop gpio-controller and gpio-cells, GPIO is provided by the
>   child (Rob)
> - gpio: drop duplicate init of 'handled' variable in irq handler
> - gpio: use boolean with IRQ_RETVAL() (Linus)
> - gpio: drop 'virq' variable inside irq handler to avoid confusion
>   (Linus)
> - gpio: drop assignment of struct gpio_chip::owner (Linus)
> - Link to v2: https://lore.kernel.org/r/20250226-max77759-mfd-v2-0-a65ebe=
2bc0a9@linaro.org
>
> Changes in v2:
> - reorder bindings patches to avoid validation failures
> - add dependency information to cover letter (Krzysztof)
> - fix max77759_gpio_direction_from_control() in gpio driver
> - gpio: drop 'interrupts' property from binding and sort properties
>   alphabetically (Rob)
> - nvmem: drop example from nvmem binding as the MFD binding has a
>   complete one (Rob)
> - nvmem: rename expected nvmem subdev nodename to 'nvmem-0' (Rob)
> - mfd: add kernel doc
> - mfd: fix an msec / usec typo
> - mfd: error handling of devm_mutex_init (Christophe)
> - whitespace fixes & tidy-ups (Christophe)
> - Link to v1: https://lore.kernel.org/r/20250224-max77759-mfd-v1-0-2bff36=
f9d055@linaro.org
>
> ---
> Andr=C3=A9 Draszik (3):
>       mfd: max77759: add Maxim MAX77759 core mfd driver
>       gpio: max77759: add Maxim MAX77759 gpio driver
>       nvmem: max77759: add Maxim MAX77759 NVMEM driver
>
>  MAINTAINERS                    |   4 +
>  drivers/gpio/Kconfig           |  13 +
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-max77759.c   | 530 +++++++++++++++++++++++++++++++
>  drivers/mfd/Kconfig            |  20 ++
>  drivers/mfd/Makefile           |   1 +
>  drivers/mfd/max77759.c         | 690 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/nvmem/Kconfig          |  12 +
>  drivers/nvmem/Makefile         |   2 +
>  drivers/nvmem/max77759-nvmem.c | 145 +++++++++
>  include/linux/mfd/max77759.h   | 165 ++++++++++
>  11 files changed, 1583 insertions(+)
> ---
> base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
> change-id: 20250224-max77759-mfd-aaa7a3121b62
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>

