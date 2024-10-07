Return-Path: <linux-gpio+bounces-10975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F099328C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1CA1C2272B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2F41DA62C;
	Mon,  7 Oct 2024 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufM7qYZH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ED01DA0ED;
	Mon,  7 Oct 2024 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317314; cv=none; b=jINCKwf37MUWYQorwrmAHf5TDl8bZ2ybiV7S8ZDJFQFu34YD9SBcuHW6PvI/QvMJdZooZ1YL8oNpKDMOeETLZnCoMMZkYj3iJYhLh9xAZnvD0RYtbP1We0pM8p6Lhvt+tseNdfdmG2hLSYC16tYndbySCfQiYGFpwRM+665GNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317314; c=relaxed/simple;
	bh=mb/EntZAH5636vRx1tL6DIfFpHNmGBmg1NC7Jttx0u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1E5uXwLvatpaRhwH3Sdd4s5D4+I9v6T6YJsccwZn0/PlEseTkivNuOH/aaazABzeGuNoyCTeMNpaUW6R6sT6mC2y66CKJID5mc/E6QqNKRrAfYl1w2+E+eOxZupDE/H8BBtsI/V9JWbDAA2H5jOC0OsCl938sHl13eU4bhmuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufM7qYZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAFEC4CED2;
	Mon,  7 Oct 2024 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728317314;
	bh=mb/EntZAH5636vRx1tL6DIfFpHNmGBmg1NC7Jttx0u0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ufM7qYZHomEPYQZFDRLbhuB2kRLXduuT6tPJmzZ9+w5xuvpWQ5unFmSKN99rlJMXF
	 KubF7a2e9T1cKKDXBEBIuldmGbzmIe35Z+G7pSZj+tqKZ/YBCK5VmVAEvU9tVm/+wa
	 jXxRhwBcMjsTaVUfxy4nlusrw1AL7r3pI5Gx5sSNqE4/I//PW6Zom9HpG2KjIQ0gPd
	 bRa19dkswMkT1m+ZSnWTfA0bnr5KWPS/SnAqzF4E5jkYBCfWSEjV4lm2s7Ftzul4lB
	 djjztAuUUG8ssgM1PXQ/Mf+ca1LA3RHQcyvIYoSzrF7dM6dvM/blWXYu2IkDOG2q4j
	 WcR6k1gNnvYOw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso63019981fa.3;
        Mon, 07 Oct 2024 09:08:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBrOqBCrmtyo9/uX3+XlTojcuKLgPdrb8DoH1FSG3HxZ3xa53kiyxfpI5IpoMsPprtNRvSxBu4jlx4@vger.kernel.org, AJvYcCWcL7vKHNNI86mvjGJUQMJPhhuwR0QANTvAaik7yTn4KHYCUqFOIdfu5gHz8W2/j8WgHoxwI7o71uvmfg==@vger.kernel.org, AJvYcCXdT42oR4I1RbiYDK+u+ZicI5ymhr0Qy4QA69irepZr3vQChA4NFZO1fJfPUUJ7KCjgwgkn6F+uiVMFRftX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3nDo9mvULSvpxmBV3mTGdpUJLNI2n5Ngr0P5SUv9b0qxMnTpK
	M+LYcg4eBHW+FIHOK8029Nf/wu6WxOHRXZyqJ6dc9nV/WRIbtBOxL+xghCE0k6DiOQp+z8NbXM5
	UDTZcgkIyv2GG9h/F8qFuILYt0w==
X-Google-Smtp-Source: AGHT+IFkJ71X0YYr1aDhpcTISFu8/dx+ZpD8GCVANAoP91uoXdd+XPWx1OEAkEzHRsA84/JqVYKumeOPERd1hITbmKM=
X-Received: by 2002:a05:6512:398a:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-539ab9cf27fmr7669514e87.40.1728317312820; Mon, 07 Oct 2024
 09:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004123423.34519-1-linux@fw-web.de> <20241004123423.34519-4-linux@fw-web.de>
 <20241005184449.GA505893-robh@kernel.org> <DA1815FE-D2A6-46A3-9219-9216A3C6D61A@public-files.de>
In-Reply-To: <DA1815FE-D2A6-46A3-9219-9216A3C6D61A@public-files.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Oct 2024 11:08:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKvJHf0OFpQf0uWeoqyCEvA4gdAyCdd7fD83_qQRSMErA@mail.gmail.com>
Message-ID: <CAL_JsqKvJHf0OFpQf0uWeoqyCEvA4gdAyCdd7fD83_qQRSMErA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
To: frank-w@public-files.de
Cc: Frank Wunderlich <linux@fw-web.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org, john@phrozen.org, 
	ansuelsmth@gmail.com, eladwf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 2:41=E2=80=AFPM Frank Wunderlich <frank-w@public-fil=
es.de> wrote:
>
> Hi Rob
>
> Thank you for first review
>
> Am 5. Oktober 2024 20:44:49 MESZ schrieb Rob Herring <robh@kernel.org>:
> >On Fri, Oct 04, 2024 at 02:34:17PM +0200, Frank Wunderlich wrote:
>
> >> +patternProperties:
> >> +  '-pins$':
> >> +    type: object
> >> +    additionalProperties: false
> >> +
> >> +    patternProperties:
> >> +      '^.*mux.*$':
> >
> >Do you really need 'mux' anywhere in the name?
> >
> >> +        type: object
> >> +        additionalProperties: false
> >> +        description: |
> >> +          pinmux configuration nodes.
> ...
> >> +      '^.*conf.*$':
> >
> >Really need 'conf' anywhere in the name?
> >
> >> +        type: object
> >> +        additionalProperties: false
> >> +        description:
> >> +          pinconf configuration nodes.
> >> +        $ref: /schemas/pinctrl/pincfg-node.yaml
>
> mux and conf are used to match subnodes see example for mdio0_pins
>
> mdio0_pins: mdio0-pins {
>   mux {
>     function =3D "eth";
>     groups =3D "mdc_mdio0";
>   };
>
>   conf {
>     pins =3D "SMI_0_MDC", "SMI_0_MDIO";
>     drive-strength =3D <MTK_DRIVE_8mA>;
>   };
> };
>
> This is same as done for previous SoC like mt7986.

Why do you need foomuxbar? Please define a prefix or suffix (separated
by a '-') or just a fixed string.

Either we missed it on mt7986 or it was documenting something already in us=
e.

Rob

