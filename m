Return-Path: <linux-gpio+bounces-33191-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMBfJBnGsWnvFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33191-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:44:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9172698C8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FC57301B79B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91033750A9;
	Wed, 11 Mar 2026 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+6M41CM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A190377008
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258262; cv=none; b=fhLsTlcyCg20k5lBMT8NE60/wgF5KbJdV65FGJGd3v+mVcU4yEWpKwi1o3+uW1oBgq+9t0nGUJ9WECsgAhXgASxo1SD5l+d5wpH06R2SpGADbZ0zxGeNFxYKzsSLJSOAq0dvx1eonWW10qVJv3HHFUc6Ywhr65g3OYgvz6UqqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258262; c=relaxed/simple;
	bh=39PeX03cfW+OogOTezHdW5pPVtlIWod9VLbZMi7czDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j68BFNb/GnKgV/lMzrz7vi4ZQQs+Eh+3IFgBE08GTjyuATLRyAA3qnTr5hNwuWSzs1+Myf4rSpqDWZ908SIu2shuChcXy+lMfFkXzs2rvcUB5dk0JyQpvt/xk0LPVSCef0fVlES7hBSuiXbjJ/9PiKwVeVRJhCKrjdadd3OFjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+6M41CM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4D7C2BCB3
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773258261;
	bh=39PeX03cfW+OogOTezHdW5pPVtlIWod9VLbZMi7czDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s+6M41CMEQAx7onDSAvubBk35bOYaeNmb2f/KV3UCl47p5OOXHfmRbfL/P/WpgbXK
	 y6K91LYP5r0lQD03qeiWhZguPkv7WWpJamO5OPlGVcBmw/RWQQL/mg/IslEf6e8LIU
	 rE5B9ErCZMsDIE/InQfUbXNqE/mRRmFlFhs9sU460o9fgJLBABj3GODXDdeIFON3zl
	 l1pv11UB3Atj8JAxKkbq030GS2zWLpTfWhU7Ynmh83Qc7nhPzCbA/TypbJwqI0a1u0
	 Xd1ztlhQ0+Ex/tfgaAKQLXVFMum8hi/8WB4gByx46kcrZHHe0A0w32N8HqSZXX4XuS
	 9d0uq3TuLGnUg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b966a7b1908so18657966b.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxDB1Q84xLm0/HENT6AIXhrzpHT/dRjQU5ItFBJIDACcXv+E2ZeNZTnU0bZ0+KHVFGWi+3dUQcsBj+@vger.kernel.org
X-Gm-Message-State: AOJu0YzLl6oEkgtyRkJdJobPkBX6TBGPY/Y0j1rYLsCX076jxiNpsBKx
	xefLdJJHdECYxs5MWHABLl6mAfLUsHxuyrMqxLU9W7MA6RmfHBE+agT+DP4RCWpzmtccOJMyc4n
	WCJNtLyJ3SB/ak9aoMh9/AGkp3h1+RA==
X-Received: by 2002:a17:907:72c2:b0:b8e:d4ed:5ef2 with SMTP id
 a640c23a62f3a-b972e5b211amr251839466b.58.1773258259961; Wed, 11 Mar 2026
 12:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-collar-smokiness-5313aa648a6f@spud>
 <177324727784.4047403.339169143402607624.robh@kernel.org> <20260311-unlovable-ecosphere-07df196823b3@spud>
In-Reply-To: <20260311-unlovable-ecosphere-07df196823b3@spud>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Mar 2026 14:44:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJsP3ySdNJrJ9C-jSc1gKKWPwK0Z4sJjBW0wqvyk5ppjw@mail.gmail.com>
X-Gm-Features: AaiRm50k2V92nCmEywPA1fhJ0QoUN0pDSozwDYs95PdSX28ynGVvAIorcAx8lSw
Message-ID: <CAL_JsqJsP3ySdNJrJ9C-jSc1gKKWPwK0Z4sJjBW0wqvyk5ppjw@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
To: Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Daire McNamara <daire.mcnamara@microchip.com>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33191-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.54:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,bootlin.com:email,microchip.com:email,devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B9172698C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 12:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> Rob,
>
> On Wed, Mar 11, 2026 at 11:41:17AM -0500, Rob Herring (Arm) wrote:
> >
> > On Wed, 11 Mar 2026 15:17:39 +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > On PolarFire SoC there are more GPIO interrupts than there are interr=
upt
> > > lines available on the PLIC, and a runtime configurable mux is used t=
o
> > > decide which interrupts are assigned direct connections to the PLIC &
> > > which are relegated to sharing a line.
> > >
> > > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 77 +++++++++++++++++=
++
> > >  .../microchip,mpfs-mss-top-sysreg.yaml        |  4 +
> > >  2 files changed, 81 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/microchip/m=
icrochip,mpfs-irqmux.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
>
> AAAAAAAAA, goddammit. I forgot there was a reason why I had not just
> sent off the new version of the series.

Providing reviews of bindings entitles you to free testing of your patches.=
 :)

> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.e=
xample.dts:18.33-24.11: Warning (interrupt_provider): /example-0/interrupt-=
controller@54: '#interrupt-cells' found, but node is not an interrupt provi=
der
> > Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.e=
xample.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provide=
r'
>
> I wanted to ask about this Rob, I wasn't sure I fully understood it.
> I figured it was because...
>
>
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (=
microchip,mpfs-irqmux): 'interrupt-map' is a required property
> >       from schema $id: http://devicetree.org/schemas/soc/microchip/micr=
ochip,mpfs-irqmux.yaml
>
> ...I had not added the interrupt-map yet...

Yes.

> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (=
microchip,mpfs-irqmux): 'interrupt-map' is a dependency of 'interrupt-map-m=
ask'
> >       from schema $id: http://devicetree.org/schemas/interrupt-controll=
er.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (=
microchip,mpfs-irqmux): 'anyOf' conditional failed, one must be fixed:
> >       'interrupt-controller' is a required property
> >       'interrupt-map' is a required property
> >       from schema $id: http://devicetree.org/schemas/interrupt-controll=
er.yaml
>
> ...so this schema complained. But why is there a custom warning about
> "node is not an interrupt provider", when the conditional schema
> produces a warning of its own?

The first warning is from dtc. There is some overlap with schema checks.

Rob

