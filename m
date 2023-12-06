Return-Path: <linux-gpio+bounces-1067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71F807027
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 13:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A45D7B20BE8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189AE36B10;
	Wed,  6 Dec 2023 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDDojk5n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EEA1BD
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 04:47:26 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-67ab5e015aaso24913766d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 04:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701866846; x=1702471646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4HaoseseFRfpAOsa7GPwOZAfsJ+SNvW7lTiyiT6xZA=;
        b=WDDojk5nnfqvjKfIagrNhoMnc0xRQ3ADDpucyZmznWEFnKzT6E4mtkS6ZoUNOPv5YK
         z5W4QtybCsVXG/FEwgWHHgNaoP7SxP6sD7uG2oeEVLnqBn3ilIV7NT/MHSCjBvCzqb6k
         wHDc6/iRGPujeEpNTH0EHxdeyAOMHU51Dfe2MG6HiWLUpBSR7huvfYoRTsMvyj/HNdV4
         CvK3qvVmotCQ8Pn3BG9BD0OwwDd7QLPjr63Lb4GLCtvRDttEnVL6zFBAtsuZr3ZhjqBt
         XylJugLZyzNerRrtq/RoXex2tRYsU6oC9gMclM9uBqQIXs2vg39OTokhIkUn3amUARED
         awhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701866846; x=1702471646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4HaoseseFRfpAOsa7GPwOZAfsJ+SNvW7lTiyiT6xZA=;
        b=EVZG87JxRyPyTGD8WZMZ1B22DiHV0LiVMxGSc4vRXsiS6UAwMNQVpASmiJpOPqceej
         dJUy8+NFt8O1Sp/oYLie5hxGKzLWC+GOszHe7/rDAJ33B+thn3GQ1FMRLQ4jJwd4UbBB
         yFK/UirceDW7BidzEp/mMlVMIvkX1XjkVv+K/dE1dokRqrlXQ4UgOYM/W5fSU6ETlUvt
         UTNaksADDRU50u0pspwu7Wo2DoOFCYiS6KwDXX7au1RWZ1Dnv13t7e/XIEShb8RLk7Zs
         RXfDDXhKkn1Rzur9gUwlqNWpKV5sE0fRIPWuo5QgPHwKJFMnytlU5B/TWkwsMmdY8I0X
         0eFQ==
X-Gm-Message-State: AOJu0YwZXTFxHSRK1F5CaAQdAyCSKgTZiJlHAd1oYfdbXAhTBCh9kRCd
	kuQUP7y1MejQyprr0ykDWguPtDfPg7P9fST5MIjQcA==
X-Google-Smtp-Source: AGHT+IHOfpL6BkZMMtxBr2eS7p+xlelrNL7BgzbEdDInmIpBIHdd4PBiyT6fKU1Lhyo6KKA5y6PSRh/1nAPz2rJNaUc=
X-Received: by 2002:ad4:551d:0:b0:67a:3967:4b09 with SMTP id
 pz29-20020ad4551d000000b0067a39674b09mr650650qvb.8.1701866845831; Wed, 06 Dec
 2023 04:47:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-15-peter.griffin@linaro.org> <CGME20231202004026epcas5p4d3947d7bb99e54f70ca37272cfdc5e55@epcas5p4.samsung.com>
 <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com>
 <000001da24c0$0b83aab0$228b0010$@samsung.com> <71972f4f-b5ac-484a-8a09-0b74bd7c623b@linaro.org>
In-Reply-To: <71972f4f-b5ac-484a-8a09-0b74bd7c623b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 6 Dec 2023 12:47:14 +0000
Message-ID: <CADrjBPqTdmEqD_4fcPqz0wBYqgPG8nPr2reXp5=s=bRRtLKXsg@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof / Sam,

On Wed, 6 Dec 2023 at 11:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/12/2023 02:36, Alim Akhtar wrote:
> >
> >>
> >> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@l=
inaro.org>
> >> wrote:
> >>>
> >>> Add support for the pin-controller found on the gs101 SoC used in
> >>> Pixel 6 phones.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++=
++
> >>>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
> >>>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
> >>>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> >>>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> >>>  5 files changed, 198 insertions(+)
> >>>
> >>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> >>> b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> >>> index cb965cf93705..e1a0668ecb16 100644
> >>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> >>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> >>> @@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data
> >> fsd_of_data __initconst =3D {
> >>>         .ctrl           =3D fsd_pin_ctrl,
> >>>         .num_ctrl       =3D ARRAY_SIZE(fsd_pin_ctrl),
> >>>  };
> >>> +
> >>> +/*
> >>> + * bank type for non-alive type
> >>> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit
> >>> +field: 4)
> >>> + * (CONPDN bit field: 2, PUDPDN bit field: 4)  */ static struct
> >>> +samsung_pin_bank_type gs101_bank_type_off  =3D {
> >>> +       .fld_width =3D { 4, 1, 4, 4, 2, 4, },
> >>> +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, }, };
> >>
> >> This is just the same as exynos850_bank_type_off (100% duplication).
> >> Here is what I suggest. Now that it's obvious there is some common pla=
tform
> >> for moder Exynos SoCs, and it's probably Exynos9, I'd suggest next cou=
rse of
> >> action (if maintainers agree):
> >>   1. Remove this one
> >>   2. Rename exynos850_bank_type_off to exynos9_bank_type_off
> >>   3. Use it for both gs101 and exynos850
> >>
> >> Does it make sense?
> >>
> > My opinion is to reuse exynos850 for gs101 (wherever applicable), same =
philosophy was historically followed in this file.
> > That way (using exynos850 for gs101) things will be simple.
> > Adding exynos9_* is not adding any benefit, rather it create confusion.
>
> I don't see much value in renaming exynos850 bank type to exynos9
> considering:
> 1. We don't really know the bank types for all of Exynos9xxx SoCs,
> 2. Exynos7885 also uses Exynos850 bank types. Exynos7885 was much
> earlier than Exynos9xxx family.

Thanks Alim and Krzysztof for your input.

Exynos7885 (Exynos 8 family) using Exynos850 bank types looks like a
mistake to me. I found some downstream code for 7885, and it doesn't
look like selecting a filter was supported downstream [1] [2]. As Sam
confirmed this hardware is present on e850 downstream, so 7885 and
e850 have different hardware at least for these banks.

As the EXYNOS850_PIN_BANK_EINTW macro is being used by Exynos850,
exynosautov9 and exynos7885 using a generic macro with gs101 doesn't
look possible (I have no way to find out these filter register
offsets, or if those platforms actually have these registers).

Therefore I propose:
1. For bank types that match exactly use exynos850 versions
2. For bank types which have fltcon_offset we add a new macro
EXYNOS9_PIN_BANK_EINTW like it exists in this series or
GS101_PIN_BANK_EINTW if people prefer that

That still leaves us in the rather unfortunate position that if
Exynos850 wants selectable filter support then it wouldn't be using
the EXYNOS850_PIN_BANK_EINTW macro. But I suggest we cross that bridge
if/when Sam decides to support selectable filters on e850. We could do
some sort of macro renaming, but what we rename it to though I have no
idea EXYNOS7885_blah or EXYNOSAUTOV9_blah.

@Chanho do you know if ExynosAutov9 supports selectable filters on alive ba=
nks?

regards,

Peter

[1] https://github.com/samsungexynos7885/android_kernel_samsung_universal78=
85/blob/android-9.0/drivers/pinctrl/samsung/pinctrl-exynos.c#L1696
[2] https://github.com/samsungexynos7885/android_kernel_samsung_universal78=
85/blob/android-9.0/drivers/pinctrl/samsung/pinctrl-exynos.h#L108

