Return-Path: <linux-gpio+bounces-7503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92990AE62
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 14:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F2D1F2156A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 12:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F06A197A83;
	Mon, 17 Jun 2024 12:54:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F57197A7D;
	Mon, 17 Jun 2024 12:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718628868; cv=none; b=OxCd+YXRXWXV8ujw3AlyYvAvr8REXbFrTrP6VY0xU6inyaivCfUD0Ul/OdojknyQaLec2Q0Smqmt/W5zBJxhpTwvTtI/GrO6chPihEc0aMPwqHsw3k69qQktIx1zSiYtkwt0D3YNxNNXpnS0tqKA1KQEHFw5kWHZ9hEVMbJsbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718628868; c=relaxed/simple;
	bh=mvueG8M1FYjb4/yvhOomHiYLblR/KR6g4RzUGqp8FFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8TbQjX/T7XdDBHVUhZNtfq0s6kkdrAUsOQqczYi9x+eMl6pBap6fmtppNEJZyMab0+ogRJNfGttYT9RrI4WW2CwkubfgFDj+S+TpB1gcQMUcP5UymMKe1WFjySQcpAaWCUvD28TUmPsYWthkA55z5sDbf7LKIuCzrn7XjrvZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso4745347276.0;
        Mon, 17 Jun 2024 05:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628865; x=1719233665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE+t3DfcDNPoZZJgSMp9d0HDhKQKWs2OLIvjbESMaJY=;
        b=R9/Yzonud30A6NBgDGZLeVUNGESjaj8CpTRwkZYOWXxzKsFKZiB0Y2NCPFR2KikJNM
         X3Xad2zydYTDum9W/iDpigoITZZy+oc333Hw7wi/ayBgEnoaInXP+cV6wcbR1eZt+34d
         zMCD2R1sswcj6mH2RJ2X3ijztxbZKdxER+AeF6gTJKiRz8R5nF/1QCXu7IpH3j+gZEXG
         1vMKkGzh8qDev/Qixh3RjK34PotWmyPtTQzSzgRtr1U71pZeW5mnzgyzAGj5a3sv92uX
         zyjdqyz8NLfp/yP6LQUJjPNbMp+OR6KTU5JiLX5UIhsfzaB3t/HnxhGlSy8hqRppI4tt
         szzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMhP6hOTny+J2DQW+NrCGEMRB38btUXJLlXd8NXdfWn2h+jLKNvSNTdHHYzN7VSvaFlpK9sbJVd0FQyKbQghHWjTdEuSFs1F1hUzxYHLa23KB8oxH65PTM70md5K5wbZWbwxBIE5RbFYbPwiUT
X-Gm-Message-State: AOJu0Yxi6xwJgX1GFMmMlTwvfPpRMk05wqEMwgXiqo96pGxdFo0tT3vb
	T04+VvqpHQb/KUxtYDyvqb/nyIieU4w6hhgisUPLyrBcIzIzNpESBr7uqoiV
X-Google-Smtp-Source: AGHT+IG+eyp1MrEVVXWKUOowyMPympT1s4fkJ/tYmOfuFu3HmmXfB+cEMBY7s7sPiIW3WujsfCyUZA==
X-Received: by 2002:a25:8404:0:b0:dff:4520:dd72 with SMTP id 3f1490d57ef6-dff4520e5e0mr2566258276.37.1718628865312;
        Mon, 17 Jun 2024 05:54:25 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048767b5sm1853327276.20.2024.06.17.05.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:54:25 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso4745327276.0;
        Mon, 17 Jun 2024 05:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzHKVwlclN3KWSVAw2CGWVVVoGE/esCW0UXSI7d5gBiz15yAsUJPW061+uyDMe0f7JJn6FHtFXU3mudmIDUq0STkSI++2N6v9Qufgp4RnHpr1ALf7Z0PlQ6MeVWrMjiD6eiZQBeAWrTCRhJ37z
X-Received: by 2002:a05:6902:11cc:b0:dff:310b:9b40 with SMTP id
 3f1490d57ef6-dff310b9ea5mr4951134276.45.1718628864672; Mon, 17 Jun 2024
 05:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5c1bf20b-7e94-4b06-95e5-da9f99750203@moroto.mountain> <CA+V-a8urbOnrmWbFt=n9=Twis2+gNQDf2_ap-TN42BRdxb5_Gw@mail.gmail.com>
In-Reply-To: <CA+V-a8urbOnrmWbFt=n9=Twis2+gNQDf2_ap-TN42BRdxb5_Gw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:54:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVnpHrNwYLOAcgyr53cJkw7ytXWj24TrKn2FBjosn-pA@mail.gmail.com>
Message-ID: <CAMuHMdVVnpHrNwYLOAcgyr53cJkw7ytXWj24TrKn2FBjosn-pA@mail.gmail.com>
Subject: Re: [bug report] pinctrl: renesas: rzg2l: Drop struct rzg2l_variable_pin_cfg
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Jun 17, 2024 at 2:47=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Jun 17, 2024 at 10:35=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> > Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
> > rzg2l_variable_pin_cfg") from May 30, 2024 (linux-next), leads to the
> > following Smatch static checker warning:
> >
> >         drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_v=
ariable_pin_cfg()
> >         warn: was expecting a 64 bit value instead of '~((((1))) << (16=
))'
> >
> Is there any way I can replicate the same on my setup? I tried the
> kcehker utility but it didn't print the above warning.
>
> > drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >     362 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinc=
trl *pctrl,
> >     363                                               u64 pincfg,
> >     364                                               unsigned int port=
,
> >     365                                               u8 pin)
> >     366 {
> >     367         unsigned int i;
> >     368
> >     369         for (i =3D 0; i < pctrl->data->n_variable_pin_cfg; i++)=
 {
> >     370                 u64 cfg =3D pctrl->data->variable_pin_cfg[i];
> >     371
> >     372                 if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) =
=3D=3D port &&
> >     373                     FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) =
=3D=3D pin)
> > --> 374                         return (pincfg & ~PIN_CFG_VARIABLE) | F=
IELD_GET(PIN_CFG_MASK, cfg);
> >
> > pincfg is a u64 and we're returning a u64.  The code here is trying to
> > mask out PIN_CFG_VARIABLE which is BIT(16).  But because it's BIT()
> > instead of BIT_ULL(16) then it ends up masking the high 32 bits as well=
.

Note that there is no issue on 64-bit platforms (i.e. all affected
platforms), as BIT() does produce a 64-bit value if unsigned long
is 64-bit.

> Thanks, I'll update the macro to use BIT_ULL().
>
> @Geert, shal I update the PIN_CFG_* macros to use BIT_ULL to avoid
> such issues further in the same patch?

Yes, please do so.
Thanks!

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

