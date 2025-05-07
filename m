Return-Path: <linux-gpio+bounces-19720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03AAAD696
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 08:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B433B0406
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 06:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B85021322F;
	Wed,  7 May 2025 06:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr5rA2Iv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A9B2063D2;
	Wed,  7 May 2025 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601060; cv=none; b=tVE/0s+g8YlVZ8uSnZTmn2C7kUMoA71nxlJCOb5IR3OC8Q6jzrbAMVwyIH74nkoKDMgz2wZxRrxxSG10WszLkKQoIu57zl6bqAb8HnGOkU9nw0h18hWVyhaykJWMIDc3FitVvUuAiZebxXJit542GT4gVYXdOF+uLSSk+0LrpxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601060; c=relaxed/simple;
	bh=uPboJtORJLTXZAEefZEjcc4REguT1i3TGxVcx273sNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFX6G4aHua9lAMqc5fEV8OMMF5ez+gK9tc/yYwQod3bD/Nqz9zKsz47b9m0PkiB4DVpr8fDi4bwDW+/FQONgfHiyIoBgjimbSkR39xO3fUTqV+86t0L4meaGipatyC603FqO33f9LcsjmqbHfaJd5hHbUik0r1NDfjZU+t4CiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr5rA2Iv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac34257295dso369932066b.2;
        Tue, 06 May 2025 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601057; x=1747205857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xamK371qeDgglo6MoBubskEqTznJCUNhPzrK1iwUBn0=;
        b=Zr5rA2Ivf9FCL0p4CPXLlIxuji+1IbOhUapMKbmTwR7/ruU8j/elJBuZ1jtKwcqWUm
         Kmwvmw7McjBv+vMOFOkZVIahk6ss1UbpjMauTk2VU/DPz267KXWQDfekPQ11mf13aorC
         iyi2vkIF/K1Hnkgq6McLXYk4tLQiH6EGZVmom8HT9RID9D0xWfD8WaVvB+sY3vH60lws
         j0Uu4XSMQ9mfgo3ZrIqzX1RQtIt6EEOgjZSZRs6Z49+a1w51VcFoe85Vju4cvny7CZDf
         MD0i7gN3smevHU32V/SCDLCuDtgW9SJAAuG54RADSCVm24ZSWC/K5SLk7eMsbKIluYvc
         N5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601057; x=1747205857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xamK371qeDgglo6MoBubskEqTznJCUNhPzrK1iwUBn0=;
        b=rceJOGxRB/sHlN/hkIJZXfA/Jor2jZx7NVi0/+LYYYOV1nlJDsZSL8eYcrNKL/RgFt
         65qI27ZMpC3P4k09QGDO6He0GOf5R6q1+V6me1Qt3eeWAIXUxpxSoTFNa6yVQHhHcCpm
         9dyO+XrOtHCAUobQa3GCs8aZzbd/ktj7MzSMp4D4zrHCt/yWLOf3sbjI3DAGL5cSugfQ
         mZ9I9sm7g044kBC1MaLBoXRIWfG3ekmE9xiR0Wub8s1ylrUkGXXkwtjEGvquI1RVDa1t
         fHztNa1Y6z/BQsfKzUul/trBmpiI6Bs+N2atRaADxEzDJ5qrfB7W8GtkwmagtOydFX0u
         PO6g==
X-Forwarded-Encrypted: i=1; AJvYcCWMLvGCc/zysTt8YYNV/CXwpfIzQgmbw26gvLJ3uWb9NTTxmZ8Vf7hq4Z2tUV8qK8PZOD3wm3Yh4BQH@vger.kernel.org, AJvYcCWoBB/v0ntFlxUE++qXa9iHsqUXoq1TD0gy6tWmbqr+QT/XUs2BdlKDutx6/KWzR9fPjuHGLDhkT1H7wAcN@vger.kernel.org, AJvYcCXZc2q817oq79epNQFy4svBxgeSATL2uumqK3Sgth06SNqpp4KNhKTLC49uygrFjRLqi28HmYK2jaBb4wi6kGGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwECC71ZhKFbU+7CX6Mo089Skrag//KuyVZ3+5kWPbyq8Gvb1NK
	oTPClJu3y4yIIfwqCtAlBzVhEDd7gtF+9Ht8d+GpF+7esCnIChs+c32MHOM8gvc2wT33oq/Y5/e
	L80e+/Yig4Bbgx7qB/JKtltIdp2w=
X-Gm-Gg: ASbGnctXl9Y5EMHor5zxo+r0ZlPvMIXze6qS8wMBltyJKYM0roV62jcu0+kv/gjxzPg
	jkyES8NzEmkfrEizKcMujSa84wRA9eaIb0fCtKlzDrbULnCvhit8Vcvgb5t6MS2jF56r/GQ/P2C
	7GpQn179OTzA0NlJhEIWTIsA==
X-Google-Smtp-Source: AGHT+IGI77F5aV03xw4q/HDB6CAuRWeWQEFqnds/n2CENsez5LXuhQv2OMhweTULBgv7huoEcYH14MKgqYabvNZ5Nug=
X-Received: by 2002:a17:907:3d94:b0:ace:68a5:ec50 with SMTP id
 a640c23a62f3a-ad1e8cd6aaamr232314366b.45.1746601057038; Tue, 06 May 2025
 23:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-12-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-12-3906529757d2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:57:00 +0300
X-Gm-Features: ATxdqUEyr2DC5DFowZNdUkHLnOYf7BYsyZqXfrppxWGAEJovaoI5Q4o1n5r63Dk
Message-ID: <CAHp75VfFnd616FiG8XP_oW4MeMBrqj_nmi0xCOGUj-LG1ru-qw@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
>
> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also as a mux or switch.
>
> +---------+          +--------------+             +---+
>           |          |              |             |   |
>           | PWM0     |       \      |             | H |
>           |----------|------  \-----|-------------| E |
>           | I2C0_SDA |              |             | A |
> Intel SoC |----------|------\       |             | D |
>           | GPIO0    |       \------|-------------| E |
>           |----------|------        |             | R |
>           |          |     FPGA     |             |   |
> ----------+          +--------------+             +---+
>
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each switch, has a direction flag that is set depending the status of the
> SoC pin.
>
> For some other pins, the FPGA acts as a mux, and routes one pin (or the
> other one) to the header.
>
> The driver also provides a GPIO chip. It requests SoC pins in GPIO mode,
> and drives them in tandem with FPGA pins (switch/mux direction).
>
> This commit adds support only for UP Squared board.

...

> +#define UPBOARD_UP_PIN_MUX(bit, data)                          \
> +       {                                                       \
> +               .number =3D UPBOARD_UP_BIT_##bit,                 \
> +               .name =3D "PINMUX_"#bit,                          \
> +               .drv_data =3D (void *)(data),                     \

Wondering why we need to cast here and there if currently we all use
constant driver data. Perhaps enable const for now and if we ever need
that to be modified by the consumer we add that.

> +       }
> +
> +#define UPBOARD_UP_PIN_FUNC(id, data)                          \
> +       {                                                       \
> +               .number =3D UPBOARD_UP_BIT_##id,                  \
> +               .name =3D #id,                                    \
> +               .drv_data =3D (void *)(data),                     \

Ditto.

> +       }

...

> +static int upboard_pinctrl_register_groups(struct upboard_pinctrl *pctrl=
)
> +{
> +       const struct upboard_pingroup *groups =3D pctrl->pctrl_data->grou=
ps;
> +       size_t ngroups =3D pctrl->pctrl_data->ngroups;
> +       unsigned int i;
> +       int ret;
> +
> +       for (i =3D 0; i < ngroups; i++) {
> +               ret =3D pinctrl_generic_add_group(pctrl->pctldev, groups[=
i].grp.name,
> +                                               groups[i].grp.pins, group=
s[i].grp.npins, pctrl);

> +               if (ret < 0)

Why ' < 0' ?

> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int upboard_pinctrl_register_functions(struct upboard_pinctrl *pc=
trl)
> +{
> +       const struct pinfunction *funcs =3D pctrl->pctrl_data->funcs;
> +       size_t nfuncs =3D pctrl->pctrl_data->nfuncs;
> +       unsigned int i;
> +       int ret;
> +
> +       for (i =3D 0; i < nfuncs ; i++) {
> +               ret =3D pinmux_generic_add_function(pctrl->pctldev, funcs=
[i].name,
> +                                                 funcs[i].groups, funcs[=
i].ngroups, NULL);
> +               if (ret < 0)

Ditto.

> +                       return ret;
> +       }
> +
> +       return 0;
> +}

...

> +       board_id =3D (enum upboard_board_id)(unsigned long)dmi_id->driver=
_data;
> +

Unneeded blank line.

> +       switch (board_id) {
> +       case UPBOARD_APL01:
> +               pctrl->maps =3D upboard_pinctrl_mapping_apl01;
> +               pctrl->nmaps =3D ARRAY_SIZE(upboard_pinctrl_mapping_apl01=
);
> +               break;
> +       default:
> +               return dev_err_probe(dev, -ENODEV, "Unsupported board\n")=
;
> +       }

And actually we can get rid of that train of castings by switching to
use the info type of the structure

(namings are just constructed without checking for the better or
existing ones, choose another if you think they fit)

struct upboard_pinctrl_map {
  ... *maps;
  ... nmaps;
};

static const struct upboard_pinctrl_map apl01 =3D {
  ...
};

...dmi... =3D {
  ...
  .data =3D (void *)&apl01,
  ...
};

board_map =3D (const ...) dmi_id->driver_data;

...

But since DMI will require castings, it's up to you as I don't like
the idea of having that driver data not to be const in the first
place.

--=20
With Best Regards,
Andy Shevchenko

