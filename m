Return-Path: <linux-gpio+bounces-13682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 563829E9AC9
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 16:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2561218886A3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F041E9B25;
	Mon,  9 Dec 2024 15:42:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F31E9B12;
	Mon,  9 Dec 2024 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758969; cv=none; b=svrp8Lsspl1l8FXWqUHMf/kEacIxbXxoq3Lx5WflrePu1uWx6wpSdh7QrNFOf8hsctcPIC6CRXp2WWPRAKN/WOAlSmSM6hyIsM1urpGM4xL6t2RrsCDsCy22+7PNiERcAhJln97gPWRrbtFQUxWqp55CMfL8rfphRVeySiAduJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758969; c=relaxed/simple;
	bh=MDtf3KrjN/ZuyRxqOUDdPapgk7TPgg4Z+6jlNqAS+CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibxhNbHyr8LUDdlQnpQvvknsNzs8KGqHQCilJfB67jb16/7B/L74t9RHjRxvNnRzQkgaEzFAqaJ8SQib9hGeU8afIbrZpeGkrM+WBIodukIamx/4ezsLhJXk86jnz7o/2Hupbv8Q2j9quhrkGJhWmpatHssIfMxUhiyMXpCk6wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afeccfeda2so548417137.1;
        Mon, 09 Dec 2024 07:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733758966; x=1734363766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxv+gi2b4vb+2PfhKBfiYPC5UhPPhL9JTvs/aZ/ti3E=;
        b=v4PzPoYrxeu6v9cdFtbnoVkFxsNMDL4CE7bVLXS+9+pC0SuCMLjNWgYjkgtYjfUWzi
         hjDQoYgp3z+qqrFGICua0f7AwFow/LlcEwhGUYj3JAF6Q13Fx2g/ysIUcTP7G16E+p1A
         zlymn3y7Xenr0MK39xIGnKb/M3jrShbAJDyjfzUIvLg2tuehQTxzb4qip6NSewheFnBB
         oRIG+x+h3vPwd2bbbPqW8ZGFdkCeMgCHJDaMUAnJ9mDhr5gG6ys6t49IkL80+TQB442n
         xM6MOViHc9iovE/8SbRK/gxypNPtcXkG72+FBHEfNNJcfIFuh5sZuo+XzHXWWaGIx6WE
         CB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU60khhr/uzHmDy0qgixEZdpKFA0QxPat3kFTPXLKZKYdKEWw2gGUZ19PNyNBPkj+CZLwu1o5PYfanADA==@vger.kernel.org, AJvYcCVmQGmlafiLjD4XYX8dwg3oDBnZh6TAZkeZyLjrbHyZKVoQKx+ZrQnkLA2Lzfl7Z0H0VdN/B/iupcUqyAwc@vger.kernel.org, AJvYcCW/p+pasNrnJjbBKX4k1v8u08/nnlaJhg+UE+vvBof3E0RRFF1s9eP3gHgGm1eKWi/Teeo3qAgnQB8XMXs=@vger.kernel.org, AJvYcCWEUBSdttpvxJhpLW1bQA5pt7NrOsd0eSHAG/Z41W5RQwagv6AMMfYvjrufazDM8ZL1xDH/54AJgGm/@vger.kernel.org, AJvYcCX7qFfL1CBm6Zx3SbrKsLATQbTZzfClbGqp5mfbFkrf8YxkpMgnLH/DkSY6gSI7pI8n5F61vlvpWcj847KOfSXVSQ8=@vger.kernel.org, AJvYcCXLaLV9QP5lclC5/alW2khfgkRVew2QTgopwxrYqWFoZzLCJxIcgA+FUELf29HfCBWpT+Sgv/K8Oe7k@vger.kernel.org
X-Gm-Message-State: AOJu0YwAR/ziodfLHGiSM4/vo8rXsM6LyX1E/2rnhG3ASqeHRE2pE2pW
	nu95BDFZrvymqWylog3cdInqDuUTcO1RQF6iOmJuW5ic9h7IjNWjTeksMvxWAVo=
X-Gm-Gg: ASbGnctiCgJZEerlfJFuRPdOD/K9o8Nvr3rwnGo5IMvFAbTaaAStg3K4pLWp+YXXh+q
	r/pBWlE16522YZY527/Q4oEPlT7Nv4eP0vc+o6CG0dA+/zRwSXNCY8M7Mb027Fh5lBwgQxRVPwh
	GdwlHnjtxITaeBHGSvy2+IBv1AxpTzZphEr+8EQWLfjZ5w9zjlh4Kd/3cIu+D5RdqttlolEeAmZ
	9ZuK4y5pe4NVip8K5D1oXqbZukLe4EPFoSOebdq9dNYrOHgHewxrY79L0qY6cREm81VE9UqGn2P
	XLn737n2BZ21
X-Google-Smtp-Source: AGHT+IGqF6wUFSgOO4+KJou6ZjI/bxTh6odQa2c2jWG85N61Nyk3HDWl7WBBNDGhHtfyQAHZukAdWw==
X-Received: by 2002:a05:6102:5494:b0:4af:df60:8649 with SMTP id ada2fe7eead31-4b116c6eee3mr1567661137.9.1733758966115;
        Mon, 09 Dec 2024 07:42:46 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b964991sm1199889241.2.2024.12.09.07.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:42:45 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso924763241.1;
        Mon, 09 Dec 2024 07:42:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/aI3YEp1zjteOsrSM666F+kAiAW7ePL8UjvWEGj0uNtkBlDd8h7zMpNrisO2HRXQoKy8DeUrIVNvfhi8=@vger.kernel.org, AJvYcCV4+bQNAdA1ndJN3bUDnAmcE4wPQ5MA2npyYYflXp0hKNuaJkkO/8tieDFuHLVmzqwkLF4rlDDjEZl/B2hm7WvbR0w=@vger.kernel.org, AJvYcCWPcnOVQGFQaUct/+nV5EnBovIaKjuU6+Qapv2bPPQZ5KKv2NUedAVMCV6wBM3ANX9wMfHkXnkXMB1r@vger.kernel.org, AJvYcCWibF23FmRlaNA/Dnc+222jw0IzrOSZ/u2UBix1U1Xtq18AwYcMSj6C1cEuOBluq1D8X/JjrpMRIilfB8tf@vger.kernel.org, AJvYcCX0cvuLRLs9baUGeI1by/5pS6DxoY7yFQWKCXBvDIIbiyoZ8XZEftRaa4mmmGmcWcZ6VReb6nwJa8eA@vger.kernel.org, AJvYcCXQIDPyzizG4OLFM39tWfJRghba4meu0Jssz0054oEAa0xFUfvAbE5NNY1tn4CtYcKB4veOiE5AkNZfJw==@vger.kernel.org
X-Received: by 2002:a05:6102:2ef:b0:4af:f5bd:6376 with SMTP id
 ada2fe7eead31-4aff5bd672dmr3479930137.7.1733758964965; Mon, 09 Dec 2024
 07:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-23-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-23-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 16:42:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa+kmHJRTo_HOiY=LKsoOoG1011O4M5JmKWNCmRuh34w@mail.gmail.com>
Message-ID: <CAMuHMdWa+kmHJRTo_HOiY=LKsoOoG1011O4M5JmKWNCmRuh34w@mail.gmail.com>
Subject: Re: [PATCH v3 22/25] arm64: dts: renesas: rzg3s-smarc-som: Add versa3
 clock generator node
To: Claudiu <claudiu.beznea@tuxon.dev>
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

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add versa3 clock generator node. It provides the clocks for the Ethernet
> PHY, PCIe, audio devices.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -152,6 +158,30 @@ &extal_clk {
>
>  &i2c1 {
>         status =3D "okay";
> +
> +       versa3: clock-generator@68 {

> +               renesas,settings =3D [
> +                 80 00 11 19 4c 42 dc 2f 06 7d 20 1a 5f 1e f2 27
> +                 00 40 00 00 00 00 00 00 06 0c 19 02 3f f0 90 86
> +                 a0 80 30 30 9c
> +               ];
> +       };
>  };

I did not verify renesas,settings. The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

