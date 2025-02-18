Return-Path: <linux-gpio+bounces-16209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC004A3AA3E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 22:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2265C7A6D73
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 20:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4E01DEFFE;
	Tue, 18 Feb 2025 20:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PK55lzi1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83B1C07E6;
	Tue, 18 Feb 2025 20:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739911592; cv=none; b=mp/Zv50/KLJ+eQSZlnZJZQWO6JY4KiZCKeHhv/aPdxi1Uiu2FIOwZd9HWJQp98AOESJSR2N4i5K3I+6d9gcqW5P/ogk1ED+LYOvTY8c936SZMzAsVVi/Feh1hA2bGU1mQoFugH6sxjhi64upJ6wB0wGHX7tn1m7P+Nb5hYmxLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739911592; c=relaxed/simple;
	bh=D+gTGnpF5GaLeuIa9CDoIY8JwWWMQAy5FHTC5P+mL8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6jAQMUhwnZYgEUR630iwhvVz4HLViCpLw/ZAIEJlExr6Z+q4r3P0whyDA9tKaRIX6TFPjDYQxm3MF/7b2lTWEn0GC6HFWZZPgSbltVZ+8P1/7ccM+R+dfQa6Gu8lVb3p536PJTD+oW7cfqHjII/a90mkIc/3vmC6HrvTCoB8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PK55lzi1; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5209437e773so1198967e0c.3;
        Tue, 18 Feb 2025 12:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739911590; x=1740516390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf+aHspLddnRxhV4gF/h8Tvd3+UesI7DFbahYjZ/f4Y=;
        b=PK55lzi1DbhLZhWOL4/mgnsybGIu+EvMsaP/0JKDrspaBc6ThrdR2fVJF3HYyqAtjR
         o+gXE0/grwBXE4Ug8OhzMM8dMnW7LK0FxNsS/dpthtOM125P49Yvct+cIXwAsoqHkvFL
         DftJzhalBDQZuj6rpiZhYELSf8nancNfxYTfDweHziVETYvV6W7W+d8zdICkoXVwceSG
         57FIoBBeF5RdwxzMsEjCWUbDtOF2HBdMpclRAd08mwk/x4NMo7oroVmDfRL/434jlEfQ
         dgpu9xEEcmrTPUaycz/rwHD55H7sZrTHjjVq+WWBYmixaGvF0jfbqbxIVPK5Cc9jxD+G
         G6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739911590; x=1740516390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf+aHspLddnRxhV4gF/h8Tvd3+UesI7DFbahYjZ/f4Y=;
        b=hvh5crM34+Kqco5VmNmxYL1Td7PqMhBGTNxYYSBJMSzzoG8t3JxvNcCwrZKmhAGE26
         DT/rEFjtrKjOT6u78cMm4lHyBeJmiPkP9J3OquksM2piP3BzUdFCiN/prwXokgXpRefT
         /DiBIA1w3cVxn7qYYAKWcViYWcd4Nyj7OtEpwsJ1VeXhK1irwo5Cahh8PiDKcVtyYE6q
         TSbMufu/OFXuYnIpjpsA4q3dqEU/nzi6iVkiA/BGRsfhuvw7hu7wsS9T1mbeg32jcy1w
         0JB7D9B+/gYwqmTIElt8/GYlkxCPo020Bqq4I4AyxpEib5R4ks3XNjrXFgBiRAy5Y6qB
         PJXA==
X-Forwarded-Encrypted: i=1; AJvYcCW+h6rmuuY5D8ZXWtMGTQdZpCkaXAdLGpcaCv3V/vQM+BOMflm65a1LKxKScAhH2i/AKW67AHK+Yur9yRpnWj6JzMY=@vger.kernel.org, AJvYcCWAjwVaWvFsfvluueKVmLu90DcfHpsqGj5Jskf2bmRJwEeqIDCYnX0qa9t8WzkRUn4JV+bkEgIlH6TWhp3L@vger.kernel.org, AJvYcCWhwmfI1tNfjHtPcJ/g0NlOsPOS8a0QzxSOh3PczJJZCxbpCxZi9aJctFDNLQBpZrLIevoHIts0Mv/N@vger.kernel.org
X-Gm-Message-State: AOJu0YzBYRjPg14mKcDTQkpUo8C5e3vGrxDSTok/Lv6gSd7yyeXYBPOx
	ynnyJJDAD1DVv6aQOA+7oq/ZKVlFJZcr1DMRgatZn4MCQaHDjgtLaABsv/i4P/YLRtdzZQ4uOC1
	IRqkjP2CC414xtS5IBou40VxYJ88=
X-Gm-Gg: ASbGncvhkfjhDX7yUsLTRrzZolIGYnpRAaBu2E4taEYj7JF9NiA1Lq5Z48Ny17pOnyN
	vShaCGpARnoKrt/ND7D48K01LXTycXkOJ+kb3ScMFhpbFfKQUlVRgb6Ld8VRJCnKtoCO/M+Hz
X-Google-Smtp-Source: AGHT+IFYF6A3mN3GSsArf28yv5yPwG1HmPAlQ9CCcdrs1oNb+KigWGkerDcV159XsuwafK0DIYTku9RxDqRQxmRR+WI=
X-Received: by 2002:a05:6122:3785:b0:520:652b:ce18 with SMTP id
 71dfb90a1353d-521c42391a9mr788423e0c.0.1739911589741; Tue, 18 Feb 2025
 12:46:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215131235.228274-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250215131235.228274-1-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Feb 2025 20:46:03 +0000
X-Gm-Features: AWEUYZlj20An6Bj7wqjOn_uIEULbOzZDzyKhnuBbIOnqPIJG65p6KQmb0IaUZHE
Message-ID: <CA+V-a8uQq5s9zYqXWwgi26KgyH7cRDSBFbEeXseht82O=t=JeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Suppress binding attributes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 1:12=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Suppress binding attributes for the rzg2l pinctrl driver, as it is an
> essential block for Renesas SoCs. Unbinding the driver leads to warnings
> from __device_links_no_driver() and can eventually render the system
> inaccessible.
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controlle=
r driver")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index ce4a07a3df49..5f006a059d9c 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3386,6 +3386,7 @@ static struct platform_driver rzg2l_pinctrl_driver =
=3D {
>                 .name =3D DRV_NAME,
>                 .of_match_table =3D of_match_ptr(rzg2l_pinctrl_of_table),
>                 .pm =3D pm_sleep_ptr(&rzg2l_pinctrl_pm_ops),
> +               .suppress_bind_attrs =3D true,
>         },
>         .probe =3D rzg2l_pinctrl_probe,
>  };
> --
> 2.43.0
>
>

