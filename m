Return-Path: <linux-gpio+bounces-10823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE40A99005D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD9AE1C234D2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845F9148827;
	Fri,  4 Oct 2024 09:57:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F20140E50;
	Fri,  4 Oct 2024 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035865; cv=none; b=cz1jgOds+40IN7wFZz3t9tsixmn+3WLHC4jPOF284QxEFZ/iq0dJmyBHyZjBfxLxMj3KH8yyPLisam1cXDvmFJrFqRA+2wQYkt1amTx3XrybfL37WndYzN2oFVOVcpILqvof3CiQVYdaKd/RsGVSbO1OGQXEVXgJSe6BLCpzyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035865; c=relaxed/simple;
	bh=MSfU+z/WpDjG2DPCdHoQTrXJTyTvSCU7+V3VD3oE6FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8FRLW8k70IPA8NBlIWc0EWMfxRk7iln4LpprSrfxHMOQQ5dHaFfGPflQY0wKCYo0jFBI6JwaIatdCWKM194OL5EuSJAkH4768NujeT5CEpdf5xn/IygxBUkFen2/l8vDGjaALTynHSgWqAco/sJBtyEhKAIUxpF5djpse5ReX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e026a2238d8so1862212276.0;
        Fri, 04 Oct 2024 02:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728035862; x=1728640662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEK6203kg7Gf9kxHoXN6C1/DGtS57JA6OSLQ9kUayeE=;
        b=bnYanHmz7fQm1cdZ9LDPuzmXBCBw69TtZVg48AfdxbjeY+XkSTRD5Y79HDXmOOlpSI
         NKCGtkHgnv/DbyXKLGdjk5IEvzaK/q89nlGnxk6TfAFq2NVHu5TRpuKzybB6NJQ8ED4i
         YdByFiKw1mlAOcKtZisRKB0LMiSX1zmqYD8Iia3OXcdRvWeq6bdHORKblRRqSAqyB/TT
         vz8aQajjyHCv1EgVnw8XB3PoiE4vQ96JbaUrmKaevTRUOXwJTbt9EpS2HzvOYfMLGCDf
         1Px64+wrucmuIuNAfaLUY18/WG7z8zfPjHs7U7YLQjCDi+dPdBrt3kOn1m+8AAP15UVh
         CBhw==
X-Forwarded-Encrypted: i=1; AJvYcCW/8kWPM8tQeEHJfSD7uP87Ta41YBlU5Mu47wtuGujbRnOvbQW3O+JNQG6687+T4eY7tkjcRK0n5TpFZj0F@vger.kernel.org, AJvYcCWeH+GwRf9Fc2f1DyngO9vLB1FpSouAKwOJkxy47do0Fx8xAVQbMZjVAWEyq1kfMQnZlYNudr/YXR9L87DPzIb5sXw=@vger.kernel.org, AJvYcCX+AwGME3eyMbNVO/YA1sh8OWyZN1pEzxD3pU0Fh3xtVWOnBEt52XaZk/jnwsCF2Caf/9x541SloWK9@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBOj9V/WP57ltf/qJ5+n0cYlY3UHrsROWj1naPCw2feVQmIPN
	8LPtVpHOVymr/Ej98V+5MkMqI7YTo0iEhHm2Dl01l7M3/HVeTwMLbz/KaGZ6
X-Google-Smtp-Source: AGHT+IGLC92n6s4KrV30WK8dEmY5KW2pKudhs8UBtIMMMUwarbZGXlr6HjlMSpA6AJKJaZ6zLBzFrA==
X-Received: by 2002:a05:6902:2b02:b0:e25:ce87:6437 with SMTP id 3f1490d57ef6-e2893951aebmr1279877276.44.1728035861908;
        Fri, 04 Oct 2024 02:57:41 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcfb557bsm5699267b3.125.2024.10.04.02.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 02:57:41 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso1711910276.1;
        Fri, 04 Oct 2024 02:57:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB0F22mlmT6tpN0A+y6vZjDKVAc+tBDeiphVWtbUpy70yL7xEZMUoCqcE9vMR72Ff7FPH4T3p5jPMOusW+@vger.kernel.org, AJvYcCW6WTmOYskWdJzIZxzlo/LowwgaarRkT4iJEOZd4qXmypKNJVhzq37sFOeWd8LVOXnt8twwudAG5hxS@vger.kernel.org, AJvYcCXpLSgj5uOW5VDWidZ9LcsEAXAp2P28daKkN8kmmR3wOKn/P/RvKhofRn3rQJ2ep3LRLnxNmmEgN0dgCcQY4grwRos=@vger.kernel.org
X-Received: by 2002:a05:6902:2405:b0:e28:6dc6:279d with SMTP id
 3f1490d57ef6-e2893951d52mr1268324276.41.1728035861099; Fri, 04 Oct 2024
 02:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com> <20240930145244.356565-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20240930145244.356565-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 11:57:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwhe4NeT4uepDNHreoaZ8q=UiGr0fU0woy+YarBODcFg@mail.gmail.com>
Message-ID: <CAMuHMdXwhe4NeT4uepDNHreoaZ8q=UiGr0fU0woy+YarBODcFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:53=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The RZ/V2H(P) has 16 IRQ interrupts, while every other platforms
> has 8, and this affects the start index of TINT interrupts
> (1 + 16 =3D 17, rather than 1 + 8 =3D 9).
> Macro RZG2L_TINT_IRQ_START_INDEX cannot work anymore, replace
> it with a new member within struct rzg2l_hwcfg.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.13.

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

