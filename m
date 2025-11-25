Return-Path: <linux-gpio+bounces-29068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5AFC85E12
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 17:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 329E23B2B0D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 16:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDE523D290;
	Tue, 25 Nov 2025 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwzdjhuo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7B322D4C3
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086995; cv=none; b=tZEYDNvuEeomdlfKC1u2aiZIcXnARzii0PbpsypbZEXDvO7VNUitD3eTVLQGiPYlmLjFF7LvCQ84nL0dlLjySJ27vIIM2GHlKRptc5V7K3vfbYIxhmZ/dEMA32LATLLCCcyhaU7PJ/4Lz72NWAcxpOCK1g79OV52dDP2hl1sf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086995; c=relaxed/simple;
	bh=ZZNDBK2BVhAD768SQkUjkJTdpP4BJ3kiwKCp9pUj3l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlICe6XRY57XR2ITD9SNTUGQ5bN3R8jDRfrcukgxZsHT/rkqqS/ozyf00F7Na3D+NK/2yzi9eLgnDL7+raoy6nOw/HKrNNvu4PxnnkUKqrjalaVi8qhQ4dCOz0Hza1bvbUPanEQKiI+JXh1F4fZ2Kqvz5J5A/XBI+2AAzCifxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwzdjhuo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC122C116B1
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764086994;
	bh=ZZNDBK2BVhAD768SQkUjkJTdpP4BJ3kiwKCp9pUj3l4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dwzdjhuozsktqh1uEqLtWXLE3Y4ijDUN5lGZVSA5tiOJUsx9KYs7h2GZsuM5Gx/Xi
	 ogdXt1magG4xJGhW0KEfoMhJEgIcc6sMHXcbuBwjaYnHohJ5ofdbiTJ59oDuDPlBsY
	 k1eAGvo6/O4Vy2M0tV8O2e8HQZf6LIlbsrPobiIZGMKQ/k7xnClYE0OfwWVA0d12uo
	 KHGWscuG+2wT6bRAzWyDeK2vNJMTgsg+yR8CCQ1IU3p6oDBLH1LHQFNUaF478Jwt5m
	 AuTnwvUfJEKVQBQqICRAcReGi1K/T+JtrBjY9uUhSg7mT9g8fWntonWoW9RhiAEQ+r
	 N2+X4WQEyjJqg==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63f9beb2730so4497635d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 08:09:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYlx4h814I+ixR54CkRdPEHGFDZP+68iXZpwWHaBbJwnPzkTJeLwY9OtCTvUO204d0X/pvs5vNj0D+@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWFPPip9haKj3k5wCDKdn8o0tGDul+MJdG+dmSE+nnD/g1S95
	vAn0UCeg71rtmQU9TFmHCy0808/skDlsfW+0XWYNxGTi5wBlH4HbFsoCvlWxIv6otZaK+JD37gr
	oCYl2Q+fxQ1ckLUQnfW/cf68Nue/igDQ=
X-Google-Smtp-Source: AGHT+IH0wLbZcZEqWX92Za1hESIG7WAjFRxjfJteZSIoUtcOqh9fEEaG8QJTTVQDJ9zOPgiaGpL5ewrpQlhHsrpqKZ8=
X-Received: by 2002:a05:690e:4287:20b0:640:dfa4:2a6c with SMTP id
 956f58d0204a3-6432936847emr2204010d50.63.1764086994039; Tue, 25 Nov 2025
 08:09:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-improving-tassel-06c6301b3e23@spud> <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud> <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud> <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
 <20251121-epidermis-overdue-1ebb1bb85e36@spud> <20251121-skimpily-flagstone-8b96711443df@spud>
 <20251124-operative-elephant-16c2c18aebde@spud> <CAD++jLn4z9KFTRoROZ8aKnK-1v=_magjgSq7JJJYt0=CO=gH4A@mail.gmail.com>
 <20251125-depravity-proofs-17b8d5dba748@spud>
In-Reply-To: <20251125-depravity-proofs-17b8d5dba748@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 17:09:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmsBFt0rhQRsfynXM9ENjO=NXjenOmox=7_Vdy-t0t0UQ@mail.gmail.com>
X-Gm-Features: AWmQ_bks6-u6m8wg2c5pyzIP62EmTFwv7qtwcD3UXlwd7p_OO31yyAPjGHSiQTM
Message-ID: <CAD++jLmsBFt0rhQRsfynXM9ENjO=NXjenOmox=7_Vdy-t0t0UQ@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 2:03=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> I'm not sure how keen I would be on this of_property_present() idea
> though, feels like wasteful to search the dt for conflicting properties
> when we are already going through all possible properties and can do the
> check at the end, when we've got all the information? Could probably
> keep a temporay bitmap, using pin_config_param as the index, and use
> test_bit() using the known-incompatibles to check it somewhat neatly?

I think it could work, as all conflicts (I think?) are boolean (this OR tha=
t).

It's probably a bit ambitious, but I'm game :D

Yours,
Linus Walleij

