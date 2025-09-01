Return-Path: <linux-gpio+bounces-25306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF9B3E018
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362D81890DDC
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFC830F549;
	Mon,  1 Sep 2025 10:26:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEC3081A9;
	Mon,  1 Sep 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722372; cv=none; b=f5ADvKgqBKHnqJhkT/+EyYHRFoDh8vn7LLVxdPg0Vfd9uUMtXizQapv/zG1R8HChFnX2d+ITOTBFcWm1qoUwoayS+Vbed+ljFVPN6ekuFGRA54/JfHT/iep5mdIKpWAiQk/t1mk6E5tBiaE2k/3FtLKr5uEKfZ9fpmp9tMyE8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722372; c=relaxed/simple;
	bh=KlPMli+YTGrSmlreZkYduv5O2gGu89LeCVUbysiOvIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUNxPYZ3bmJ9373iGnyalDUAzyGlpxc7NMh9xZMaOePKi483l7+nCVs0kE49gTdNm2JOR4P3x+8JnWfBnSSlBxNk6ZwIpC4Ii97GnRUttU8PrcX+Mcrh0WogKA+e9O7gxVZPeG/JFu4v24Tok7N9AHboqd+BHWvRZyw9hokAHck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018eb083eso1953481241.0;
        Mon, 01 Sep 2025 03:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722370; x=1757327170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV3OsbhzOeODyoDYN/QMtyaaE2+Lj2OTOI314KxLNk8=;
        b=dKkxlOuV9n18ykcgZLTatc82AT4oiXcdLDI3dUPe0Y14ctY6TvszFVGKFDNFJxjpon
         FuHBzXxKZaUU+wi0R4baxRcchf61HA2PClaLBbiOzC6AyDpPISeL3rHCKAH3dZC+aMXz
         Gx/wJB0/kzChG5wW6vD1yb/20KwyDKXHGROFxcPIEewf+NKrSCUYiVydT4XiFHQIJ63X
         3qjOvSa6nCWwiq3RkEUf/RE+BsNZNr2vl7fISdKoIqbaPAZ9GNACFhlq9shTDwYUNwRw
         /NScUzzYaYZKJdXIrMS02Noy074u6IZtV6a7/Z+doaC3dYhPvvgwNiS9A8Ky3Q0+eOzI
         5kBg==
X-Forwarded-Encrypted: i=1; AJvYcCWWK5jXQJahJ5u4eBkRHCyAuUqUQPfOfkHZKL9g+/so3VRS2Vu0A8mvbah0oQcpnIoQJs5WxDwkcjs5E0kz@vger.kernel.org, AJvYcCWn9T4rBtYzC+UwjNr5tKB0dgkrgW0eAPKV983kmAkI+Bg6rI3KGmI5jxDWYJe9QeJBGuefBfvYZGW28MTkxWSeG00=@vger.kernel.org, AJvYcCWvBbkXxu+AFMEr97Wa6zU4LvNJK1E8NlTpyOEbCg/5mFjkQThKK3H2j09uRCGiJVDK7pT0epIoqSZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GBLonHIek0bEKSqyb2mCvrIzJL8TCh+FcKch46KpUtcTEM1K
	g/E8S7mp/WiPsnwHSW1uy7Qic+lsQk3nCzmSvvi4w0oAoYN16p+DkumTN/UsrXWK
X-Gm-Gg: ASbGnctFeAj14hTyOEchi3wxuBy97UXF1dVHwyEzyhe+pqauGaLZKOarqUacU6139zG
	Tm69nLI/Hr7dmPnUuC4ml3krhcrmXfPURCoS/SR9bl9EXoEpO31Hgtl51zXPYJKe18yyYxMgOTG
	HDyNQ77M0xc5zMlyPuzr0OpihRb6Fkc1cIhL7cvs8H45sHHb0EV/tyf0/1o/+PuEAjXtmNf8weO
	x5jukifbKC82c+JpFr3dDB0LmL7/x0hL4BtreBZLHmf6nKeyky1wfVEP7RoEmKqYHmP1aeSWqoG
	+Uozkfdjt8bOVinK9d/2EMG2tXoP4jMlbQNYDv2tG+2O4EWQ6pRUF2L/MTDmeOV+BlTmEvquNKW
	t9/nwBCDpbDFhFB/3rNJVE8RtRGwU908euQGRf5ywkJ285xnjTcBAJpa0mWbobH+GYdo6Q1Q=
X-Google-Smtp-Source: AGHT+IFK9ysZbgAOGijhcpN7tzZT2x/hBm7dJTqAmEjvsgNx7fUJRbnQJsJaYMpZ9owW7E1znUIrxw==
X-Received: by 2002:a05:6102:4691:b0:524:2917:61aa with SMTP id ada2fe7eead31-52b1c149c51mr2204347137.32.1756722369864;
        Mon, 01 Sep 2025 03:26:09 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19158a6sm2916513137.9.2025.09.01.03.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:26:09 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8943761ca20so2350119241.2;
        Mon, 01 Sep 2025 03:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf/JPCijqglL9bpUVFyvg4/MxAVc71BE/TiHxK6DgQNk1zm7SMf0bT1gn1P1N90mTuMiXr2ySxE5hi@vger.kernel.org, AJvYcCV9V3xBRsjQ8Te2pY6J3bpRr35lJXNIX0vyAkTWicitmZtTXOxG72DeMW+1WR/zZdqYBiOaMvX5qNhSrya34mL3O4Q=@vger.kernel.org, AJvYcCW3eM2C/nLs4KqRzQOpYaREbdqfZQQh8XG/lPhLiLu1aroYsx+W9tUrv3589ii0lt42l4/ovKemAuHCaYbP@vger.kernel.org
X-Received: by 2002:a05:6102:b09:b0:527:8b63:78fb with SMTP id
 ada2fe7eead31-52b1c353160mr2103953137.34.1756722369370; Mon, 01 Sep 2025
 03:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
 <20250831084958.431913-4-rongqianfeng@vivo.com> <CAMuHMdW59wJCKq8nQ-SZHXVsX2kSCF0zg_gTP2vi3ApwH_SXAg@mail.gmail.com>
 <89294a30-47a7-45bf-80f7-04ffcad378a7@vivo.com>
In-Reply-To: <89294a30-47a7-45bf-80f7-04ffcad378a7@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 12:25:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDSmtpJ_4_Qj7RFukXqgFYo_9WUFKuKtc8DUQWGTNnew@mail.gmail.com>
X-Gm-Features: Ac12FXxGKDI6SPNUdqsMSWhT3AIsUr6ZHt855FHGjJHCM8cZEvtahFsN0OGRRA0
Message-ID: <CAMuHMdVDSmtpJ_4_Qj7RFukXqgFYo_9WUFKuKtc8DUQWGTNnew@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: renesas: Use int type to store negative
 error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"open list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qianfeng,

On Mon, 1 Sept 2025 at 12:13, Qianfeng Rong <rongqianfeng@vivo.com> wrote:
> =E5=9C=A8 2025/9/1 17:07, Geert Uytterhoeven =E5=86=99=E9=81=93:
> > On Sun, 31 Aug 2025 at 10:50, Qianfeng Rong <rongqianfeng@vivo.com> wro=
te:
> >> Change the 'ret' variable in ma35_pinctrl_parse_functions() from unsig=
ned
> > sh_pfc_pinconf_group_set
>
> Thank you for pointing out my mistake.
>
> >> int to int, as it needs to store either negative error codes or zero
> >> returned by sh_pfc_pinconf_set().
> >>
> >> No effect on runtime.
> > Fortunately the issue was indeed harmless.
> >
> >> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> > Fixes: d0593c363f04ccc4 ("pinctrl: sh-pfc: Propagate errors on group co=
nfig")
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl for v6.18, with the above fixed.
>
> Will do in the next version.

There is no need to resend; I will fix this up while applying.

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

