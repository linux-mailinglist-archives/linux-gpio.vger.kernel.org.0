Return-Path: <linux-gpio+bounces-7561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A190DCBB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 21:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71BCE1F23D9B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 19:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C2716D4F2;
	Tue, 18 Jun 2024 19:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pXN2msVV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099DB15ECED
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 19:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718740013; cv=none; b=Ojzpsz9TYm8UIuv+yrwFElh5anSUIbgbtku6tvzAnt8Isen8M9PdLjiq3pR9Pmn4ariLWekoD6x+N/70WsuICB43WE5392CMKQPi+dTVyTYOjy5qcbHaDQJus7GCLvTpL0tOvwvS9eQU7UG7kdctY4J7QgX5iIEbduTepDDoxiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718740013; c=relaxed/simple;
	bh=cCA6VLX62IDjCPZsqkeLgA2nW91IT5j8nl7XYymOaCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rr6ap8634tOHHdFuPwOWwlkp/csmNZTrjxp0e1KtRJywh4ZaUwHb+JOg8tWcYFrHlgjK/yZFxn3V1EDrBmJDqt99lMnclNJu3sktztyvbZ4SANjUNA6I9Gc64O++bqoCDmPzfYFNGcVveI28HaIbd3885yh5LtJT6JKEZHrtBR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pXN2msVV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso5732425e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718740010; x=1719344810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho7/Qs26KEYzkDAAbDAFYeryla1DX+NBsAS+13y4jlk=;
        b=pXN2msVVLJtSMxl9K4ff9tcFkr8F6WorAKurVHEJgUprvKZs19Cam06XJHGVNfW896
         vAtI5qUrZ8TvEW9J5kYqw2yMHx67FNttzk+YCVAnz4Ovo1iYUj76DuKOGrjWtQuGY1ag
         OnzB9Hzh6WI/xFm/VztfYI5OcRiUOkMEM5aUtWrvRIltW3aw2sa8M8q86c1OJOQ0PJmW
         wLnlHF8COmWDx53m4SggtmGSGBuqtHwkW3jiU9oePs5o3fGkebEV0Xp/mtDpyM6QVBxr
         75RUNtmcTH2AdbuGo/rpCNVYc5va8TC5Fb+rRShFjKZhd6ne7A4iJVl2FiZcRr3DpoEg
         62Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718740010; x=1719344810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho7/Qs26KEYzkDAAbDAFYeryla1DX+NBsAS+13y4jlk=;
        b=gow/iMZVFGIcbUdOujhobYKQjIr2P238T3cOJ7KAMt5nx61a+FBFkiU6RB2uR3jIZ1
         cFN8e21PG1PIBVIW7l+TXBlIFjOD8bwVUPsAjgPWMBuJxiESjys3zQRhMZt6txQNUZf0
         yASbODTqUsUOQ7bhK4/wFLyU4tJRchzuUFuEZBxnK9tFLj3pz62om1+wj2UZVeVWz0H3
         wi1kWIljbEUADC0BQdlSpoKYUGzwTxUSuH8sYkWflh69xQYSBjbXpnfspqvhV+JOe/NE
         GAg/TMkNLraOKQ57lAWy/QyUx2qGmDf6+n+K/bmWbf8sUeV3AmD3KZb3f2yNE4Kt7bqi
         gv/w==
X-Forwarded-Encrypted: i=1; AJvYcCU5oDuIHVefw0mt4av+h4VDznQZlaR+Jn3k8RfdgG44ybBNxaSjnl2pRfGCRSWAhw7NMowK+RHxssggaDrHALJTcYQtZPKS2s+6kw==
X-Gm-Message-State: AOJu0YzTEn0bHn2upXntN7JSS88/Thfdi3wMu7mgUrUihtG4vx6pWXdu
	n2YX/o4+bOB8Mt4+A02nYTyE6KUIhGc/JHHeLQqgfUdncc7EfUMU96hQ/aPaRGn2d+Xu1i4a/m1
	L9eIMpRDhTqPqN4QMf6gmqTpgL9jAorIwxiEL1Q==
X-Google-Smtp-Source: AGHT+IFJweTCkdsgLEObHJA+yL+W9iel1opmGVNUxb9kenTWp/3n7/A86NF6dmRjIE6Abrtq21WliDB0UVutHnR03wM=
X-Received: by 2002:ac2:4d84:0:b0:52b:5451:996a with SMTP id
 2adb3069b0e04-52ccaa3768cmr253147e87.31.1718740009929; Tue, 18 Jun 2024
 12:46:49 -0700 (PDT)
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
 <3h63msxchuuxqa5liufoivss4raqtzjlusjn7ufti5nyjkshcb@pqevlpuvrm5q> <CAMuHMdW5oiD93ng0fVotMKoGMavs0G3DV93GW6qEQVhGxLCK5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW5oiD93ng0fVotMKoGMavs0G3DV93GW6qEQVhGxLCK5Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Jun 2024 21:46:38 +0200
Message-ID: <CAMRc=McWEAx5v5BUyw_ZKcU_SxONZnkM-otge9HPRCP_z28nhw@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 8:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Wolfram,
>
> On Tue, Jun 18, 2024 at 12:54=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > I could see it using configfs instead of DT for configuration and iio
> > > for presenting the output but - from what Wolfram said - insisting on
> > > this will simply result in this development being dropped entirely.
> >
> > How do you assign a GPIO via debugfs? I only found the out-of-tree
> > pwm-gpio driver[1] which uses a GPIO number. But those are deprecated
> > these days, or? Any other driver doing this you can point me to?
>
> Do you really need debugfs (or configfs)?
> I guess you can just write GPIO line names or GPIO chip
> labels + offsets to the new_device file, like gpio-aggregator does?
>
> Documentation/admin-guide/gpio/gpio-aggregator.rst
>

IMO that adds a lot of custom string parsing in kernel for no reason.
TBH Today I'd NAK this interface and propose configfs instead as well.

Bart

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

