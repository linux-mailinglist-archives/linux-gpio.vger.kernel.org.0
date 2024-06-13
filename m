Return-Path: <linux-gpio+bounces-7433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A59075FA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 17:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 474321F233AB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161D014900F;
	Thu, 13 Jun 2024 15:04:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA653E31;
	Thu, 13 Jun 2024 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291072; cv=none; b=ma8RUc6ZG2hyayOMh4LHWVJ2wMe5jJNNdBvS1dZJ8MGYbTVcbD1w0yl7I2ySWaDxXoS+LtJtmi1AMAM+j0t1rNfvmaphK6qSFRhh6BCP85BJc8E8dN1BwI2+rNwzqVx1anBP/RLGhrHKwTANKJuJFM1zBUmgpy8ZRyxEN4HpRDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291072; c=relaxed/simple;
	bh=WmKERP9tj4pLULI6MBL8WzHes7imyUshvMK7Cdmy788=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueO6Kw0n5+TvuuVQkcQgXJduk5aaF9OkhFbmzSPHNqyyAqWPTvpP/WMsQog8WXebNmZftrIN1BvDQDipahnbyExRKVXoGumMXCVigpnJ0aUnN8+iLOf/SYR3p1S91c0whXhUQLMmj6FpUuWFJYGPNishTsgWNSWokFD0EAzOdo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25545664f37so493369fac.1;
        Thu, 13 Jun 2024 08:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291069; x=1718895869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbNjy99xrdFjhXXMSO2YCV4k0Oh2gSCP2Gd7J/d4sfs=;
        b=akE2HzUlVTeijBfuG4nCDUjCInxqAt0k4sBDY7xIQKjkTGDsdv8qfSEJ10uBdUPNeD
         tmqQawgSsZtC8MJSJXocyy9mX49Cbdk6+L5CbXfv3Mtpdd8fFOgv+KPkuwehhmsi0YJC
         fW9oNwufb0pbJ0gMmKKMxp+0j0vz5nQwEDaxy9AEB6UWvFCEowO5zBM5tPytiWivYEEP
         0BVgWeNeGWc7UXmMjwtXRcPlJGGibqtx4qYvBl8KKcBlp960c+Hzc41w6/l6htwijyrn
         aV/jdMadlbzVJU2L7wzmJWD+983/RaHobpuEGVGW89FmloIZiCO7b0VfU23Cv/pp4gIS
         lyRA==
X-Forwarded-Encrypted: i=1; AJvYcCXq/XpbGUTuJkf0Wajsn+Cy1nyimbqtjn7h7DCFP+DbiK/+QRmT7eCQUaZWOCJmJzM3nYj7G1Y73V52dlowpko+fQl5Fl6Jvu9aOAodTusY4H0PlgFk0sJGsIV4B/UqCZoMiP4LwxX/F/OgywZaYahIz/jYK10/LNdxLTjtj2RbBFFWEv2r0K/mqK7j4M5UVH0aN0YF3AHPpnUKMdPSWsp9WT3Ly1bW
X-Gm-Message-State: AOJu0Yy7zDKTzgy8JvquO90H+ueddQUOD/qUEkjnNj0ErgGURv9LnQhJ
	tB4Ex/qiJXzf9UC0xL5nOwwcfcCHsLJPCQprSyFFm6nX9BSx7l4T6ExWjmMd
X-Google-Smtp-Source: AGHT+IFKM5qMMASl10rmXKrcUmwgeXTv62z5DjrFnDyPUs5g9dLQFpi2z/xFC6eh3855WITdwr6/KA==
X-Received: by 2002:a05:6870:40c7:b0:254:8c7a:6c97 with SMTP id 586e51a60fabf-25514d23f24mr6164361fac.30.1718291069162;
        Thu, 13 Jun 2024 08:04:29 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2567aa141d6sm431807fac.24.2024.06.13.08.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 08:04:28 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d22802674cso546758b6e.2;
        Thu, 13 Jun 2024 08:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8Dow31EtxT7P7pEoMQIZDShQ1ihERNO3RVGJ76vyDULNXMdKytN6foPMgIdDFkNArrsp2GjgNJC5DKO4Sc8CPO2VtvYlCyJs/pM1BwEWDepm2u0FiaLSMIPEUmEgV9BqmHJ4zaD4Mi1QuhShF89sDwRKcsTVZVCj68KQFh19JFhmtur1nHnpaYt2s1ZZeAILDLJZA6qF+Hi/fDP87tm0Yi8QUsDNf
X-Received: by 2002:a05:6808:228f:b0:3d2:2f52:c635 with SMTP id
 5614622812f47-3d23dfe7db9mr6804347b6e.22.1718291068517; Thu, 13 Jun 2024
 08:04:28 -0700 (PDT)
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
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com> <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
In-Reply-To: <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 17:04:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmtXcOQ1SibKFh3M+X-syEyEHfxjvSmtDoDNqU40MPVg@mail.gmail.com>
Message-ID: <CAMuHMdXmtXcOQ1SibKFh3M+X-syEyEHfxjvSmtDoDNqU40MPVg@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu, Jun 13, 2024 at 10:54=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Thu, Jun 13, 2024, at 10:27, Linus Walleij wrote:
> > On Thu, Jun 13, 2024 at 10:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >
> >> On second thought
> >> though: are you sure drivers/gpio/ is the right place for it?
> >
> > Actually that is something I requested.
> >
> > I think it fits in drivers/gpio as it is such a clear cut usage of GPIO
> > lines, and it doesn't really fit into any other subsystem.
> >
> >> May I suggest moving it over to drivers/misc/?
> >
> > Misc is a bit...
> > messy. I remember Arnd being very sceptical about putting stuff there
> > rather than creating new subsystems, so since I've tried to avoid it,
> > albeit recently more and more stuff gets merged there again :/
>
> Right, and that is mostly to avoid having code in there because
> there is no other place for it. Some parts of drivers/misc should
> have been a separate subsystem, some should have use an existing
> subsystem, and other parts should have never been merged.
>
> The parts of drivers/misc that make the most sense to me are
> those that expose a one-of-a-kind piece of hardware as a
> single character device.
>
> This one would probably fit into drivers/misc/ better than
> some other drivers we have in there, but leaving it in
> drivers/gpio/ also seems fine.
>
> I could also imagine the functionality being exposed
> through drivers/iio/ in a way that is similar to an
> adc, but I don't know if that would work in practice or
> how much of a rewrite that would be.

Hmm, I like the iio idea.
Sorry, Wolfram ;-)

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

