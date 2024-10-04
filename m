Return-Path: <linux-gpio+bounces-10816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533F98FE23
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD131C231DF
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A80113AA38;
	Fri,  4 Oct 2024 07:54:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED3313A884;
	Fri,  4 Oct 2024 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028456; cv=none; b=EoBfVtYQQQtZMZYsHwRykuJ/n7OfdhxBxaTXuAA7yvHy8pxYzsabsiCEyix6BlWqhxeyfp38ouwewW0FhbthsK05qAknv+eCGfeTshkKG7WmSN25kqG+/lEwEwMNaCNIKDdWmdmg/pdUOyDrbzksWBVUOMXfO38+mU6b4KBQNYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028456; c=relaxed/simple;
	bh=Wg7ul4YZSmWzSUMBwlfWIpZgmFJpPiFMzQOvVLNoDP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAi1DBcY5bRpT8Kwi+9QSMNUt4OkbvlBgMu4EAFKQtTC6wYvVcssw3ry3CUXg6Ezo7x4QSdm1eI5iYOTLEaKlws9VPLXz+65OEDyS1c/xcVP3/A3J7qnTZdKFPVLDbkPkV4IgmM1pRSYjtHNnYNqZcovKsavqxL0poQICTbsZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e25ccdffcc5so1683261276.1;
        Fri, 04 Oct 2024 00:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028453; x=1728633253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKYPD1a2MwpDAh7rgvBPhraVJ6bG7cu3U6Mm6tadaOg=;
        b=PNajY66EEz9Q79kE0mEJ55s9qmtX9lMrYaVIGWP8w9+EFGyp2vPcuz8T6DxT37FKLb
         7Hs6JoJbuSIBZbcRwp4D4VOtF5yhjM3fa1ke2lA58KEqo+Ie7xr3bJLsnj0evfo6EwtM
         MloqlzHmhbB9cFObjE+JbAipI9j/n1joLVd5Lae1riJ/ek+P9RWFECGNZmj17ZIqZUB0
         99p2aRrHXU64gmOk/3m4cjETRkhTTsleouBgWSvXscw+CBpaJlDPWneYUEoMMNjLM3pa
         1KXsDMHLESoqG0+qdc2Omr1CFcSu9fsQEFf0aGIJZkKBQLaxU5dwP6eYn/gaCNWSD8Qy
         Ya3A==
X-Forwarded-Encrypted: i=1; AJvYcCUL3hHM4VIyyUvGi832yeflS1D3VoinYg4/mMbiaDYNd/D+f1p1qvz19W062ZjlCUcaQVMiRuJO212a@vger.kernel.org, AJvYcCUemvmsTV86saOVU0oxNXGq9RYFKCQJVQDX7yV/AGn7I9UO8zJIpyz76vKyM8uY9CrDQ0pDeAWZWeBk4rwA@vger.kernel.org, AJvYcCUo1WL06Y3dEKJrkptEzCxcKLjbYKngmI+bB9s2QKZJxlJoETXT/7cf78LWWyA9p28OkAPBU2ahL1PpUOd3kg9uVZc=@vger.kernel.org, AJvYcCVh82roSM+wB2BH2kzrKskI3usd9dvdRV4zLZs5OPZ91e3Cdo8vhpWzM6U5b0+oxay4VNeh4i4iEcG6pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuk/eFDCGsIaJTMyPSYYy36RhZMymapnbJc77tI3ML0UOPICeB
	ahW/gDQbYxiZndJhzp+WG/2Qg0gxU0nfjgtN1S2b8DvVPNOl3KnBjgGLlzBarYw=
X-Google-Smtp-Source: AGHT+IF0qW0aHCCIqgYmt95gwlS+6dhhA/vMYHaxSM+ejOhu+Ld/5K8AY7/7HlikYRL9EkDhumR+Gw==
X-Received: by 2002:a05:6902:2412:b0:e26:ab6:e49b with SMTP id 3f1490d57ef6-e28937e37a0mr1250803276.28.1728028453010;
        Fri, 04 Oct 2024 00:54:13 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885d15b73sm517074276.7.2024.10.04.00.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:54:12 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e1651f48c31so1747520276.0;
        Fri, 04 Oct 2024 00:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKWV4KfLKLXepBKjEwD/KoD9fh+4z2LH2kFS8EvtP7No3mZKnFK0xnHjVXvNzlFRgKtidt8JDskeB7@vger.kernel.org, AJvYcCWCUkDnRoNS4RDjO8Gh/ytYVoC4beu9ntVkpvLYHYnSUcVHMwNCRK9OVQEUpz2DpapbcEo6Z0TPim1c6w==@vger.kernel.org, AJvYcCXbg99CfRzewa3X+i+65rwKndU73FAZxNglSIjENINiWWLwUy2Y4dIJizSmbJxb9DJ3BgdEaJ9eolIC9vnm@vger.kernel.org, AJvYcCXiKOgl2nQoQMy8N5Cd3mEW5jG4TAq6Cs+nm4HlE2UzeMyC6MoBJpiONxcqzEgN/DN04/VKJJrSJBAMo1vN9bVBOTY=@vger.kernel.org
X-Received: by 2002:a05:690c:b:b0:6e2:167e:814f with SMTP id
 00721157ae682-6e2c7289b2emr16053787b3.31.1728028451953; Fri, 04 Oct 2024
 00:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240918120909.284930-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240918120909.284930-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:53:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkHvHh=AhJhOutFRAJMczpCGdUCPvPuqjY_V4aiMvmAg@mail.gmail.com>
Message-ID: <CAMuHMdWkHvHh=AhJhOutFRAJMczpCGdUCPvPuqjY_V4aiMvmAg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 'input-schmitt-{enable,disable}' and 'drive-open-drain' properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabrizio,

On Wed, Sep 18, 2024 at 2:09=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disable}=
'
> and 'drive-open-drain' of multiplexed pins. Update the binding
> documentation to include these properties.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yam=
l
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yam=
l
> @@ -119,6 +119,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        input-schmitt-enable: true
> +        input-schmitt-disable: true
> +        drive-open-drain: true

I think you also need "drive-push-pull", to disable open drain.

>          renesas,output-impedance:
>            description:
>              Output impedance for pins on the RZ/V2H(P) SoC. The value pr=
ovided by this

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

