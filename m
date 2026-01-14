Return-Path: <linux-gpio+bounces-30513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE4D1CC00
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 07:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F54D30285E5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 06:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E131D36C0A6;
	Wed, 14 Jan 2026 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wd7kn3Gp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777B37419F
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768373659; cv=none; b=njGZyAStmCjQhpRQcClDlSyicSSQ7Si/9v0krJcCnLonw9RAziR96U1IeBYII+wIPfLEzxsB4Y1LRqcNeIStmjae9jmNa+SRj/nwhLg6CFiLJl98OYbehvXOCkpghkzP3OoRelQmB+R27aiD2EcnPA5tkgk5q5CvSLZTUNKpzSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768373659; c=relaxed/simple;
	bh=eZE7On40794J7ydQFeiSBE2S0pwhbuh9801PWQaEf/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ns7MWjh5mmzX5092HnTqtBQX8LXDnUOqWXnpd4XriPncImKR8SsWonH7UT5ft4WyoGZLa8C6m78z+jZidDMYl7z1/DwVgifS2Z8GsNpwlGXrzX6txdv+KTKNZX8aXkb6O3fXFTjTPUkis2oPkD1ZSW6sd7RkFncUihWTg0EKJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wd7kn3Gp; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3ffbfebae12so2758340fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 22:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768373650; x=1768978450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=;
        b=Wd7kn3GpZcEZr3GuosI+DCnov3/JuaAk+p8gYJ7CrFU79ulZQkONKYZc+nK/dbEV0g
         RhzdGb4txyYlKKyZBzxH/xh6LuImfhHUDwGdBg6BQ48lXaJVnXoDkaSYJ0hE3rkZTsd1
         vBnjcTQTC8EnI8OlQaplHOhPQpv+rW5u4yhk3TjIQmboYT5AGjiy+Jgn1iE83jAGzqeV
         3cJXQeyWWZtYlscY2CG6Y+oFFdxVrjUjgh6DFC4u4WpNQWOx4gyd/XyMHVLk7aSJZDBY
         wyLfkMNOevLOZHWDCn9/6SNIV6uXIkSCXdpRUUS/YQNSY52uFRPXTWZuueGvN/HYeoFc
         pRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768373650; x=1768978450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=;
        b=UvlX/nlZehwUs29Zpq7ylBYTgx0jM7FcAQR/p1v4VD6PyEpbe5cUJcCh7wF9kZho72
         GmqHLA+BOKmBaSiTMTvDpBSCjRsMse6Kg0aHHMbVC7hT+K4al0B7/F3GHOY2uE75/t26
         1drBS//zcEc0gkBoWhq+x0Qci9Iqy0MWGHWyUKdY86+wMCIWpgfld+v72vGhbAqf0Rn+
         9Y+BApdoVqWMfsn+Rce2+ZDcA/9PQNJ0xN4NIeIQFRUAdRlaX7KBzv/G3DehcxWaqi86
         b/9uSnHNvv1wG2B5FLfaRrScYiVH98e2DqKQSg6FQKeAq+CKIvjUe8rlwlwsQ8oWASR1
         XAJg==
X-Forwarded-Encrypted: i=1; AJvYcCVopb4az0ROu9rhizvYFDQR1jpgwGS5oKWdFIYa8n8XZiy4x+dxHMmhCG3bSmk34da6+LlZFA0KiSoV@vger.kernel.org
X-Gm-Message-State: AOJu0YysruvJQ11wRmQJ4KojviyFWtiuyjUuW8wX79gfad5fDFH+RjNL
	p7zAZGib/klu6VmVM1kXrsezvDpo3XOkbaHhLju7KRfk2JWnq5WoOg01asV6olt5S0XiYsk/2iN
	boGRIBtd39bMKa0HzQmN4NjWChDAZr8CHP+Ayu4F2Jg==
X-Gm-Gg: AY/fxX6FruXP7FPFGlt6SGQO671lCJsYt+5/erQkVe5LzjUQFq4jIqRlV278noNh9sw
	U5iLw35hNQokhkT1c4LH8Wmwqmx3P4b0kSI4ZBi3xt73nG2vTJCC3HkwFgwGWMpXE6SQImQnzSt
	/Hoehv+wgKSVOWWF2l7WYASf02gCpbisbUhzXfDKifdjbLzAl9bQXD4ENYn4fwmZvJm1eZcgGDb
	fOguBuFM5YKUpcXTOvN1+nsUNorIttY0fOe8ahitKpe4FfL85xMc60yWaVAKnxfS2rgkaN0bF9x
	mnQviVlEK4NK3qWmMBgm7EBvy9r+TwBKotLk
X-Received: by 2002:a05:6820:668c:b0:65f:2902:4fa4 with SMTP id
 006d021491bc7-66102df2e32mr770769eaf.65.1768373650571; Tue, 13 Jan 2026
 22:54:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com> <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
 <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
In-Reply-To: <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 14 Jan 2026 07:53:59 +0100
X-Gm-Features: AZwV_QjQvehCkstZ603G-yGEHjndP2wcqmxShTV0eKq96xdT4eINMWBA-NAc2Vg
Message-ID: <CAHUa44ERuPKeNHoU9UpLWTxZrSvR15RbiuOPXqi2SBYnBfg44w@mail.gmail.com>
Subject: Re: [PATCH 05/11] drivers: bus: add the stm32 debug bus driver
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 5:09=E2=80=AFPM Gatien CHEVALLIER
<gatien.chevallier@foss.st.com> wrote:
>
>
>
> On 1/13/26 15:45, Jens Wiklander wrote:
> > Hi,
> >
> > On Fri, Jan 9, 2026 at 11:57=E2=80=AFAM Gatien Chevallier
> > <gatien.chevallier@foss.st.com> wrote:
> >>
> >> Add the stm32 debug bus driver that is responsible of checking the
> >> debug subsystem accessibility before probing the related peripheral
> >> drivers.
> >>
> >> This driver is OP-TEE dependent and relies on the STM32 debug access
> >> PTA.
> >>
> >> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> >> ---
> >>   MAINTAINERS                 |   1 +
> >>   drivers/bus/Kconfig         |  10 ++
> >>   drivers/bus/Makefile        |   1 +
> >>   drivers/bus/stm32_dbg_bus.c | 285 ++++++++++++++++++++++++++++++++++=
++++++++++
> >>   4 files changed, 297 insertions(+)
> >>
> >
> > [snip]
> >
> >> +
> >> +static const struct tee_client_device_id optee_dbg_bus_id_table[] =3D=
 {
> >> +       {UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
> >> +                  0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
> >> +       {}
> >> +};
> >> +
> >> +static struct tee_client_driver stm32_optee_dbg_bus_driver =3D {
> >> +       .id_table =3D optee_dbg_bus_id_table,
> >> +       .driver =3D {
> >> +               .name =3D "optee_dbg_bus",
> >> +               .bus =3D &tee_bus_type,
> >> +               .probe =3D stm32_dbg_bus_probe,
> >> +               .remove =3D stm32_dbg_bus_remove,
> >> +       },
> >> +};
> >
> > Just a heads up. With
> > https://lore.kernel.org/op-tee/cover.1765791463.git.u.kleine-koenig@bay=
libre.com/
> > we're switching to use bus methods instead of device_driver callbacks.
> > That plan is to merge that patch set in the next merge window.
> >
> > Cheers,
> > Jens
> >
>
> Hello Jens,
>
> Thank you for the link!
> Is it fine if I push on top on your "next" branch for the review along
> with the appropriate changes? I'm open to suggestions.

Please base it on the tee_bus_callback_for_6.20 branch instead.

Cheers,
Jens

>
> Thanks,
> Gatien
>
> >> +
> >> +static int __init optee_dbg_bus_mod_init(void)
> >> +{
> >> +       int ret;
> >> +
> >> +       ret =3D driver_register(&stm32_optee_dbg_bus_driver.driver);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret =3D platform_driver_register(&stm32_dbg_bus_driver);
> >> +       if (ret)
> >> +               driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +static void __exit optee_dbg_bus_mod_exit(void)
> >> +{
> >> +       platform_driver_unregister(&stm32_dbg_bus_driver);
> >> +       driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> >> +}
> >> +
> >> +module_init(optee_dbg_bus_mod_init);
> >> +module_exit(optee_dbg_bus_mod_exit);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
> >> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
> >>
> >> --
> >> 2.43.0
> >>
> >>
>

