Return-Path: <linux-gpio+bounces-20569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DBAC4338
	for <lists+linux-gpio@lfdr.de>; Mon, 26 May 2025 19:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C782D1897E52
	for <lists+linux-gpio@lfdr.de>; Mon, 26 May 2025 17:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192001F37D4;
	Mon, 26 May 2025 17:03:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551963595E;
	Mon, 26 May 2025 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748279010; cv=none; b=f+uUqrCqk3/Po/vsdVuWdMezcAdH2MRqHx3NnLs/NMltLosflXPLiCGi1FWpYupkOa7dHRurmTA3WsDVCqiSgt8BNUQRr1GgMQTnYYb61gFoBCEci1foBNLCZ5IgTWOcIxEfC1wIoWdDzQvQ3Nyi5UIkdGOCgOcpzzIcxlgG4rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748279010; c=relaxed/simple;
	bh=S6MYSVF8EsvwxyfLZcoepSZZXUPzFm1P/4bcMAYCajI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsdD+RvhzkPkS5YXuhcVeXi5Rdp9ImMeau+YDDMYKx3/ZnEwuQei7mDpBqsIfu5vCGLA2OVplak+017vzvssw8FkOOjXr1KNoyvTYu2ZCwQ13SiHIxyLbsNXizgfvyKYSoMf2InL50TBytw27QLiR6y3CYHV2a/xYroMrz5hNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-48d71b77cc0so26994301cf.1;
        Mon, 26 May 2025 10:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748279007; x=1748883807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ezYcjK/kuLdHuSHwh/ef2ocXIk2CuNxW7qZXpfVeTs=;
        b=CyaMGcXn4zUkdpHR+1iDB0wLyv/o4cqXj8n69lhlkbYxx1wD9cogCbRNym1vk+78Jy
         OYpO9LFN8awVspMz3nA6LWdKfO66+EjRxgF0z9j7qb5+0J4KMoaocHl0f4L2OzdM4sTW
         6nIUUV/D18/VUCBdWipaggv2x/9+xp3nY+yCcScUOvxowBLmWoXvajYxLsweKtSMDuoW
         w5kcp6LGju1R+HvdeIdRzc6yEX2trMyrIIffxVDGTe95CPawjTDaVjB8VSDrEkwFB/In
         xyO8zG9yH+7432qe5vNvfz8kCywCuwXtGnnrysHXazRLWfivB/vq2EBgg9ADJRjIW/x3
         5esw==
X-Forwarded-Encrypted: i=1; AJvYcCUB2T7lYGfAmZPShnLgUdarLniiZeiZNQ4nRwJAaSHgave7Eg00HhwHSYbDS5WJmnkVcb2N/nyRkJpXvTUzxwzQOAM=@vger.kernel.org, AJvYcCUY256NP3U7AWAdwytB+8e1gI1ZrILUtwohVARzTGtkzcM90iOj2QMaQVycDd3TXIaY5M0eCzfd2vK5JSWD@vger.kernel.org, AJvYcCWKarhzjYs5Gc4KWpgyA1u5HzoBFOoMutqR4s9BWqO1e0/bFRJrcqTYrgT93AYAHA3W47jD/US97bWX@vger.kernel.org, AJvYcCXHWkBP9NTjoxGihFyM0+2HYXbYFtMJk4PgUU0UySIzgXiqZIsoMCGrougesY+v9UKRJAfu7MNfm8dzXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0SZikWr5ju1n4r3k1T69SteXKpqVdI98YqPvJpLZ21IPOwYd
	GyRC/XRXZE5rGTKDBHtDG419/ir7rfnpO4Fa4olEz3QzBmm1O9UyZZNYYUtHAl2a
X-Gm-Gg: ASbGncuZRx6vOUMQlTw40Zs2+7JzCtBFTfR2oiLYzhQE8qr+7BcboTvIQzQm0ah01Eu
	c2zlnqWCcaUmkeImNNYlkpFRWXtRxLYymaET5E+N52VcGokvfCg0x8cjpDnFY+mx4+Gvrb9Gt56
	YhqSLvv33D0YvitahXC7CumUbDrZB9W23Vb3/DDsaC1+4fTmHk97uAgSgFH3NSzjeEBIkVLd+uh
	8P6O4/r24fyQplFIFhZ7QRLr+aAHulO2vx5dx3duMM5tWcZ1vMFcwZiDHiUDov1btToCxbUUkz2
	jOLTqZAGyIgpi7U2wNvfW3OQ4OEc5LVH9KDwstMF5lxTTdJbu23p+xwiMCBa8ndCkzDEadLYrVf
	AfovDotECAPEKVw==
X-Google-Smtp-Source: AGHT+IGfAC16fwvcKeA3Xzx89f+r53ggyhRfmOySsq+ksQvW3N2iwqJnB4tP28TQgj+bqaheqQbTSg==
X-Received: by 2002:a05:6830:6307:b0:72c:10db:f210 with SMTP id 46e09a7af769-7355cff50demr6874377a34.13.1748278995283;
        Mon, 26 May 2025 10:03:15 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a4afb9sm4039258a34.13.2025.05.26.10.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 10:03:15 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6060167af73so1513002eaf.2;
        Mon, 26 May 2025 10:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR8VfWb1DboBWTvkxEbfuYyWYcI1BsHI3nJ9Jpj2HkDzTB+lw6NYpGSPkwd+n4DyzZaVF/3TY7uM49@vger.kernel.org, AJvYcCUSgoFgIvqVOPIcNwWGuwY+2sLCSj9fIx5v9KEb4avGiD6jGIcSlRbppZHG/pMJXhttiahhlWCL/5TixA==@vger.kernel.org, AJvYcCUsaMT91BUEo1j2p5JdxBJnqwgxk7fpd0zHZfea8Y37MuyliCpxLnq79EcqjJekkicQpQy3HwimFu5BSsAJ@vger.kernel.org, AJvYcCVzzosWBy2LdQFDMdgWhUdXwSGvdvLT8GluRa+DGULgdNvemMDl3Nb89MZ0wwv1nX+ILBT/k09uznZGYhvU+ICdi1g=@vger.kernel.org
X-Received: by 2002:a05:6214:62b:b0:6f5:106a:271e with SMTP id
 6a1803df08f44-6fa9d2be7e9mr168460116d6.38.1748278983943; Mon, 26 May 2025
 10:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com> <20250519215734.577053-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250519215734.577053-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 19:02:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHUuLiwG+-znzGxqWzYHo3Um7e+yrTJeb-Ei=SQ8TjGg@mail.gmail.com>
X-Gm-Features: AX0GCFvT7iN4yfX8D71Vm8JTSTnk1aSrctC0JzIhU0KPMEe0rEDICsFhXWYVd_E
Message-ID: <CAMuHMdWHUuLiwG+-znzGxqWzYHo3Um7e+yrTJeb-Ei=SQ8TjGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: add compatible for Renesas RZ/T2H
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 19 May 2025 at 23:57, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) pinctrl
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -29,6 +29,7 @@ properties:
>        - renesas,pfc-r8a774b1    # RZ/G2N
>        - renesas,pfc-r8a774c0    # RZ/G2E
>        - renesas,pfc-r8a774e1    # RZ/G2H
> +      - renesas,pfc-r9a09g077   # RZ/T2H
>        - renesas,pfc-r8a7778     # R-Car M1
>        - renesas,pfc-r8a7779     # R-Car H1
>        - renesas,pfc-r8a7790     # R-Car H2

From a quick glance at the docs and driver, adding support for RZ/T2H
to this DT binding is a not good match, as the RZ/T2H PFC hardware
does not have the concept of pin groups and functions.

Using separate DT bindings, as for most other SoCs in the RZ family,
also allows you to use the preferred order "renesas,r9a09g077-<foo>".

> @@ -194,3 +209,13 @@ examples:
>                      power-source = <3300>;
>              };
>      };
> +
> +  - |
> +    pinctrl: pinctrl@812c0000 {

The unit address does not match the first reg property.

> +            compatible = "renesas,pfc-r9a09g077";
> +            reg = <0x802c0000 0x2000>,
> +                  <0x812c0000 0x2000>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges = <&pinctrl 0 0 287>;

GPIOs without interrupts?

> +    };

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

