Return-Path: <linux-gpio+bounces-14696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99433A0B2A6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 10:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1670166E39
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 09:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A0823A568;
	Mon, 13 Jan 2025 09:24:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158DD22F19;
	Mon, 13 Jan 2025 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760265; cv=none; b=fi4omSOKVU5+4JaCwq4liMa5bOCRZ2rIk1KmcS0OoZXiANIg7o03s1b3V7lUGRHfdM1D9sO3cBUQNw5nH3yqnlyJmIDNk41mkIa9+PmkisqLkqM4dkw73uVymxib2f+hcC3VZQ/MJKN2H3UncyvLVL5XXVto5/w+hDGIHAmgvNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760265; c=relaxed/simple;
	bh=84bvFb6cD3GLpZUptbdmF7YOn8xMF2nDELR6ofKX8hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5lvfCUYdJ7Ksk9x2jkHDIFZcLsW15Ado5NQvDIrvsGasisjDA+8DE1hkE1wI1v5LSnpL2ULP7JihPHMSEuFZds2XlJ/U4YKciW55eV+JkWX6y2wPcOL5lku8mf+vNk0ahR6D8yacYCHfsA5DH3+5YLLGorjLj339uDHT+Lkhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85bc5d0509bso952445241.1;
        Mon, 13 Jan 2025 01:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760262; x=1737365062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYZ4TIeu11XIguoy+lnYJTPraqx664zEMCZSQ2GxQKc=;
        b=VsWzwbqPI2GB6K3AIEvaCWjLoIqSt4d8484GTZAyp/gLDHMPrFY1oaz4C3iPTDuce/
         KKk27v/5cmokVJf1BuuMsu7/PM5ZYw3bZj6VFdYbIfGMsFQC0UQF8tiwNoXsMM+ugvyq
         18xUB+Jd1WmQxdvy7bPyjmF3nS2iaR354VRxIAngjym06WKIwT6sgdSiG83/T0gC6iRN
         qGnxlOuzdG+c/48gAo+otfU+0SqFybO/F6D/EC2h3kaBtkgNxN23FBx+HgVOIjkhRioh
         Dk2GOJss0RIekep0Vn7FXSuaX44jq5NE8mV3OjnYmPZ0V20r9255jc4Rfjsbf2v8l5fd
         X/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc0B/Romia4+O5NxTdVSUp89q5QAdB3H8gz0YchgckHo9tjJo9M8tdXKmPt+dQlUq3WWLhwQ3mVcE65KGQ@vger.kernel.org, AJvYcCX5FBSzLdygQ5pvEFuxKKczVO7j00ufg1Y83VJD0OTsTha2kXiHk98MOa2rbxNkro5TbvkPEFE7XEh002xHXkwceCU=@vger.kernel.org, AJvYcCXjR0lTildetcPq6kK43xzXd8SX5T5vTTCvU7EvUdJd2XES0ftCm5Zd3EJfgRXuahbphyYSrTu7xY/T@vger.kernel.org, AJvYcCXmImnHQKyB9j+wzY/8Qmq6UFj4sRmwjpILxUSfp9+2mbhroGdZlkuH0okJuUFfO5rzj9zbpsMC@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/GNS3/GIScMT5X/WHhTADkcGtb7RRFekBiLrGzKVD4KkvH+C
	i8JUQ59vhYTma+cdmL/vqLSqmWSbKhEc45LMuPLKk8ODS/nvUGIF5ZFCC2ZI
X-Gm-Gg: ASbGncvudrGyp9fkjjlQMDCnVahGh6/qQhce1ORSLh5Cznf4EswX205TFhJ+8rflr4X
	niJioXa9g/nnb9vZCr4S5dgH0/7jyLjtgxMLWAvi8LobkOu1kjmH1J2KjCIIHm6hp7EXWDAFWm5
	pqbURvIXOs+T8CvX5YLUHdS8SAXFllceGr2TzUkCvf+g7ddGsnFCCbjHc3XeDoSqRreC20GGHpv
	0iKt2c3HL43C/7gV1CC/A4D6jlSJ+5DsOleVfMZ21uCzvk+8Fm9balFBVfYk4DHsb26jz2sxpqO
	hKORUPaRCaUa/4byS0c=
X-Google-Smtp-Source: AGHT+IGYVy5ZX0kEmJ99FdTEiEGnhnakzJvC/hNJ82OXQhJgDuvBZcJMpl6cOu05qaiv0uWM9BT2Wg==
X-Received: by 2002:a05:6102:509f:b0:4b2:bc6b:c845 with SMTP id ada2fe7eead31-4b3d0d763b1mr15360629137.6.1736760262196;
        Mon, 13 Jan 2025 01:24:22 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623134c6f8sm4646377241.4.2025.01.13.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 01:24:22 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afde39e360so1360359137.0;
        Mon, 13 Jan 2025 01:24:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUvhsk1lWs07ojEJuiHoCthDx5xox1wD2BKALmHU3sxO2AviCOgloEfpn5UfVG3gOUU6RPXMKP@vger.kernel.org, AJvYcCWhFW8nLq/OC/8LyuWfecGGEujgc6Pe50IssrswpgPpSkVhro6OY2AE+W+D1wwHa9IjUaYJomy5lUqW@vger.kernel.org, AJvYcCWy6ld4sahUFa4VJ76/VbGhbWVD0FIrESsd6+Rzbl+lC8S6pkg5A3zLOU+aRPSqLefgb44tu2R8SB8nVW/N@vger.kernel.org, AJvYcCXokAZMoyjxWrBwOsxrY3nND8W0dm7PpPJo/4od9+SM3uvDHQ4tUBMHNb1gXsFQ0rUpp48zMZvdGQoHNV+YxIlD42k=@vger.kernel.org
X-Received: by 2002:a05:6102:8017:b0:4b4:3a28:6491 with SMTP id
 ada2fe7eead31-4b43a286656mr17964850137.25.1736760261906; Mon, 13 Jan 2025
 01:24:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110221045.594596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250110221045.594596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jan 2025 10:24:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGbxJGCZB8U2CJ5cj6QBx2GqXt-Pp6czWNaq=45bOw8w@mail.gmail.com>
X-Gm-Features: AbW1kvZg6d7Xxpj2ymrdwlth7H82qDIqd7wLoyU9raVAPvQzpgvyCJe9tRi-BY0
Message-ID: <CAMuHMdUGbxJGCZB8U2CJ5cj6QBx2GqXt-Pp6czWNaq=45bOw8w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Update PFC_MASK to align with
 RZ/V2H requirements
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:10=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The PFC_MASK value for the PFC_mx register was previously hardcoded as
> `0x07`, which is correct for SoCs in the RZ/G2L family but insufficient
> for RZ/V2H and RZ/G3E, where the mask value should be `0x0f`. This
> discrepancy caused incorrect PFC register configurations on RZ/V2H and
> RZ/G3E SoCs.
>
> On the RZ/G2L, the PFC_mx bitfields are also 4 bits wide, with bit 4
> marked as reserved. The reserved bits are documented to read as zero and
> be ignored when written. Updating the PFC_MASK definition from `0x07` to
> `0x0f` ensures compatibility with both SoC families while maintaining
> correct behavior on RZ/G2L.
>
> Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC=
")
> Cc: stable@vger.kernel.org
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped SoC specific configuration

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.14, as it is a fix.

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

