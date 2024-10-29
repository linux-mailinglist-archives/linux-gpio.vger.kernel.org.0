Return-Path: <linux-gpio+bounces-12287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264629B4C6F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 15:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48D7F1C22881
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CC5190486;
	Tue, 29 Oct 2024 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DajKmhy4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2E18787F;
	Tue, 29 Oct 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213170; cv=none; b=ZhVQPZTUk6cNH5WkhdjRwL+xCEMJkuHLqGi9AS1LqM7jJUTlN+FniUMFWAAYmKkC97vIUtfQTQ/gB8tKIV3yYTIhLGnMmOnsquYwwK/z/SWtDfJ5+4E89/GSc8zEngnYtb7PVJzqTW7rz9H1DTDlMt3tKqO/9KFdy0+Tfx2DE8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213170; c=relaxed/simple;
	bh=z9/PAFrKjs56x5xBh+utIKnj5bxjIYhNcsNJqIgpVgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FN680fh0DeIhv5tCuzVx01Zy/DJEEY+gAEfUbXMjLgsMoMGsF2G2edGvxmcCLf9ndl1Y20eJZziXPQjwbrBGOoIKfR40lNXiZKVOYmiE4B9GpE9VX+hzPYhgnN7fxwAebKx0kX3PRdicwSEroiGz0TDJbFHQiQU9z7KZY7HQQ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DajKmhy4; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-84fcfe29e09so1513034241.2;
        Tue, 29 Oct 2024 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730213167; x=1730817967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9/PAFrKjs56x5xBh+utIKnj5bxjIYhNcsNJqIgpVgc=;
        b=DajKmhy4i+f9SdfWncTbdgmm+A2HcsoAwp8SZfUvNESe/qdc0P89YiZyHQWVO9r51y
         xsJyphL8N7SDK1rQTJRqft0V7TKsbURYjzziTJEPkUrFZg3qbRNVjIq0DqBtJhrmF7pW
         7nEBtkMdCo2Hj3d2uRCS3ltO5luAs5zJbmffZPE7oWJEhRdazF3L3qEmUcK6VP0cvApT
         AJPo7VlOuyt6FLew1JIdsSgzc8/gRsF0wyw2vrnfoI/E+fFkoYhcUltF9v+VwD+bPeBh
         4PmO9umIMYudoX6AJbzpZnusddh/bz/rJw0BFPgJPvJlgF7ySrUjpVHzs1dbr9ranUcZ
         TMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213167; x=1730817967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9/PAFrKjs56x5xBh+utIKnj5bxjIYhNcsNJqIgpVgc=;
        b=wy44izXyFWr+QsLxmmMWdTrh33vA9U851fGxbdFsyPqsaYEawau5fim4rScqY0NgfL
         Qk0+txoZnrcR3Z0m37DxQ4UGgwDAMAzYLcgPa7BWvmqgFsbixa9Ofkv5aOe3oM0y3qon
         jLNEbNeWomgTRiVESR8UrEyb0RYlbnT2CcGGYgc3tvJ5XEX85WdQtXTYqFCYFX763gbB
         XI5ghTWI5HrpCOvcPbwjwpMIBmqFhU0d8w/G/y0YPeW1HTw15VS8u4doDJ4ZJMi0FIC6
         d7iGUh3YOgM71chVRNE4cBUb9dx//vThWFMQloiYgEBtlJdV9yC5TxvpcFgm8lx4TBck
         nBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0rbn8YRn+AGWyHypjKsx6uHgHUzD8vGaoPaRY+zQHTOrpecsWQ86OZRu3lQMxGJBdUhFlp3eRvFeACc6HyoYaCN8=@vger.kernel.org, AJvYcCVHFLgWiDdjdE/Dr6FLV9CetaxpnSZJKBvwVs0Me6pB6/w7fS4rHF93QFLXT35UsKTu7Zam0xGlqwSF2meP@vger.kernel.org, AJvYcCVgRI/x7c+qAARBgcNtMYy56gEB4DmNkLo6ObEspJtLGMosuCJ7ooI8mymkBB5IUGtnqvbT5eVA8uGuLg==@vger.kernel.org, AJvYcCXxRfn53dJgQwKv8WTEuAfHbpgTmSkSCxOnoyXFaKyEd07OuC5KSeYOOIseD2qUIJriCCRucIgxzJoh@vger.kernel.org
X-Gm-Message-State: AOJu0YznS25uiUvhX2Qn8AOblMsXJwKsdplsTyps75taL8jffKqtyq33
	2YGuznhwY7IeuWwtnxyGhlGZrbIFVQ/f2RkW3arkynEYJnXyOQ2dE+xnynTOlNjcvA1eRKFYfDL
	qdQV8ylngEUIOvahdqeyg4aJ2hWE=
X-Google-Smtp-Source: AGHT+IFgAm+Gj69QV8yDPvOm9jQHfY/PanPH41xd8pyiyekJrATHL/AQwttx7j2NsE9p/1nZPlW3HSoe8KCFEsmS/1s=
X-Received: by 2002:a05:6122:7cc:b0:50f:fe39:a508 with SMTP id
 71dfb90a1353d-5101523f155mr9806883e0c.11.1730213167346; Tue, 29 Oct 2024
 07:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <1b5f9e16-4c82-4093-8950-12188b662c39@tuxon.dev>
In-Reply-To: <1b5f9e16-4c82-4093-8950-12188b662c39@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Oct 2024 14:45:41 +0000
Message-ID: <CA+V-a8tDwa3ZYAwZi=-cDH1f5cuJJ0EHP3Z9W1o0adKHsxLEnw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] pinctrl: rzg2l: Fix releasing of IRQ and status
 reported in pinmux-pins
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Oct 29, 2024 at 12:37=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@tuxon.dev> wrote:
>
> Hi, Prabhakar,
>
> On 25.10.2024 14:49, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series aims to fix the reporting of pin status in the
> > `pinmux-pins` file and properly free up the IRQ line when using a GPIO
> > pin as an interrupt via the `interrupts`/`interrupts-extended` property=
.
>
> With this series, the Ethernet PHYs IRQs switch to poll mode after a
> suspend to RAM cycle. I've added the logs here:
> https://p.fr33tux.org/3e8193
>
Thank you for testing it on RZ/G3S, I'll investigate it further.

Cheers,
Prabhakar

