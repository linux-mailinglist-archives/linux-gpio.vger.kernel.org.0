Return-Path: <linux-gpio+bounces-495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D490F7F854D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 21:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B7A1C25EA6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 20:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634D2381D6;
	Fri, 24 Nov 2023 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L+BTNSDh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2484812B
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 12:55:56 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4ac985ea4bbso742806e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 12:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700859355; x=1701464155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkHq276wBIZJF42T7edYR58TpHdTxmoC8MZexHWaDek=;
        b=L+BTNSDhnOWQFGlDzq6yzaxsLtL+G96FVJlqkXCdxQvHK94gmg19OXAe+lzpfjAMUk
         ytfgSH0JLhHl9MBko5D1YEUscY4uku/BLNGM1Gjkz3kUzMEMe3thRlj20BM9qCPL4igm
         53Aw6ZdSgfNmHFX0IgO+kwmOOVtUQhPGjQiCVDx71c+DCI4OV7sghtxiBqiHv0QA8hFM
         chOneN9LLKiiBd5ugWgx0vRcMhi7scgT62RzJqkOMywoyDHR220jlkbq+vyrF+kGwGNh
         YkCX18SQizTUW7Sza4qYmfqBoBod1Cc1negVmPoyEf6XbwjE0xspLaJt1v4kB99cnQYc
         /AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700859355; x=1701464155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkHq276wBIZJF42T7edYR58TpHdTxmoC8MZexHWaDek=;
        b=igkpseUWoCl+3brT3m538jmE01wqB9ObChcWK5bx3CrRer0TPnUg/loMM18Jv1sKTa
         IfVFHBgxHUv6tpjOVe0E1SEt6C3S4syXDjg2PybBmcS8dhsKkGKiETK7FRhQmzBpQFVo
         X//V1X6Y+BEXg7uOPWDnKIguTbXS7HPlrJ9gK0wS6kFu8cFcDVvvE3tHjUg+9hxLtJZ+
         gUOrzBK4uvZ2MbYwliffLpubw6Cv7oPhXkezop9X/qW0N8hGdcuqzOKAaVYwDdN6RWrR
         lxGeZcZkm6LlCofecCGGBDD1wTyP0ueNz6eLz+cU1m47vd4VX3kUHHozZ/OrpJurHTrX
         VC6A==
X-Gm-Message-State: AOJu0YwBti8++/jgEXkaUeXP0mY5/n+hz1LeJWXFxet+kjmPVTzzxbDp
	S+HRoFNXwtjAUFeNb3I+QK3gGzcC3zk4vdnok1DXAA==
X-Google-Smtp-Source: AGHT+IGyMdCS127hCfRuELIeiuKJJlRWy7zB1fLtO/z70biQOC7A9rJzvNeCJQc3kdlZAemSoi5T2jUmhPGUwwl0D2Y=
X-Received: by 2002:ac5:cde1:0:b0:4ab:fbff:a811 with SMTP id
 v1-20020ac5cde1000000b004abfbffa811mr4130200vkn.14.1700859354954; Fri, 24 Nov
 2023 12:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWDdGa-Zf06bteld@smile.fi.intel.com>
In-Reply-To: <ZWDdGa-Zf06bteld@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Nov 2023 21:55:44 +0100
Message-ID: <CAMRc=Mdfe9caGuJxNfL2jFT6_NKAno5bpskhUn=jNSR=Kd0THg@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Kent Gibson <warthog618@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 6:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Nov 24, 2023 at 05:00:36PM +0100, Bartosz Golaszewski wrote:
> > Hi!
> >

[snip]

> >
> > I'd like to hear your ideas as this change is vital before we start
> > protecting gdev->chip with SRCU in all API calls.
>
> Brief side note: If we can really fix something (partially) right now,
> do it, otherwise technical debt kills us.
>
> (Most likely I refer to the list of the GPIO devices.)

I will do it but I wanted to already start the discussion on the wider pict=
ure.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

