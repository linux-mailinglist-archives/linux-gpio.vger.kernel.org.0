Return-Path: <linux-gpio+bounces-9364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151E7964585
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A758B29254
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 12:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C6D1B1518;
	Thu, 29 Aug 2024 12:51:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D41AE861;
	Thu, 29 Aug 2024 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935878; cv=none; b=bstQtF7+vCPkZbqTtctxZViXe53c2ndgYExDRuhSylYeY2hvEe0Mwitm8ZO9/Kom+uLOSl+N7vnw4Z9J3oom2xjYBOOKDXPAQmaWus8gDCIuBj9vjpWhphSbyNW824FI5RBxxAN7vG38ANk4BGlb60Uq832kOb7pzditf6QesXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935878; c=relaxed/simple;
	bh=TdlstDs9GF3GW1CQLJxbDiBEfsNrmEYh+0rBE8YH438=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oX0Ji+s7kfc8bcAGTHZmBV0mJDRCGmiPCTeW5ilnvjpCPhLIYO5Si8KFE5JeWVyQbppwuqy1a37/xSfVkeljyDXxIDv2LkzQwgKva9zZTQVifpSi+dtTps0qFzhgd7HSzguAWNFCir+AbS7DdSLsyIJtCyDT4OwHjqqf0VxoPB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e1161ee54f7so695624276.2;
        Thu, 29 Aug 2024 05:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724935876; x=1725540676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RaapfIZqaKH/yUWHMOaNDMRq75shGd+WNNlMTOiDx8=;
        b=WJsOfhH9irmM0WHdIPjzeCumywOW8UWV988Ix0WHsP+ACICGt/89QciFNVlwmXYUfp
         9DUFcUJzNwxfa7g6Gff6XBtZYFjsrJWBPv2ziBge9KEIfonm9LbWuWgEjHEZ2eYMIAVM
         /oTkLH3uwIh+LpACcPC2Z6zaCKOiV53xJYaWuBxuKSXwJQ8QI1Qph+l/dt0BYGuJAXrr
         0bUITNBjlzFTLgZpUQBLoaGcUq+o9S5nI30WXgaadOoxhdp1AFP3l612C+ILRlgDGRhJ
         5Hyxt/SPlsoCPNc9BTFrfLSJXuJ2iUa/dVVoyJHYbIXbrDDiLlWHSmlwdXs4WdyR9ZQN
         ah7g==
X-Forwarded-Encrypted: i=1; AJvYcCWidbVc7yL2yWu7pJK0J/cqJWtxNABTHap3x9aJnGFViLAzNkuOFlhYAjyS2QsijyNHVYSMhiCSNHrYD+bk@vger.kernel.org, AJvYcCXeLryRaq5ytcp9trLdFHalIU4E+w9ZRT9fRRUTdIRVvfe7Yew0lyjFIHQn5F/Uewji0nYQzffmNTq0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlql2F65WvSFS2+M5+JKyhXQE6pE1qL/2f8lj5dg7ARcST+Nbv
	cZRluZlltEBKm7b059ygOuDhQxKQ6E0TuEhipJpDl+ZEjE8BFqtnnaAz+JXf
X-Google-Smtp-Source: AGHT+IESphWkmRnT6/H9x41PpF8+hRufS//3uA9QTn+VPZY2/qMrt1QLU6hy1TXnqsIvD2rvBmFw0A==
X-Received: by 2002:a05:6902:1791:b0:e13:eba5:406d with SMTP id 3f1490d57ef6-e1a5ab58505mr2573707276.9.1724935875659;
        Thu, 29 Aug 2024 05:51:15 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d5daebd6sm2271907b3.105.2024.08.29.05.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 05:51:15 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1161ee54f7so695584276.2;
        Thu, 29 Aug 2024 05:51:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9N8kt0Zs0rbLRYLuXK3SUJTY/GokEdLrqhGinlmq9aeAxg/G+wy+/fBoc4yk0meIgG3jlKQC8keH/@vger.kernel.org, AJvYcCViND1QZNtHzcdFvSCfvBDszy8C8eua8blmZtD0xezVx/6e1NnbymV3/VJFQbaa+7Dfu/XC7dQOyPqKp3LW@vger.kernel.org
X-Received: by 2002:a25:ed08:0:b0:e1a:43fb:12e6 with SMTP id
 3f1490d57ef6-e1a5ae020famr2604026276.35.1724935874608; Thu, 29 Aug 2024
 05:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822230104.707812-1-andy.shevchenko@gmail.com>
 <CAMuHMdW2W+RsnBWdvxJJ7wOKCyM_162Hb1Xkd6id4h_74fzQrw@mail.gmail.com> <CAHp75VfyPQGXT9ypp+SducvHwOgMpCm-rCXSrQ=9-MCH8b+ZLw@mail.gmail.com>
In-Reply-To: <CAHp75VfyPQGXT9ypp+SducvHwOgMpCm-rCXSrQ=9-MCH8b+ZLw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 14:51:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX38O+TOhaK4_C5kh+11VwQTdnnSU=nhkSzdeJT=aMnxg@mail.gmail.com>
Message-ID: <CAMuHMdX38O+TOhaK4_C5kh+11VwQTdnnSU=nhkSzdeJT=aMnxg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: renesas: rzg2l: Replace
 of_node_to_fwnode() with more suitable API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Aug 23, 2024 at 3:17=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Aug 23, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, Aug 23, 2024 at 1:01=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > of_node_to_fwnode() is a IRQ domain specific implementation of
> > > of_fwnode_handle(). Replace the former with more suitable API.
>
> ...
>
> > > -       girq->fwnode =3D of_node_to_fwnode(np);
> > > +       girq->fwnode =3D dev_fwnode(pctrl->dev);
> >
> > While this looks correct, the new call goes through many more hoops, an=
d
> > is not a simple inline function.

[...]

> P.S. Also note, it's _the only_ pin control driver that uses that API.

Thanks for the explanation!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.12.

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

