Return-Path: <linux-gpio+bounces-24319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 001AAB22EC6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 19:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED8D67B0C91
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 17:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9F42FDC2A;
	Tue, 12 Aug 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrx7ONev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433802FDC22;
	Tue, 12 Aug 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018981; cv=none; b=CP7rVoGAELN/lMJ3DXpqRkOvURCoI9DnClLu4dqdG15LlaiEWmWcZvWQYJGtIwZp+yioW77dl/w+mz9sYSMbooTyLSyRJLpF6xsJAPYWzpz2+vb7k5USpWjzfs3tYWmPD5rlv+OmcGSZ84nUo0STtQgEUH44wUhUpmdFVKpaKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018981; c=relaxed/simple;
	bh=hiKx5h6WgJ1kRSlNqANQXTbZ/qufuAsjkmYJWLdzY/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ck0C9EfIyaAZn6nRNte/iPdPCjH1XmIkr0spdv5AJ3iBO+V2NkWGQg1kA3wOOi5E7i7E0VGhX2X+P3liZb6AVXLMv8xK0tWg7l793vkKloF01ssxPsxvV33Ng6XD0Pi/wl82QwzciPGK7GBwybDKVjlo/l5PxL35zRyf3jFG4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrx7ONev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085B8C4CEF9;
	Tue, 12 Aug 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755018981;
	bh=hiKx5h6WgJ1kRSlNqANQXTbZ/qufuAsjkmYJWLdzY/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rrx7ONevt651nfLg0mqbamZT+I9vsT7FOdqYPWXahJLbdCSR9mxCrDH69WVkjOJFJ
	 sQrSPjjyETzpVgPm/FHFSlCO56TxP9G1ojEVjiQONhbWjmHp/jN3AGYxeDXB4e9tl1
	 glmCD6QGhW2LROTweKFIBVLIf3b2wlfF0JZzidE0Sv/duoSwFiK67XXeW0tyfVD0p1
	 qFw12ZcpeprdH93mFyOicmwAeeVdeemJK2Apu8OvKbP5yYC2TKznK1bubWNGb9egnq
	 3Gt1V6Wv6p+XqgkHEaM4Xh6Q+NAEFXFo+NMzcls9CuGdnwu7g9utWKlCFpqWlmxiMv
	 j2QJ2LTmx0ywA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af96d097df5so1043620266b.3;
        Tue, 12 Aug 2025 10:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcx18mKhV4JI1t8hY+1EK/pYbtlbJacs9/dGMXcGP0F1tJo/fx7oiK4/ad23FMCzYNHKd3Bz6pJnDDKmeU@vger.kernel.org, AJvYcCV5F5izSu4RvsSDC5t2G/xgKiJiI8SvnYlgJUudNcjZBq1CDRiVHATAbynHblTLczX9PqVP1B4W1lZT2g==@vger.kernel.org, AJvYcCXk58MGqzwg1JHt7AjAyuf/nBCfTSz1NZDx73pBH7+q+Ws6OEPxScLcVq0oBHnvUQuPenmiE4h4DCdx@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQynzZXfaQXB2ICxMvHTVDXVj+d/JIGtI8eiRfwqjOnYcSZl0
	Lg7qqEeP6JCEEeb9BX19Q36209UgT8fzA5KiJIs7aFqi+qid5JpWDA/0IBp+29W3ry1jzpjdVP9
	1C88lpomgDISsl+uJiAzNZ5Ff4gANrA==
X-Google-Smtp-Source: AGHT+IEBE2ikhAU2DNl85LpL+NhY5CizUSURSGTC9MFOW45Us0P1xe9kfUVQc4IbWaS2z6b1ZX94B9hdIEwvFsOIwvk=
X-Received: by 2002:a17:906:c145:b0:ae3:4f80:ac4c with SMTP id
 a640c23a62f3a-afca4cca31fmr10795866b.12.1755018979494; Tue, 12 Aug 2025
 10:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
In-Reply-To: <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Aug 2025 12:16:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
X-Gm-Features: Ac12FXw2MCpi_Gef6Ss--eZgTnXi88_EsAQqYxE-YlC_gadE4Co6lYS79wZ_vkE
Message-ID: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Krzysztof Kozlowski <krzk@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/08/2025 13:02, Christophe Leroy wrote:
> > The QUICC Engine provides interrupts for a few I/O ports. This is
> > handled via a separate interrupt ID and managed via a triplet of
> > dedicated registers hosted by the SoC.
> >
> > Implement an interrupt driver for it for that those IRQs can then
> > be linked to the related GPIOs.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,qe-ports-ic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-po=
rts-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports=
-ic.yaml
> > new file mode 100644
> > index 0000000000000..7c98706d03dd1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.=
yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> > +
> > +maintainers:
> > +  - name: Christophe Leroy
> > +    email: christophe.leroy@csgroup.eu
>
> Oh no...
>
> > +
> > +description: |
> > +  Interrupt controller for the QUICC Engine I/O ports found on some
> > +  Freescale/NXP PowerQUICC and QorIQ SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,mpc8323-qe-ports-ic
> > +      - fsl,mpc8360-qe-ports-ic
> > +      - fsl,mpc8568-qe-ports-ic
> > +
> > +  reg:
> > +    description: Base address and size of the QE I/O Ports Interrupt C=
ontroller registers.
> > +    minItems: 1
> > +    maxItems: 1
>
> This was never tested but more important this and everything further
> looks like generated by AI. Please don't do that or at least mark it
> clearly, so I will prioritize accordingly (hint: AI generates poor code
> and burden to decipher AI slop should not be on open source reviewers
> but on users of AI, but as one of maintainers probably you already know
> that, so sorry for lecturing).

If anyone needs some AI (chatgpt) converted bindings, my "dt-convert"
branch has ~800 of them. Feeding the warnings back to AI to fix was
somewhat effective. The result is not the worst I've seen submitted.
It saves some of the boilerplate, but can't fix things that are just
wrong or unclear in .txt bindings. Despite my 'prompt engineering'
attempts, it still tends to get the same things wrong over and over.

Rob

