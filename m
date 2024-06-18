Return-Path: <linux-gpio+bounces-7560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C887C90DC11
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 20:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88611284C95
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 18:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F76015ECF0;
	Tue, 18 Jun 2024 18:58:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E446426;
	Tue, 18 Jun 2024 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737107; cv=none; b=hoM3XCs8h02VWOQzYFZauD0kcdtxpvtf5ylzeQHjeMWT2/9wZ2YIlTZXfuCLUT/uZLPwMJIP5O2dowo5kpkL1kItjTtjBODzQ1mUvk3r5+arAcDMmKcT52oKvI3J3ndOwM0XDrZwYctGrEJxaBoXg84hb9KepXm0+CQ6/6nSCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737107; c=relaxed/simple;
	bh=k8EFMG5DMLKsNyQeGALNuSJ/BSvmDb2THX39JB2v2jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=OaAqV8kDyOCzmPpUnBxwzC5NQcnA55IL1SVARazIdaj9FFqXDAatkLRL8ACr3OYDwbaxkd1ICVeuKqfRH+hMTj9aDxSm6NIfHvAZwdgI3cA3stpl1x6zHNlAe5xqFEjPFPZtDttAvLiBGIimcvSI3Ua9Q/tdaDQPQ/PdEViln5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-632597a42b4so1266897b3.0;
        Tue, 18 Jun 2024 11:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718737103; x=1719341903;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+X8wf+uC0OjwHBa17rdEnSvQT0n3Fv2/cB2AKsMkZxY=;
        b=fpmbNHGZeFcGLNlw4tGMA5EfxucpfFdRIMI+4++Gy61zKopvQ+swLmOQ8vGLq0+btE
         TymZCMj9FZ/iOvuM8WlxfWOpOWqyAVz2W+8vocCppM1h0tpmeaJqI8a1lJPODukD92lz
         Gym/KSpilX6KGlIT8nlM+gKDSbqBHB+mZlu9mPnZ4HfTNXm7EavH4CVm6avylRPN1rk8
         J6d2PvHx5s8NhnD+gZRNugmkdkfBrc0ORgDBV8xKfwpvNrVWNfLoUhasHbP7I0RikRuA
         BOwyu2LRPFJ/yxNj0etQ2R1d9Jwl9eV8Z1pQpSvxF0AujRP87eJd4HVhUfN1TlSl6KK8
         0oQw==
X-Forwarded-Encrypted: i=1; AJvYcCWyZCE1WlZZDlo1zXEZprBKX56Dr6svgwWgYvmuZ7mWy+8KKS7v0veiIDmtRAWiO56LmBG60G/H+FpDgb6CcBeM1kcRkPGfHscWJHmvHt4Ci/HeWUJ6wPicZ+Vc6W8hvuSTJFK5CEJAuHmseMtim1rVhUB4Korj/rh9EfgmESMSW6LB42MYtfqNRRrKtgSYH6lSh8MtwIb05BbDr89KbSvhO3Bb+N2k
X-Gm-Message-State: AOJu0YyU0CATIAC2kBYaSwpgjHxwk7sJfecV1mp7+HOwYOQGhGnQhBNu
	/vjGI987UH6nOWfGTF3BV3SyxHKWSWzvwCxbUVg2DfxMCEazFArvBko8qhGe
X-Google-Smtp-Source: AGHT+IGHr/VtxA5A0u985IA92CRiSiD7/zYATm8ehyr5rsBrae5vS9IeJXXbkZJEKyDda5lX26nHew==
X-Received: by 2002:a81:8982:0:b0:62c:f782:ee1e with SMTP id 00721157ae682-63a87ed7484mr6665947b3.11.1718737103362;
        Tue, 18 Jun 2024 11:58:23 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631183d7d6dsm18585297b3.17.2024.06.18.11.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:58:23 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-63036fa87dbso1073557b3.1;
        Tue, 18 Jun 2024 11:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWccjhGJBDUH61T8+buQqEEx0WAHNu0/e2JIfXLnA/H1lYu/DP3dxVa+eNgZ2tFICmEItifLG7U6IeN4X5V9lyPprkwNbCd6c6RrfJQG23pipFnaHsCB8hvEQb/jGK9rnXcMYYpTBnladsvQO9JFtqCqnCSNKH5ODfoM2zv3sVX5RbW1FvBizSJ6NggFQOTRb2ErxQPV9HkH62zdfo4cM1exxcPqcr
X-Received: by 2002:a81:e245:0:b0:61b:e506:b0f with SMTP id
 00721157ae682-63947fc3d6amr27090767b3.4.1718737102803; Tue, 18 Jun 2024
 11:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com> <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <3h63msxchuuxqa5liufoivss4raqtzjlusjn7ufti5nyjkshcb@pqevlpuvrm5q>
In-Reply-To: <3h63msxchuuxqa5liufoivss4raqtzjlusjn7ufti5nyjkshcb@pqevlpuvrm5q>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2024 20:58:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5oiD93ng0fVotMKoGMavs0G3DV93GW6qEQVhGxLCK5Q@mail.gmail.com>
Message-ID: <CAMuHMdW5oiD93ng0fVotMKoGMavs0G3DV93GW6qEQVhGxLCK5Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Jun 18, 2024 at 12:54=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I could see it using configfs instead of DT for configuration and iio
> > for presenting the output but - from what Wolfram said - insisting on
> > this will simply result in this development being dropped entirely.
>
> How do you assign a GPIO via debugfs? I only found the out-of-tree
> pwm-gpio driver[1] which uses a GPIO number. But those are deprecated
> these days, or? Any other driver doing this you can point me to?

Do you really need debugfs (or configfs)?
I guess you can just write GPIO line names or GPIO chip
labels + offsets to the new_device file, like gpio-aggregator does?

Documentation/admin-guide/gpio/gpio-aggregator.rst

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

