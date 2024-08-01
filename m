Return-Path: <linux-gpio+bounces-8523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A872C944EFF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 17:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EFCF284236
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 15:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B391A2C0C;
	Thu,  1 Aug 2024 15:19:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7E13C3D6;
	Thu,  1 Aug 2024 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525592; cv=none; b=pRHQ/JsGEnvuJkUUxy2gN2Lj8bouiMGZPkYbfmn1UjniJliKNtiUiHLjYW5DsXM19TmKT39oF05NBaINBLmrTwY5APCCW23NGyDTTl8U3ABrfD1pRJohG4GVvfWmevdtp6LAb+PTxbYRMt5RNfHoAQcSw4P8tCAngUIIyTQKnVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525592; c=relaxed/simple;
	bh=hPsrbCaY2Jr065uvGV0XmHvY3hpLPDuw5mS9wLk8/bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4aF9kLR0VrBVTKCxT8Y0TeofoFRhPHQ+zQCXZP3+IrGKpZis56/uot9Zu1LIRPbXF297UROwjrTHKy66eWhFWj80PRjsEl0OK378bSf/soDKE3j9E54w1PrFoTnS+JRz3CTqAweU86eU4mHWqEMBSztDT5wN+t6LtxrZ8aI8uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6634f0afe05so61019017b3.0;
        Thu, 01 Aug 2024 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525588; x=1723130388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDyWAMhmHE59w0Mny126OKEGtu/+cpHDnSt+3EGJJgM=;
        b=owA+ruFIFeqfzmHTif8gbBWE2Jx/EAZY2S67gNj6/TBxYmYRSMaRfgkNiRPBNXoBXv
         Rgvq8MYsB9Ihb0u00XeVZd5nK3HXOrHV4QZi0JOb36BqZFoPHbp8IE/0EIwHpsE1CM4t
         wclLUd+1K1kkXtX1S9MoQvjdYpHcjTkIQtg74tiUDoUOXCaIq/4AGP4bv1gTRyINgYiu
         OleR9r0nVvnBc1PjITDtBS9hXyy2565wQmGGst4pl2Fq3hTuPMCiVJNZVRisnnyxdYK7
         AMDH8DSdeEKDX9vc2h2jnU6CQaKVrgPbhQKIe7q8J75FMQKOvZ/O9EPEDavpeNjlOQLj
         VMdw==
X-Forwarded-Encrypted: i=1; AJvYcCU1iO0/FvOKVT5+VD8M0xPDFzwI/7uNUqjLxiWXN5weMKhbuONTcnggZAoZkchh+h1gbQVV9EzH7nIcuGTrBrp/bz5GLwKBFI6C2vdcVQpLZkPJF/AFlIktyF2HYczbJjDHGPQYrtaQ3i5XhTLkZ7M4eoEI3eoeANLsaX07LXjSdtNbVK/nrYNFmP9J
X-Gm-Message-State: AOJu0Yx9K0Fsk9xmj2GyjSvk/8QXPYExDDs9eBCxu1+RPF7GgOwYNecc
	seI93F+jw79aeSu1lG7T+qCDwXDGQ2ADY5QjwvC1mFGm3PpM6JcqswuKWiIN
X-Google-Smtp-Source: AGHT+IGUTFq8Bj7uiYf/lQTZJf2JsR2IZgEYAI+qzinGgBoLld18HXeSEzEBH27ofHFKzYRl+QvjuQ==
X-Received: by 2002:a81:5c86:0:b0:64a:3d7c:2782 with SMTP id 00721157ae682-68964391001mr3715527b3.41.1722525588698;
        Thu, 01 Aug 2024 08:19:48 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68867e9dafesm1408557b3.137.2024.08.01.08.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:19:48 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6634f0afe05so61018807b3.0;
        Thu, 01 Aug 2024 08:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUahvREYt0mdwfSkPgNImmMrz+iQlDrPG3byGtOstRh+jk8oW5Eg4JYxNfPo5oVPHl/4sJzj8QzrEJETZ3m1OriMgieLHTLMtVHf00jhObxFYrYbKZYCoaJG3ADOHsr4ouO5yE8nOBVKsufSPvRyA4alssKlwYoRBuQGf9yLESojRQyrQGEePSRlOCF
X-Received: by 2002:a81:b405:0:b0:64b:44b4:e1a with SMTP id
 00721157ae682-68961dc2868mr4974247b3.26.1722525588139; Thu, 01 Aug 2024
 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:19:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQzF==5ejD5XGC7KPm+ccq3=p0CDpjiYzsiTbn0D4yKw@mail.gmail.com>
Message-ID: <CAMuHMdUQzF==5ejD5XGC7KPm+ccq3=p0CDpjiYzsiTbn0D4yKw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Return -EINVAL if the pin
 doesn't support PIN_CFG_OEN
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 6:50=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the rzg2l_pinctrl_pinconf_get() function to return -EINVAL for
> PIN_CONFIG_OUTPUT_ENABLE config if the pin doesn't support the PIN_CFG_OE=
N
> configuration.
>
> -EINVAL is a valid error when dumping the pin configurations. Returning
> -EOPNOTSUPP for a pin that does not support PIN_CFG_OEN resulted in the
> message 'ERROR READING CONFIG SETTING 16' being printed during dumping
> pinconf-pins.
>
> For consistency do similar change in rzg2l_pinctrl_pinconf_set() for
> PIN_CONFIG_OUTPUT_ENABLE config.
>
> Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN =
read/write functions")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.12.

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

