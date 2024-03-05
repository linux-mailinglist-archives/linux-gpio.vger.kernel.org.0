Return-Path: <linux-gpio+bounces-4137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A925A871BF8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 11:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4C2285079
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 10:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEDB59169;
	Tue,  5 Mar 2024 10:35:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD05915D
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634947; cv=none; b=tJVkCpNeq9yQCZ3rPpnwmT3YxcuPA/wfKP1Ng3gf21+c3w0LVxn7BlIIYwbqWMt4hJzZ0sqbvRHdgydNJf4OWCmtwiB1UK6x9gK6Dm1mjVuBk1Wcsw1malVPX5ZwfLYWT98uGQdf3ylKkgNqA1AjsMIYYaGe2Isel9oW6pJfu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634947; c=relaxed/simple;
	bh=MTSlBlh6tfeSYdOBoclUM8pGJpGEfUVReR+9bIwWK5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exe2+zSbxTwT9kMD93Uh7V/9Xf+yss7jn/Abk+HyrMug0DbPPuhYy5UIrLim6BJ/Py3df6sVuocRYIUyAJMx751RjbgUbddinZeCsJ6ttZfjkJn6qmrhbPD0dNsgvop4iD4jFASYaoSEsuVASslrKe9PRa7gR9GBjDK1w7xeh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60821136c5aso38403847b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 02:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709634944; x=1710239744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uudnaUFZibFABfQYEMKVDL+mv6J6mBiidgMRYwMMqHY=;
        b=hiF0eBIroFMp5RlJLQ2wQKuGTtagiZX1zs9QnnecMIMadmU9WS7zhHFu6mgmhH3ViJ
         H+mtauTUj3dqjDvpiRYmlYM9HcDt6PEprjmI/K60VFnWtD1Cj40DB6r1slnezKkYCweS
         jQi7m3MFw+F3naXd+dJQrU+uUWfwZREBCIstSd5iqwpfzN5UXYkH7T6qSMT+TRG2umQs
         QU1RvLtUcC+tP5CSyzTbNDcbCXA7WM7n1D4pA8KcJdtCknjQ85+jvKIxmBkLbZ86wmhm
         QWZmu6p/QuPZLv3YA/ddjbhACr7Sq4C/05A5+9ld9JdYl6NDxJyQL/DUTlCTxim5wu3L
         4caQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/zlQxRBL2LqNejbc9piVgmXN4TKi+yqdRAPggvPeeJ9C5vQKUai8Dw/bxbuwBC7cp1HKfuug5E5EHrlXIKA85c0XqieBtwkXnYw==
X-Gm-Message-State: AOJu0Yx0xV3vArvJUxtmErYzRhqUZeh6BVCnxwQYHDq7XqmVX5oj/0F5
	JsFSfxfRTTWTEuE0I5y8wQhQ5998isHerBthxzTDBjLIz5ZMnhQueVVLm6xJ9KY=
X-Google-Smtp-Source: AGHT+IHIViCTvdynzMA1yPmIWOoOSBnJL+dUahyCS4+aI453tB4aPL9PrQvOuHmIHr9A3hphrSMxAQ==
X-Received: by 2002:a0d:ca07:0:b0:609:9f20:8a99 with SMTP id m7-20020a0dca07000000b006099f208a99mr6902398ywd.31.1709634944123;
        Tue, 05 Mar 2024 02:35:44 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id k34-20020a81ac22000000b00604198c3cafsm2380213ywh.61.2024.03.05.02.35.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 02:35:43 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60982a6d8a7so53346197b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 02:35:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuXT+f3xl5vu6Phby4lveU3ZA6XevHznjuLu7LJB6Yhz8SuUNl5B5sfE2KezGZsRpBSilpx0mC31KOiudRjKxyEJyXhG9yLGt/tg==
X-Received: by 2002:a81:5ec6:0:b0:609:82d7:a280 with SMTP id
 s189-20020a815ec6000000b0060982d7a280mr12420118ywb.11.1709634943491; Tue, 05
 Mar 2024 02:35:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-fix-aw9523-v1-1-97205563645b@linaro.org>
In-Reply-To: <20240305-fix-aw9523-v1-1-97205563645b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 11:35:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwVwC3Q4SgKer4ws3tktN2SmkB3JTmmBXy5oKdJEzsUQ@mail.gmail.com>
Message-ID: <CAMuHMdUwVwC3Q4SgKer4ws3tktN2SmkB3JTmmBXy5oKdJEzsUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: Fix I2C=y dependency
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	David Bauer <mail@david-bauer.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Mar 5, 2024 at 11:29=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> The AW9523 driver fails to build in some allmod configs since the
> I2C core can be a module, but AW9523 can not. Fix it up so we depend
> on I2C being compiled-in.
>
> Fixes: a4f15a8d4c82 ("pinctrl: Add driver for Awinic AW9523/B I2C GPIO Ex=
pander")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403050916.KBtE6eEj-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch!

> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -129,7 +129,7 @@ config PINCTRL_AXP209
>
>  config PINCTRL_AW9523
>         bool "Awinic AW9523/AW9523B I2C GPIO expander pinctrl driver"
> -       depends on OF && I2C
> +       depends on OF && I2C=3Dy
>         select PINMUX
>         select PINCONF
>         select GENERIC_PINCONF

Any reason PINCTRL_AW9523 cannot be tristate?
The driver goes to great lengths to support removal.

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

