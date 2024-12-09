Return-Path: <linux-gpio+bounces-13678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E27829E98DD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CF1F166E80
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A51E1B424D;
	Mon,  9 Dec 2024 14:28:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEED1B042A;
	Mon,  9 Dec 2024 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754513; cv=none; b=YMKj/DBdkHolaNovQ8sL5DnUmnU2fQ1KUcucTvFxuw93k2BlPWTi0jhmr0NtM+iUxH7fal8R9b++nOuKQy74ybTlQCSUhJIQ+1ejMSGhiyVBCBzLRjgEqyFUn8gBJvoRarOTKg7wSOo+bOlcqEUlJ208QTYq3pGXrDso0tOhX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754513; c=relaxed/simple;
	bh=2PREzsyz85kBTZDq8hlKJq8l2Dc5aeEG1Zkbzhg0BDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDNSJnZwyyBb3Ug7eFTkMjMHMpHmQCp/I7XGed7wYxjoVYSnIajVoBhlfFoGDR0EMiVWvSP+jpCgGDtQ4KkIuyv51qh8COK/Bu69+PJlSyPwo6Jwf6X14BgVJFOYkqFkuIfe1vZ7xefYsJhw6k1pfWjCRosJDK6hm0xiagy4T9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afeccfeda2so514658137.1;
        Mon, 09 Dec 2024 06:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754510; x=1734359310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpsifwGaktyhkJ/lUdGLfzerbmxDEKO6SEecVe7lU18=;
        b=DkzMRIxOnuzZ1iMX25uBVg/WISZKFjXhOUtidkxtSEDUuy7IrNilbI+XnqJ9R8maxe
         vVssju3Sh8Rjnf4DS5hbVSFOxuCbHVOHr79ib2VDsA5cXt+Ooe6tvjexjn9RnIUM45t8
         GScL62Zcm4lctkhUNdih3CdrL5aVtsrmnlT+2F8J58oIQQecldxZngCdkuoTcsN9yL2O
         6HYNNK73kuVaGtUPPnKUA0l9pK3ILOW/0I3Sp3WjcOuUQt/fK6GZ8DDLPcU9N+kx+eF5
         9DWx82y6+JjGvNlQFtiG3M8TNwnqTGo/0+jPlVu/1S8zHXuw8rG5RFq/iYgCPIO2FTf+
         snDg==
X-Forwarded-Encrypted: i=1; AJvYcCUkgd4PTqhYTl8Sl7+hG5b6TOuE37kjLdK8YdlwpXAwazDa9m1rFBliK97hNyMVy8Jn/hJCAytVQqFUAb8=@vger.kernel.org, AJvYcCUzqn+SEbacqHZiUTTXmJInITse9zNXwL2izeLaWpng4CFAc/YUDr46t6NULRCu77pNACBMGtVxyqIu@vger.kernel.org, AJvYcCVEW2VDvzJd8a0kCmDBpxnJtBSKF8/76mtcauyfYZHKZPYEJE+uMkffG+8fUVQhmGMLFvCvoMXqyR+3/O3W@vger.kernel.org, AJvYcCXOasxixeRxNSGW0r9DGJ7CO8gJ6uM7BVaPM0y3v5FM7+ErBWApyU5G9bYTD46Doib6tdPbJRcj1aNT@vger.kernel.org, AJvYcCXX8YsXLdh9NilkwKOe0O9Uas4HgY0WF/JXI6/W01Gnf6BCpBW1RM3BOE5rx1iDeeS5I8CSaMYozwGm3Q==@vger.kernel.org, AJvYcCXg3Zkj4deyCoTeghGW0MPEHBXSuI+XdPsPa/TayinPohrxbTAg2dY/YEzlt5P+e71wRuzxIJ7rIJgC0mPAJ+Xp3ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YydMyAgkvL59UspzKLkjO/YyPscN3DlrxdhKhtjZVP0hGSx0ndr
	qXUWCQMVp0510G/6wS7AV2Lro85uRTJm4AIguqOZG81SSwRyW0wfmLhUxBdh2xM=
X-Gm-Gg: ASbGncsq4mhTdORkGV7T1WfupRybUIMPWNK95F9JnFngv2g2S2pbNcZ+vEr0boi6EpM
	JdBWQu931Lk78VBmfF0uLAoQjL0m7PPUS1Nb0Wca2aX+2CD5eXaeaM84cOj2zRLrSTvKK2kexc0
	VNkFzJHEOu1TphoboA4PbXwHCCjTMuQhzw4k2Y+9xjOoXU7hBzdZtZR3kQyLqP/cwOLeUBR78l9
	TB2euyOKligPuy8Hre9Kr8Pmo9EXH8t3K5cU+uZBKfXIStE9GI3HRPrEC7WJWsldbJlrCrrLMN9
	WjRpjWv6fMKz
X-Google-Smtp-Source: AGHT+IHfiwxw0atZRuCGYkUhIBxXmvM87MpHNe6dbkKiX+2UahfjkIWYdVNbBdhNcEJhOBdma5UOfw==
X-Received: by 2002:a05:6102:290c:b0:4b1:11c6:d3d2 with SMTP id ada2fe7eead31-4b111c6e527mr1612018137.27.1733754509795;
        Mon, 09 Dec 2024 06:28:29 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b9669a5sm1190575241.3.2024.12.09.06.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:28:29 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c5eb83a7fso440165241.2;
        Mon, 09 Dec 2024 06:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUU5OqASY5dox7KhzkUJqVRenoLuPEawPDwmU7XBdvBZBDMjj+LKcY8EqLoBQ3wSAYsONNlmKszxkUc0wwz@vger.kernel.org, AJvYcCUpT3tGq6VHStLT0EzJ05iA7KXCy1B+sCwx2PzsvnY4ce53XxTi2iHGcDGmFzWux1wHCklf81tCPgfR@vger.kernel.org, AJvYcCVe/Mpt6pvw+CzAwz3fl4O4iAUped90MOKfbgu96QQEyRqa1cExqCLnYeGGNVD7EIBFE0pBfz72NDD1m4ag8ibMkR0=@vger.kernel.org, AJvYcCWzxpc5eCaPS4j6Kc57yUG9O/rLXJjd8oO3kf23T1p4tmENHk1Y0Yw95v6pjZRwWhUNeQPy1bcTe2WeSg==@vger.kernel.org, AJvYcCXE9qZuphsmBH5GI6h05Mn74FU//f+NK0mOygoUNcdEpAQWQcCnihn4VSZWZmtCA9zT1LiMf8zfy3uRhZA=@vger.kernel.org, AJvYcCXLJQStWbsTOKrCAd4tBEKrInHhaK6OHryznyA6nbjP1EUPobABSWmjwc4c2bNDbWjplxUmSBeSIg7p@vger.kernel.org
X-Received: by 2002:a05:6102:2909:b0:4af:4945:9a1c with SMTP id
 ada2fe7eead31-4afcaac87abmr12454406137.19.1733754508690; Mon, 09 Dec 2024
 06:28:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-8-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com> <97049f44-cdcf-42be-aefb-c535bd7d0dbc@tuxon.dev>
In-Reply-To: <97049f44-cdcf-42be-aefb-c535bd7d0dbc@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 15:28:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSdY5gwm7U0630UpjtwOyfnjaDKkHMdncdt5ByEdyLOg@mail.gmail.com>
Message-ID: <CAMuHMdXSdY5gwm7U0630UpjtwOyfnjaDKkHMdncdt5ByEdyLOg@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] ASoC: renesas: rz-ssi: Use only the proper
 amount of dividers
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, Dec 9, 2024 at 2:32=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 09.12.2024 15:22, Geert Uytterhoeven wrote:
> > On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >> -       static s8 ckdv[16] =3D { 1,  2,  4,  8, 16, 32, 64, 128,
> >> -                              6, 12, 24, 48, 96, -1, -1, -1 };
> >> +       static s8 ckdv[] =3D { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, =
24, 48, 96 };
> >
> > "u8", as 128 doesn't fit in s8 (why doesn't the compiler complain?).
>
> Failed to notice that. Thank you for pointing it! I saw no compiler
> complains, though.

Me neither. And the code has been storing 128 in s8 since the beginning...

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

