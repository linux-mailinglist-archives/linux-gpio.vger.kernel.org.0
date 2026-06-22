Return-Path: <linux-gpio+bounces-38785-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E43bDMEEOWoKlgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38785-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:47:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4926AE66E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:47:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vr7PVhbv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38785-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38785-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A57C300C017
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 09:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B4B364943;
	Mon, 22 Jun 2026 09:47:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C223A1684;
	Mon, 22 Jun 2026 09:47:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121659; cv=none; b=eWCbos/N9LJBLQQrd5ImUupAOoS8nsekQOiJYsPPrNtbceM8+4zGRMMEx5YfcLZ5eLVFgu0USd5bqsOu36MMrclddFmjS3TJi4LE1k4Qt10SYngSZk+5uqwwOjTKOInOr/TU3kBrs7eNGQonY6aTWu9avBxuOThBvBQSLwxk0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121659; c=relaxed/simple;
	bh=kq1TWWaWz4JxuT486DLHsuubNhsLfiudA7mhq6tfj2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZUPtasDxqjAwrlQvuRBo1L7goY/M6LkmjseBIo+J6lA1CwcIOhWF2SMmpXB0fdlHgUdPm1xnUAsJ/+XEOF5cAWX1S7yz72mpSmlyTDczfJZlyP5kxt26166nU2tW1YLf6hXbkEqPxwFCwqn8RnaDYGTfjtRciqV/XmFAYkutdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr7PVhbv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796FF1F000E9;
	Mon, 22 Jun 2026 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782121655;
	bh=bWE7qvAYRYKI3hRdY2piIWvs0fVbJcPJuA/ePpRA8nY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Vr7PVhbvG/1UgKbHFvt58Wz4jeQ4diPANr6q+zYuH6HY1dh7euxOCK9Saq7GjpUo2
	 yTU246ojHyZtR7baACzNequfN1CFzLtlWK38M/ZQRx0PHjOTfuNVu4Z4Ne7CepW4qn
	 egIKpCDOtEAv8KtKo6zm8mwGn/zRO9MdfzPJAUhNg/SWAHCIQBE3Yr42M/iRZOpntN
	 RJxWs+vedD/ohe022/LBbYNGWslyjfsDA1oHDfQH0LaR3wwjnR1u1uSVi/ZrSMmaPG
	 Vxv1RYi82ct+Oj2yYeqp6lHsgjhiy7VI4rLVIOHqbslfeNmpOR2E/wbKWgjPVYKQJS
	 bBVwb1UjlEoWg==
Date: Mon, 22 Jun 2026 10:47:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
Message-ID: <20260622104728.039a5ea2@jic23-huawei>
In-Reply-To: <DJF5ATR2RPDJ.3LSN8DY58E6RO@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
	<20260612-ads126x-v1-2-894c788d03ed@gmail.com>
	<20260613-sparkling-naughty-tuna-3e9bf1@quoll>
	<DJ92M0ZMSI2C.2I39LHFRNQS7W@gmail.com>
	<a994993e-7459-48a2-a8d7-823c1b0c9545@kernel.org>
	<20260621153318.4a723e3b@jic23-huawei>
	<DJF5ATR2RPDJ.3LSN8DY58E6RO@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38785-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE4926AE66E

On Sun, 21 Jun 2026 19:18:33 -0500
"Kurt Borja" <kuurtb@gmail.com> wrote:

> On Sun Jun 21, 2026 at 9:33 AM -05, Jonathan Cameron wrote:
> > On Mon, 15 Jun 2026 06:30:28 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >  
> >> On 14/06/2026 22:56, Kurt Borja wrote:  
> >> > On Sat Jun 13, 2026 at 1:59 PM -05, Krzysztof Kozlowski wrote:
> >> > 
> >> > [...]
> >> >     
> >> >> Functions used by probe() should be before probe(), not somewhere in the
> >> >> middle of the code. IOW, entire probe is together.    
> >> > 
> >> > I they all are, it's just that regmap stuff takes a huge chunk. I'll
> >> > check how to reorganize.
> >> > 
> >> > [...]
> >> >     
> >> >>> +static const struct of_device_id ads1262_of_match[] = {
> >> >>> +	{ .compatible = "ti,ads1262" },
> >> >>> +	{ .compatible = "ti,ads1263" },    
> >> >>
> >> >> So devices are fully compatible? Then it should be expressed in the
> >> >> binding and drop one entry here.    
> >> > 
> >> > Not fully compatible as Jonathan said. One is a subset of the other.    
> >> 
> >> This is THE meaning of compatible!  
> >
> > This one I'm in agreement with. It is a strict subset, so should be
> > using a fallback.  If the fallback is used, you just get support of the
> > stuff in the simpler chip (or if you can override it with a chip ID
> > you might still 'upgrade' to the more complex driver support).
> > If you do end up with properties that only apply to 'new' parts of
> > the more complex chip then they should be verified as part of the
> > binding (assuming you can do that without the verifier complaining
> > - I haven't checked!)  
> 
> In v1 I had the "adc" subnode which was specific to ADS1263. Then I
> agreed to drop the subnode but I'm having second thoughts...
> 
> If we dropped it, then we would still have some specific stuff.
> #io-channel-cells would be "const: 2" in ADS1263 chips. Also ADS1263's
> channels would have an extra ti,vref-adc2 prop, for ADC2 voltage
> reference selection. I should maybe also add a vref-adc2-supply.
> 
> Maybe it's better to keep the subnode or, again, go for something like:
> 
>     spi {
>         multi-adc@0 {
>             adc@0 {
>                 ...
>                 vref-suppy = <&adc1-vref>;
> 
>                 channel@0 {
>                     ...
>                     reference-source = <ADS1262_VREF_AIN0_AIN1>;
>                 };
>             };
>             adc@1 {
>                 ...
>                 vref-suppy = <&adc2-vref>;
> 
>                 channel@0 {
>                     ...
>                     reference-source = <ADS1262_VREF_AIN2_AIN3>;
>                 };
>             };
>         };
>     };
> 
> In this case we would have to kinda duplicate channel description, but I
> don't think it's that bad.
> 
> Jonathan, Krzysztof, David, thoughts?
> 
> IMO the ADC2 specific voltage reference stuff is a strong argument for a
> subnode or the above solution.

Given you end up with channel specific stuff that differs I think it probably
makes sense - though I do wonder a bit if that is real.  What's the use case
for using a different reference for the monitoring / debug than the main one?
I could imagine some dynamic use where you want to sanity check against
a wider reference range, but maybe that needs userspace control rather than
in here?  

Jonathan


> 
> >
> > The SLF3F discussion is about (to me) less obvious case of not a strict
> > subset, but rather being detectable parts with different channel related
> > properties.  In that case the ID match is necessary for anything to work.
> > Anyhow, that discussion is in a different thread and not really relevant
> > here.
> >
> > Jonathan
> >  
> >> 
> >> 
> >> Best regards,
> >> Krzysztof  
> 


