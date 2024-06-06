Return-Path: <linux-gpio+bounces-7238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269A8FE5E9
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 13:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84D0A2878E2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 11:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BB61957FC;
	Thu,  6 Jun 2024 11:57:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17C195967;
	Thu,  6 Jun 2024 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675076; cv=none; b=hdIUeBnAeWqflCyqg8yrtUbXs1pnRSJjq1k45u0WuX8KcsMLkviakuU5qvwrCjMpqc4zagTsuZMnIiqnKc2xiO4OWUcYoC3MaKHTpKcnme/ttTsHyySVv0EA7Or39Vzyp9nxUtAklvCAjnZMSj9VLn8OFbTbxTbjv3kQXxeZL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675076; c=relaxed/simple;
	bh=GOMW/FwNhUYau4q4SHpghUB5HgRQmmWpXYy8yblL6Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpM3CKDiZOyZVnq74eMOuq5dV2wMADHTC+xUw4KIFbYivtXmW5xRvnxOpVdB1d3OYg5GOq2+ZjDE8H8vwl0BgzD4TTkG5zqT94BSjJ7dQQ+/HqfkWv5Z9F75m1W9irbtEpujTY1ZcZYMxLF3XOTs5V6Lp141ztVRSzJzBhaXDiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62a08091c2bso8409767b3.0;
        Thu, 06 Jun 2024 04:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675072; x=1718279872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW29ScnmlrzACbU2zNoMRoUdfE+x9Aisx6QLidUI4l4=;
        b=SMbHAMMzj/KO8hfuiTCBE1yGHAB47n9mTb391CutuXHA86yHbPY/b9fZ0jlvNqfj+N
         n8HwCqh+iY4ZUfyl/vgJp3DlL7VhxiyKz9D8/NXM93bVn4Swy4iYb6kL2sf+uswRTa/o
         /tZk6d2aOgH91xTn37AAR1WsSKmNRnzwHz584L4ZdLBR04R6TuaZ/P1rlWT/f+yuvxtZ
         gf9aLKG70CGmG8KTJz91WqKCK62uxAuxI3kzfRgMKKQHZDuYn9z81lR1CKaCd/HPZQCc
         G+HBY4KdLCPxx+TCOEdvSKw5ZYgD+O5sIwPwIP5KEGcbP04ZkOxHwlpb3CBq7uDvH+81
         o9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVpMxd8Y0mVuypAoQFfiBrT1cW5+I1k3XjrzgOAN648eELNbsO0UV0ide6xBZwP00kf8RWVqKrCsDgwuK4QCOwVOhEAM/UP7moYfN4eZiWREiUvPlrJAGVLB9X51IC0CEfO3XcRFAOdTNVRLynJbv8oKG7jjW5PYMi5N4N01K+WZAhJzt92KYieRe00s1RgwwM/3XIZ1VKbdI7y07r3MB5H7hftSHqPSQ==
X-Gm-Message-State: AOJu0Ywl5GJRq18gFchbchid1sND21WMJrHQtIaj4kHHvz/ciXSa1JV6
	QB4Sm1w0a3jaFXn5xP1lOhtK0313y46k87zYix6ktw/WnnpZusWoe342a4Ca
X-Google-Smtp-Source: AGHT+IGO9mA6vXfOFRblu46UTFef4m4DKibuGUgH9GSY1vpQnC2W/4LoFnRmTgYGB3XLGiFDNpy5xg==
X-Received: by 2002:a81:ad04:0:b0:627:24d0:5037 with SMTP id 00721157ae682-62cbb310351mr54258387b3.0.1717675072115;
        Thu, 06 Jun 2024 04:57:52 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccacadca4sm2206077b3.18.2024.06.06.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 04:57:51 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa682a4025so980579276.2;
        Thu, 06 Jun 2024 04:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ+Ev+Dh+oGOrZAosHwR+5gDEIXkzerjoINl5nb/M6B+bkkTKBII7AlCcF/h/PkyAp06mxs2E6QBPhovLD9O6BUVix8sBmoQQHv9IJLojhgS3/LTFnCqz0hBD9mOVBQ7riTj/yy4WDRNgyPTRys58+44oGQBwJsPIZfes+qIj+RgRqpmvvUYVjtIMaMMG0jp3URVtJqcdGMOh/qFlJYc8g1DNRoCmiQQ==
X-Received: by 2002:a5b:64b:0:b0:dfa:7bcd:efc0 with SMTP id
 3f1490d57ef6-dfacacec42bmr5433758276.43.1717675071297; Thu, 06 Jun 2024
 04:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606085133.632307-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240606085133.632307-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jun 2024 13:57:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrR7ymDBvLywYF1YYf894gUTGsQkC+M-1+uxxAEoS+xA@mail.gmail.com>
Message-ID: <CAMuHMdXrR7ymDBvLywYF1YYf894gUTGsQkC+M-1+uxxAEoS+xA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 10:51=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/V2H(P)
> (R9A09G057) SoC. The RZ/V2H PFC varies slightly compared to the RZ/G2L
> family:
> - Additional bits need to be set during pinmuxing.
> - The GPIO pin count is different.
>
> Hence, a SoC-specific compatible string, 'renesas,r9a09g057-pinctrl', is
> added for the RZ/V2H(P) SoC.
>
> Also, add the 'renesas,output-impedance' property. The drive strength
> setting on RZ/V2H(P) depends on the different power rails coming out from
> the PMIC (connected via I2C). These power rails (required for drive
> strength) can be 1.2V, 1.8V, or 3.3V.
>
> Pins are grouped into 4 groups:
>
> Group 1: Impedance
> - 150/75/38/25 ohms (at 3.3V)
> - 130/65/33/22 ohms (at 1.8V)
>
> Group 2: Impedance
> - 50/40/33/25 ohms (at 1.8V)
>
> Group 3: Impedance
> - 150/75/37.5/25 ohms (at 3.3V)
> - 130/65/33/22 ohms (at 1.8V)
>
> Group 4: Impedance
> - 110/55/30/20 ohms (at 1.8V)
> - 150/75/38/25 ohms (at 1.2V)
>
> The 'renesas,output-impedance' property, as documented, can be
> [0, 1, 2, 3], these correspond to register bit values that can
> be set in the PFC_IOLH_mn register, which adjusts the drive
> strength value and is pin-dependent.
>
> As power rail information may not be available very early in the boot
> process, the 'renesas,output-impedance' property is added instead of
> reusing the 'output-impedance-ohms' property.
>
> Also, allow bias-disable, bias-pull-down and bias-pull-up properties
> as these can be used to configure the pins.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Sending just the binding patch of series [0] as reset of the patches have
> been Reviewed.
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240530=
173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> v3->v4
> - Added a conditional schema for ensuring the reset length
>   is 2 for RZ/V2H and 3 otherwise
> - Updated description for renesas,output-impedance property
> - Dropped '|'

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.11.

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

