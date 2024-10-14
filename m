Return-Path: <linux-gpio+bounces-11310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4B99D6E4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 20:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D6B1F236DE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 18:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FE41CACC4;
	Mon, 14 Oct 2024 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3yLn9ZW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4C4683;
	Mon, 14 Oct 2024 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932292; cv=none; b=NurtN1xIhtqHdRpve9qiTzfr4wWpsoPrq5LH3LroiQUjq+TEbXhrrtrdwDckj5/ubfZJeyAi+gb0giSozTlZ6H6tA6whjXOeq9CJUnJ0HprQU2bu4VzpBOHtu/6KnWAgWEdt5D6OOUEqP0ZGEMuHX4CS1QmiGMJyuldkhB3o67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932292; c=relaxed/simple;
	bh=0cNdfxlaAERI2ZFlY9O5b6oEJR0zLiQVvjIssZNT7uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8/AgVeSta3zjSdcEGCy5HerHa6sH7iyeAQLyQJTcUQ2juCdK6JyedLk52dg4lTCswlHpXmkkh/pEbQY4sNxFxl/vFs1quKPFAuOapaklwrX/rPOZVqXbPWW6USj9796HN0dnXuJvRf/IC/c5AOW5EpROuRV/Jv6VRKbp+UYKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3yLn9ZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA8BC4CED2;
	Mon, 14 Oct 2024 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728932291;
	bh=0cNdfxlaAERI2ZFlY9O5b6oEJR0zLiQVvjIssZNT7uA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l3yLn9ZWGzwmeKqHx5fGWbnkT/m9/UciHrCSJZVYcU53aUoevp/gleaS/f9tEbAuS
	 9obNFAtScyRsaWjGPym1pRdg9wlBY8pNmcD+//s+U3D5a5AaU83Cblx7Ah8No78Txp
	 xJ9S2l0HhN7zbfI5Q1UADxk9daxJYM5SIv7wDqDg9oTRrSNtvB7lGj+cfujcjAbvGC
	 1V/bmYhvYw29W27lV8bkT6fBtoaKEUm7lTlYAsIM6vMSJyl9HpNMc74Yl3Lvz+WM1T
	 T6svYEJBkJQeXzorEBuCjtjc46M14Ip54DoyUH9e1x177RDHeBpDy6Y09ytey/HW7q
	 YRHplFP2s8H6w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so2501291fa.3;
        Mon, 14 Oct 2024 11:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu9B086OuvIgZAhSIopDsLHw6M4HaAhhZTKR3NWG9/odkwH+YxlLS0PtFWpXDLyKCouEz3zhwe/6jPag==@vger.kernel.org, AJvYcCWXtbrWj5kc+FN4wAx7PMyzmUVA0s/LjBy76dDyyVxtn0q+8rPsQJPBh0tPSbp4er+W3pEGksUpozsd@vger.kernel.org, AJvYcCXig7FPgvvdONX9jTYW6xJsF65OF7oOydt7i+n4cs6GOodjd0xDqGzTjmqUht/gyVOkFHWF/9PDMHCr40b7@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8toJvtfxYGfdBH828KHLnxw7x8rEVMWLz+rYk9YAbPUz4f7X
	IzOlUyyz8RPvQFXu5dX9iE29gqURmJIGYTqJtb69fNMXnRq1W9mR7hNiYB1iVBhWqkTcP0iniUD
	wc25agIukJvshLRdguHH2fYiogw==
X-Google-Smtp-Source: AGHT+IGB7JJYiM5L2evoekVIoH09vgK4CE4aQy4IbaJ7FdMyUJ22wtpfWp4Rpcz4KtN6+j3CywO20ZHiH68G5gGpwl4=
X-Received: by 2002:a05:6512:23a9:b0:539:9594:b226 with SMTP id
 2adb3069b0e04-539e5620d75mr3724058e87.34.1728932290183; Mon, 14 Oct 2024
 11:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com> <20241011165640.GA2475122-robh@kernel.org>
 <e410cdb6-84a7-482b-9234-3f61077b8151@gmail.com>
In-Reply-To: <e410cdb6-84a7-482b-9234-3f61077b8151@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 13:57:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKdHsf0A38XJ+rwsu2FyLfMmFyL+BHKnTGg0=0A7CfUmQ@mail.gmail.com>
Message-ID: <CAL_JsqKdHsf0A38XJ+rwsu2FyLfMmFyL+BHKnTGg0=0A7CfUmQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 3:09=E2=80=AFAM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
>
> On 11/10/2024 7:56 pm, Rob Herring wrote:
> > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> >> From: Yassine Oudjana <y.oudjana@protonmail.com>
> >>
> >> mediatek,pinctrl-mt6795.yaml has different node name patterns which ma=
tch
> >> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml w=
hich
> >> has a description of the pinmux property, as well as some additional
> >> descriptions for some pin configuration properties. Pull those changes
> >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match =
in
> >> preparation to combine the MT6795 document into it.
> >>
> >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >> ---
> >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++---=
--
> >>   1 file changed, 28 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779=
-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-p=
inctrl.yaml
> >> index 3bbc00df5548d..352a88d7b135e 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> @@ -111,12 +111,12 @@ allOf:
> >>           - "#interrupt-cells"
> >>
> >>   patternProperties:
> >> -  '-[0-9]*$':
> >> +  '-pins$':
> >
> > Worst case, this could be an ABI break. Best case, it's churn for
> > mt6779. Is it worth unifying?
>
> It's better than keeping different patterns, isn't it? We wouldn't have
> ended up here if they were made as one in the beginning as it was ought
> to be considering how similar the hardware is. It's easier to change now
> since nothing is using it yet.

I can only assume there are users unless you tell me otherwise (in the
commit msg).

Rob

