Return-Path: <linux-gpio+bounces-95-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CECE7EB04A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7891C20A76
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 12:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CA73FB2F;
	Tue, 14 Nov 2023 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUva1w1n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5B3FB19
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 12:52:51 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D791737
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 04:52:49 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso5525148276.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699966369; x=1700571169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm5tIBxlFob9g4Fl4wFAfi9oUFoS3/1CELy15DVM1mI=;
        b=IUva1w1nEizlrvNSoUb3UCdQBfVmQ5Q4YZp7nEJb92vakCXDD3tvM56YuNFWj73t56
         TOoZ95mU9fpkZD2KzIW51MFjmpbE6+hIE3T+so0B1GAhA59XFPmZTZSjSDtLr8mydiBn
         Ef9QF2o6CrkfgsAZcZmj+S4j8KOM99mRlpubKhiM/m53A3QLZcc5PUzMkjqGMDY8tRdu
         PS8vjaJPg0kpvBHmKGd8zxZQbZXG+Bwl+WJuQcx5XkAv1XEgI7/vnmvOcFgAVwjfcR2L
         th8L1YtixZdLUKGq3erttfLhik3qL8eBf1l3jQIVwmRRUC1q/x+O6K6Hk1CZ3y4DfDHl
         jIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699966369; x=1700571169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm5tIBxlFob9g4Fl4wFAfi9oUFoS3/1CELy15DVM1mI=;
        b=qtFdtYGF+HjUAfk3+766waLpQNMUguxW6ybEdE09X9cwS5s+6BXmuW4K6HGoiJsSmO
         Z18QU0cumSEKv0gntiHIWrVRurlJvLgVGtIvsgHnuKiJCNdKNBLVRvWOqfgdIotsh3Vz
         OU+uTHRu3/Z1859t3LIU/D4HNbo/RLbwFA7pG5X+BF2ZsrIVhREvWVWJfnUDZxpVhj7B
         7lR2Q05rWF2mKQ+3w2N6Hq+ugQzSXVOw2QNqJSKHfXr3/ygFOHAY/yxf5m98r2B2+XNJ
         nZjgli8/efgj43GBVSulVE5ZBlrKKcibA5fNzGsgXM+hM5wkMDcF8TCyuxMA/eHTP6YS
         Q8Rg==
X-Gm-Message-State: AOJu0Yy51PF0rw7tXYPQjn7e1BZoVVvSn0IQ5LZIb3eTZRZKHrA0BYXL
	9w1GXDA6kfwTcHkCaSnP1wyGH6/5OghLI+o4IcMG4w==
X-Google-Smtp-Source: AGHT+IHb5y2/nAMzpAAbpcAqsc2332J3Hl+TEbnJYw6VgROQL9pFrDJMQLjA7DxF+w42E0bHCOIHzfYDBAjoO7yaXoA=
X-Received: by 2002:a25:6951:0:b0:da3:ab41:2fc8 with SMTP id
 e78-20020a256951000000b00da3ab412fc8mr8347458ybc.16.1699966368706; Tue, 14
 Nov 2023 04:52:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20231031095014epcas2p2814fa2bb5f940ccb0d0951667df34f98@epcas2p2.samsung.com>
 <20231031094852.118677-1-jaewon02.kim@samsung.com> <CACRpkdZRMJgWkLwKstpN_9=VGutbE1wBv+X_a15RJ=7ddNtbHw@mail.gmail.com>
 <15d9340a-dd4f-43fc-96c6-f6a8daf76e11@linaro.org>
In-Reply-To: <15d9340a-dd4f-43fc-96c6-f6a8daf76e11@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 13:52:36 +0100
Message-ID: <CACRpkdYrJMnJLHa1+Vtga3WdYySx9ioGzqmnf1uZKGdBxEWa_Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] Introduce ExynosAutov920 SoC and SADK board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jaewon Kim <jaewon02.kim@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 8:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 13/11/2023 15:11, Linus Walleij wrote:
> > Hi Jaewon,
> >
> > thanks for your patches!
> >
> > On Tue, Oct 31, 2023 at 10:50=E2=80=AFAM Jaewon Kim <jaewon02.kim@samsu=
ng.com> wrote:
> >
> >>   dt-bindings: pinctrl: samsung: add exynosautov920 pinctrl binding
> >>   pinctrl: samsung: add exynosautv920 pinctrl
> >
> > It is best if I can apply these two separately once Krzysztof is happy
> > with them. I hope that would work? I don't see any specific dependencie=
s.
>
> That's fine. I might have conflicting pieces in-flight, but then I'll
> funnel these through you as well. I can apply these to my
> samsung-pinctrl tree and send them to you as usual, unless you prefer to
> apply yourself.

Oh that's best of course, you take them when you think they are ready.

I was more referring to that we should be able to merge the two pin control
patches apart from the rest of the series.

Yours,
Linus Walleij

