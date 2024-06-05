Return-Path: <linux-gpio+bounces-7167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744168FCE0B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 14:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8759F1C22155
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A80C197A62;
	Wed,  5 Jun 2024 12:14:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66601197503;
	Wed,  5 Jun 2024 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589652; cv=none; b=IzijG0A1FGrB5hBFe/OOr2TK/MSdI9v0E6IcTkm3Y0P0kcJP3yY+6JfgirP1uk1qGoMQ22FJHZLWVZ4UkfB80gckVOjdsZhzIO1HNZ224NfjBHszeNb08yPF5UhI9Ycxg7URP/zOS8XkqJjx+X32Q31om8Y3zrp9/DsP4mzHo5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589652; c=relaxed/simple;
	bh=3kmYkRE5l0pAlN5CkTx2XXiDFZd1noPq2fbHblWvzec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnLLaQI4Uz268Wx7FSvn8R22l6kdnC2fVaDlGwsdI4FZ1eI5ENWsSEA9MX4Vsj4Hzg4ZLSj0p7GLV/5tT+YGu13UUY/E56JURgwlvhZ20GXhw652sImOv2fur1S6FcpGk10pm7THZgtn+spjSAcAtXAJQyur06nMjDgSJnaIChY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62a08b250a2so23350457b3.3;
        Wed, 05 Jun 2024 05:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589648; x=1718194448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxXy8Ps21+71uwtN2Z1w314kqnFNif1xevexGRCZTfY=;
        b=I5B0/hqogvgys4/N9HlvC/cEGihqTAc3kRH1S3q5WnsGbds2cuATtUI30laUG/3WO0
         9yR7Bwug3LxPxEjcjYDh6nC+kT9WvTONbAcT7EjCuKoga59nGmUsIcHvWWSDylZXRQ0S
         z8impV5rpZJdZw3QOYCYoVea/Iw3PwxkjowRRLL+LVGysGubx6X8IsbhS9gL407hsPas
         D6OP0ofcTDNsA9dqfUjwBGD9paxjdroPdHuqHifDuHFPPL82xDDfkiSMN0rne4EAMWzC
         Blux8F5AePiPPg9Hy8lZekLvfx7EzSeRrWVUYI3mEG2xtBwrvNHl9k+XFLoOt8/T7WwY
         M8qg==
X-Forwarded-Encrypted: i=1; AJvYcCVqfq5wt/Ayb47v14vDibwmm4ys/eMFEq7BmyCO37ogCWF3Eo2oVWt60JZVq/LgIA9+V8r4LMN7x+tSbfdXlI34IwagLmmkIB0sudGII41Fk0u+KyLfoVVOuv1TeeCxNZlkB5GUBWVqbh7ZKaUF7uDTmqxTOjad4asko7KHbf3PMgdsdm+PHUvfTMNjwuqLxO8HfthYjmtF9uPfUb+44dt1g+NcvD8nxg==
X-Gm-Message-State: AOJu0Yx+yHwZMrll8h0fMo+ZQVI+7eM9ZzGLwgJkaXAgNdESod6lUP0L
	/TBen4FUfnLqKkq7LrJKPNFcEdfjAQ0r+x9of7XrKQKfDrWQwbFMIlXvO+VJ
X-Google-Smtp-Source: AGHT+IHFxWIyxmloptP1IhWyTmlCve6QAT+6pLq8lWa/FV23v+cEXagUtI/rE1tK3IfSbXEw47MtfQ==
X-Received: by 2002:a0d:df49:0:b0:61a:c19f:fc4c with SMTP id 00721157ae682-62cbb4ad9f5mr23164957b3.3.1717589647545;
        Wed, 05 Jun 2024 05:14:07 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766b3259sm21760417b3.109.2024.06.05.05.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:14:07 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-df78b040314so2317626276.0;
        Wed, 05 Jun 2024 05:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9jIcTnxvaCGnOo6L6xHMIGrNVILP1daKmZAzqRL47XvUnklMYZmNtQ6M4+wZjuR6XXMAp4qb56tanpAQAKl6156cJtJ3+DxHK67yFqd3wt/1/y2s/yXj3Ra9ZtHaQwYB/PSXq+ziokwYBway+Us4xw3QjNBPGtj1/jRZ0Nkg1Tv0eKlksMLpL2Z0qk8LZ898BGW78SxQUF7eyQ07lVndfmhx83UulsQ==
X-Received: by 2002:a25:aace:0:b0:dfa:b42d:f818 with SMTP id
 3f1490d57ef6-dfacac33deamr2055002276.19.1717589645708; Wed, 05 Jun 2024
 05:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:13:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfuoZ41LMgNKzMOx4BJj0eRSE0K0Tw8JKSz7tkQ5fCJw@mail.gmail.com>
Message-ID: <CAMuHMdWfuoZ41LMgNKzMOx4BJj0eRSE0K0Tw8JKSz7tkQ5fCJw@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointer for writing to PMC register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduces pmc_writeb() function pointer, in the struct rzg2l_pinctrl_dat=
a
> to facilitate writing to the PMC register. On the RZ/V2H(P) SoC, unlockin=
g
> the PWPR.REGWE_A bit before writing to PMC registers is required, whereas
> this is not the case for the existing RZ/G2L family. This addition enable=
s
> the reuse of existing code for RZ/V2H(P). Additionally, this patch
> populates this function pointer with appropriate data for existing SoCs.
>
> Note that this functionality is only handled in rzg2l_gpio_request(), as
> PMC unlock/lock during PFC setup will be taken care of in the
> pwpr_pfc_lock_unlock() function pointer.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Now passing offset to pmc_writeb() instead of virtual address

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

