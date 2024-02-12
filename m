Return-Path: <linux-gpio+bounces-3212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91393851860
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 16:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D28728153B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 15:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDEE3C6A3;
	Mon, 12 Feb 2024 15:47:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A973C473;
	Mon, 12 Feb 2024 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707752823; cv=none; b=VZClg4JyoD9JXdtbMQ5DpkJNQPA9RJJPHhCJodXE9L69KzAU0tFA+ehgqDiAVeL/IKacHsd0tSDxL10YfJx5Qs2EyoSMGhDh/gXL/TZoxgFzZgbVOvwk50nFHjLX5xBOS4ZOy1J0B0tbpRj23U0MsrUU79QX9p/d6huJ/FGDMrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707752823; c=relaxed/simple;
	bh=EDBWB6GBNi0W+iQmBNi/KkfFM/lm7+Z06g9WVGVP4+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv+HA+UnvgzjZWrZ1stlaVBfffYyGMbBoThdBZcBByGDjSjUAb7JpxjVoLkZuKY1adQc+WMXIShPDWY4DqhkVSWhde7WMxg0meolpBzLJnzDeWeTwfriHujw3BOw+wgr3pt6vVI5/WITjXr2TjPN0uxGoHPAdRlbIgVN0l4Yzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6002317a427so29713497b3.2;
        Mon, 12 Feb 2024 07:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707752819; x=1708357619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcZ5zMRrZ4nctrweDovJiA16frJyWR2Vm7uFbsgD4hY=;
        b=BcUo4TGHW6Rll68Zr1ON5TPxp2xVBm9D83ICJgYulanqpUzD3ZLgmdYT2qQjQFoYvC
         HAm11gBjhvTcuWWgNnK6G/PmBE9h7dD+yn/TqQzZ/K14mOXtnt4qQ3/o1n/4Z50s9wAR
         iM/L+9iNWBTD0ElHC6z56Hhb5ZEnjFFFZx6ALpqDzomd1QKEpHsiPMjhryl84azpvt6+
         ECCvaw5jSK8bO5rpetNu2N4vmr26twzqctDi8A/6SHE/6zt0Y6CCKrgig1qlQBaL6c0C
         pKG8CoB/TZLRhlZxdulcHPLdqws6hbO0jBK5nj2FekxAgX8fGbBov9eEA/i9TTbow2wK
         phsg==
X-Forwarded-Encrypted: i=1; AJvYcCUmlcGEgXU7//mnH9KZ9WOwqJQv/Xpktu0TpcvHyoiCpJzK9ChpUqcxBqRf9EY5XhWn/XOvS5oZU0h2D3k56LiGXsqzDjQURh3U2T1RUFowoMr7pgEsafWQU3sqaPPSkr7nKsZu1Xw9SEMCkQbL
X-Gm-Message-State: AOJu0Ywp3TahneOSt17i8m/ZURHsUli/3VX0spJ0+NmPAm/YC5t+iB5H
	zeyNl8NNXjlc5FGcjhqAjAX5PHfxGFC/20tBEK1J4Ox/M43XG1f4yWUqtAxzZ1g=
X-Google-Smtp-Source: AGHT+IE/QCRLEdA3BsPUS3TRo8cs3u5le2rA5YyPXg48zm9iyePGxLYlPuJDAoYtKw0AKmGNy+tIYw==
X-Received: by 2002:a0d:d609:0:b0:604:b8aa:2516 with SMTP id y9-20020a0dd609000000b00604b8aa2516mr5093046ywd.9.1707752819192;
        Mon, 12 Feb 2024 07:46:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHc/VJxVHhWzmrG1IeZ9h87PVXjmAUbIdouC8hQZ+7W6wGUd6reRYPe8NsTWBGCoVj/jXxskFdEa3yMC/eZj1yIw8mPYsYf7RBrb7AowNPMxACREogIx13IsULsCCd8Qs1aq8uyslKcUw/Fgua
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id t5-20020a81c245000000b005ff9bb7fa40sm1196630ywg.34.2024.02.12.07.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:46:58 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc755832968so2477492276.0;
        Mon, 12 Feb 2024 07:46:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4JEt2JTqU4FBHP6goaUmhZ4yli5okNOSclOqrxiIfwG+QSPmwzwJGPgumm0XWzwz3TYVkwoMsxTaJJVq37AAtxDoQu1NhwM+CvZ0B8fa1eg/oSttjiO5eVUN+AtTcsxzkhwVt8yaR8hwx07R7
X-Received: by 2002:a05:6902:1369:b0:dc2:2b0d:613e with SMTP id
 bt9-20020a056902136900b00dc22b0d613emr5819089ybb.10.1707752818564; Mon, 12
 Feb 2024 07:46:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
 <20240206135115.151218-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11269AA49D4149705AE41F1C786462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269AA49D4149705AE41F1C786462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 16:46:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVOddt6yego8yM7MNVL9JxHQ3n4yJ7Xzv+S0sMXtY-Bw@mail.gmail.com>
Message-ID: <CAMuHMdWVOddt6yego8yM7MNVL9JxHQ3n4yJ7Xzv+S0sMXtY-Bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Configure interrupt input mode
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 3:10=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > Configure GPIO interrupt as input mode. Also if the bootloader sets gpi=
o
> > interrupt pin as function, override it as gpio.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Replaced u32->u64 for pin_data
> >  * Added rzg2l_gpio_free() for error path for bitmap_find_free_region()=
.
> >  * rzg2l_gpio_free() called during rzg2l_gpio_irq_domain_free().

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

