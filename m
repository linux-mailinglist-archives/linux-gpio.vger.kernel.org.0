Return-Path: <linux-gpio+bounces-873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A88013B6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 20:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92CBB1C209D1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 19:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF3251C29;
	Fri,  1 Dec 2023 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/D5xbPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844730FB2;
	Fri,  1 Dec 2023 19:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E313C433C7;
	Fri,  1 Dec 2023 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701460282;
	bh=EJH7pcH1qCI/9Ve49j/evlBf7hZBafJ34Kx2dvf1CwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N/D5xbPMScGWqU7OkCWVs9XjFjv25Aed2kcWHTEMBMKNE2B1NmJyoyZvm8dHnQsGU
	 FoksU6IMv0AC/uDwyWvh5SVGskGdoPaVXg17zr3jLsUy848EnZiNVeVM8LTvqUbApR
	 Tpd3KHLZfVU6wr+FxneehIT6owf4h9nmYyYkqrSxSU+6oBeWSWB4HJ1S1WkyTRbrJz
	 YO1MoQMMRoyxFZ0eFzGA/dzROW3DdmfJCImwvmsLHa4Gk+t2lR1LIkJb9rSmRg46tF
	 9j2bYmZ3iQr5REjUNnJsTfuk0r7mXfj+F4dKrdZLM5C5zp9mr+En7tZUlKm+AkXeQY
	 sR6grXNTQy+Aw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50bbb79f97cso2594668e87.0;
        Fri, 01 Dec 2023 11:51:22 -0800 (PST)
X-Gm-Message-State: AOJu0Yysvo/v6jkzhYgX4czzUXWiN5uPmMOAHq2R+n5eyQvqnNMalEPj
	8jy8fBnZIAUQ1FbEGCgB61ytME5/p7HdBngsJg==
X-Google-Smtp-Source: AGHT+IEMD8rQO1KH9KmGglrp52KHDXnUwLoWuFX1qmdNaWfItn9cnh29V/dJWQgSHPWDEjtq4wpND/HoficI4Tv4oLk=
X-Received: by 2002:ac2:57c9:0:b0:50b:e03b:95f2 with SMTP id
 k9-20020ac257c9000000b0050be03b95f2mr331377lfo.1.1701460280311; Fri, 01 Dec
 2023 11:51:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130172834.12653-1-johan+linaro@kernel.org>
 <20231201144320.GA977713-robh@kernel.org> <ZWoQXHnQbJuoxmw0@hovoldconsulting.com>
In-Reply-To: <ZWoQXHnQbJuoxmw0@hovoldconsulting.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Dec 2023 13:51:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKh=MG_8TtKap5LvUY-u=KTdGrpb-Sf7MAd1JNqQGue8Q@mail.gmail.com>
Message-ID: <CAL_JsqKh=MG_8TtKap5LvUY-u=KTdGrpb-Sf7MAd1JNqQGue8Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: clean up example
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:56=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Fri, Dec 01, 2023 at 08:43:20AM -0600, Rob Herring wrote:
> > On Thu, Nov 30, 2023 at 06:28:34PM +0100, Johan Hovold wrote:
> > > The Multi-Purpose Pin controller block is part of an SPMI PMIC (which=
 in
> > > turns sits on an SPMI bus) and uses a single value for the register
> > > property that corresponds to its base address.
> > >
> > > Clean up the example by adding a parent PMIC node with proper
> > > '#address-cells' and '#size-cells' properties, dropping the incorrect
> > > second register value, adding some newline separators and increasing =
the
> > > indentation to four spaces.
> >
> > This is fine, but I prefer these MFDs have 1 complete example rather
> > than piecemeal examples for each child device.
>
> Yeah, this is not ideal. The closest thing we've got are the examples
> in:
>
>         Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>
> Are you suggesting eventually dropping the examples from the child node
> bindings and adding (several) complete examples in the parent one?

Yes, but if the child nodes are truly reused across multiple PMICs
then, it is probably a worthwhile exception. There's not a great deal
of reuse on most MFDs.

> I guess there would need to be more than one if you want to cover all
> the various child nodes with real examples.

We don't want examples to be exhaustive permutations of every
possibility either.

Rob

