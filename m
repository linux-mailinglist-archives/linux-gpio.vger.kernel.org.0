Return-Path: <linux-gpio+bounces-12445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E09B8F20
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC041F22C65
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 10:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A108D15D5C5;
	Fri,  1 Nov 2024 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIXeLKXT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718715A85A
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456715; cv=none; b=oC1YhpQ1JZ2E4lKNoXT08C2d7iQCSw3yF3gzcebxpy93hEiTf2qrkSBUcoD7+6Y2uxEW2ZQCJS0p7q0z47pNCngVWosCISWZn/xvr6y+w/a7LGW+D94wB1ZksZ0asAhjHFWsD4KTsgKMCTprffzxJuYEYA2PfOy1BvJzB4KHLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456715; c=relaxed/simple;
	bh=+yXHMbKZ1H5XAjjCoPBfjF7SFzBBi8D94y9c9WKOknk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijxitINfMgA/2GlX9XpEm3aFjM7/84o/m7Fhcvz1eQDEU3Xqicm11rwd9GaPLyT8VyZo9GkTVJiGxjoxWe2dr0B+U8el6icFqwK5SXjTN7rgXjA4989zTgftclqSiOifcf3QMP6sQwwGgiuFka+EvHettZi3BhD9ZQVcr8fIxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIXeLKXT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5111747cso18389271fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456711; x=1731061511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=;
        b=pIXeLKXT3i+5+lhQQwW32ZtR+YUZytHp9/nV8gXy+MDJLZh4Pt35wL3SKAyl+n/4Jp
         xLTjp8j2iamuabR7bJCYYbGRB423DYN67mWpLK99GBbHkMUb+LNzsMqqDTfna4hPWZnA
         y+KxP1jJd7ckgY1IdGhSUfnCDlJH9cfZ438JqJzqKP9XpMxwanU4SlHYcJuA1GbBVyqB
         3NASVi7d4xns1LC07PGWbh4fYEpxI9O3mroMqGLl5/iJiERjm8PS7kwZ0HlEGtLobBtY
         tmbsV3r+x0l9c2IIIiRAGywaPtARAi4C3UwVJxfeAmpqa65T2JG7Vziu2A8xf1GQRKGY
         RmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456711; x=1731061511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=;
        b=TkzgJQfPUIYbnIGxHlmHFZpsMiPoQqoQVSG5aQBR1u9CgHu54+soQfEXqsEUXtBVEm
         jtpHAO6BRkgCoBAjY62UQik1Jsiqry3PuPZXywYWPncrSAXO+nKO7TZniC/BR8+r6upr
         KiN1DgNy9TGxL4r6melr39wykpUHOrnZ20hR6mqWLq0xvwBV97AFkATyCtMDbrwvRg56
         wiojp4wntUKyE/Xi2Y+Y21tMjFpXOg/DeYv5SvGx2Ld+n5lacpUlWl4l+IKpQ1UD5Vjx
         2zkQKlZQRIClHicVvaL6LdV3Vs1G1U2y5oyaeV7VtjNWW+Q5EWhZ53UWnnI8Znh4/OV6
         GSQw==
X-Forwarded-Encrypted: i=1; AJvYcCWC7L7xthrD4MDuffShRYqVusxnBzDMuZEhmJsFMlAhXC8smsaYDgbhlvKhA5t9gSDNfvER9GY0pwvn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlc01ZS725aIVWkCjoD+whjwRID8ID8HGRwIPg293EDypeBdrx
	XOPOcfTTglfvRSYoNxgfo4NiYJXE75FlyiMvtI5CruqnlKSeP8BU4g/KoabDSjHOjeu5VERpSHm
	hebW+bePH6CTKx03xOHgWQTNIzoCsym0kRPoE/Q==
X-Google-Smtp-Source: AGHT+IEh3UD7clJCQ/gk/n1lZMbdbxLI4TLsCj8gBPyhuLX6iMsirPWos/kw6T81Ngl9MnmOHHdaCm4w/4b+g80Z8io=
X-Received: by 2002:a2e:819:0:b0:2f7:a5fe:adbe with SMTP id
 38308e7fff4ca-2fdec72f2bemr26733951fa.18.1730456711357; Fri, 01 Nov 2024
 03:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-8-antonio.borneo@foss.st.com> <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
 <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
In-Reply-To: <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 11:24:58 +0100
Message-ID: <CACRpkdbne8730=6Hvd2W5ymv3xYNC6ApPthT0Fcb+D-fafA_5A@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Cheick Traore <cheick.traore@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

some responses below!

On Thu, Oct 31, 2024 at 2:44=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> > Otherwise I would say that just checking if the line is in input
> > or output from other properties should be enough to configure
> > this? input-enable, output-enable to name the obvious.
>
> On STM32MP25x there is a 'skew-delay' HW block on each pin,
> but it's applied independently on each pin either only on the
> input direction OR only on the output direction.
> There is no automatic way to switch it between input and
> output path. This property assigns the delay to one path.
> The generic property 'skew-delay' does not considers this
> case.
>
> While I could extend the pinctrl driver to include the info about
> direction, that is trivial for example for UART or SPI, it will fail
> for bidirectional pins like I2C's SDA; some use case could
> require the skew-delay on SDA input path, other on the output path.
> Also the idea of assigning the direction at startup (e.g. in the
> bootloader) is not feasible as the delay depends on the
> functionality that can change at runtime e.g. by loading modules.
> I prefer having this "direction" path explicitly selected through
> a DT property.
>
> The existing properties 'input-enable' and 'output-enable' are
> not specific for the skew-delay.
> And I think it would be confusing having 'input-enable' or
> 'output-enable' associated with a bidirectional pins like I2C's SDA.
>
> I propose to change it as, e.g.
>   st,skew-delay-on-input:
>     type: boolean
>     description: |
>       If this property is present, then skew-delay applies to input path =
only,
>       otherwise it applies to output patch only.
>
> Or, it could be a new generic property (keeping backward compatibility), =
e.g.:
>   skew-delay-direction:
>     enum [0, 1, 2]
>     default: 0
>     description: |
>       0: skew-delay applies to both input and output path, or it switches=
 automatically
>          between the two direction
>       1: skew-delay applies only to input path
>       2: skew-delay applies only to output path

I like this property the most. Can we go with the generic
skew-delay-direction?

Also state in the existing skew-delay property that if
skew-delay-direction is not
present then it is assumed that the property applies to all
directions of a pin.

> > > +          st,io-clk-edge:
> > > +            description: |
> > > +              IO synchronization clock edge
> > > +              0: Data single-edge (changing on rising or falling clo=
ck edge)
> > > +              1: Data double-edge (changing on both clock edges)
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1]
> >
> > This looks like it should be made into a generic property,
>
> I believe it is too specific to ST implementation.
> I see already some 'retime' mentioned in old ST bindings
> bindings/pinctrl/pinctrl-st.txt and bindings/net/sti-dwmac.txt, but the c=
ontrol looks quite different; I don't plan to reuse them.
>
> I will fuse in V2 this property together with the next two in a more
> meaningful one, partially acknowledging your proposal below.

Hmmmm. Let's see. I know that e.g. MMC has similar properties
and if similar things appear in other bindings (not necessarily
pinctrl bindings) then that should also be taken into account.

And in MMC this is called DDR.

Yours,
Linus Walleij

