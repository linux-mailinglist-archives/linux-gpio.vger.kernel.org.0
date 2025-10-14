Return-Path: <linux-gpio+bounces-27084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F4BD9B18
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E9C3B1DC6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8174316192;
	Tue, 14 Oct 2025 13:20:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3489E316189
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448001; cv=none; b=kGaHfxE2p3zBgPp0mN1pUVnc3f8RoqFGaMRi3V3X2hMqFEH05BFqVnBq7y1tk0BUIyoBwqcFIds+wbmxZCPpuBGk/VzHcM10onHZB/3/J89BfPK9IlwZWGqMA3aA1pFU/JV5ClkaxlO4YoWt99kHbMHqKDM/JTM7L2txVhVOtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448001; c=relaxed/simple;
	bh=aSDd+KL4NOTNpSwWZ1vV1gh67WYD6fXPWRozSjlK8ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP2IsMfN+RLS+m3ubm5dGs2Wx1JdZIJW1Fp49haG269QEQQgBnUTO47qm5bjp6VRiruZnEJV1HAuDB3VeYcdwv9DgNBa4XRmpedqaVVS1V+pynTMnfpZHDDahGoFt+8+lfDw18sV8tWa/2G6J6ewzaPHDDqfWi7JWyUNlJo05m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8fea25727a9so1357655241.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 06:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760447999; x=1761052799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Njz6v4Ye7icNa6eer5LCY0z/OUSx/xsBh5FobUmXyGU=;
        b=bc98RcQ7s66iIwXuzBBEyfXYzYFjJZoM09af1W5WP0bgsMU1SeYuk8z9GDFROriN5c
         aKkUa3e43A0FLpbhwRpuLO5GStOAVUF6WRjhQCUTM8oCZEw5JJMEOazhLlT+KjKJ11qr
         qJPkdS7a8ll0kEGHcSsXAkpacYeNH/bJHRnAVpPy9nVn5H1DayXF95wN93ZEE8svMI8e
         VSf7iQAb1PVxIlxDffWWZkUYg8NJF68/rW+mw+MyRGR1NOSloPFoL0WI7t+Jj5WnUxT8
         FS0Qo+EpruFUsefZxUOZS6povsdx64raugprEe+oh4ZaUcbZF3+FrGglROvchAe7iA1g
         vtcw==
X-Forwarded-Encrypted: i=1; AJvYcCXRPyI2fMbzQZhx7JgMwojGB1ZCiT7DYRE2R0TBs59rbOmSLxjJk9f9Sn5HU9Gy67DwkcU/zFT3flxc@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXaiCfiZ5BYrqN5a43oAv/BOZtpsxZV12G7kaSrEOAT+AN1wY
	86IHhR5V5lIlViuPzPce3+XK6JOp48stuuM2t4K7wqhK8jbI0Ifs44IHVCL0R8uk
X-Gm-Gg: ASbGncth43DQ0bRdangEtsvqDQc2wkrOYuPeNFBdc30QUzB+XM8peLUaYIth4B8A82o
	T/0S2Jg1vBwNldigBrXme/Q2huw24yhWaSRRdKkBLIxjhe34QA3IYWDsG/ypL/NmuxIM6fJauc/
	ziqJ+e2mc8SwIkVDbwBwz80LI9K4G4ACA3cvDfQOmokzvmQ6UgncAu3ZAA+BoGhM52WyChR4KgM
	FScDBVlcjzhC/X6ZrZndq0tnHPgd27WIUiE/XSkm4tX0SJQUSLnY9Cyk4Ejor6K8Fv8QWQCxtQZ
	k1wnUBoUmd3EOP86Iff1Q3folPS9Rqu2fRjOJDJPygfEQPDcC0Lnr02zo6jBeHUtvjfwk1Hv4gB
	EbeYO4B+iM+OmMzCt7nJ651Bkyx4uG5gMmVAeDnFD8i/N4v6EF0DI/7Pe9lCkqrGU5qMdcnzBKz
	tbYng6N0A=
X-Google-Smtp-Source: AGHT+IFmi8KhDkD8l2b0Z655D6syJOXjHz4cEtQPiKjwADbS5nYmzLVT4nwlnZqwqNbMtkgefzo6Rg==
X-Received: by 2002:a05:6102:32c1:b0:54e:76ce:8fb5 with SMTP id ada2fe7eead31-5d5e2271ac7mr8092206137.9.1760447998751;
        Tue, 14 Oct 2025 06:19:58 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc716413sm4222635137.6.2025.10.14.06.19.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 06:19:58 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d758dba570so115003137.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 06:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpQI0RqPGs9fI8Y+VUM5kIiXNg0hRuztcQ4p7kt0KxKKyAzsHPVvBe88CZX49ESIECgjrc4Cevh1xB@vger.kernel.org
X-Received: by 2002:a05:6102:6ca:b0:5d5:f6ae:38de with SMTP id
 ada2fe7eead31-5d5f6ae3c7cmr5745861137.41.1760447998299; Tue, 14 Oct 2025
 06:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com> <20250918104009.94754-8-herve.codina@bootlin.com>
In-Reply-To: <20250918104009.94754-8-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 15:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
X-Gm-Features: AS18NWCbANtqchYIwTz4iekVik6u-ZIED4wJm4rfdVFvh3ZW_Tu4x1cmyNlu-78
Message-ID: <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Thu, 18 Sept 2025 at 12:40, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/rzn1_irqmux.c

> +static const struct of_device_id irqmux_of_match[] =3D {
> +       { .compatible =3D "renesas,rzn1-gpioirqmux", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, irq_mux_of_match);
                           ^^^^^^^^^^^^^^^^
                           irqmux_of_match

Interestingly, this built fine for me before, presumably until commit
5ab23c7923a1d2ae ("modpost: Create modalias for builtin modules")
in v6.18-rc1.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

