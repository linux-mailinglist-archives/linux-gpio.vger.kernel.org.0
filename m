Return-Path: <linux-gpio+bounces-39930-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +I09E+K6U2qCeQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39930-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 18:03:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D31BB7454A0
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 18:03:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ABFVP7L6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39930-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39930-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31D2F3003606
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 16:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258E12701BB;
	Sun, 12 Jul 2026 16:03:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB52773DE
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 16:03:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872220; cv=pass; b=K1F1ivHO5s1u3N2YDry5XCu8z0GCNKTZztkN1AGacdnJBW+RDEywWbD4+47BXRgTbFnwIOh2rFDMJTjYJmO4xZt5rsY/iIcRnKh0Zq4eODpekG7m5ZwRcVUg6LRyo7Tn3ru1EIyv0U2yVchnp7ubL4uHEjePHJ7L6sel7oXlmLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872220; c=relaxed/simple;
	bh=Y5U7o3MoFragefFGlIAbSwXv5uezv4fetCvCEUv1FO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLG9lbRW0IuTrQiVYQLmpMPG9+mRuMjsYdO4/nBLfu/y+Anq/d56bHvk37G0SakGPoiON7oGDtNylm9rzVVyG4SWrDQPBWdphrVNZkM6Q6pG2kQLs+feFGMNqooRL+0C8uKph+9yiDzcKQL15letdo+H65M/U84ewz9MNCR4gCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABFVP7L6; arc=pass smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1719520a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783872219; cv=none;
        d=google.com; s=arc-20260327;
        b=GM539naHAi+Jilcd8TuuGJJJSkKwvbA78acVRGOeY7hlILgHTBaBrsrGVv6VKu/i5p
         J11me01t5aCl2cToM2L7ZJUoe6alsi+fOqAt8Ue8duy+za3PcgcGj80eYPOryljDuArM
         +0wd/IpDRFXycdJr0s5FQYdHecb1xHDQjj7wKgbR6tiaG9FO1hxiYEFYOfDQXCuBPSWu
         1e+3Q/s40AiCA+RKmKWC+mla9NowBYKN94qzeTg+J0UBkPRfYlPi09gHY3ef6SlaCigF
         qGPZqsgepsgkttcpeOyQ1MyM8bh/aKLL1VzxjB1wBCvGp1Wu3xFPHRC9Gymnzpb6Ubdp
         bFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFvLh7Vsfcz2Mq3+Nid++P/J5oTQIp76A0wwsGSrijA=;
        fh=bWTilA6IkSUcngTgYBnbZlu3LkJfVi8rW12ocCzH5I0=;
        b=btKr5ucxlAVsmkmHZM1VpzCHfiA2azkMI3ukYYMjObVUYfwJJe1CTPDOsaVd0Ihbyw
         CfEMfx48e9tGoZkM6+i6NiYbnIPiBIdAcqSs965h+KYTBPWXAcHMiyZSLBP1whBzg3si
         etJ44/WQm1N37RUiZZTnUsnnuoxLTKNuXVsrKc2VB3k/CrxNS8ZdExNEfo0tNB0zHjsr
         sjtDcujVx+wZTQrcseQqBNXbeOINCyn214YQcaPE0aoVO3NqhyJU6AzgG2pBFXhCk5hW
         DPHI/Vpkk2eZv78ajSKJtQ+1mloZLfqWRLTjC65DRkROXf+CABqJyoGzWBxhjl5Soe3F
         wjlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783872219; x=1784477019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFvLh7Vsfcz2Mq3+Nid++P/J5oTQIp76A0wwsGSrijA=;
        b=ABFVP7L6ZcZDOqqhS3163siEb0R7G2ESLzjVxUDA4ibW1Tdz5s096oOushjYKYLFle
         zuk++F68z8EKpuXv1r9FW5DRXx0pesYRp8w48CR22Yv4ZqSwJuBdvDqj+ZU7vWcIDq5U
         U05Izhi9L5y8BE6cU7pOnzZRBeuSlDOpgmbtRRaJSoil7G6Kz+UBJey2OCMwy5Hh9C95
         0NnH2jqQjcsB1YXa6Ec5ieLRJtyBfUSt3aCG6Xkb5wi4kcYLJLCP4oxNIVLNMJGilDcN
         1GuiOWEXXLlALNsJLAasmIFxz3uKgg1W9jmQizZN1KKGoO/wfnLxp4yCQT3Rf7mWL3r5
         g39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783872219; x=1784477019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFvLh7Vsfcz2Mq3+Nid++P/J5oTQIp76A0wwsGSrijA=;
        b=Zd5stE2ZH+SLA+0pOJeFncq3af2192Ki9TvtyCRXmLm46rN4/eYJOSFrfvlHwzn4AT
         kDP1xrP3BFu42HHdN4LOYlw9ldgrG7CTP1pbHmTUPOmFklIMZpfiUFQavc/P3DAUsT96
         Ksm9zJgKBtQjQr+s+SPVvTR0ziJ9Pam3i/ucU6QXN9RqEt4J0ric52LAIlkaLHiX7eCr
         TLtZZmejQZUsRXoiCP4sN9+dN90DbChOvzKsbd20DNckH6nB79YnaQV0/lRmjPxwBvJw
         hMtWVcdkU9Y5QKo/oVRNE01/9UAxzqs8IyXQS0UgaRuCjjcZTIzpMSmXZzMOOTA0DDP5
         KSRA==
X-Forwarded-Encrypted: i=1; AHgh+RqI5SCCP7G647NXhkVp5CIRPhcGqoe7m0zycit3f8eq324uhfuEsW/WBNJYN3Soi8wZ97B4LlOLQGr0@vger.kernel.org
X-Gm-Message-State: AOJu0YwSaHaEro7kHugunKyk/8Arm2cAsw8n4ceH3cgpp/qPgD5jnT2B
	f3BdokOSUzex6QuaC70AtKOaPtR8oYbs7yz65CkeuYrqm52O7VXs8XmdixKMNG9spe/2ENA+Lwr
	gRHkB5mRpxRQZohhZj5ja/N2qZTlyssE=
X-Gm-Gg: AfdE7cl1iC7xxS7B0HYs+UxOXJVMa0LO3UIAKj5r9vf7bwPunqUloHi+vvh8Mimeowj
	IMHjRskU6+R6yyK6/DhBww/dzvcM/fuvaYi0iEE5Cd8GVs3JWP/Zyx+Da4WLzg2qa8sTxHgp4TH
	1baroZCVqu1SaEe61A2EhoYXFRLOKeJ/tslKQDWVBRx3ufP4uQsL8JtEjkjbgFa5ZqL7shZrhlv
	5Tszu3CFBom3Xt5DOp2uRX7lm2wQ9zuX+QA1Plb7gPjFl8xJURyWDLkFSPN/m992vpOX8HDltn1
	ZEUA/kewuavipMegytrOQv/IOkbiVAc=
X-Received: by 2002:a05:6300:67c2:b0:3b4:75c0:3ec0 with SMTP id
 adf61e73a8af0-3c1103d29f2mr6042129637.30.1783872218804; Sun, 12 Jul 2026
 09:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <3e700a3fa7872a96257ff25a77670ec05cfd239c.1782909323.git.mazziesaccount@gmail.com>
 <CAD++jLnaOOoLsLxzib4d1XXLxRpWBPrqCdRwqVVEUmKYS4ad6g@mail.gmail.com>
In-Reply-To: <CAD++jLnaOOoLsLxzib4d1XXLxRpWBPrqCdRwqVVEUmKYS4ad6g@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 19:03:26 +0300
X-Gm-Features: AVVi8CcrijvdbHQVpJqjEqeOb1JSN6FIx_2WzRJ2op4hx0-LyN894GNSivE7TBs
Message-ID: <CANhJrGOHk-Q7zb8sd6PHcf2BfsYxfo97bpm5d3NODBbMgJzTmg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: mfd: ROHM BD73800 PMIC
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39930-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D31BB7454A0

pe 3.7.2026 klo 23.46 Linus Walleij (linusw@kernel.org) kirjoitti:
>
> Hi Matti,
>
> thanks for your patch!

Thank you for the review!

> I have some inevitable pin control nitpicks!

Great! That's what the v1 is sent for, right? ;)

>
> On Wed, Jul 1, 2026 at 2:41=E2=80=AFPM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
>
> > +  # The GPIO1, CLKOUT (GPIO2), FAULT_B and EXTEN_OUT pins can be
> > +  # configured to interrupt pins by OTP.
>
> Maybe move this helpful comment into the top description: instead?
> It's kind of generic helpful info.

Sure. I believe Krzk asked for that too.

>
> > +# The GPIO1, CLKOUT, FAULT_B and EXTEN_OUT pins may be configured for =
a
> > +# specific purpose (like ADC input, 32.768 clk output, fault indicator=
 or
> > +# delivering power sequence to a companion PMIC when multiple PMICs ar=
e
> > +# used) - but also to be either a GPO or GPI. (When used as a GPI the =
pin
> > +# can also be used as an IRQ source). The pin purpose is determined by
> > +# OTP (One Time Programmable memory), typically during device manufact=
uring.
> > +# The OTP can't be read at runtime so device-tree should describe the =
pins.
> > +  rohm,pin-gpio1:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the GPIO1 pin has been set to GPI or GPO at manufact=
uring.
> > +    enum: [gpi, gpo]
> > +
> > +  rohm,pin-clkout:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the CLKOUT pin has been set to GPI or GPO at manufac=
turing.
> > +    enum: [gpi, gpo]
> > +
> > +  rohm,pin-fault-b:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the FAULT_B pin has been set to GPI or GPO at manufa=
cturing.
> > +    enum: [gpi, gpo]
> > +
> > +  rohm,pin-exten:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the EXTEN_OUT pin has been set to GPI or GPO at
> > +      manufacturing.
> > +    enum: [gpi, gpo]
>
> Can we explain what "GPI" and "GPO" means in this context?
>
> I read it as "general purpose input" and "general purpose output", but...
> you just describe the exact purpose? So what is "general purpose"
> about them in that case?

I see I could improve the description. These properties aren't really
configuring the pins, but telling the SW how they have been set at the
manufacturing. For example the CLKOUT pin's "usual" purpose is to be
the RTC CLK output. If this is what has been set to OTP, then the
GP(IO) registers have no relation to the pin and they shouldn't be
used. However, it is possible to configure the OTP so that the CLKOUT
pin is not outputting the RTC CLK, but is a GPO. (Eg, is an output
which HIGH/LOW state can be set by the software). In this case it
truly is a general purpose output. With another OTP config the pin can
be an input, and state can be read from a register.

So, these properties are intended to describe the hardware for the GPIO dri=
ver.

>
> I would re-use "input-enable" and "output-enable" from:
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> (I mean don't $rf that, just use these strings).
>
> I suppose:
> enum: [input-enable, output-enable]

These sound like control properties to me. To me this sounds like a
request to enable input/output - and this is something we can't do
with this IC. But I think you still have a valid point regarding
re-use. I will check this when I rework the series, but I believe the
BD72720 does already use these same properties. I might be able to do
a common binding for these and $ref them from this and BD72720
bindings. (But I will check this when I am back at the business).

>
> > +  rohm,clkout-open-drain:
> > +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "c=
mos".
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 1
>
> Here I would also reuse the generic pinconf properties,
> something like;
>
> rohm,clkout-drive-type:
>   enum: [drive-push-pull, drive-open-drain]
>
> (Push-pull is what is colloquially referred to as "cmos".)
>
> > +            rohm,pin-gpio1 =3D "gpo";
> > +            rohm,pin-exten =3D "gpi";
>
> If you instead use nodes with properties you can do this:
>
> rohm,pin-clkout {
>     output-enable;
>     drive-push-pull;
> };
>
> This collects the clkout config in one place and make
> it obvious what is going on. But I don't know what the DT
> maintainers think about this idea.

I will take a better look at this when I am back. Still, the
"rohm,clkout-open-drain" is also already used by
rohm,bd71815-pmic.yaml, rohm,bd71828-pmic.yaml and
rohm,bd72720-pmic.yaml so I am a bit reluctant to changing it as it'd
require me to either ask people to change their dt-entries (asking for
a nose bleed) or support both old and new properties in the same
driver (asking for a nose bleed).  :)

Yours,
    -- Matti

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

