Return-Path: <linux-gpio+bounces-10737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C398DFC5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAEA6282202
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAEC1D1F56;
	Wed,  2 Oct 2024 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Be2Rpkhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1861D1F59
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727884111; cv=none; b=Uv07sbX5DV0AoedG6bi85IhhDdpI1Nd+xMVwJX9k1Lt9yQjQ1dhycOEllotd7lAkGGL3bfYsiJw8K2wpnLGgR/fNKFko2ucR7cmHPBT8FEtuKBh4BN0Kya3adeP5bCejT6nWiTh2MulpUHnE0U7TBbjwheVlFBBOJrPgYWF7J/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727884111; c=relaxed/simple;
	bh=vPpmKPkGsBgRFJIeAW63489wqwk+a4kj5VX3dy2cbbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xsew5l2HYGSH+UB0bCXRMMfcQTLAf5fS6KsRjF9OsJ3kr0FaO0DxKL+RmMUOZYCxGJT/d6f0+vfXciV3gIh4GTM6LEX7D6qH4EgqmdM7eAvIFU3EFxvmUUfCNwhcDk8TArsE0vW5sLMnAKNh9mec5yIqC/KHf93WOarHs+K/q84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Be2Rpkhl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad75b46a3so30210681fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727884107; x=1728488907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPpmKPkGsBgRFJIeAW63489wqwk+a4kj5VX3dy2cbbk=;
        b=Be2Rpkhlq0G+Mu/tt1/cev3WPgSUuUIz77yKGJnjWWyZD53hBEGXo33AS1sYVn86wf
         mVm2892korUcNRK2BdEAvdHYVUtVOVlDeqM+jlnXQU1e1UsdbLtAFUpqXUyTDJnp4RDN
         rTmOH8D75K76YpcoSNqazctg3G0/cBwyo2lxXHMex/pwmt9+t65VK1tP8SMtkHRQL/BJ
         i17jcpJiqdDrLt6Z1KnepAsxJvOd+6D1FloF0hqR52Dxq5IEL2LB5pOQ8IwcovmHkXtO
         +hIqBDrKiJS5VwqhjXqa18SD5OriqD7untFEvA1diZtSuACBiJ+T3yHd6RPfsNXck0xD
         aWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727884107; x=1728488907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPpmKPkGsBgRFJIeAW63489wqwk+a4kj5VX3dy2cbbk=;
        b=eFWsDNJcPj1mAEAZE9HUKvRjGJxTJJeYq084xmnfZMjfrqXaP7vZUggmrDqWZFLFXF
         6GcnBvZxp4YsiR9+pOXxWE1qUC+e4FtcN4LLoAor6oakdCuhBOtXju4tPyNFWonnvCpx
         u6SUAAn2PDHQkO4AYXth/CtFszcIQJd/CFVY85w8vmA1Pqa+a1+NZrJt3c0whY1Sy+1D
         VqDJtimvAnixvk1rJd1ZQP9+0CqQ+kuZziZrCov4Nbuj6CKgPzEfYit+VLiQGet/+aH5
         LHTGu9kvdgIhgN43f/hR+6iPkeB65orKO9o7BCSIFABJe/AqaowOFox75xnhCaWssvz6
         iQoA==
X-Forwarded-Encrypted: i=1; AJvYcCW+otKuRZVowHf+12hf0E1FkTgkTEJj0zYnqOMmm7GNAXPdAqrSsKEKpIk7XVxvfcFgrlEuYJJSQpE/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+s986DFGWWRnPHutryYeEIghT8VTSYNtgHdOXMngivvYYSdtb
	xyeF/isV2mwyz4gxHAtGkp4xk8MJHutuuMN8INynYVBWWScxqPIdnQT2UPQ7ZmXPCOJoC43naKU
	NB2bY+kzS7YYYDnqTJUlYwIIDM3Ckj6clPcaVIA==
X-Google-Smtp-Source: AGHT+IFtquU+/hcjv4KamAH8Yf+XATK5XoDLh3KzbtFyShyMUx8jgBBNpz1iQXTqzLz0TE6q0aUQe5/IgaOyycvE4tU=
X-Received: by 2002:a2e:a17a:0:b0:2fa:c2c4:f9f5 with SMTP id
 38308e7fff4ca-2fae109ca6emr18835131fa.38.1727884107406; Wed, 02 Oct 2024
 08:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
 <20240919094339.2407641-7-billy_tsai@aspeedtech.com> <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
 <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com> <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 17:48:16 +0200
Message-ID: <CAMRc=MdXeRCj9ExsKH31isE9qdbNyC7=nWL=GgORknSZjf7oVg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, 
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com" <Jay_Zhang@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 5:09=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> > >
> > > On Thu, Sep 19, 2024 at 11:43=E2=80=AFAM Billy Tsai <billy_tsai@aspee=
dtech.com> wrote:
> > >
> > > > Performing a dummy read ensures that the register write operation i=
s fully
> > > > completed, mitigating any potential bus delays that could otherwise=
 impact
> > > > the frequency of bitbang usage. E.g., if the JTAG application uses =
GPIO to
> > > > control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the appli=
cation
> > > > sets the TCK clock to 1 MHz, the GPIO=E2=80=99s high/low transition=
s will rely on
> > > > a delay function to ensure the clock frequency does not exceed 1 MH=
z.
> > > > However, this can lead to rapid toggling of the GPIO because the wr=
ite
> > > > operation is POSTed and does not wait for a bus acknowledgment.
> > > >
> > > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > >
> > > If this applies cleanly on mainline I think it should go into fixes a=
s-is.
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Yours,
> > > Linus Walleij
>
> > I agree but it doesn't. :(
>
> > Billy: please send it separately and - while at it - use a C-style comm=
ent.
>
> > Bart
>
> Hi Linus Walleij and Bart,
>
> Sorry, I don=E2=80=99t quite understand the meaning of =E2=80=9Csend it s=
eparately.=E2=80=9D
> Does this mean I need to send this patch individually after the GPIO patc=
h series has been accepted?
>

This is a fix, meaning: it should go upstream now and get backported
to stable branches. The other patches from this series will go in the
next merge window in two months or so. So send this as the first patch
in the series with an appropriate Fixes: tag or even send it entirely
independently from the rest.

Bart

