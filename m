Return-Path: <linux-gpio+bounces-28354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A03C4D55B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 12:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EBF51886C66
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E632A350D42;
	Tue, 11 Nov 2025 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2U03Uqd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22532FE050
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859136; cv=none; b=OhxBQQvjZ000yZyt2BgJuKA2aXllBxzP6VU3W7h92Y8tf5n34EXuD7JCeJgi0DL6kBq3eRguP24/+2vSA/3amEMFl4ocYYq19Cft6Dt95nwtUEFibVjIe5sY43VegRMLycvZO/xyxSmXEwK8jsOf9tQkFuOSObM77unehSyQhUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859136; c=relaxed/simple;
	bh=y66FBoc++SpxBI6FGW3rQvdUsLlCBgJvq0+SdEPQo6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ox2J5rR6kQ1q4QemjGb/+n1al7wuT7XO1mf03sXD99YQK46Cur8TByp/Y1T8PHwXFwMH7AuPeUjEsdJEiSYz7FPgbwCibiZM+hHlMLX3Y93RDbVcKAJzrYrhkVlfjKR+822h2yH0zPDvtfSLqerL9x4Zv+/xb3rzG0GccDQumQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2U03Uqd; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b495ce059so409171fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 03:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762859133; x=1763463933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoH9aK6siRf3TzdqpyJR1VLqiWASMeAZ3/LGdDhqFC8=;
        b=t2U03Uqd0W5wrdgeVXLyZTIJSUjjteG7dhXJWun9YrX0wu0qAoiYI+4QhGxgwfRWjX
         ww4hCZvw21l1WoZBlnjqbWuR6JnMkbQo1cBoTafKte/tCU2skdHAUH/qy0i/ELkJh87b
         bsBgbHI7c444CG9XRIyLNGH1yYJpojLrTCK5MvNGq2IkDF0wvojxsaX594xLpNGtvOQd
         c2kZD2fLjDjWdA47fFdqDpjHxdBKY5kBAlro/E/VCQhOxkWKUS3JtSrg0wBuhe28mvca
         jarhx25cA/3iPm+J/RQMrqf/EMIaLcMQ3Df2EJv1twmuRi67nZa4jsaAVsPgrTSxXkCS
         5g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762859133; x=1763463933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UoH9aK6siRf3TzdqpyJR1VLqiWASMeAZ3/LGdDhqFC8=;
        b=IkVeuZMYik+zGUeA7xXXsdFzHn8sb4rDJU5FBq5JxTZvhqyN5y72vjwNnySGkAdRje
         sxBcdQxba6B7CrVtr4RhJMXCOrfhCw3WxzZfD7Mg99i8cGrZWP2PoMndOWPioqWsfhCc
         yeil/Y7FRphCs/81wGL3iC4nhDzuo7Nsl54Tkjzh5M2q1ao94y9Z1Y/29+hDLF3Dnpdv
         WU/HZTpNMG42noNXEiir7xKWAkTQ0QDN6QwK9wC297ZX9DkKEQ709y/a3Y9jt53WgKq5
         +fEzppmIL5wBVabID+yzA+gnb++Iiydpl951Tmu13+rTVVVxWoc+6SY4OS3X5tHOwtPe
         w/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNtg6oOX/yAi/aMmJM61Fo02YFHB97XmuHRq7AJWy7B2LNRVM14kdBAD8dLJi1N8xbtmdq7RCI3FD8@vger.kernel.org
X-Gm-Message-State: AOJu0YxLtdyN2vOiGfHJ2Tq+dWH4tiyXJNU54l4hSATTZ66ERW1QHf/T
	pvywedh1dfZaH8kWZHhMcHc92yUfMeQWmeW1PCwPGaebuVS7ZKdZGmCEZfcASOH3nhn8OcKt0nv
	v8lqN8dJViYvFSlzpgxflXinddXy41WT1yn80F50kXA==
X-Gm-Gg: ASbGncuRF1AVZSFZNpy9yZQlVOvB8LO7YGWGX6fDr7wfR7JDUI0H7xJ9APDS37m6C/o
	VEOlyQRKY1uC5BQY49AocyZYhXeVisLc//VSu3NJz8598hRpxvy4lw/uklLYsbqgocC12MI2VCV
	LDrstAsSXPw5uw2zx7qKyqvCQVViIRB3ya+zWO17yu8YELepfGiaM+/bjpq1JRr2pZm25Iz1rhr
	7VrQdTOTj+4oRaHbOf5YeloZiMkUrXHQrSapP8atOYlhELE2flWs33PdNAV
X-Google-Smtp-Source: AGHT+IFkZiLMnr50CeQ1O4yRkma5Tp7W/uLXb3QVZ0YS6vC4SBgPLtDI8Wk1eXrn9vUKVkhHURYlWyAkxblzklx1FOI=
X-Received: by 2002:a05:6512:ad1:b0:594:2e42:d49a with SMTP id
 2adb3069b0e04-5945f1671bbmr3110517e87.21.1762859132818; Tue, 11 Nov 2025
 03:05:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
 <20251031160710.13343-3-antoniu.miclaus@analog.com> <CACRpkdYdtcnxyP4xVsqVK+geurEOEURqZO5eLC96YMqh1sE5Sw@mail.gmail.com>
 <3ead5d7aa5e6be2b6df3bb91b35fec37e23353f3.camel@gmail.com>
In-Reply-To: <3ead5d7aa5e6be2b6df3bb91b35fec37e23353f3.camel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 12:05:19 +0100
X-Gm-Features: AWmQ_blU6j3_M21L61Yu-JWVhmaHhxtwDX6YhKqEeSy_5sEpbKXDc7z5UbWQeFg
Message-ID: <CACRpkdZf9D2PH5AR46Pwi8UoyfwumKS4P3ncJ=RN4iu_cJzZ5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: adg1712: add driver support
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 1:32=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:
> On Mon, 2025-11-10 at 11:30 +0100, Linus Walleij wrote:
> > Hi Antoniu,
> >
> > thanks for your patch!
> >
> > On Fri, Oct 31, 2025 at 5:08=E2=80=AFPM Antoniu Miclaus
> > <antoniu.miclaus@analog.com> wrote:
> >
> > > Add driver support for the ADG1712, which contains four independent
> > > single-pole/single-throw (SPST) switches and operates with a
> > > low-voltage single supply range from +1.08V to +5.5V or a low-voltage
> > > dual supply range from =C2=B11.08V to =C2=B12.75V.
> > >
> > > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> >
> > So tying into the binding discussion:
> >
> > GPIO means "general purpose input/output".
> >
> > I am really confused as whether this is:
> >
> > - General purpose - seems to be for the purpose of switching
> >   currents and nothing else.
> >
> > - Input/Output - It's switching something else and not inputting
> >   or outputting anything and this makes the driver look strange.
> >
> >
>
> Not the first time a part like this pops up [1]. At the time, the final
> conclusion was to go with gpiolib. Naturally you can think otherwise now =
:)

I think we might wanna go with gpiolib for the Linux internals, maybe
we want to add some kind of awareness or flag in gpiolib that this is
a switch and not an output we can control the level of?

I could think of this:

- Make .get() and .set() in struct gpio_chip return -ENOTIMP
  no getting and setting these "lines" because we really cannot
  control that, these lines will have the level of whatever is on
  the line we are switching.

- Implement .set_config() and implement the generic pin
  control property PIN_CONFIG_OUTPUT_ENABLE as 1
  to switch "on" and 0 for switch "off".
  See include/linux/pinctrl/pinconf-generic.h

This makes it possible to use the gpiolib in a way that is
non-ambiguous.

We might want to add consumer helpers in
include/linux/gpio/consumer.h such as:

#include <linux/pinctrl/pinconf-generic.h>

int gpiod_switch_enable(struct gpio_desc *desc)
{
   unsigned long cfg =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE,=
 1);

   return gpiod_set_config(desc, cfg);
}

int gpiod_switch_disable(struct gpio_desc *desc)
{
   unsigned long cfg =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE,=
 0);

   return gpiod_set_config(desc, cfg);
}

See e.g. rtd_gpio_set_config() in drivers/gpio/gpio-rtd.c for
an example of how the GPIO driver can unpack and handle
generic .set_config() options like this.

The binding however needs to be something separate like a proper switch bin=
ding
I think or we will confuse other operating systems.

Yours,
Linus Walleij

