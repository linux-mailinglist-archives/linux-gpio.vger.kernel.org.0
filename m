Return-Path: <linux-gpio+bounces-21685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F94ADC5E0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 11:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4E0163209
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 09:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7FA290BCD;
	Tue, 17 Jun 2025 09:12:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2042BEFF6;
	Tue, 17 Jun 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151558; cv=none; b=budCAPGKLPtXwOFsWSAsBigsJZoN95fW6el8KDgIGZHh+jFyZttxF5XN2UaPeVm1hgHvP/4EZAEA6dieJj445XnowRXBbF5F9sO/BmbL8cWQ8iin4bH1zzI3wXAiBXpzP5t/ghHPdVccvMsmQPeKJiQ6ALVmZGoheaV33Yj1gP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151558; c=relaxed/simple;
	bh=4XxmjDxsaEAudKOul0VlofkNJPUiL5PE4boM7M2Zyio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHWWEh3rTWP782/S5EAcBp/nq/DuQpSig5AxQimr6k8AGrPJ2h0oClZQ8PjbsheFd5SXo2NZuyhHxTtX/4NZypUj0xI7O6hybiq0I1iwM5yloYtqKMG3m0rdERRAx4Pxm6UKs9fdfL9Y5oRdN88sXDq1Qat3we3GU6+elPH3Hbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e7fb730078so888503137.1;
        Tue, 17 Jun 2025 02:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151554; x=1750756354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYK884yO6/IR5FBKJlqO/qD4jdw4rEoWtSGdzWlN3y8=;
        b=Lnd1BMXVMBcarVAUpkfIKglkVeQfA0uU5NKPGDF6CRHjJlHN93WxoQbI7C5VzuaFor
         R6uI08SRrtw9GFj1RhyNM49g8yWQZq9NNy0kyjJL3JgL4XRmQI1jdhwgx+ceoI2p06Oy
         KepvNA3wWEn4s6CYUc+kQ+yXve2WuVWFnl0Usj2W8zc4SOQmIKPmAQIqdW4cRgoq4MvI
         E5Qu0zJXviKt9THw+jmrjwX4JiDfGl3wxa7soRjnYFWpxDkpAcdxzqfNJtLwbVi7rlgT
         q7YFs9O5ZAIGRjnfHdSRmalM3cWOpBSrw7yUVmRuiR5MfKaBOUJXJFodfpGSGLiIWcK6
         pRgg==
X-Forwarded-Encrypted: i=1; AJvYcCWW2tlCx7DaWtpSqS47KWFOWPkPtXTi/ZIvUxBSn/YRCSrHr2h1XmMWyfMfAsg7I+5ooDHokJOS6Blvo4s4F9GwCY4=@vger.kernel.org, AJvYcCWn94TplzQRVmV1XNshH8JialVf0HnSqOKr49I5TpS2HuRZ/Tpy3Zu8pmpOq/C3YVkkNxgWLYFcY4fH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+VmgpaJjFjO5nNRcVaBRxNb3O1Ix+nSg/UCZynxYIGwoanqId
	fCr3YBjGUc/vfeamvad7Kd3EhqWvUnGjRb4wte0gmkRMzaIDotjduIzKJ7dj8AUG
X-Gm-Gg: ASbGncuNPqbs1VwoYhf2W/rqjhCzV5wVIzoGESlSgJT7zunuq+PuYxYMumGpufRmmDN
	OstxAd4hyNSvw1Vhm77G7EIgPASgZ42xf/jfQYyko+l1Ij9qzvRAzgui0N19hrCwiHwpXnbJKsT
	ZPFvM71d0hstORyrFjf0tRdsG6GUBttjHmqiPauCIpAJi/x0TPVuCdqwLUQI6fOrPxHPwUFR1Vn
	a2jkLBzTpTWAipU04/NdSI8ta3cI2WztgbNQkluILmoE7E1axUMdJxHhN9Sm7HzN8naNVTxV6BQ
	5SQQLkXZsgFfd3LQxXWYZn0h/6nArK2jjPEiWUs9VvTZg0i2SCNW/KQgeWmz6jsf3U+l7D883PC
	QPGjjqOjWP7ppmO2EDWjS0DNT
X-Google-Smtp-Source: AGHT+IFQAaVBNJsDGJU1AIOqYgxdLprOdxSHmyPAYVmW+TDpcyTK9/lNn7KjjyTbQUF3ZiRBttuVTg==
X-Received: by 2002:a05:6102:4bc5:b0:4e6:eaed:7e2 with SMTP id ada2fe7eead31-4e7f6188746mr8899191137.5.1750151554166;
        Tue, 17 Jun 2025 02:12:34 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e979b63419sm175344137.25.2025.06.17.02.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:12:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f1bd2229aso555326241.0;
        Tue, 17 Jun 2025 02:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNCPsfS4vFixD+om3EQrui7mp57nEyXp7iCkXfwAYbTuZqVau+5e2+r3R84vK7tgJhgGG+wscsNvv7@vger.kernel.org, AJvYcCUdZ+P1VscyCbuCwgiCwKjPf3u0Q65CiW+W3GBXoFbEfFpTacc7xpQDFXu5BMdsSkUxUUAh7vtxS4j1387f+9dmq84=@vger.kernel.org
X-Received: by 2002:a05:6102:6f0b:b0:4e9:8488:ceb0 with SMTP id
 ada2fe7eead31-4e98488d207mr329743137.15.1750151553318; Tue, 17 Jun 2025
 02:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
 <aEvotoVqitiHxgYA@shikoro> <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
 <CAMRc=MfB_7JTzsSk+9ssdC4N2S1Rn1hHpkQ7CbWMF6SFUadrJA@mail.gmail.com>
In-Reply-To: <CAMRc=MfB_7JTzsSk+9ssdC4N2S1Rn1hHpkQ7CbWMF6SFUadrJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 11:12:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2LHU54ebB5ihcdn8tyQbZ_tbdGGs0n_6nvfopyRk3Jw@mail.gmail.com>
X-Gm-Features: AX0GCFu2HQLGscXm0McAabw44QdLWzbrp-fVKqsgQ_8xkt86E1gQgEeiUAdo_5g
Message-ID: <CAMuHMdU2LHU54ebB5ihcdn8tyQbZ_tbdGGs0n_6nvfopyRk3Jw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 17 Jun 2025 at 11:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, Jun 13, 2025 at 2:02=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, 13 Jun 2025 at 13:42, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > >       bankmask =3D mask[0] & GENMASK(chip->ngpio - 1, 0);
> > > >       if (!bankmask)
> > > > -             return;
> > > > +             return 0;
> > >
> > > Doesn't that mean that the mask is invalid and we could return an err=
or
> > > here? Or is '!bankmask' an expected use-case?
> >
> > That is a good question!
> >
> > I _think_ this really can't happen anymore, as the GPIO core is suppose=
d
> > to check this against the valid mask? Or isn't it?
>
> Yes but this doesn't seem to have anything to do with the valid_mask?
> If it's about the number of GPIOs then that too is verified by GPIO
> core.

Sure, about the collection of valid GPIO offsets.  So it cannot really
happen, and just bailing out with zero sounds fine to me?

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

