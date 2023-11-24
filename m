Return-Path: <linux-gpio+bounces-504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F37F86B5
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 00:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B5C1C20F25
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 23:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF593C699;
	Fri, 24 Nov 2023 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTf5m98E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378F71735
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:29:13 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso2052364276.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700868552; x=1701473352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsOhbxgo0w5vrLvqlyS+CI33FHpY1D06+ACp6sG/31M=;
        b=GTf5m98EgD+7w8yCztkXm+JckLfmdHG/JnmNR7ekvYqlqepF4pr7CUR3+tUK1G2bVg
         C8ptJVn8r/OnNcXlatY5uAxu24QA7Y80sPYDJgBqNrIYZapZyfDkKD3R40pI5xui5cQc
         cgFYra6+httF6E9KykWs048rdKSayCjKG3LxAwjJ/swZcdQzEB3WNfBF548ZAvxaSdy2
         7XoIW14ofBR0zwXuTr5OsN+vSQwn2shytnT1mGYogW5VmQeR4Mf3s4XF1OxS9GKU+9/M
         4v68LXpVLPaA+PBJav/oz7+DTp3cemLmhsFZbVJo2ZTQhZKC0w1UQGvQ0eEU4JRiMDF2
         LZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700868552; x=1701473352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsOhbxgo0w5vrLvqlyS+CI33FHpY1D06+ACp6sG/31M=;
        b=jL/b8KJBYOWhePA4SlSduDzp0hiy95lpwCEkDm3K0z/TaMyVvhJM45/MLtmXpruocC
         aWS3Ev9w/EnLOpMG8HM37ilj9R24H870RwyHyFAgnkZtoJwf6Mf4bGgYVCoTjGYch+ky
         uHyE17KsgY0H3W4qCgmp/3g15AhDh9s481IekzrQ01V8HCgxVYICEwVnImW76uYvn5B6
         /uom1aXJll8Qj8caVKe1jEB4Pfu3FVGLxkIus+a4YustiS4212czKhruO4PGymR3uNMl
         4cvSTsw1RYaUYwsQ41tnwZjY8zY4ZHz58kIHbaxv/vZef1SjBwBpiVfRFPMJyLShaiuT
         vVig==
X-Gm-Message-State: AOJu0Yw2W7znxI2eyDUDhC6bDVJfFRxhjlSQWEZV0ndY+rQGEOyVTIIA
	ycfwBqeJhehv5/PPngKAcZSnXa7bRXzifjlF9F6Vnw==
X-Google-Smtp-Source: AGHT+IHacgXTdMc3t9a8/JgK7vOiOb1nS+bmjqs0kfUuGY+kRG1kBJzz1yGjDpKpKdgkAOs/hXTjEcKqqFgReOEYS9g=
X-Received: by 2002:a25:400b:0:b0:d80:4533:9556 with SMTP id
 n11-20020a25400b000000b00d8045339556mr3605329yba.63.1700868552394; Fri, 24
 Nov 2023 15:29:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115165001.2932350-1-brgl@bgdev.pl> <CACRpkdbDny8X3WB_qJ4h_vbwrjno5ytAtNMgTeXg4jpegdUH2w@mail.gmail.com>
 <CAMRc=McZJzdj04Ckf_ygDhWNN2JcbTfY+yefOZSYx_nTE_Jpjg@mail.gmail.com>
 <CACRpkdb7QwWcq=mDa4y8bh_QLAFU+X9LCr0chrGVL-_9YE5P9A@mail.gmail.com> <CAMRc=Md+5N_u0QkL+OTc2xVQuxP0dZY-1GbrdGQqwhdJrv4Cbg@mail.gmail.com>
In-Reply-To: <CAMRc=Md+5N_u0QkL+OTc2xVQuxP0dZY-1GbrdGQqwhdJrv4Cbg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Nov 2023 00:29:01 +0100
Message-ID: <CACRpkdadxCYg-z5qqp_h+8NhPUy6H4x5Ev06Q_bi_fL16e95OQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: don't use gpiod_to_chip()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 8:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, Nov 24, 2023 at 11:01=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Mon, Nov 20, 2023 at 4:06=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > > On Thu, Nov 16, 2023 at 2:43=E2=80=AFPM Linus Walleij <linus.walleij@=
linaro.org> wrote:
> > > > On Wed, Nov 15, 2023 at 5:50=E2=80=AFPM Bartosz Golaszewski <brgl@b=
gdev.pl> wrote:
> > > >
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Let's start working towards removing gpiod_to_chip() from the ker=
nel.
> > > > > Start with pinctrl. The first patch should go through the GPIO tr=
ee
> > > > > and become available through an immutable tag so that we can get =
more
> > > > > conversions in this cycle elsewhere.
> > > >
> > > > Fair enough, maybe an immutable branch with all three patches?
> > > > Probably best to merga all three into both subsystems I think.
> > > >
> > >
> > > Nah, I don't think I need to pollute the GPIO tree with every pinctrl
> > > patch. It's enough to just merge the first one into GPIO and you do
> > > the same in pinctrl.
> >
> > Fair enough, but I need that immutable branch for patch 1 so I
> > can merge the rest on top.
> >
> > Yours,
> > Linus Walleij
>
> I applied the first patch (after fixing the typo in the commit
> message) and sent you the immutable branch to pull. Please apply the
> remaining patches to the pinctrl tree directly.

Pulled it and applied the other two patches on top, thanks!

Yours,
Linus Walleij

