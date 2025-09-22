Return-Path: <linux-gpio+bounces-26451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D38B91583
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62F55423F85
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 13:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AE730F92F;
	Mon, 22 Sep 2025 13:13:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699F30C612
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758546807; cv=none; b=qK2I4peCqXePzGBonhPalkm/+RcNPwUMmZxoVCl483t09Q6rPQKeSAq2xAZs8TLJPgDgCbh3mUoVpARxkpETMDE/yDvRh3agrWMMXMpCbnCkcat8yeMSYkK6DIs23L7nPN6LEqkowYRx2+Cv4YSAJ0jNGI5CfbZCQifkmXFxQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758546807; c=relaxed/simple;
	bh=S/6XpFBr1IRtyZO8OA/cwmZ4o5NgtKwVhHfKm6CI0Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lij43oxNK0Fs2xtJlK5aeZVbBI8vPVOjeXoeGCC8cITikTm+POpSs6RLN8KY6wPdhhAjpHMjnJ5H6CKUOXmw05CnOlQFn2UNvbeJzfxwDWRngfAZNzKvHUQnbVejsj8pvJ1goNUj/zZkWPlxtzF5Y2evsXXlEYiULWWU82PzYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-58574b47548so1037405137.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 06:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758546804; x=1759151604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nutag0WU4swh2Ttkj8YGMxVYoDLOFgxz3Bs9L8eyAiI=;
        b=hCDh49ynUKuf7ey1m1Yr/c88d5toKdBixaNHZob+UON21L7AMaJdeHXsE3vxivF5lF
         HP3c2a4ZDA8SAHlSFqSsKfR6zdxDqRvd+lT1lTwXkJkKBzzKFlXHMrQTnPS48w5Bx5L8
         gd2BamahvDP2G/strYmP9sQ8FfsyYLdY8vZsy1yooUqhO12X/aRisJngbovy0B2qorkv
         R+Zw+E4zIZHOUA66yHRoM/H7/GROTxjX+Y+gtkTB1EWxNWOoBb//iO+S022pPuAY2caX
         PutLTSxypWpFo3hiNcJi/+ZnFqP4GEr2GGwPJQEa4iJUGmW7gSMl30xzG6gPHuNmd0Rm
         tCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlqEBkhCIjx9rdTFh5HL2lAsHax5fML+A89wE+p4flgKS/zn6dPIObZ6NluT6h7SKPbmkO+wi+qs8m@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnWYZfZddI8wDMF5vfeI7QK3mU1kqZV2crdffLlD5Xc3UKSEp
	CxddaUatszZ+xyCIKt85dVYbVvFM90NdntwMXbbgkaF2LBi3ZrWQxTXZ9+prtwT2
X-Gm-Gg: ASbGncvzjIk2gKzMyBLhfZ7o9l5TyDkKJO+E/M0PPrOuhYJRDks26z1AEkWLUHy+j2K
	QD/9OjNbdmSoyxvwNqv9TSKmMmxAQp3M4w9aJ05sxpnA4L+JDa3Oemt7HRCyCOrPQcxrZK1pb9s
	cLbpBSQP9VV0YqogD9r0obzKacP9NkJGB7zc9gSXktmLeRV1CvkBNJbms2k4CWBuCNC2HWMk8T7
	kIR7ydaAD0AwHf5jEgWpaQwfnJ8UMeZ4XRRJGSrlLWJo2oDpBa7pvbcBC6dAs8TLt3SZIkD1wsO
	66IYInMEAe+z4ykLMMu1Y7upBh/oHuZpaOGAiNn8JOuqUWoOuIcmgk7JdBDBYZD7uMUP5qtqeYZ
	TKdgX6+u4B8WLyzDAJ6RD0LC0lh3QFGOGfSCaZr/0lR8xG2h/gWR4uNo5eZGNWy/PXDv622Q=
X-Google-Smtp-Source: AGHT+IGl70K8hxE4QkIXFVy5FAVJ7G84+oPd1/9urLyhxQzBUsSLhvkiymvW9jED3ubbSy7/TcQtuw==
X-Received: by 2002:a05:6102:578e:b0:59b:ecd8:c0d6 with SMTP id ada2fe7eead31-59becf74cb4mr1737138137.9.1758546804128;
        Mon, 22 Sep 2025 06:13:24 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8f31bef21bbsm1072809241.13.2025.09.22.06.13.23
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:13:23 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso1562272241.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 06:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGi5IytdOS/WJ2s1ZIZfL98QbZ3HJMv44/BgQgV4AyPd8EjfacTUUPR14/gW/nDP3JS4/foSORlpXf@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:519:534a:6c22 with SMTP id
 ada2fe7eead31-588f802c452mr2930268137.32.1758546803126; Mon, 22 Sep 2025
 06:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com> <20250921111557.103069-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250921111557.103069-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 15:13:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCMPkh+D9G1rNJmhnyqOV3Ya5jb_VKjZEdVjysEqFVUw@mail.gmail.com>
X-Gm-Features: AS18NWAuG6KhnMhrzu9_2fL0vDBhmEtSyA2voBsifQw3rX27cbvUkygACfbs8sY
Message-ID: <CAMuHMdVCMPkh+D9G1rNJmhnyqOV3Ya5jb_VKjZEdVjysEqFVUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: renesas: rzg2l: Fix PMC restore
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Sun, 21 Sept 2025 at 13:16, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The PMC restore needs unlocking the register using PWPR register.
>
> Fixes: 14c32dc1f63d ("pinctrl: renesas: rzg2l: Add function pointer for PFC register locking")

I would rather say:

    Fixes: ede014cd1ea6422d ("pinctrl: renesas: rzg2l: Add function
pointer for PMC register write")

as that is the (later) commit that should have converted the direct
write to an indirect call.  However, both commits prepare for the
advent of RZ/V2H support, and the actual issue cannot be experienced
before commit 9bd95ac86e700ab8 ("pinctrl: renesas: rzg2l: Add support
for RZ/V2H SoC").

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

