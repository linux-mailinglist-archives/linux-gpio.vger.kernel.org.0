Return-Path: <linux-gpio+bounces-13959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843339F4B65
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A977A2AC6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 13:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8051F3D43;
	Tue, 17 Dec 2024 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDshkeoo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD97A29
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734440450; cv=none; b=gvcemJupyrtyGyRoWNwZLFXGrbwBtZRRHttbhIU1vumqxfbGCSU0cRl+jG7vDWocAfouhnMAE3le9cXE9nB5Tdo8frT3d3rw1VqxxGsHZ+9UniiBSLnbNiweG7LKrg3EnrFmXZuf7mh7Upk22ujL3J0SdIHoZPG+jG1FUVLuOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734440450; c=relaxed/simple;
	bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgHv9IaR5K/z+HXinbIDLvvdjpoy24n98EL2coY9p1t+HCRgCcYFNtkUM0xZqRKc6r1xVGezITgCQqaJckwGLSxtW2j7uULi1PggUC7sB6+37jh869G48KNPNKBwgS/Cl5Lu24vLVrhq8XUABFMv6KPRFC88C4ufzFP4cbifXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDshkeoo; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so5700762e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 05:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734440446; x=1735045246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
        b=oDshkeoomomkIWzWQtd40b2V5rwgwFkhB7Eu7YBZGDvIYVgrDvlPqAjvxUdLBWF9uu
         2eSFlFRSUmS3lgz62kRmWj+Fway0aioruT2H4RepwD0PYuC+KOO67uBEYJ1b420tKwyX
         SzPj/DWyPya0fN1WIQP7kluPUlE/7mpclvMFDagnOQp+RTL9iepc57XYBCISnMeDeRlJ
         ey5hJ4amtgEWvmvw8ebabxfDkQdp5xB3O+4ZeLIVHkDbNDlE/2HNVsS1StdG73epPkrX
         zwawVFoq/IDIcv+gE8TCRFc31FGfhttkRGDvdPHSItlFlhNPBYqBZoG6gpgOl2sb9ZEz
         Yovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440446; x=1735045246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
        b=sRtnnuZVtfHkG5fUvvlwqWOXnwRgDjtLrLpqsQsXL0KpScsu7y8qzwENRSBywjPkPg
         81DDRC73/+dkVLkpyUk/huDq9sTafaM+XSv8lrz2MWQNC5kcVKTbxyYYCs5AfqmAKbAq
         uvfShNv6fqRs2gJoUH4xDrkOs9koijc3R0qrw7DMX+U7QPrafxnbrPqCJnSMJFQZg8dF
         2apgPsVGP9W0j5INlKPJwXAexNK8uNJrKYKMpeF/1iNyl2lWlS1ZCwjHaPhXsUH2BbFd
         SFyGn/xhN4wpEwUxDLQH8tIkux+/nF+D44/FWMzSiIX1lpIBN6qUQ+9NO1lfarO/59Pb
         M2xA==
X-Forwarded-Encrypted: i=1; AJvYcCU9FrkWCUdf/aNx9YaVQPCZZ5p/0Zz0+NvE/QRzkj6J59kS59TgqjyEiOTum4/lsY4E1npEwxqT06ax@vger.kernel.org
X-Gm-Message-State: AOJu0YzbS4Prv0vF/bcvA6qFcRta0aLS6Yt4IdBK7Ze12N9PJlDXZWks
	CIKV+63Nj76c420Tkx4NWSMFW9YxkjUdbGlyKmQ6LtF7DVfpiCRb05jnSHN34K6U4xDsKcJAMi+
	4RqX1vzAeITsu9uWMH3zoL0fqkQ4zRj+XPpkMOQ==
X-Gm-Gg: ASbGnctY3mTyBwidGDwfr3cKkfBx+S96sf9gHra29dEhgxC0Yu4WZdV9yAXF9V/fLey
	sdfgNRUspkpycCu7AxGvTILDRtgUwytCWKfd4iw==
X-Google-Smtp-Source: AGHT+IE11omUaJ4WXf3M872hwf4LKHvl3NeeSE6hV/ORlMdadi+NJj5MwYpomF9yj0vKXlTRigYPF4Zh1hB/AzSqds8=
X-Received: by 2002:a05:6512:220c:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-541310a37fbmr1037395e87.35.1734440446299; Tue, 17 Dec 2024
 05:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733136811.git.andrea.porta@suse.com> <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
In-Reply-To: <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:00:35 +0100
Message-ID: <CACRpkdY+6QPRH-Pd9SwXV6dsdah-otMa8bkt=-avzF6Aiaz7gA@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:19=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> Add device tree bindings for the gpio/pin/mux controller that is part of
> the RP1 multi function device, and relative entries in MAINTAINERS file.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I can also just merge this patch to the pin control tree if you like,
tell me what
you desire.

Yours,
Linus Walleij

