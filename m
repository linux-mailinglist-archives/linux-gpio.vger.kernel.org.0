Return-Path: <linux-gpio+bounces-39921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iohGGF3wUmpSVgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 03:39:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D297743661
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 03:39:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MSSyOB44;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39921-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39921-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B033019F38
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 01:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5FB21256C;
	Sun, 12 Jul 2026 01:39:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3225776;
	Sun, 12 Jul 2026 01:39:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783820368; cv=none; b=g++3/WRveQlTlF06/xJ/YmxupX2N6EnhEcCm19Fkq8uN9GNHCwZSqI98LcohK3mZki9J+dRoTTMNUQ6LC5FhxXPOnS6YJ6R6ig0mYwkwFQLqhcm8WlKNIb6fcz8r1TtBABfyneTXUewzNvFG+r6BzE0isLMkVjN+qJ2raHsCpVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783820368; c=relaxed/simple;
	bh=5oijIS0WvNE8eYZwIxcmNY3efe9YwRaa2Y8G79AVRe4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hRQ3WXjGZhdTgrCKIi2BbWcrMtwbbvL0gmVESLPunpTmeXtMUdjgIRmrI6l8wbIjPt/cgTlueFrnc705Uw+VZgcs6Y7+UhiOkr9njo6Gqse5AIrbks079Ir4xvspU6Z+5dOl/efsgOHI08Pnkb5UJACn9EzYIxOdIoz1y1chVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSSyOB44; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5D31F000E9;
	Sun, 12 Jul 2026 01:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783820367;
	bh=lx6UIKORYr83MRZW/mBwgJxoSVTHyf6D4qI4x8AJ3uY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MSSyOB44OPV2UFjmYVfxjl2DA4q93sKXHnTTVQtN2VhXxARW1pUPWQnNCY5J/Ydyr
	 YMorTtU6Q4tml6uVSemegYj879GlJHOjAe9gu0phFMyArDIoPPmxDlRdW3zpqm9e8d
	 s2WTbdFY7Kl3azgO0pOL2H1neZqQ4jbUhAJIEl5E2F5KQyuHe0oKrSdKpNPqg+WUYc
	 /DVSpkQb/Q8B959GDIaYj1sgJVO3iTacGoa3o3aiN5Ng5MQfGGQ75U6NyT7/fLDD1I
	 OAguLeUshgo5S+lVVe4QhI++F5GImTcZmlY9xaDY+JIU+DrIJxzsmtdmIwL+D4gDiJ
	 9EhZfIfvwTJFA==
Date: Sun, 12 Jul 2026 02:39:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Janani Sunil <janani.sunil@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 jananisunil.dev@gmail.com
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
Message-ID: <20260712023918.119fbecd@jic23-huawei>
In-Reply-To: <a96caaaf-5cac-4bc0-9e74-e48b6fe0afc1@baylibre.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
	<20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
	<36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
	<20260710013322.595f8ee4@jic23-huawei>
	<a96caaaf-5cac-4bc0-9e74-e48b6fe0afc1@baylibre.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39921-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,jic23-huawei:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D297743661

On Sat, 11 Jul 2026 09:40:32 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 7/9/26 7:33 PM, Jonathan Cameron wrote:
> >>> +  adi,common-mode-output:
> >>> +    $ref: /schemas/types.yaml#/definitions/string
> >>> +    enum:
> >>> +      - avdd-avss-half
> >>> +      - 1.65V
> >>> +      - 2.5V
> >>> +      - 2.14V
> >>> +    description:
> >>> +      Common mode voltage output selection.    
> >>
> >> Why not using standard regulator provider bindings for this?  
> > 
> > Interesting question.  If that was done there would need to be
> > a consumer which means explicit modelling of any analog circuit.
> > We do that in a few cases but so far (and yup this is a driver thing
> > in a dt-binding) I don't think we have any way to consumer data when
> > a backend is involved.  
> 
> There is also the regulator-always-on property, so strictly speaking,
> a consumer is not required.

Makes some sense I guess.

How would the voltage be controlled?  Set min and max to same value?

J
> 
> > 	  
> >>  
> >>> +
> >>> +  adi,vcm-power-down:
> >>> +    type: boolean
> >>> +    description: Power down the common mode output buffer    
> >>
> >> Is the buffer separate from the output? In that case I would expect
> >> buffer to be in the property name, otherwise this should just be
> >> part of the enum options above (and the default one at that).
> >>  
> 


