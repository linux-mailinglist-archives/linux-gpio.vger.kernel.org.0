Return-Path: <linux-gpio+bounces-17495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411CA5DB96
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 377191899A38
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2396B23A99A;
	Wed, 12 Mar 2025 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUXOkLmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB718D620
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779080; cv=none; b=T+VR5qH651c0gLQGD6qFBHhxSdnPywkvKfIvqRF0oMXMHn6SUyMlB0B/uDfBD5BcnjOztLEimqTanFkGdKOjLtEqhBIKmuF4q0/MO1lhi+LyK9U0MdHKH5yqBD2ytlFeUSLe9KXNHpTV7vJWJBOtClb4RitszltbjNpobJT1pDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779080; c=relaxed/simple;
	bh=LamZ1dekJFD1CplIqMFq82A+Hivmj1FNR9Ba1K2yv3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7gzwpOnne44BQkBmd7IBF9UIO8ZUPEJnTvSdt/UXe5GKXZzEx07mCVqCpsfJPJlWy48PCNauqnofupJtj0or2wppkbu9wpIBDgZAeXlYWiogwitWrADG3s1MC9dUbXi83OLTNzW8rnHdT8oe+DxR+25BUyI5yejxtUSRdDFyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUXOkLmN; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7272f9b4132so4251130a34.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779078; x=1742383878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UdPvnPkDYszULhre/XOAdt2THz5zT2TlDbP/t1A4yE=;
        b=bUXOkLmN9a33mGpf9s4rT1BooLhOYIPBOVmm6ayBsCc0+1CAqb+WjfNank8ls8vxMb
         WaFR5mI8j+j8hvhAlCrUt9qBwj8rIXWzd9yEOLErhbwHgJAQTJ0qZvLOwWtnFdO/WgZ5
         gt5PGqyE557M3IXeC3q/H9M4ATmk3ee5PMbMeZPBSQJ7wsIFLRtQjkN6X5SXcEY12wq7
         +X5C9RXZama5wC8l8XpriL5Eshd/BvLONvohndp54syjOn/mykX+nCPBHgag44g3xdE2
         45JWE3zGYbDWURwuKt//aam8PcCTiRaLFp05Ksht27kN4XF0d71BxWF92mtex7zS8+Ki
         TC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779078; x=1742383878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UdPvnPkDYszULhre/XOAdt2THz5zT2TlDbP/t1A4yE=;
        b=QKrGtHWokAvKsLAvQNwuY5jShdZI6jucL1NnucBoA41xH1gcYYQKCjPd1CHed3j38B
         DHf+pGvk4bJaZHB70gwuuS/UhQQ8hEgAG8oP8WEWPSF3mMA+N08jj1sC69nAzKTvkfUp
         eUpapIh0KR1yBJJ25uXBb9a6fHofzLeWjtoHxKVonZlSOnQorerOwDiArRxpvJjGArbH
         zk0CHCNYcT3wP/kftvnSuieXzfCbY+5XhDbHzE9c1J66NI1RJYRnVumgy4zZJ/Dv33kM
         8K8GwrZeAZ3qiohevcB2S887rc09psAn8Ir1qClLqfstZt9EbCkfHV2JePZSoo9DuUFC
         61Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXOnWk7N3kYg+yspjpkBc7C+m0l2R1D+mjf4cmsnr/N7We/HViXkbiwGodnkwGeH/feQIStZaXB6IVs@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXPj138v1xU0mJs66Nnr8/8/wywnldWK47cBaDxAONDxwJvd3
	9eFYhuaHN/IlHJ7zUKbafc2euqfJZB1kCti4+Do5xWhCSJ2GktxtmY3lW4urKJOpt/b2Z97r6cb
	ZpgteschWnnjsB8XP8Ihu99bapZW8mda2PWGJWg==
X-Gm-Gg: ASbGncuoFbkeGsiPEnsMdFE9Cvyu7TbHOE+s4rI5XVVS3DOQxF3NHLPIbMEAmdrt0L+
	DwLWc85zx45SBtqu+YXAicVpJihRejvmor4+JfT2YpSD5xsywHec48U5+SVze1EGEkJKs0SX3yS
	QhakG50XwnAl/mIdWvyOZv7ms6ICdc
X-Google-Smtp-Source: AGHT+IHpN3V115z284qmxaOdgGA4PwV3v/6Lpfa9pDfmxTKlcBbQ43+xR982OzrJIgzm+w3NL49THbQiezCdr3Q3kYQ=
X-Received: by 2002:a05:6830:91f:b0:727:2f79:ce33 with SMTP id
 46e09a7af769-72a37c6a7damr12652067a34.28.1741779078312; Wed, 12 Mar 2025
 04:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-3-2d775e486036@linaro.org> <59a1a6eb-d719-49bd-a4b5-bfb9c2817f08@kernel.org>
In-Reply-To: <59a1a6eb-d719-49bd-a4b5-bfb9c2817f08@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:31:07 +0000
X-Gm-Features: AQ5f1Jq8qDRuo8RWVbqyC-4s6dvJ3zqh5v94onY3xAq0EKJNYhbmQXeDH_scC5U
Message-ID: <CADrjBPqYoHckqr43y1z8UtthZ9DOG15TJWSv_707Jbyf1yforw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review feedback.

On Tue, 11 Mar 2025 at 19:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/03/2025 11:29, Peter Griffin wrote:
> > gs101 differs to other SoCs in that fltcon1 register doesn't
> > always exist. Additionally the offset of fltcon0 is not fixed
> > and needs to use the newly added eint_fltcon_offset variable.
> >
> > Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configura=
tion")
> > Cc: stable@vger.kernel.org
>
> It looks this depends on previous commit, right?

Yes that's right, it depends on the refactoring in the previous patch.
To fix the bug (which is an Serror on suspend for gs101), we need the
dedicated gs101 callback so it can have the knowledge that fltcon1
doesn't always exist and it's varying offset.

> That's really not
> optimal, although I understand that if you re-order patches this code
> would be soon changed, just like you changed other suspend/resume
> callbacks in patch #2?

Originally it was just one patch, but the previous review feedback was
to split the refactor into a dedicated patch, and then add gs101
specific parts separately. The refactoring was done primarily so we
can fix this bug without affecting the other platforms, so I don't
re-ordering the patches will help.

Thanks,

Peter
>
>
> > Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes since v2:
> > * make it clear exynos_set_wakeup(bank) is conditional on bank type (An=
dre)
> > * align style where the '+' is placed (Andre)
> > * remove unnecessary braces (Andre)
> > ---
>
> ...
>
> > +void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
> > +{
> > +     struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> > +     const void __iomem *regs =3D bank->eint_base;
> > +
> > +     if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> > +             save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> > +                                    + bank->eint_offset);
> > +
> > +             save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_O=
FFSET
> > +                                        + bank->eint_fltcon_offset);
> > +
> > +             /* fltcon1 register only exists for pins 4-7 */
> > +             if (bank->nr_pins > 4)
> > +                     save->eint_fltcon1 =3D readl(regs +
> > +                                             EXYNOS_GPIO_EFLTCON_OFFSE=
T
> > +                                             + bank->eint_fltcon_offse=
t + 4);
> > +
> > +             save->eint_mask =3D readl(regs + bank->irq_chip->eint_mas=
k
> > +                                     + bank->eint_offset);
> > +
> > +             pr_debug("%s: save     con %#010x\n",
> > +                      bank->name, save->eint_con);
> > +             pr_debug("%s: save fltcon0 %#010x\n",
> > +                      bank->name, save->eint_fltcon0);
> > +             if (bank->nr_pins > 4)
> > +                     pr_debug("%s: save fltcon1 %#010x\n",
> > +                              bank->name, save->eint_fltcon1);
> > +             pr_debug("%s: save    mask %#010x\n",
> > +                      bank->name, save->eint_mask);
> > +     } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP)
> > +             exynos_set_wakeup(bank);
>
> Missing {}. Run checkpatch --strict.
>
>
> Best regards,
> Krzysztof

