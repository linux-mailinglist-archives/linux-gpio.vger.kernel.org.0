Return-Path: <linux-gpio+bounces-28852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44AC71302
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 22:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 480CD345EB6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75AE305056;
	Wed, 19 Nov 2025 21:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wK3tWXqN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D555D303CAA
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588908; cv=none; b=ebNTeLsy6oKdBQuNO52uSdnr4t15lvu/zTYpaSl6/lLkpImaOmvKXaGcfu0yE6Dh6f8yYwTviYU6W+jdLnrt9+m3NfaX3M3qRiTGNRmx8ED/luiRVJC1T+YXT1iOY2VNm+us3HRmpd41ZVcK6/W8d6492lttP0ZBkvtstjV0sss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588908; c=relaxed/simple;
	bh=eMAxaY6rrs6A4fFDj97fh5lJbxCKzyZvCMj8lU7ZYv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NS5HyYeTbJd1EXrx+Z0o9jroqAItcVA7xx108M2qntDaM8YUEYDUmdbasVUkFPJWN3H+Jy88kR0OgzVSq2VFvODzd7IDsDjvrzC4stANTr5jXbz64Hj8vP1dcmDp8TT3rlulylabY4XC3Y5/1Plni0ti/U8yFOMZNaIkYOhz/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wK3tWXqN; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-786d1658793so1945277b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763588906; x=1764193706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXtu45HOp+QjQ+CGzoiEYHv/Opj+rrusKUOIKh83wnI=;
        b=wK3tWXqNwLNwYIAI1kfyVVwIL1mx8sz1awHYhhHbqUBQ18CncFn+ESD0Y5J3S2ogll
         iCC3+341ef0m/HChdRGyV4HNkbl/dmc53XnQkcUeAvTm+A6m9Dq8Q/acpGD1447foLL9
         AGHZSairuarGZYRdWaAq0oPDZYQ50Ly/YPZkdQaAiJE5+Q7MmItjRUlcSjrn0KIaey+2
         D8H5FEi2ukBEmzhRWkl/tL52mNWj0qmFqySAY+OUi8DgDd8CtdnAYrSUPT4wIKms1yJj
         vRUhy5zQTZZDVlZuQb0xZkLwgHW5reJzmLy5VFHVkO6X71yxpHJSI36NHRoBag2gJ2z6
         XuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763588906; x=1764193706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXtu45HOp+QjQ+CGzoiEYHv/Opj+rrusKUOIKh83wnI=;
        b=TCp8dadSOpnpBWgrIOURTt69FH0zQNl7fCL9AEtUxNVlZDAsYIZ/tI6lFeFBGbu5Wv
         57/eFuZ6sK7rG8ry1suO36TQlWwCFG+My2scccrIv5o6DqeI/dHPtUDzXR6RFoatYJoR
         3pLsOnSuNS51U2gqlzy3vG9+1NssdJLJm7Y7yqeUQzpn71r03e1G1F/7S2ngMs+mxuiR
         iID3m4n1aMzbjvdvFMcLQL5nSVkd1hS7oxwD+WRwvjXJvW1nA5PIU3x9JIIFmN3wY6E4
         yl4939qYxhpZdIKv2yUiPuUCZxpUPkwmFC+Qur2iBpBN++89IBBqJrHx+WLkF6MaPaeC
         1WTw==
X-Forwarded-Encrypted: i=1; AJvYcCWMiP7fpRPzzsOTyHEtZverBx9xaNlCjGQmSQJolYKKTNqjTU9Dn+8+5ilmQoCxiSi1Z0PyG/bw341n@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCMfQngiMijoe6bscmh3V1GHLBnELS2XQCl351wDl4pZm8cXg
	xY8iOlFpjSkCpupJQU2JmbKdYG8zVdjs7MmGekcUwSJ/LL/TkdXA6Ld+J2Ecw31X5YN5BCiy4cn
	T7H4ME8oMDsQNGIyJrTqX1GbTmeEAQUxBhn0Os2xrpQ==
X-Gm-Gg: ASbGncteU7iOqqVtDjUiZq72SDwJ/QtgETFJReHBaA/a/ph4rcL5f4joujqFZcBkM2s
	h6AZbeibarti038B39KSWwL2rXEy5ARMC1WGqZSWqwz8uYXsVbLsFsp1HtWxl3bNlvelN0SSdN+
	FcrZ4UnSQ3qgFXfVbwTTUF6gAXhY82y3HXEjm1plqUgVgwkFkjUX4oS5Zc9TQqpX8xR+DPDCv1V
	UiPnFinWlWFagapr2MLkJAJ8MAPg/iNKxJHOH9SHtgSFGbjlRyHGbtrVahwV3v4icST5sw=
X-Google-Smtp-Source: AGHT+IGDpkg7exJ/L3Ahb/UZhNymY3zPF/urZZEwLsEjgdmdnaEH4u3MrHvlfcwNsFivy+Jy/cJhcXSItGBraBKnZdI=
X-Received: by 2002:a05:690c:b9b:b0:786:69ee:15f2 with SMTP id
 00721157ae682-78a7955c398mr18167777b3.3.1763588905537; Wed, 19 Nov 2025
 13:48:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com> <20251119-bacterium-banana-abcdf5c9fbc5@spud>
In-Reply-To: <20251119-bacterium-banana-abcdf5c9fbc5@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 22:48:07 +0100
X-Gm-Features: AWmQ_blHf69FNaCM4oz-zmhrDHvaNKVrXd90BkuQsgnRM7qYBXKg3H2UOXoKiOs
Message-ID: <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 7:23=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Wed, Nov 19, 2025 at 01:08:26PM +0100, Linus Walleij wrote:
> > On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:

> > > +       //TODO @Linus, it correct to group these 3? There's no contro=
l over voltage.
> > > +       case PIN_CONFIG_INPUT_SCHMITT:
> > > +       case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > +       case PIN_CONFIG_INPUT_SCHMITT_UV:
> >
> > Consider not supporting some like PIN_CONFIG_INPUT_SCHMITT_UV
> > in the bindings if they don't make any sense, and let it just return er=
ror
> > if someone tries to do that.
> >
> > Isn't PIN_CONFIG_INPUT_SCHMITT_ENABLE the only one that
> > makes sense for this hardware?
>
> Yeah, I just didn't know if having the others was helpful, since they
> say things like:
>  * @PIN_CONFIG_INPUT_SCHMITT: this will configure an input pin to run in
>  *      schmitt-trigger mode. If the schmitt-trigger has adjustable hyste=
resis,
>  *      the threshold value is given on a custom format as argument when
>  *      setting pins to this mode.
> which implies they should be implemented for systen not permitting
> hysteresis adjustment.

I see.

I looked at the bindings that look like this and are not 1:1 to the
in-kernel configs:

  input-schmitt-enable:
    type: boolean
    description: enable schmitt-trigger mode

  input-schmitt-disable:
    type: boolean
    description: disable schmitt-trigger mode

  input-schmitt-microvolt:
    description: threshold strength for schmitt-trigger

1. input-schmitt is missing! But it is right there in
drivers/pinctrl/pinconf-generic.c ... All DTS files appear to be
using input-schmitt-enable/disable and -microvolt.

2. input-schmitt-microvolt should probably be used separately
to set the voltage threshold and can be used in conjunction
with input-schmitt-enable in the same node. In your case
you probably don't want to use it at all and disallow it.

They are all treated individually in the parser.

Maybe we could patch the docs in pinconf-generic.h to make it clear that
they are all mutually exclusive.

The DT parser is a bit primitive for these.
For example right now it is fine with the schema
to set input-schmitt-enable and input-schmitt-disable at the same time, and
the result will be enabled because of parse order :/

The real trick would be to also make the
schema in Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
make them at least mutually exclusive and deprecate the
input-schmitt that noone is using, maybe that is simpler than I think?

Yours,
Linus Walleij

