Return-Path: <linux-gpio+bounces-11846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE99AC72F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 11:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F4BC28295D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 09:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A7519E7F9;
	Wed, 23 Oct 2024 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YkHQL7Dn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9144194136
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677505; cv=none; b=Ax5kFbHj243ht8Sq5wnZpUBhFDeGi4k9EsNgC+mjn3pcFLKgNxi/IfQRcn+6kTjiQupwvNFxchzfGUgRDvcJqDd1BJzwffjnJvcWx2STCv1E6MIg71BIJnokOs4dlTPX2cshed4VRW6O/6T1LTQb4zmA4ddMStiN1LWWMLF8tb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677505; c=relaxed/simple;
	bh=2L9Ape+8+yTZPYfTF9lq2DArA0UAGnHMSIi/f1A9gfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewhqOpg4JAHeaDEgQplnfdBgyKKMmt+vzo9feIjyUgsvQs97uQ1er7ptk23i+w2t1GB1GD1volNG2460dgEr4j4n+6/jl8HqPfSEWTy4I28CeVi1441/V/MuoX2D4JYuesAsrKhg8hFnCrRBvt/3WsezkgAHXOzjerFJ7SRWjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YkHQL7Dn; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e690479cso7079766e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677502; x=1730282302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L9Ape+8+yTZPYfTF9lq2DArA0UAGnHMSIi/f1A9gfo=;
        b=YkHQL7DnsYQhrzyr2n1lTllPnMBWm0sSpdrh3kHFmETztJidDH/MccHCf/2pRluxor
         BE9eL92/+oryL9Q62thn8oe9+s5tRZODf2IVfM0XSEPgRtrr1SXeod9eb1PRwQ2Jijym
         +aduy4nzhoCgBkxHYYVUVctSjntB0UAjaiKY9B3toBqRY244aQkU0MNUbx0RIc8OqJL7
         OhU0aUYmYT+I67gCljdrOkebxETocfW9/3XmGiACApjEJOfeATFC5RET8t2tHVB1q+gH
         mYYlBtiVdm7Uvl6wep+atsTdzqibVpFEmR9Z7l1eA+64Vz3ZQvfsXZo8Vxf6kppgvQdN
         qgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677502; x=1730282302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L9Ape+8+yTZPYfTF9lq2DArA0UAGnHMSIi/f1A9gfo=;
        b=S9b7XQC3nQhnIFjC4Lu56Rz8ZrnYk/zHJODx1tGxGmcFEGGNOJN5GazeMi3oW68aDa
         q8/KHH1pCTnCI0elv69DsSuMuFCecPhtlmI1IM+egcfiZpiPPnG2U5xSRlKotCGxiWg9
         Vr9hdVDdIwZ6OyX0GrAj5s2Yl/riyWCJ9bKXUNE3CeoNfRsiUyRBwtR6WN+vn5EEQnPV
         pazPwr81LKxN8oOy0Q3/ediB5n+QuQB1XhZ1ZIqbWlKj0bfLJhoijk4YU198iSx8d9yQ
         oIeEYOpEvK0plUTVj7UqQOIj3ixdZ6PXoqZeQSV67oPr3CGOABN0/n2NtStCqFOcLg1L
         WDtA==
X-Forwarded-Encrypted: i=1; AJvYcCX0bPjg7VTx0qXX91ZZ/hdV08KxTO5GTC2/vCIUUZxAzlOjUnHyzJJs+CDTAPfl0p1dI8P38SvJCNLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6nakFT3gIF+GoDp+nQpi7XXjNWEcOQvbV60YAVRkdB5HQYWOP
	nkYi6ZWdd7lN1QwilV0/Wg/9/hw96WFZ1OAC5ItMNY3qdO+B0obFFQmt5kAXzKSaakfgJTZvlqf
	So4Mb56S51DeiAB112z4pplLId8q+bplj9/gCGg==
X-Google-Smtp-Source: AGHT+IEMaIVffKoEGuSVtg7x47gj83aOUojX3IM7m0iK6Z0nZEbKP1bY+xstXSXj6igHPpLfZOwnpBcyvDYP8Q2VVnc=
X-Received: by 2002:a05:6512:2211:b0:539:958a:8fb1 with SMTP id
 2adb3069b0e04-53b1a394c17mr776373e87.60.1729677502024; Wed, 23 Oct 2024
 02:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud> <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
 <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
 <20241016-cobbler-connector-9b17ec158e3a@spud> <20241022-unrushed-dragonish-2949ee887824@spud>
In-Reply-To: <20241022-unrushed-dragonish-2949ee887824@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:58:09 +0200
Message-ID: <CACRpkdboUNST1Fc75DZOQsbysW15X4VQMcVKS6TcuH=wNsoFFw@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 6:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Wed, Oct 16, 2024 at 08:42:51PM +0100, Conor Dooley wrote:
> > On Wed, Oct 16, 2024 at 09:26:13PM +0200, Linus Walleij wrote:
> > > On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM Conor Dooley <conor@kernel.o=
rg> wrote:
> > >
> > > > What does bring a nice simplification though, IMO, is regmap. I am
> > > > pretty sure that using it was one of the suggestions made last time
> > > > Lewis submitted this - so I think I'm going to do that instead.
> > >
> > > If you have the time. Using GPIO_REGMAP for MMIO is not that
> > > common and I think the driver is pretty neat as it stands.
> >
> > As with using the common MMIO stuff, I don't think GPIO_REGMAP provides
> > that much value as I cannot use the direction stuff from it. I was
> > thinking of using regmap directly, like:
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/=
?h=3Dgpio-no-irq&id=3Dc8933e1e3600e3fa29efe28fbb2e343e133f9d67
> > which I think reduces how ugly the two direction functions look.
>
> Sorry to bother you Linus, but I was hoping to see some sort of comment
> here before I squash this stuff and submit a new version. Is something
> like what I linked above acceptable?

I pretty much trust your judgement on this, I'm fine with either solution,
the patch is also perfectly fine already as it is unless you want to polish=
 it
further.

Yours,
Linus Walleij

