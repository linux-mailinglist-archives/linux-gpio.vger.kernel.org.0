Return-Path: <linux-gpio+bounces-26406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD1B8AC5A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 19:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA8087B80FA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 17:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A814027932B;
	Fri, 19 Sep 2025 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trIoGFAE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670EB247295
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758303222; cv=none; b=tyMqwYWzKncafLMH+j1bBx6Z6cQ1EUdRpIdPSeP0mfMNEm8mUbR6ZfDnfFMefeCpGKn/4HEThoiii3U6CNs+N8UzmtcyiLz/kmc5+2IGbd8OGyMpzi3DnNCpSjM7fFFpbT8l1xpK/iW4Ktm/DfaRntMUfwkEf5TgULg6XHBqROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758303222; c=relaxed/simple;
	bh=+STrF9PYCBuc8/qsS+R4t2F0Hq1eLV08xgFRkBJD3nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8T/rTmicpsMvLV0hUHMQDCPzWxxdi6ZTTpOI2BGZ+76XtuKe7ucBR7KEf8imMrgFQU/7K36EeeP2TwTB826S135+dzJZX1G0Y02wf37UsSj33Kl8dAoguMRSKNSwB1HRF+eJDSGYe7zc+/Bi2bCST/rpSdbISd2UpMr7qBdxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trIoGFAE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40578C4CEF9
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758303222;
	bh=+STrF9PYCBuc8/qsS+R4t2F0Hq1eLV08xgFRkBJD3nc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=trIoGFAE4UosNsFMT+rSrmDzqZUOaGqRMFx98wg6sX51fjVkofYbQuqQ86twtURoa
	 8YF3T77sDkXbCe7VL6Ve0tKbOIb174SO0mRTonUzt3Fgz5BI8Ju/oghIXc3n7U3sqS
	 Xzv629DmvW8TjdfFM2VsFREnSyTuzMg8r+fwXeaO+WHraHHlnf/Xj8LzZx6g4oA0JQ
	 OEXbtmxDM/lOAj/Qc5j/9UrCpdy1FCT+QFw/4WvYW0UYn3ElrUIMS2KK/F+Ucc0Fei
	 Io6wsFBsig40LatLLL6dZ1apRIU0Z/bZ0sIr9fmVwCxh5LyXQgFMxrYmdeI9StMTqA
	 9BbkWg038aolA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fd0d29e2bso1053572a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 10:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfa9uwPLJySuhiTfp3kwLZXfu4eQli65p77Tr6nQymvV+RziSXQFYcZwU3CgKXW7UW3VZAQEJctPgw@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbIni+1wmNCRSVFPefhL+KKfHtzmM1X3Dxyqs1lB6rFYbVpMl
	LFF5WwpxEP5jTlUfJqFkbzbCMBgTwBp6AqtfBSRobW8IfsthbkLLZQGBK02rUQMH08l691XgsWx
	7fILyRs8x42nMdFY+Xhl4QHEE0tfCIw==
X-Google-Smtp-Source: AGHT+IFdAHQZ/nDUnKsSSIL9qonNEPFjd3PHBSsoiQD+Q5n/+BJxgmT2/kYpRWAJZfsEz+lU2Sc7msvI1kFYm4PEGLA=
X-Received: by 2002:a05:6402:35d3:b0:62f:40c7:8543 with SMTP id
 4fb4d7f45d1cf-62fc08d7695mr3868736a12.6.1758303220768; Fri, 19 Sep 2025
 10:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-7-herve.codina@bootlin.com> <20250918-majestic-mockup-0a0e090db0a7@spud>
 <20250918171502.411c3527@bootlin.com> <20250918-education-resource-aac71b87e979@spud>
 <20250918173915.730bc3db@bootlin.com> <20250918-flakily-thermos-5404fb4bcd1a@spud>
In-Reply-To: <20250918-flakily-thermos-5404fb4bcd1a@spud>
From: Rob Herring <robh@kernel.org>
Date: Fri, 19 Sep 2025 12:33:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4CNq-NRDYz8bsTrAqv7rZwd_FYR+z-97o1UfnBp9=Wg@mail.gmail.com>
X-Gm-Features: AS18NWDOpFL6VIHjLpp_0Gr54mKQd2E6A2Ik4bvpTdMu2EYUpi-oL3EoqZwJsAo
Message-ID: <CAL_JsqK4CNq-NRDYz8bsTrAqv7rZwd_FYR+z-97o1UfnBp9=Wg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
To: Conor Dooley <conor@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 10:44=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Sep 18, 2025 at 05:39:15PM +0200, Herve Codina wrote:
> > On Thu, 18 Sep 2025 16:26:59 +0100
> > Conor Dooley <conor@kernel.org> wrote:
> >
> > > On Thu, Sep 18, 2025 at 05:15:02PM +0200, Herve Codina wrote:
> > > > Hi Conor,
> > > >
> > > > On Thu, 18 Sep 2025 16:06:04 +0100
> > > > Conor Dooley <conor@kernel.org> wrote:
> > > >
> > > > > On Thu, Sep 18, 2025 at 12:40:04PM +0200, Herve Codina (Schneider=
 Electric) wrote:
> > > > > > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Tho=
se
> > > > > > interruption lines are multiplexed by the GPIO Interrupt Multip=
lexer in
> > > > > > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lin=
es.
> > > > > >
> > > > > > The GPIO interrupt multiplexer IP does nothing but select 8 GPI=
O
> > > > > > IRQ lines out of the 96 available to wire them to the GIC input=
 lines.
> > > > > >
> > > > > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@=
bootlin.com>
> > > > > > ---
> > > > > >  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++=
++++++++
> > > > > >  1 file changed, 87 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/soc/renes=
as/renesas,rzn1-gpioirqmux.yaml
> > > > >
> > > > > This is an interrupt controller, please move it to that subdirect=
ory.
> > > >
> > > > Not so sure. It is a nexus node. It routes interrupt signals to the
> > > > interrupt controller (interrupt-map) but it is not an interrupt con=
troller
> > > > itself.
> > > >
> > > > I am not sure that it should be moved to the interrupt-controller
> > > > directory.
> > >
> > > Your node name choice disagrees with you!
> >
> > Oups, you're right, my bad.
> >
> > What do you think if I change the node name from "interrupt-controller"=
 to
> > "interrupt-mux" in the next iteration?
>
> I guess, sure.

Stick with interrupt-controller. That's what the schema expects and
'interrupt-mux' (or any other variation) is not in the spec.

