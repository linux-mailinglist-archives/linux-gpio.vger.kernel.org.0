Return-Path: <linux-gpio+bounces-21686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8443ADC5E2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 11:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8189E176A64
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 09:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C6E290D8B;
	Tue, 17 Jun 2025 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N0aqP0kq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFE21B184
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151632; cv=none; b=Ng3TG95GvnnLLxKtmhT8UzchA0vAlu3VfJkBXYOrQPNIfJdr6wiy0TnW6zagaZGizpdsgcWUQNA2zeZO5Tk2XFWAWcRkp67jFR34v8HHDp0qSKw49SP3KLeZED+2yLYVjmrONLJ7AH+HQjHMqn7yPT7i40J3YrFsUtD+N+Ikbog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151632; c=relaxed/simple;
	bh=GFZGZld2msZlsqI4AeZceArgzS0jDDja1cJAY7hfImA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po0p1Df54XG7ALn7dsS/QwvhLX/eltsD2yFX/7HzwVR56fmD6Mm2KoUD7tOXNyRJYJjL7RPz+XcJpIK1+FpYqLI5b3vNywlHOWXVmGS+4Xehi+dvQ8+bXIyLlFtgfL3O1b4oyV3nXact3bMnlINQlA/ql94w+Tvptm0XPLpCvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N0aqP0kq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b3316160so3254978e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151629; x=1750756429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hznkuFVQ4L6OagoiqF3YquzOm9wFiJU8GR+IIG9PGoE=;
        b=N0aqP0kqxVR9LAmQfHEt8LKbODr5l0J/3nv8eHp64UR3KmrfLdpKBhQYcK7FLwMkrJ
         pJMuTtCDAj3s5fHBv0BFx9oZ+66ZSGiIBBNaDXb3T9h7QWgkGt/1TrbOB6YkLudJhAKf
         qIaR3LVSPs3OuNwgZu+I7Lq8bgHdki2sxiBbBW8EeEHSfdeB08Exo4YoX8p3ZqeBp1AA
         tOHGl0vo8Sq4psS2MyfOB4egUcWarITcJyzbPrYGZebf9FyjV22pGWwCI9w2EZpNj4rZ
         ohPOjeYwa65s2psdYSAJcBQTx7P1cs+nDlWhb6UADcHFhC7XEaI7kOEzR/R47px6i6FE
         2q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151629; x=1750756429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hznkuFVQ4L6OagoiqF3YquzOm9wFiJU8GR+IIG9PGoE=;
        b=W8Uo66B0v84I2EUXHk1NMeeIACwiUA1mgjpHLS4nHtprgO0bnF+OYJY6v4FaVS/wWQ
         fm6nY0jnE8J4hAFHSWDKdmPgei+6pujA+YIdsWWuekSp7gknLF97ftKdfiQW8ZjEaSsl
         owKQaupNh5ceQvsTWDyQ9c/Bdr0/cBubCFNdm/SEYciUJIkVItBkOFGf6huNDv+KyfuX
         J+7MJsGIV5S8/PBGgFAMdOmx13oRrJhLCwkW5vYAZUPSaEomlnXAuo8B3V+2+WNJLczG
         cYcv87vSKoaBngb68s0eykTpXFF4+moTOUL12Ec1CW2D/yDF817+t2PbVNn9ykcxRpY1
         mj9A==
X-Forwarded-Encrypted: i=1; AJvYcCU8HoTxrWweHaFCIwBCdVCst2V61fvWJpX/JkCxJW74sHCWNSOXDX0JS0VIBCCNFXflysWhApZvzilN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAgoCecbJr/yCDcM9AL1rEhQzd8TLsIO4Hicrtk1Pvc5clI6x
	dVYT9qycyZRRe9BNAeC1naJ/lsMtI7LCegAUhxJxudKChYFzV4BCcOPbMtis+28vthnywOBVh6J
	635A8K0DZ4qUumV9M8osCrUo7fX49BgcXj7FJUdtObw==
X-Gm-Gg: ASbGncu1gXC26JKRhuTeCYoNREMMzm/Z6U9jhSiv4E3VqA8VByEP2SjoiFr/wODFj35
	BEnfnYPDjOCx0qXxsnioaAZ/4vUnujPt0rharyVcJINhcL8yJ2SNe3vZTPNoJzSR8sZ+3K4e35/
	961sF0wRU0a4eE2RQ/WBpvCgHR544irC8t+5qtgvDPoWJmmTN9OSH96/gtqUfPcqMJKgZgFymCT
	BeXRHyHUWNYNg==
X-Google-Smtp-Source: AGHT+IFpKUJs/wBsDFRVXAccck5zl6phPlCBZHHLHmfTMcj4BN/oFh2IvP8A5zGA6byZ8fVbdK3XRYNq12y1lhg1xTU=
X-Received: by 2002:a05:6512:3e0f:b0:553:2dce:3aac with SMTP id
 2adb3069b0e04-553b6e885dfmr3012127e87.16.1750151629264; Tue, 17 Jun 2025
 02:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
 <aEvotoVqitiHxgYA@shikoro> <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
 <CAMRc=MfB_7JTzsSk+9ssdC4N2S1Rn1hHpkQ7CbWMF6SFUadrJA@mail.gmail.com> <CAMuHMdU2LHU54ebB5ihcdn8tyQbZ_tbdGGs0n_6nvfopyRk3Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdU2LHU54ebB5ihcdn8tyQbZ_tbdGGs0n_6nvfopyRk3Jw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 11:13:38 +0200
X-Gm-Features: AX0GCFvKpHGhwtgEZ5aBU-l3jf8i7f4xF0zgKvoqoEBj5J7RHEK6cKq18KAVcqw
Message-ID: <CAMRc=Mc79tLcd1QJEJxDk_qQPjt85RZw3WsQPW_5WBtrpTyLoQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use new line value setter callbacks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:12=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 17 Jun 2025 at 11:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, Jun 13, 2025 at 2:02=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Fri, 13 Jun 2025 at 13:42, Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > > >       bankmask =3D mask[0] & GENMASK(chip->ngpio - 1, 0);
> > > > >       if (!bankmask)
> > > > > -             return;
> > > > > +             return 0;
> > > >
> > > > Doesn't that mean that the mask is invalid and we could return an e=
rror
> > > > here? Or is '!bankmask' an expected use-case?
> > >
> > > That is a good question!
> > >
> > > I _think_ this really can't happen anymore, as the GPIO core is suppo=
sed
> > > to check this against the valid mask? Or isn't it?
> >
> > Yes but this doesn't seem to have anything to do with the valid_mask?
> > If it's about the number of GPIOs then that too is verified by GPIO
> > core.
>
> Sure, about the collection of valid GPIO offsets.  So it cannot really
> happen, and just bailing out with zero sounds fine to me?
>

If this cannot happen, then why not drop the check?

Bart

