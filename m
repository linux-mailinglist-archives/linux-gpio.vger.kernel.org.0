Return-Path: <linux-gpio+bounces-18346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636F6A7DD1E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CB216C1E9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63572459CF;
	Mon,  7 Apr 2025 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ewF7B6dS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A550622B8A8
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027524; cv=none; b=E7JcSJkWeT3e784ZE/7569UN/0lprO9wbzviPJ74pZIo3JoBnxtv2OTAhS1HP3ngn+tLXgZR+rh+i8ZhXqbdyQ0+f/rjP66PB0Tj2TuEtIK7f9c32eyzFog7vLn3UpXi8gTIpH1c4oQu47UQfqRch07ATsrBZiEvQ2zzKF44SCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027524; c=relaxed/simple;
	bh=2zAQKYKEskwwU28OH2AkW9XmWSMWx0e+7cB//mUEAUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHgFojLHqckYG2rs8nRtCzSfmd473VrbkJpmEv2TkTBWmqO3nfTcrUkmM9K8hPALS0LNxpnQ8OjQHAyhmeeXOB07BWPQFMroDnmj3J1EW3Hx53Lg8xKgI8RkfqU7hVkEAHkiekJzarMeSMiMjMlzpZC8lllGcxhUo6KvZcKVlPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ewF7B6dS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1884284e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744027521; x=1744632321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyzXLIZQz5jByjQJS2N0CsVIfLCOdR71gsbEiiRIwmo=;
        b=ewF7B6dSA1CQJsoKrxgoM5hdWnj5v0E7VZzoF4F3WPfNp7FcFEJlFC1JKDYEUnLAUn
         P7tF/VofrWu4zQI/pUMbcGcdVm+sjc+MMarRCyhiX4dPiUbFuThLyVQBGktWlxmnXC79
         +Tt2M9cYQiFbXnVJpbm3bZIaT9w3r+pv/aXaA92ZpyS+rCo5yl/UrgyVqM/PlIip/tEj
         PLZoc7xsEKV7BCWcz9yQ1Qd85p6qIi5E6kRWTRHcWgyVKtPt3ksWcNjJE3QsbOQDF4TE
         DXOYIOcL0LEyXJtJ60Cs+bgWK0HTCD6zZzPTlBikcNmHrzGcxUWmZk8zToSOtmYsGGPb
         XdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027521; x=1744632321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyzXLIZQz5jByjQJS2N0CsVIfLCOdR71gsbEiiRIwmo=;
        b=UmacSg2SrSIb2k74oy0/c1KOKiusyJn7RuFhfTyQwZ0+hGFwkQBhINzqNA2NTspLfA
         aNb87oX5mQC72PebRcA18njsXxGOpTOq3QTlHJAcGEXnjeVuCwY2uG6nK/YsnTVTGmuZ
         1aFDKBscwDXHRIndqsGhGWFwIScU58LIuJA6dS2nzl564R8+btp9zFO2+WWn2RyBeTCf
         CYB/xInsJ6nWiAwXi3VWgiXE+5JEGCLiLbsckR64c4k/dj3synsJ2kpm3crsMl58cXn6
         P6oUdcMhXEi5JXSrUKu1nBBIoY9AOkA0DWPPK96eKA5kpYQjpY6xiI814Kl2vuEwVbWV
         Viuw==
X-Forwarded-Encrypted: i=1; AJvYcCU59/qajFY7/qefsTOTCw0QzQx+JxDs6x82cHjnzFdDF/Y0YZrfbgdZCZRCVAHfHblzdXzw1l8JovtL@vger.kernel.org
X-Gm-Message-State: AOJu0YxZbMELVL8UHkyZn7cvaBEjQYOAD0evU/A5eydJKURav7LxE9x1
	4Ohm8/MXddW3xL3JqnxIqg1AZx6tRjeMhUT0AIkTX28Puh+mG82FjSBl/yflp5VkjgD6nOzoH/Z
	Ry+jwVgG+4ztuh3E7mPXckr2kV+J1AAlApFxeaA==
X-Gm-Gg: ASbGncvCaeaV3ugvEYzYDUhfXHgTREYKPk9CtSOwod5rkPveUImJcjZ7NUq9/6mb0v5
	MFlkBL+NkV2q/Lb6SmgzNvCPRImC8NwY1Hsd0M8kFTGVf52TKSTlOH5Ovur3zhcuMZcVgL+NjYB
	mcKw2yjd6ygpBKgXGUpbi12p4J+PFB0amVYz7gUNVcgm0mBls0SAWCAlT1SA==
X-Google-Smtp-Source: AGHT+IEHw9355ezApneCF4SUVAzLY4ETP4OFd5PKxXyTOOvjdLrpav+qCe3u7bCH6diRQ2nujvbYSwfCNWcbhNX6Dk8=
X-Received: by 2002:a05:6512:3984:b0:54a:f7fb:ff82 with SMTP id
 2adb3069b0e04-54c2278b893mr3000965e87.26.1744027520594; Mon, 07 Apr 2025
 05:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
 <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com> <6b8583c9-3755-4b33-a454-261854e6cf2f@blaize.com>
In-Reply-To: <6b8583c9-3755-4b33-a454-261854e6cf2f@blaize.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 14:05:08 +0200
X-Gm-Features: ATxdqUEsVQaphQBZzJswprLa4CXDw66XJ1bSTvKJk9OJJy8QVGv0t5yn3iIm7lM
Message-ID: <CAMRc=MetyZqOgtdPgtSVQ2BHDCOAqoE3K70eCehkOscL8kmbMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
To: Neil Jones <neil.jones@blaize.com>
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matthew.redfearn@blaize.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:02=E2=80=AFAM Neil Jones <neil.jones@blaize.com>=
 wrote:
>
> On 27/03/2025 11:27, Nikolaos Pasaloukos wrote:
>
> > This is a custom silicon GPIO driver provided by VeriSilicon
> > Microelectronics. It has 32 input/output ports which can be
> > configured as edge or level triggered interrupts. It also provides
> > a de-bounce feature.
> > This controller is used on the Blaize BLZP1600 SoC.
> >
> > Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> > ---
> >   .../bindings/gpio/blaize,blzp1600-gpio.yaml        | 77 +++++++++++++=
+++++++++
> >   1 file changed, 77 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpi=
o.yaml b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8b7842331a22b7b9fbfa42b=
9c711da99227de2e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/blaize,blzp1600-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Blaize BLZP1600 GPIO controller
> > +
> > +description:
> > +  Blaize BLZP1600 GPIO controller is a design of VeriSilicon APB GPIO =
v0.2
> > +  IP block. It has 32 ports each of which are intended to be represent=
ed
> > +  as child noeds with the generic GPIO-controller properties as descri=
bed
>
> Typo here I assume, should be nodes ?
>
> Also maybe better worded as:
>
> Blaize BLZP1600 GPIO controller is an _implementation_ of the VeriSilicon=
 APB GPIO v0.2 IP block
>

I fixed these in tree, thanks.

Bart

