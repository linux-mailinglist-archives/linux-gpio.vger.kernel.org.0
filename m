Return-Path: <linux-gpio+bounces-14385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0FA9FF396
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 10:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5692A7A10EA
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 09:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198EF44C6C;
	Wed,  1 Jan 2025 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4U+oYw0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2315E96;
	Wed,  1 Jan 2025 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735722683; cv=none; b=P+yU4s6bhLpkBwEivVqvQqtxG31+xnEHy2BuKy5fzXkmGut2fx3F0RHBVzmghBWB+ll4oDNVEudso8K1rcQw2IsWAUAXiiAZUks9cpFJbUINXSUPB9sCJQu3Gat2WN6TTju5AOZKwVdAhNNpuPcV/zA6r5VGmTIm39NbpeMN3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735722683; c=relaxed/simple;
	bh=2oMs8//KW+/UsKKCMEJ3pfOq5EeKZb+VZinp+Bm3FXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+8kzXVMt1/BjBR2UXhYD02Bq0Hc/k6dbdJoshwozPxmqTJTFEvTmuw0Bdk9xDpdzn5Rp4BEWWM7VV2G1G6HA8eIAisuVnJIFBuXhvA8L26tDnaBjis45A5k0YThBouF2PzT+xZNoe2DVuNFmEeWGdES8bBYYrfKZfKCltDEsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4U+oYw0; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53c9035003so10839881276.2;
        Wed, 01 Jan 2025 01:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735722680; x=1736327480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6Ak1nndFpa2BYohYKIMDuJuK8Xdv+pbjTqPkvicZUs=;
        b=X4U+oYw03xvRQBB4N4L7/aOnKTPOy55DP7wNYZKxOfLQI/UCeSDlT9UeNmhy10dqR3
         +AodWT+vhluMHvd2tcQH+ZYiZ9QpckgcZpa7Wnhc2rXvnwQvO7M3MNhfVYF6DdpdqSc5
         O4mCQysMwQ+56fhYsLMOSR34hg5zkq0693pQAaozylcVWDUhAmVJuwIjvK64kdS9rB6D
         c2SWpKzjGlnGtoQmdNuHH4IkmfhuCp5cGhdFRyrjMEXawCAXY07TgJ7tNyTQEfO8Tpic
         GMDVojqrtT7zKH7I1FGIs++MDG88+l+7jQkpdMYaTYQ+FjSLTexTpMa28LhW1UsXpti2
         elqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735722680; x=1736327480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6Ak1nndFpa2BYohYKIMDuJuK8Xdv+pbjTqPkvicZUs=;
        b=ILPfi9kgSQWlZzqLLXMC2jvfDkpLZ9feIHs7DtsOoqcGmYSwPMChh3dC5qX3/ot3sp
         Sef1vNbif4QIwO1cy7K1PuaORnV6UDrl/pY2Zt3wXlrkwFN0G2l7AJS6sEngvxtmOAnf
         n1OR3xp8B8XQke9WRrzflC4rv5HA9Gyd2b0yaABZDlcwto8QIwiDw4GDlHvtZWk25Wy0
         A6WXhS7PZccQ/5pOe3b9JPOejVWklBhVRTkFqq+lvY8g4ldBx7EPhCibI9dSbFWCc/L5
         U89G7I2e39o4T5kqHdxKQXSnvMFfp2erSdpE6QdW4Hq2hPG2zc/jqVp7iKDZB/yk6DOa
         SdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCJyugxRouPmj5YTPUQYVNcL+UAeb2WBjRLJQUtcJhbAMdWpuFp02J70bnbjVGkzuDCxFFIyogl+9C@vger.kernel.org, AJvYcCW3GYpT1Oszo3MbRQrTeuSOaV8PjsK4QbnfOQNAQw1j67JSuLI+zxCI6Ur60n0/XtW6YDJY5tS94+wnKG7n@vger.kernel.org
X-Gm-Message-State: AOJu0YxnPit8uYv4kirPaqXbTcevoALqZoJnIyT7CUZFRACDxRgUWVut
	9rAabaJAiz6MkBberzf+qI+jCvPDQXJ9v9mH70YyHUhMqLZ4bd5XAyAXBR0QVbFHRtZ7fK2ncpN
	GDlEOLA/KycRl2DubFOXyRsl9HTjXzn3UQWM=
X-Gm-Gg: ASbGnctNcSAld9mxDFrasMoZ+kbfBTNKSZQ26GL3J6EKrKkklGmZREmvi/+c7foBO3e
	/UMmHCve/qJfMYnYhZ55/AVVzjHbJLZYCZRentyUy221n6ei+fRndUFxcqHc03D6r/FlCaeI=
X-Google-Smtp-Source: AGHT+IGKouYjjJN74Hg1lLFd842DKnin0bEhZ+VIkA7xUmSu7qec3sUYknV430V/04XS2PG9Tt6dxRJwAx6C+Sc1pIg=
X-Received: by 2002:a05:690c:4881:b0:6ef:8c41:dee0 with SMTP id
 00721157ae682-6f3f81357dfmr304023617b3.20.1735722679892; Wed, 01 Jan 2025
 01:11:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225035851.420952-1-gch981213@gmail.com> <20241225035851.420952-3-gch981213@gmail.com>
 <csu3mg7nurpwxkr6drpz6xsw3dqn5ttdotvmfkfvrwpo3geedf@jos6rqxovqr2>
In-Reply-To: <csu3mg7nurpwxkr6drpz6xsw3dqn5ttdotvmfkfvrwpo3geedf@jos6rqxovqr2>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 1 Jan 2025 17:11:08 +0800
Message-ID: <CAJsYDVJhPdPZY9OdCr9K27Q-2YPmi7TAC-fNB8Cn2vQpCzJBog@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: add support for GPIO controller on Siflower SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof!

On Tue, Dec 31, 2024 at 4:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Dec 25, 2024 at 11:58:51AM +0800, Chuanhong Guo wrote:
> > From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> >
> > Add a driver for the GPIO controller on Siflower SoCs.
> > This controller is found on all current Siflower MIPS and RISC-V
> > chips including SF19A2890, SF21A6826 and SF21H8898.
> >
> > Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  drivers/gpio/Kconfig         |   9 +
> >  drivers/gpio/Makefile        |   1 +
> >  drivers/gpio/gpio-siflower.c | 353 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 363 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-siflower.c
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index add5ad29a673..fdc9a89ffbf3 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -637,6 +637,15 @@ config GPIO_SIFIVE
> >       help
> >         Say yes here to support the GPIO device on SiFive SoCs.
> >
> > +config GPIO_SIFLOWER
> > +     tristate "SiFlower GPIO support"
> > +     depends on OF_GPIO
> > +     depends on MIPS || RISCV || COMPILE_TEST
>
> This is supposed to be dependency on ARCH, not instruction set. I don't
> se anything MIPS or RISCV here.

I haven't sent any arch patches yet. The SoCs basically work with
MIPS/RISC-V generic kernel so I was planning to deal with it last with
some device trees.
Should I simply drop this dependency line for now, or should I add
ARCH_xxx to arch/{mips,riscv}/Kconfig first?

>
> > +     select GPIOLIB_IRQCHIP
> > +     help
> > +       GPIO controller driver for SiFlower MIPS and RISC-V SoCs
> > +       including SF19A2890, SF21A6826 and SF21H8898.
>
> ...
>
> > +static void sf_gpio_remove(struct platform_device *pdev)
> > +{
> > +     struct sf_gpio_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +     reset_control_assert(priv->rstc);
> > +}
> > +
> > +static const struct of_device_id sf_gpio_ids[] =3D {
> > +     { .compatible =3D "siflower,sf19a2890-gpio" },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, sf_gpio_ids);
> > +
> > +static struct platform_driver sf_gpio_driver =3D {
> > +     .probe          =3D sf_gpio_probe,
> > +     .remove         =3D sf_gpio_remove,
> > +     .driver =3D {
> > +             .name           =3D "siflower_gpio",
> > +             .owner          =3D THIS_MODULE,
>
> You sent us some old code with old code style, so probably you sent us
> donwstream poor driver.

I'll drop this owner line.

> Please clean it up before posting.

Do you have other specific review comments? I haven't found other
stuff to clean up currently.

> Please run standard kernel tools for static analysis, like coccinelle,

coccinelle failed on something else:

make ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- C=3D2
CHECK=3D"scripts/coccicheck" drivers/gpio/gpio-siflower.o

[...]
/usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file
./scripts/coccinelle/misc/secs_to_jiffies.cocci -I ./arch/mips/include
-I ./arch/mips/include/generated -I ./include -I ./include -I
./arch/mips/include/uapi -I ./arch/mips/include/generated/uapi -I
./include/uapi -I ./include/generated/uapi --include
./include/linux/compiler-version.h --include ./include/linux/kconfig.h
scripts/mod/empty.c
virtual rule report not supported
coccicheck failed

After removing ./scripts/coccinelle/misc/secs_to_jiffies.cocci, I got:

[...]
/usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file
./scripts/coccinelle/api/stream
_open.cocci -I ./arch/mips/include -I ./arch/mips/include/generated -I
./include -I ./include -I .
/arch/mips/include/uapi -I ./arch/mips/include/generated/uapi -I
./include/uapi -I ./include/gener
ated/uapi --include ./include/linux/compiler-version.h --include
./include/linux/kconfig.h drivers
/gpio/gpio-siflower.c
warning: line 140: should noop_llseek be a metavariable?
warning: line 222: should nonseekable_open be a metavariable?
warning: line 289: should nonseekable_open be a metavariable?
warning: line 337: should nonseekable_open be a metavariable?
[...]

These doesn't seem to be related to gpio-siflower.c. There's no
noop_llseek or nonseekable_open in it.

> smatch

smatch give me nothing:

make ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- C=3D2 CHECK=3D"smatch
-p=3Dkernel" drivers/gpio/gpio-siflower.o
[...]
CC kernel/bounds.s
CC arch/mips/kernel/asm-offsets.s
CALL scripts/checksyscalls.sh
CHKSHA1 include/linux/atomic/atomic-arch-fallback.h
CHKSHA1 include/linux/atomic/atomic-instrumented.h
CHKSHA1 include/linux/atomic/atomic-long.h
CC drivers/gpio/gpio-siflower.o
CHECK drivers/gpio/gpio-siflower.c

> and sparse

sparse doesn't seem to tell me anything about the driver itself either.

make ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- C=3D2 CHECK=3D"sparse"
drivers/gpio/gpio-siflower.o
  CHECK   scripts/mod/empty.c
command-line: note: in included file:
builtin:1:9: warning: preprocessor token __ATOMIC_ACQUIRE redefined
builtin:0:0: this was the original definition
builtin:1:9: warning: preprocessor token __ATOMIC_SEQ_CST redefined
builtin:0:0: this was the original definition
builtin:1:9: warning: preprocessor token __ATOMIC_ACQ_REL redefined
builtin:0:0: this was the original definition
builtin:1:9: warning: preprocessor token __ATOMIC_RELEASE redefined
builtin:0:0: this was the original definition
  CALL    scripts/checksyscalls.sh
  CHECK   drivers/gpio/gpio-siflower.c
command-line: note: in included file:
builtin:1:9: warning: preprocessor token __ATOMIC_ACQUIRE redefined
builtin:0:0: this was the original definition
builtin:1:9: warning: preprocessor token __ATOMIC_SEQ_CST redefined
builtin:0:0: this was the original definition
builtin:1:9: warning: preprocessor token __ATOMIC_ACQ_REL redefined
builtin:0:0: this was the original definition
builtin:1:9: warning: preprocessor token __ATOMIC_RELEASE redefined
builtin:0:0: this was the original definition


> , and fix reported warnings. Also please check for
> warnings when building with W=3D1.

I also got nothing from this one:

rm drivers/gpio/gpio-siflower.o && make ARCH=3Dmips
CROSS_COMPILE=3Dmipsel-linux-gnu- W=3D1 drivers/gpio/gpio-siflower.o
  CC      scripts/mod/empty.o
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CC      arch/mips/kernel/asm-offsets.s
  CALL    scripts/checksyscalls.sh
  CC      drivers/gpio/gpio-siflower.o

> Most of these commands (checks or W=3D1
> build) can build specific targets, like some directory, to narrow the
> scope to only your code. The code here looks like it needs a fix.

Would you mind sharing the warnings you found, and the command to
reproduce those?

> Feel
> free to get in touch if the warning is not clear.
>
> Best regards,
> Krzysztof
>

--=20
Regards,
Chuanhong Guo

