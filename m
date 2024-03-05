Return-Path: <linux-gpio+bounces-4132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47A871927
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 10:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82801F24124
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C091B50263;
	Tue,  5 Mar 2024 09:10:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4174F1F5
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629800; cv=none; b=XQ31otViJTKEK0fAA9tg7kzwVrSXsHHfWkgTmVzUOEuVl+PukFYfqRm9V1bwOItuVBqe6BGNceW+iW4rLYAqpr3tjwz92mnbc59VaiqXV2EvT3DUl9FXdTSfRuMynNZ7l11P1SBPm9dh2OkSUm3pkKFMV51RN8loOVoy9mosh1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629800; c=relaxed/simple;
	bh=MS65Alsxnkr74qwNikRDdp4gOsQCK5+O6xrsazKiMI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbUOfhbsq8P5CfeH+w4XzGVuglEk8c2XrRW7zhA4pD+fExAc2b2lAHEym2tCJ6f7R7wZ+cEq7amTPToSgvajsGGkHVM64WRul7BrIXJFleFcsXJX4Q6lf2tdu8jxtu3ZIGoisDU0gX5tEjOpXpKkNtkGnBQvtBt6kTtHQ6kHxk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60821136c5aso37861837b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 01:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709629796; x=1710234596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS2EhQkb8znzNRLVG31kt1hidEbM4cOpbHTV1RY1MOY=;
        b=wy7TESM0b6P6H/SiEhG1kgWsrkF1I5hwjxATNI6Mn4G35mkP7IPgs4c2yFOATe9b/r
         pIMxzKpQv+prEMZGADCQEpfn17JxRcsggIj2/G48LRYAloXKOcy+N9CgBQHNWz6wFrtX
         aVBpp+ioIPmIYyKMjE/nW1stU2QKWyHB53HD//tSPlc7LdUJ5S92WV2A5vLmyQuanOWi
         05MKwjqLBrxiCblfP/9uwBqsRiRPehpjsa+kd3Bwhp5zhMzptnHeJhfPWUABdeoaqvTB
         siEduv3fwHTacpomHujbbQmat5eIz5U5pGVUz9dyI98c/R1dvsJNbdBExQJ7/mqHVVTv
         KERA==
X-Forwarded-Encrypted: i=1; AJvYcCVPDsiG4oxgbNKzHMSH9MWBCYRblYPm5KJlTU8y4L745YEJ0KPXeLBbHUHBmsn64edibHfOrkDGLRBasXd1U7aPAv+TOMug2OpXjA==
X-Gm-Message-State: AOJu0YzhCREyBRDdvAFcMXG0wJGWgZzk5MZUvcA+mbKQhETIfnHCROCf
	NMurBnhNujKcgHbjR3AnFU0qkuJGzxAr5lWN1uYpk1ocfHbdLLSBFXv10CfBokQ=
X-Google-Smtp-Source: AGHT+IHLbpkj/E05OfhNw25OBOjX11xVQ3EDXAsSG2Z/AffGDbivqThIEyZh/cbQ36oFrXeW+3SXAg==
X-Received: by 2002:a81:994e:0:b0:609:3a4:5cce with SMTP id q75-20020a81994e000000b0060903a45ccemr10224171ywg.49.1709629796412;
        Tue, 05 Mar 2024 01:09:56 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id h5-20020a81b645000000b006094292e834sm3071517ywk.75.2024.03.05.01.09.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 01:09:55 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so5338746276.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 01:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVAEavHTegt0tp+k6ugsW4sSH5SLZGw7BIVsyKlnFQ88fsVu+9Nt92QPx9MlKVbnrnkNgZtw75OrWEg2IRx898qvGt5lTHkKuh3w==
X-Received: by 2002:a5b:582:0:b0:dc6:deca:468f with SMTP id
 l2-20020a5b0582000000b00dc6deca468fmr8307295ybp.29.1709629795563; Tue, 05 Mar
 2024 01:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-awinic-aw9523-v8-1-7ec572f5dfb4@linaro.org>
 <CAMuHMdU3yUAxMgN-xo5BU2O8x0sn92myz6ZH68DB6JnMfgh7rg@mail.gmail.com> <CACRpkdY+6__RoDrMT5tsxSAUBOxzjOFzH56Z=07SSG=2PXwcxA@mail.gmail.com>
In-Reply-To: <CACRpkdY+6__RoDrMT5tsxSAUBOxzjOFzH56Z=07SSG=2PXwcxA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 10:09:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWumc5d2=otMjwhcT7xtyKCoJk1EXRDsPHtTwt_02g18A@mail.gmail.com>
Message-ID: <CAMuHMdWumc5d2=otMjwhcT7xtyKCoJk1EXRDsPHtTwt_02g18A@mail.gmail.com>
Subject: Re: [PATCH v8] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Bauer <mail@david-bauer.net>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Mar 5, 2024 at 9:58=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
> On Tue, Mar 5, 2024 at 9:00=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, Mar 1, 2024 at 2:30=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> > > From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainlin=
e.org>
> > >
> > > The Awinic AW9523(B) is a multi-function I2C gpio expander in a
> > > TQFN-24L package, featuring PWM (max 37mA per pin, or total max
> > > power 3.2Watts) for LED driving capability.
> > >
> > > It has two ports with 8 pins per port (for a total of 16 pins),
> > > configurable as either PWM with 1/256 stepping or GPIO input/output,
> > > 1.8V logic input; each GPIO can be configured as input or output
> > > independently from each other.
> > >
> > > This IC also has an internal interrupt controller, which is capable
> > > of generating an interrupt for each GPIO, depending on the
> > > configuration, and will raise an interrupt on the INTN pin to
> > > advertise this to an external interrupt controller.
> > >
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
somainline.org>
> > > Signed-off-by: David Bauer <mail@david-bauer.net>
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > This "Reported-by" should not be here, especially since the issue
> > reported[1] was not fixed, and is now in next[2].
>
> Oops I dropped the tag.
>
> > [1] https://lore.kernel.org/all/202106251415.3UY7htNp-lkp@intel.com/
> > [2] http://kisskb.ellerman.id.au/kisskb/buildresult/15135594/
>
> I wonder what the problem is though since the driver
> depends on OF && I2C...

CONFIG_PINCTRL_AW9523=3Dy (bool)
CONFIG_I2C=3Dm (tristate)

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

