Return-Path: <linux-gpio+bounces-7502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C490AE29
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 14:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69F41281D9A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 12:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2661C197500;
	Mon, 17 Jun 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFlTVF3+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB541974E3;
	Mon, 17 Jun 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718628432; cv=none; b=mEyl1S/UphnbVq+wWIrt1GGN9vxXSYJtUfVPWFutJtPhDzgufXk8694uHa55Pf/DJA7voTZl475/W8BDeAu2Je/4FnRV1I2MK+ZfRsgrAezw1eJVG8jrWfIdZm/PgpMPJIKJXrnV1Xw3KjfKbp0Vl/nfzM1o5heiU2sDlPpQbOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718628432; c=relaxed/simple;
	bh=fgDhmnsWzagjpjppawby8HkrlGmPsQo48aapDAFQeNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Baqh2zqDY4yu41HVH/naf9afKbI1yfw6OdSm6cYj0jzovxRXe/mV2pIIUDSp6S/NuCi7oCtLTOE1v5MMakGJhdWICyX9JSFGpNqOyHZbWouBoODhY/qLz+orp8VGUu93ILqUKiX52ZQ1n6A8odCGcu/CYYDFs5lyUczXaBcmAW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFlTVF3+; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4e4f05835b5so3029506e0c.0;
        Mon, 17 Jun 2024 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718628430; x=1719233230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2O/6Zxxvthbjk5aEL2cHnkGCJu4j2zRdBmg2EhvHk4=;
        b=FFlTVF3+y7Oi8YnUsfK4+yI0SXypKf3YHNlYi2HksTMU956M3OScJjqEArHYGYDOKN
         U9uFymtrPPLqUfesGqYoMyov0nVwrSeGQ7JPkpDzdVNx6uYWF0aYiP/Jg9JOp6PekJXu
         HmkWWMf18PhDR3M60Q6Q1F9ZXdeMEwrwEQZaY2Bjn1DJ8OVp2eNRkCh0S7rw2Tp6q64U
         seqYKHXrnC7EOj/+Q9TxhXQRaF5d5LfpnqMcIQWGnmIAl02srMwv7ye1D1JrLnVWkBbX
         dVOSbkWuZty8CUHIpLZAcKUKlA/4RpfTgdIfeXbJIw5TZhr2yt3u5lpSwNp2efE/46PF
         TrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628430; x=1719233230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2O/6Zxxvthbjk5aEL2cHnkGCJu4j2zRdBmg2EhvHk4=;
        b=Z6UNVfHrpx56ciF4nhx7BwjUxtT/n40lhT6Mw/U5yYh47/BQDIeFYHhc4FGq3HpWcn
         HYUT1NN3NLLTlwJQGnhuBySL7xZwOzP5NJRKgDrDIfOgqHfNSe6+Pb4/e26N/xcI3ryp
         XeuG1H2USG5nQKA7S93PIhZ0gJnN5w16Zd6Cnjsh65SRsGBeyRpOWblQdfAxRhfcuzJz
         HYyj0+0BQFdpzMpbd2u7+F5cxcwYb/+mDraOv5aMIa2XOVp2yV1RQbi3K+rWVyrQ1tQX
         6eODBNDM6q+9Hb7HYddtMS7tLmNlTXBeUF2FodrnDXB9Y3e35j3GYp2wAhC5NtpMsSty
         I+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUuXWMKJFDttc007uKzhJFRR8VUIMOaS3kD4Pg5DlghkB9IjiW45cT3KK+ODgmBw4wyexINunHAex5zRzu7HazPiEutLu8EhuXYwtvz8Dnaccr8GXI+PBAQc+aLG/188FTo1SU5u8+X6KVmGkHS
X-Gm-Message-State: AOJu0Yyx63LsSw8tSZrKm1TjtrCYLmQljH/j8STBIY6nsAF2h+b+FEQU
	dJUUf21U4Xe6THVPog+A9ET4Md405VO/Y6E7MKfIAO//JS/7liC4K9/Ws32K9aJ04tmNh+TkdjU
	it22dynSabLiwrHE8sCwz+A3R0+tgWIN+E+fXbg==
X-Google-Smtp-Source: AGHT+IGmMPaqiqOFsUDX5zO6pKwugMoraPATOoq+JH2jtuy02xUxmGKX7bibONkkrxEHhnrnUdZIkgIa/BcIWbshiGM=
X-Received: by 2002:a05:6122:d0e:b0:4ed:fc4:d502 with SMTP id
 71dfb90a1353d-4ed11ee78a7mr10189719e0c.3.1718628430375; Mon, 17 Jun 2024
 05:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5c1bf20b-7e94-4b06-95e5-da9f99750203@moroto.mountain>
In-Reply-To: <5c1bf20b-7e94-4b06-95e5-da9f99750203@moroto.mountain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 17 Jun 2024 13:46:43 +0100
Message-ID: <CA+V-a8urbOnrmWbFt=n9=Twis2+gNQDf2_ap-TN42BRdxb5_Gw@mail.gmail.com>
Subject: Re: [bug report] pinctrl: renesas: rzg2l: Drop struct rzg2l_variable_pin_cfg
To: Dan Carpenter <dan.carpenter@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for the report.

On Mon, Jun 17, 2024 at 10:35=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hello Lad Prabhakar,
>
> Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
> rzg2l_variable_pin_cfg") from May 30, 2024 (linux-next), leads to the
> following Smatch static checker warning:
>
>         drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_var=
iable_pin_cfg()
>         warn: was expecting a 64 bit value instead of '~((((1))) << (16))=
'
>
Is there any way I can replicate the same on my setup? I tried the
kcehker utility but it didn't print the above warning.

> drivers/pinctrl/renesas/pinctrl-rzg2l.c
>     362 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctr=
l *pctrl,
>     363                                               u64 pincfg,
>     364                                               unsigned int port,
>     365                                               u8 pin)
>     366 {
>     367         unsigned int i;
>     368
>     369         for (i =3D 0; i < pctrl->data->n_variable_pin_cfg; i++) {
>     370                 u64 cfg =3D pctrl->data->variable_pin_cfg[i];
>     371
>     372                 if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) =
=3D=3D port &&
>     373                     FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) =3D=
=3D pin)
> --> 374                         return (pincfg & ~PIN_CFG_VARIABLE) | FIE=
LD_GET(PIN_CFG_MASK, cfg);
>
> pincfg is a u64 and we're returning a u64.  The code here is trying to
> mask out PIN_CFG_VARIABLE which is BIT(16).  But because it's BIT()
> instead of BIT_ULL(16) then it ends up masking the high 32 bits as well.
>
Thanks, I'll update the macro to use BIT_ULL().

@Geert, shal I update the PIN_CFG_* macros to use BIT_ULL to avoid
such issues further in the same patch?

Cheers,
Prabhakar

