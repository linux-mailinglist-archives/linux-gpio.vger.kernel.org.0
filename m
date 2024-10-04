Return-Path: <linux-gpio+bounces-10812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93C98FDBF
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57C16B20EFC
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE450131BDD;
	Fri,  4 Oct 2024 07:23:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25476139579;
	Fri,  4 Oct 2024 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026594; cv=none; b=SPrNkiBTRuw5KbU8lnRq9ZRf1JYG/UAGThYJ1eLnbJObqKjmUvL/UHMKmY8dTOJipJ+RnhG0AQZTbbCxse5uk/LHYct1U0VNusFK6y2OLRhaKe8H0eFKfKCUqwGtbOrRLKi4Dy3+Nuh4XlWUwIZcd8/iXh1KjPnzGBUDjakLmWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026594; c=relaxed/simple;
	bh=Hl4u0Th43hF2MbsKtw/2elvkoII+rYvDW85vcCaOIag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOVGaxmW7M43kYIAUZU6/ULeNtcoM5AnB4yBxlQsh/krfT1TXKEBcNuTzBlF3xwmprZduVQsaIt8GhVGprFN/pg6B5SYMSeKsdtKDsPV6wx1p2Lq2XWl9bdCpigTDs9oAjk8V/ImLpRcsNZE6jZVbYYGUZJ7GHOtX0t6tUKA6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2772f7df9so14879827b3.2;
        Fri, 04 Oct 2024 00:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728026589; x=1728631389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BitaU0i3Fe9ELNWORBY7TZc2nikkKIP92O3aWDApq7k=;
        b=qmBxy2AJHYsDaw5FfHRPoj2eEmZhDpiG4H4GvArd9DzhBTC85RJUwngGxmyjSo8VDA
         dtI9itjiL42eI2uOaV785a/JjR6BJn1Gb9iIEojmiunouFP+Ua9HJTs28ImXtYt2/nHi
         emnb5Dw6irmmmNesbb6gQN8t5b0AhTkHqtXoYvmuhYiZUZ5D84LFo3Jy8q1ofqDA49UL
         7Hf4obY4XfeJB+BsmopoDSC5y7h3I7i6LI+jfP0nh5lSAZXyGbCICODDQd1Y5aeWkjaJ
         DLUoIy3rH5nEM6TEklwvZsKFQ6V6GON4dAp7MRZnreCmmX1qDakRvZ7sxlhJtNcajuTD
         0FiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkmrc6kP71LbSI/JBSamELRCjBNGiPLuGPMXX1NPnLBA1WBzr7xlQmdFrnwCXL97HpuMxBqmscfd2A@vger.kernel.org, AJvYcCWEAoWk8x5uvGdw5lGBYftoIRj0fdgVdUWrooOzuKvs86s7patdWzRkv3ZCKmofxUUb24d03HRhQMvLca2YMhn8ngQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjQ5YNTbhwYTr5JceelyAlPUBKtOwF3S0Hg5ITXrVO0FKOinF5
	seIJ31e7gP7eVgWBziB6wnvFlJFQMPlzrXkb7r1ODE73YhfyP9UMVJ0kvp1v9Ro=
X-Google-Smtp-Source: AGHT+IHWujPZqKnPiK6jLCeYYfd56y9UeSskyRivin/TgddIk9UbxXcr7e5Ofjt059cJr47kHq4ASw==
X-Received: by 2002:a05:690c:6610:b0:6e2:a962:d80f with SMTP id 00721157ae682-6e2c6fcb63emr14919347b3.8.1728026588753;
        Fri, 04 Oct 2024 00:23:08 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbead375sm5561537b3.51.2024.10.04.00.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:23:08 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2b9e945b9so12857137b3.0;
        Fri, 04 Oct 2024 00:23:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeQ9vMsyIM7cEML3zSDbIe9/FtaXc1hACjKFAqvdZA9BYcDMHvBJsYYjgR4xAHPUQyGrvYOJP6ZZhh@vger.kernel.org, AJvYcCWzAZbHaCRwxRNBESGLCH+3uSmYI8KxdQukQnmsEfM59a0gBEbj2V4knH4ki2Z0jQtOaB4COxLLr+Nv8SPsWj/+w+c=@vger.kernel.org
X-Received: by 2002:a05:690c:500a:b0:6e2:c3e9:dab5 with SMTP id
 00721157ae682-6e2c7036f5cmr13488957b3.23.1728026587795; Fri, 04 Oct 2024
 00:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003082550.33341-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241003082550.33341-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:22:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4hL8P+LFtvNC6b_hUKekXhWuTXsaz5sqvGyGcB_gdfA@mail.gmail.com>
Message-ID: <CAMuHMdW4hL8P+LFtvNC6b_hUKekXhWuTXsaz5sqvGyGcB_gdfA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix missing return statement
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 10:26=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Fix the missing return statement on the error path for
> rzg2l_pinctrl_register().
>
> Fixes: f73f63b24491 ("pinctrl: renesas: rzg2l: Use dev_err_probe()")
> Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Closes: https://lore.kernel.org/all/OS0PR01MB638837327E5487B71D88A7039271=
2@OS0PR01MB6388.jpnprd01.prod.outlook.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Fixed mail id of Nobuhiro Iwamatsu in Reported-by tag
>  * Replaced tab with space charater after return statement

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

