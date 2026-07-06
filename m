Return-Path: <linux-gpio+bounces-39493-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QFpgIMZ6S2qBSAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39493-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:52:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44E70ECAA
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:52:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=gW1AZif3;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39493-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39493-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24FE43056FDE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 08:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5565247ECF3;
	Mon,  6 Jul 2026 08:48:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE44189D5
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 08:48:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327733; cv=none; b=dP7UxUhclsB0u7uFRxinxkPi4fs2nfnKVeTcaIjiRhtLr6CP1bCKZDzBfck5YuisDNllAuXT5cCxlW3LV0VKsitZU1E/y6r7gNsGKbaV9lUeiyuxXl/k/gUonl6a1jGTOD7F//1k2ucq9TSogoTAxLNtjpI42o8XV0eFo3FMiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327733; c=relaxed/simple;
	bh=z2oTf9yYxPo6yQtv8mYvhxIjMC9eUcS2nJLqAhDWmuo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IRbGFCKU+ROD0/Nq2eBwBRrVh6H7j/H/2kuZmjxXpbyoMDmKc5GZk0Cabw67BwRE8R++NCJjAcZf+p1is+KSRnrWRiQ3/5m2s65pgl+tOO3ZAgogCQpWuodySeKn/RXYz0UKCsA03rEcbdiipZ5O9cLtHsxCIvtZkU06EywGg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gW1AZif3; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 522D11A0E82;
	Mon,  6 Jul 2026 08:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17D68601A2;
	Mon,  6 Jul 2026 08:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6922C11BB9D9D;
	Mon,  6 Jul 2026 10:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783327717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4G2+USFAeZTDisSq/eM4nDWS0t6QootkKLNwL7GEI6s=;
	b=gW1AZif3NdWuwJpcaSREpPyyzuzLVd6yQeWN/RWYlglDm0RwfTJdyVqzGj2HaxYgqGb15r
	SI5y5Jtp6apxHnFT3jd5CKjLqUDoukQNNZ6T47eGareIAu+Vj0a+MwOm6j17N2t5v+Itsy
	I6bmUZdZ1Xn4YFbvDRlORuo/quhrnQyqTdRLXtYOMjuuevVQjLX7KR00jqSc/EHkmD812F
	LkIoPE9qnTCZ7hVcb36epMNvJ35G+b4CplTfizscLw+l9t4n6lh6SkRn5Ohq4SROCD5iVb
	iphsKW7hpvYrGOOv2tSBXA6qa3bHMKVscFwAojrisvLbZNZaqPgshagL764ZOw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:48:32 +0200
Message-Id: <DJRCWXDUGFY8.1AIUFSEBFTG94@bootlin.com>
Cc: "Qiang Zhao" <qiang.zhao@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
 <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
In-Reply-To: <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39493-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:paul.louvel@bootlin.com,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,lists.ozlabs.org,lists.infradead.org,vger.kernel.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,bootlin.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB44E70ECAA

On Mon Jul 6, 2026 at 8:52 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 03:30:12PM +0200, Paul Louvel wrote:
>> Some QE GPIO pins have an associated interrupt line in the QE PIC to
>> signal state changes on the pin.  Add the corresponding
>> interrupt-controller / nexus properties to the QE GPIO binding.
>>=20
>> Because the GPIO controller does not perform any interrupt handling
>> itself, a nexus node (interrupt-map) is used to map each GPIO line
>> supporting IRQ to the parent QE PIC interrupt domain.
>>=20
>> As the QE PIC can be configured to generate an interrupt on either a
>> high-to-low transition or any change in signal state, three
>> interrupt-map entries are needed per GPIO pin that can yield an
>> interrupt (falling, both, and the "none" case which defaults to both in
>> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
>> property is not part of the DT specification.
>>=20
>> The interrupt-map property is optional: it is not required for GPIO
>> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
>> or when interrupt functionality is not used.
>>=20
>> Update the example to show a scenario where each bank supports a
>> different numbers of IRQs, or no IRQs at all.
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>> ---
>>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 69 +++++++++++++++=
++++++-
>>  1 file changed, 66 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario=
-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-ba=
nk.yaml
>> index 1af99339ff40..0c849a5698f4 100644
>> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.y=
aml
>> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.y=
aml
>> @@ -27,6 +27,17 @@ properties:
>>    "#gpio-cells":
>>      const: 2
>> =20
>> +  "#address-cells":
>> +    const: 0
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +
>
> If this has interrupt-cells, then it is a nexus, thus why isn't this
> also a "interrupt-controller"?

Because these these banks are not interrupt controllers.
Interrupts are handled by the QE PIC, and the GPIO controller does not do a=
ny
interrupt handling itself.
In this setup, does it really needs an "interrupt-controller" property?

>
>> +  interrupt-map:
>> +    description: |
>> +      Specifies the mapping of GPIO lines to the parent interrupt contr=
oller, as the
>> +      GPIO controller does not do interrupt handling itself.
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -37,9 +48,61 @@ additionalProperties: false
>> =20
>>  examples:
>>    - |
>> -    gpio-controller@1400 {
>> -        compatible =3D "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-par=
io-bank";
>> -        reg =3D <0x1400 0x18>;
>
> I don't get why you rewrite existing example instead of adding new one.

I could yes.

>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pic: interrupt-controller {
>> +      interrupt-controller;
>> +      #address-cells =3D <0>;
>> +      #interrupt-cells =3D <2>;
>> +    };
>
> Drop node, irrelevant.
>
>> +
>> +    gpio-controller@1418 {
>> +        #gpio-cells =3D <2>;
>> +        #address-cells =3D <0>;
>> +        #interrupt-cells =3D <2>;
>> +        compatible =3D "fsl,mpc8323-qe-pario-bank";
>> +        reg =3D <0x1418 0x18>;
>
> And now you are not following DTS coding style.
>
>>          gpio-controller;
>> +        interrupt-map =3D <
>> +          7 IRQ_TYPE_EDGE_FALLING  &pic 4 IRQ_TYPE_EDGE_FALLING
>> +          7 IRQ_TYPE_EDGE_BOTH     &pic 4 IRQ_TYPE_EDGE_BOTH
>> +          7 0                      &pic 4 IRQ_TYPE_NONE
>> +
>> +          9 IRQ_TYPE_EDGE_FALLING  &pic 5 IRQ_TYPE_EDGE_FALLING
>> +          9 IRQ_TYPE_EDGE_BOTH     &pic 5 IRQ_TYPE_EDGE_BOTH
>> +          9 0                      &pic 5 IRQ_TYPE_NONE
>> +
>> +          25 IRQ_TYPE_EDGE_FALLING &pic 6 IRQ_TYPE_EDGE_FALLING
>> +          25 IRQ_TYPE_EDGE_BOTH    &pic 6 IRQ_TYPE_EDGE_BOTH
>> +          25 0                     &pic 6 IRQ_TYPE_NONE
>> +
>> +          27 IRQ_TYPE_EDGE_FALLING &pic 7 IRQ_TYPE_EDGE_FALLING
>> +          27 IRQ_TYPE_EDGE_BOTH    &pic 7 IRQ_TYPE_EDGE_BOTH
>> +          27 0                     &pic 7 IRQ_TYPE_NONE
>> +        >;
>> +    };
>> +
>> +    gpio-controller@1430 {
>>          #gpio-cells =3D <2>;
>
> So two new examples? But old one was wrong?
>
>> +        #address-cells =3D <0>;
>> +        #interrupt-cells =3D <2>;
>> +        compatible =3D "fsl,mpc8323-qe-pario-bank";
>> +        reg =3D <0x1430 0x18>;
>> +        gpio-controller;
>> +        interrupt-map =3D <
>> +          24 IRQ_TYPE_EDGE_FALLING &pic 8 IRQ_TYPE_EDGE_FALLING
>> +          24 IRQ_TYPE_EDGE_BOTH    &pic 8 IRQ_TYPE_EDGE_BOTH
>> +          24 0                     &pic 8 IRQ_TYPE_NONE
>> +
>> +          29 IRQ_TYPE_EDGE_FALLING &pic 9 IRQ_TYPE_EDGE_FALLING
>> +          29 IRQ_TYPE_EDGE_BOTH    &pic 9 IRQ_TYPE_EDGE_BOTH
>> +          29 0                     &pic 9 IRQ_TYPE_NONE
>> +        >;
>> +    };
>> +
>> +    gpio-controller@1448 {
>> +        #gpio-cells =3D <2>;
>> +        compatible =3D "fsl,mpc8323-qe-pario-bank";
>
> Wait, three examples? But isn't this the same as previous one?

I wanted to outline that each bank do not have the same number of GPIO line=
s
that support interrupts.

>
>> +        reg =3D <0x1448 0x18>;
>> +        gpio-controller;
>>      };
>>=20
>> --=20
>> 2.55.0
>>=20

Thanks,
Paul.




--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


