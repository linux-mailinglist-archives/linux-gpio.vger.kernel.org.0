Return-Path: <linux-gpio+bounces-10713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84C98DB08
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7CF1C20E09
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3681D07BC;
	Wed,  2 Oct 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJCiRoVJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756611D0F71;
	Wed,  2 Oct 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878938; cv=none; b=jVazVk80h1ZjA0I/nBaeoiWuV7YRIBugcXiV5RnVVaUHqjlyPLcYiJEOZdEegPplo2/ZY5LTCrcMmslQbQdMr0gMX70R8X7WSFhTJJOtqoCG5IdCF+feBDrkkqFnaoqyo+OCi2DkN38vv6TYj9Ga/mI2rBQt6r65lCOuZMqRW18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878938; c=relaxed/simple;
	bh=2SrLfB54i0n+nB96XgKNRFkKMrLGl0RXmHN2/ftbl9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTLlGxwfnILqzBn2YCqf0dS/XhwqJpiOfDQmwNgNxAOkQgjHpXhgpL+RbBljW1sFm6hcwBP/tHf949DpzBvL6iyygFCsNc+UE78yv79Ylt3guC9DnHyO6rey3X6Oiwso+tYl4JmcoWCpx4tAcEHLrwmoe+fw9m/zbzsF+Jio3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJCiRoVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446C0C4CECD;
	Wed,  2 Oct 2024 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727878938;
	bh=2SrLfB54i0n+nB96XgKNRFkKMrLGl0RXmHN2/ftbl9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJCiRoVJ2VX7Zv/PucdIM1++E19KhNDWwG2WQ9XZ7imYga3P3LRz4bAc3uNcDj6CS
	 +4mMMGHoKiGE8k2cOuCzLGbfjV5JgaannSCR1XWbEvDJ6kBTCz6ddWd8X2ujYXeEeS
	 gM46XIOItthc+fu/nWVImTipm6fvtmkOLRzIwEPNX3kSUdJc/PGfOkuDp5YIM7PPrh
	 HCvjDJzhANml+ZSlfMwHtiY15VCSfi6BLoNG249GNMCjDxPaYOlQcL6X/kEhHh47p9
	 2rEGlfBujfG/RqLX/wUzTTXS0eBNoyHyCIxo4Z4h3bg64rfKH+uwuWHoPYDuH6wtC3
	 0uOMZeh+xjgew==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53988c54ec8so6204077e87.0;
        Wed, 02 Oct 2024 07:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWJIwFiaAt4v9bcKDzUFaCmuwbaDPXxCFKnTYzUtqKtFtuga+ANaqx6jidL+qj2tMQ77wr74WSIU6B8FFi@vger.kernel.org, AJvYcCXXvTL27jO29DtjtOj9eyW6aePbSsDDsE9P/Q0wO+A8pSH/5mUAZULFuNdls0pTY1QuQLlWNi+t1NDm3g==@vger.kernel.org, AJvYcCXamLGh+T1g2ZHgHa8g1ieWL3ByICGFBuRtkYag4otZQJxso7cEOF5ZXfSEWVYyQBpxp6C2YnZfgwRW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uLHEeqcuXJSaEYaiuPL4Ii7/jKVD4CKXD19vM8hRm//AKve+
	4DRti7QR2E0+s4HD9kxMZn2OE3d4hHcBzjQ1XGo4kpPmeuUOuYuxZWRqTv0teDelIBPxZ6YUPls
	Yj3Vi20JmgWfmbysgDmdJa9KEmg==
X-Google-Smtp-Source: AGHT+IHgfZX6X89URDIQx3zhgPCvhBbz2WhgVN86b2htMQnLx1g3W/UhzAdWE/tXBKOj+8dUzY2C8TSqBSFUDwHi1A0=
X-Received: by 2002:a05:6512:2203:b0:539:8d2c:c01c with SMTP id
 2adb3069b0e04-539a079eb2dmr1919798e87.41.1727878936658; Wed, 02 Oct 2024
 07:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925173504.1906872-1-robh@kernel.org> <CACRpkdYh22c08kLWDJ3wmK+i9-C2ngXdJwhg-kAXfdy2+mcB0Q@mail.gmail.com>
 <CAMRc=McdAwEUCDouUeOENt36LZ+d4Fd=yeqzm9dn83XSqZpQFA@mail.gmail.com>
In-Reply-To: <CAMRc=McdAwEUCDouUeOENt36LZ+d4Fd=yeqzm9dn83XSqZpQFA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 2 Oct 2024 09:22:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8HxEYicNKu0zhfWKY8Ui9657PWEDFr8maSWKaeJijXg@mail.gmail.com>
Message-ID: <CAL_JsqK8HxEYicNKu0zhfWKY8Ui9657PWEDFr8maSWKaeJijXg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing
 "#interrupt-cells" to example
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 8:32=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 7:35=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> >
> > > Enabling dtc interrupt_provider check reveals the example is missing =
the
> > > "#interrupt-cells" property as it is a dependency of
> > > "interrupt-controller".
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Can you please merge this into the DT git tree?
> >
> > Yours,
> > Linus Walleij
>
> It's already upstream. I learned it when I tried picking it up. Rob:
> any chance you could send b4 notifications when applying patches to
> your tree?

It's not upstream. The ep9301 one is because Arnd applied it.

I do send notifications when applying things. Not using b4 though
because I haven't converted my scripts to it for that yet.

Rob

