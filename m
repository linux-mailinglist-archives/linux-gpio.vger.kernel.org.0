Return-Path: <linux-gpio+bounces-8135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A492BF0D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB83B25F5B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F55319D886;
	Tue,  9 Jul 2024 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IWQ/Gd2o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633214A02
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541146; cv=none; b=enHG5lbN4oOGjHkauWasU4wWvxTuelIzCEVMfVNHANrHSO423SLQzWp+zIWYjhcZ4YkENjHNRJQhwIdGAnU1COz5ZAkFgQFa2I4wLRpFjXmyX6ylSE3vPB82bU8bc8JKSdinDSJFi1nAb8WFvWv4J5wtHUCPAOI9qktDDko+0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541146; c=relaxed/simple;
	bh=VF+yfPArG2Uya737SWlaNledFQMHHnudw306bPlIOaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6Yy8O/eb+Qwvt3XDCbZo8BAnVjlaN2I9DkeFi+yyWUns4gwcfskuPLH3dsmyvSY4XEyX/WEB0SljmemT2EC9ogTi1XfGvsDIvyYFSHsUuiZkNgDKjhGrz+Lm/7H6hrREQk1otusAadcXzE0Au6LSVmIBSflz+4+LuhW9qY58lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IWQ/Gd2o; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so26869661fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720541143; x=1721145943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfXk3fTEqlZPEPFJitKkI9Zinf/x9z2xgvf/3brmGeY=;
        b=IWQ/Gd2owi5B88xlvEg93GsAgKYsKQ6qna0P6SxS4VuwQUISFYR0JrK57mZAh237Aw
         Su6lzjgu2ZkNTr2iI935vg6yHxVskP/XOQnybb1qohHWuERkM+grunj+lSJe11yJZEmY
         6kv6EvKo9+Uu7ODpx1uGFvfFe4dOpahTacQ6NWMgtKYnG8UF9puS2rctXvUjeC2mtShR
         7GCt2pc+9yU7Ee/3Blb51KVaXjuDMbw1blbFKxeJoO6rhEj6S73EfYLyteCG9x9vPuSY
         cGg65Sc3seAUfXvs6cGRcAlebFAOxVNJmnMzu3FYXZfLZlaLlRLc2/AzNVdeAQr792Zx
         tEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720541143; x=1721145943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfXk3fTEqlZPEPFJitKkI9Zinf/x9z2xgvf/3brmGeY=;
        b=AmA+6cjCC/UZM4YoElXGzJfD8MITLb6H7s+MCIefKw7tVb94TTtCAThMMXP731HHOU
         iVnIWWtpw0Q7xUoDHRBRS1n6BmcOlBP9OvugY2ZV9e6c1enT0Z5TLA/grvfdkag4X3X5
         uyCgcSN9XYDjY+Ak3Yu9+mGXeqd/iqvvYfQSKNEa+xeLyXzkznxWpJLlWWdvR6FsFw3a
         sLw0Nq/x8snCauUCnKEU1L0Sccsy5R3cYffznI0c9Dg5J2ReCBwZR5DdHdSlTh/sSPib
         IAABDtpZKFSpGqMT3vqhgiI3TB6dyPFnm9JfmkpGfqSgedY1yKc2kdV2o9CGqzuF4LGk
         thKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEO9zYrEb7PeHy6lEa/luO22nCs1OOnUV2yZ2AXjXisKRPyWuuLH7pCf4uQA5drJHA+Nv1i/DX5Mn7e7J86JSsuNdmGJCQF4Ry+g==
X-Gm-Message-State: AOJu0YyjWsonwQfV1FhvDJ62O40RxX0WA8TCFBYp1+soKrIoouW1/QO6
	X2FLAehYH9JfAyfqLXaZl09+sDOSxmpOAGitKs0I9//6ff3QCQFYzQQbDtdZEfgsVh0g0zF4NkU
	Ff4h1M18/WN6RmZ9yy957FQrbffw8TgZqhPurmA==
X-Google-Smtp-Source: AGHT+IGKSJVfXAisUe6NcGYCOjmc/g6+k+gV6B29QgDU0qUyMmPFcYA13AfVsIS1mqs4poXl9Q2EMviFQ4lfCIG8kns=
X-Received: by 2002:a2e:9097:0:b0:2ec:4fec:812c with SMTP id
 38308e7fff4ca-2eeb3197a3dmr18848061fa.44.1720541143636; Tue, 09 Jul 2024
 09:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709092354.191643-1-manikandan.m@microchip.com>
 <20240709092354.191643-5-manikandan.m@microchip.com> <172052434347.27822.16864713604407945517.b4-ty@linaro.org>
 <20240709155410.GA3589336-robh@kernel.org>
In-Reply-To: <20240709155410.GA3589336-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Jul 2024 18:05:32 +0200
Message-ID: <CAMRc=McwTgOjQrNtSVORWFS92tJA_G=26x-8E6U+=4qW0d6OWQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
To: Rob Herring <robh@kernel.org>, linus.walleij@linaro.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, arnd@arndb.de, 
	durai.manickamkr@microchip.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 5:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 09, 2024 at 01:25:51PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Tue, 09 Jul 2024 14:53:53 +0530, Manikandan Muralidharan wrote:
> > > Convert the Atmel GPIO controller binding document to DT schema forma=
t
> > > using json-schema.
> > > The at91 pinctrl driver uses "atmel,at91rm9200-gpio" compatible strin=
g
> > > to find the number of active GPIO banks and identify the pinmux nodes=
.
> > > "atmel,at91sam9x5-gpio" and "microchip,sam9x60-gpio" have additional
> > > registers to handle drive-strength, slew-rate,  pull-down to drive th=
e
> > > pinmux configs.
> > > The new compatible string "microchip,sam9x7-gpio" is added.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
> >       commit: 337049890b8cbbb4fb527c58976ea19f4dc747a0
>
> Patch 5 depends on this one.
>
> Rob

Oops. Linus, I see you already acked it. Do you mind me taking it via
the GPIO tree to avoid rebasing the tree?

Bart

