Return-Path: <linux-gpio+bounces-6905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB38D4738
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2333CB23FB9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAABE3DAC1A;
	Thu, 30 May 2024 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffPskhSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EF81C2316;
	Thu, 30 May 2024 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058135; cv=none; b=N5qmqAE4hg8B2/SFyClLvrnTZWpBSBm8AZsNF04Gb6UjLGb6lEqqyFlG+o634t0QBogjbUYuj+2eKXRhZYAiZ/Dmx17y0fPW/zE5XgPJUKq5WTFKh+rkYhYscC2LrehxkTfLYHN42SPz06t8uXyq6/lLBfU7OJSOiZthB600U4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058135; c=relaxed/simple;
	bh=d+acRatEc6DpLwwmAnjJ6YLIHcizk+EBvPY8MGwvFFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSh1OZk+8zVOT5PjYY0mGPd/mEQ5C6gXmIQkJ9sP1cXJaXy151scU2zenPGmV/25ezWBhlOaEZyxXq1plU26vl9jjSrCfep7qb4218LmxClTJVdQI8XGILCMWAMNghcnxjDflUFB0hnW5YgKgUUTEe/9996eC0IyI3tqrYtWi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffPskhSH; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57863a8f4b2so665074a12.0;
        Thu, 30 May 2024 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717058132; x=1717662932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tRCS8ScCQLShf7HScOW0ihIPDEDUmhO4C7qSOpkyoM=;
        b=ffPskhSHsc1XloGIr+2taOcrR4OEhdkTnFB5tbisMs8FpmPFDGPeLoRj4t7Qb7WABM
         WtUPY00ZNsgCTD0W8fRI7YBYt/CtSvQM0ZFRQorNXAA6CcHf8IVsO4jkQ2SAWCEsrXdm
         /a5HATlveQaT6hRtXWjXeb+dMer57dtjVY0VmhV9ikM9MbLUk+mMFP5eOy6s5NfsJrDJ
         4AB1gQcY5rFctK5jsKrdAOtE3F3rC+iXWoYGGJBBmmFkZkQu8i6OwhvAxYFExdZkTd8H
         NFRapARm1TYgFKOQ8nYmeIrI6WZffHZEPYJWyL7851BnjYmK7eoBs6I79NmkNQHQwEs0
         Jmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058132; x=1717662932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tRCS8ScCQLShf7HScOW0ihIPDEDUmhO4C7qSOpkyoM=;
        b=UrVn/u3V6pV2o37494EbMMyxaYB2wNv8X2nFC5GMrH565t/yO8qqPibL3ovjMUHaex
         gp2q0PBxaahKgHEjP14eLlsZd3B+MHGTJdJqj5O09yNn/Z1hjAQ9y/gPteT2XxqiYTfQ
         7JETFihFMsPSSbONfOrG/iRQB1c3dg5d3TYuCPgM/kQvudZAV1M5eyayLFHrE+vGufQa
         8GOss542SVZhqPhcLy8jouZBtVhbRjnYIEwpL9NzrDtGLQ9IXmU8zrW9AWUVPiHlocK+
         7WwBautCOvGif68lKTqq8XHH3voD7K10nV0LL7e/DVBt+MYKIcH8onqb7VSDke/0jr1f
         HjJg==
X-Forwarded-Encrypted: i=1; AJvYcCUinEB20Xeeg6FLID+9Lb3oaFUp/1XH/QjrtPZY/R7I31RVwneEn81QDWUSAxvflmcJsadOuAcpXYc4hX5cnfb2QijW/5grl+e9YL2KxlkkiaQRwgehPS1m1r8OEnGQa3WIMjiVeXZZwDoMHZAZJLStk8g2ANawiAYmG7JDr6PgAgTFSZxnUHMY3qAAFHR4fosvmfKTpwYTd3X2rqIDpLw5CfMT
X-Gm-Message-State: AOJu0Yx3uy96Ok677KZ2umyVVFlbKwpqAN7HoIa6NaYzJh1rMKxZmVvl
	YmLox4vP3ACDQtNegTOCHSM4AtWa/v8dfW/xdqT2kWGKL4KN3Cja27kvpdsA4EgUFNOFzQM0j5J
	93jCfQxJ7/Rpd/x7+S3Kagac8Gebcz1NP
X-Google-Smtp-Source: AGHT+IHgQI19SwSr5c5LUPVeXJOTDOIwTMbd+WWxYVnepK4Unba10nGT76+nlWCdW7rd0n4sIeEGavB/Rz1q2m9Irro=
X-Received: by 2002:a17:907:6193:b0:a66:1264:2ac2 with SMTP id
 a640c23a62f3a-a6612642b50mr42744566b.42.1717058132088; Thu, 30 May 2024
 01:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-4-johan+linaro@kernel.org> <CAHp75VdnTQJFfqOdxC99gWckxebdUr4hV0wp3ZTs1Pey7q_fsA@mail.gmail.com>
 <Zlgz3nDjfRO5LYnY@hovoldconsulting.com>
In-Reply-To: <Zlgz3nDjfRO5LYnY@hovoldconsulting.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 11:34:55 +0300
Message-ID: <CAHp75VewzRUiKQvQ9D9HWPOo6Yfqtv+AV+AVTPQO=foRzMoegw@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] mfd: pm8008: deassert reset on probe
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 11:08=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
> On Wed, May 29, 2024 at 10:45:40PM +0300, Andy Shevchenko wrote:
> > On Wed, May 29, 2024 at 7:30=E2=80=AFPM Johan Hovold <johan+linaro@kern=
el.org> wrote:
> > >
> > > Request and deassert any (optional) reset gpio during probe in case i=
t
> > > has been left asserted by the boot firmware.
> > >
> > > Note the reset line is not asserted to avoid reverting to the default
> > > I2C address in case the firmware has configured an alternate address.

...

> > > +       /*
> > > +        * The PMIC does not appear to require a post-reset delay, bu=
t wait
> > > +        * for a millisecond for now anyway.
> > > +        */
> >
> > > +       usleep_range(1000, 2000);
> >
> > fsleep() ?
>
> No, I'd only use fsleep() when the argument is variable.

Okay, this is basically the same issue as with use of dev_err_probe()
with known errors. fsleep() hides the choice between let's say
msleep() / usleep_range() / udelay() from the caller. This, in
particular, might allow shifting constraints if the timer core is
changed or becomes more granular. It's independent to the variable or
constant parameter(s). Whatever, I'm not going to insist.

--=20
With Best Regards,
Andy Shevchenko

