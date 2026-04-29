Return-Path: <linux-gpio+bounces-35805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKOvEPlA8mkApQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 19:33:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F589498363
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 19:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ABC1302AD3C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 17:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105CA413235;
	Wed, 29 Apr 2026 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEKrzCC/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A8A410D12
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484013; cv=pass; b=Py7MfzfBpHanpgOlTU/n1JFd3QefenzMl8+axpJZYBXyvMJ9vfkomUB0AtscFovuR/KTJfvjL/hbna8h9JB36hsC1LWlbHanxnSWQw5BbdNOEhv0OpIriKgGwLOjWwiDjfxFw2i3QS9bXYMgQNvSETMn+dJ3IxXCak3Dur7iODw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484013; c=relaxed/simple;
	bh=kN1Jg8zrE0WkiYysXn+g0/IiPU/u/Efvo6UZbhbtzTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ/MGVQYlNhntBbfRxlJ6aFlgf+hGZR05nE1mg+zzwVBZA6c2pj7FDAoay/ElqInrZgEiJYDegAEB+a39zYsISkvTZCLj71MW7frlHwXTDyVcUr754CkYHtn2YSiZVgrxvlYZU1jNAhjJ9Zsf0mhXO39nf6tIE08uUeJHAxLAuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEKrzCC/; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67790429f71so91519a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777484010; cv=none;
        d=google.com; s=arc-20240605;
        b=aNsOX3DhKpjhLSECH0KufvlqApZTzpZ4ebEama0nJcXTmwz09Ir8N1bqKZD6kcnD5b
         BKs4bHRYqQMk2b7lvLbIjBYmE7DwrHaFTrDjKEwVTnIwUHuDsKGehT9/7b2Ks63qUUCP
         SAhBa2CNlKRtmVr0jZ5YAhnR3gFXWgMRXkRt1/EWhe8sPooKJNadmmQm9mMUaD6hmGkW
         xaNnbDuTkzrN18VMrY7o8yC+eVmezHQSPVegDrAa8RmTxv9hC98FXk8Fn0El3s7eevOK
         d3IaKccXusm8tphIKLPtR3BJeRwaFAVOhQwGZYhY6HOZtLabpyNcOhVUicAtkN0CaoT6
         2TOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        fh=588J30mhYViVj980MO0/OnpELYmgqsom/etWV6zTdJc=;
        b=JXhMaMDFzCUhCRIpKLLAE0FaWdhqbzaBKwfMAB0DR2yWNQ1CCvdqIjv/U69bLH/R3x
         9rm/zyvjnTKJe7a0mBmIs82c4JS1Sw/A55Iam6xhUqBVzGofG9r3bLMomLJoH9OzqsFj
         MjFto9ZG4iw+ntHSHnlLEVEy6gnnXRHPuHtuxDaidjFAo4t6cKtMe6CCew4mS7+bOFgL
         7mvwV5qUHuSeNNxwlkCGH04rShAylvNEf6/tsgPA1z6JmSqpO6GUS4WOw6zom9z45U/6
         hsMpJGdlNrgb4xB/J7RFZh82anHIiGyrhOI6Efux+0Wu22xVnkPrJbKzQ9CBubKmvqfQ
         A57Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777484010; x=1778088810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=PEKrzCC/rAYDBGbkyjxCwRTqVSUmwyhWncEDGEJDD1tfT5AzME3HRihUbthWq6pyp7
         QycNd14wHmXXNN4jxEJuyFaSq0o38AsPNg5DRuCjwju8yAj+dHEc5XA3z+AOik/nGGFV
         PDb5YwnzrlCwoYLc4vYEYt8bxJOeIFByHRSmhhXVCB7oQ/GbdX0I9UeL/bv7mhXQri8i
         gjprCCsn+XGTdBgqVKYQvvzUE5ujR0ETrdAn/nn7Rpy9ZbsyZ5UUHHoya8VBKoH+tUWZ
         oLZq+y8E9nwRapDuGWGykFWfM1s5u9sPt7k1ygv6klmBTPlahP7K493EyogU3Qa68M07
         NlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484010; x=1778088810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=SoguRAewmximxFdUMsQGIjyglyRbmb7w2W/lUqbEVDQeKtiyCiEmcAkL9olYxSQ/K+
         4vxBhg35W7FfUzZYHN1xaz3j9N5ab7tN+vhFqPXCQUkGBZNvgYCA0gtgC4Y4zLIRep10
         P0JFfZ0gMZq9xSjaeRwumTzFm1w4DY3QTNYDOfa7wj2mGyqsrm9LM5x+w25i5ErITM4C
         GubbvKEOz5VuvO1pasXvkyph1vSCl7gwGMpcvPQktmYIrbd9bA+inBi0yWlWaHT5LniY
         tJA6hxgjEvgjB94rhgacAPO3ImjYUJl8CUmwLlLDt6/iO511M9esM0b0W27nTDlE5Rvr
         cnQg==
X-Forwarded-Encrypted: i=1; AFNElJ9RxyfiRP+wx1RLgq/QFjcl8wh5D6urdwo4cv3RldbPs1j3dlpiwgF2Sj2HJOYgfkKjenSklPsj1IzY@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcin+Tx+FG/ALu2MPlyvP5b2u28jS8bisKgPiw5aF6T1eAeof
	goeSGeS4dBk0yoUxXUFBCkLEwUn/79m83queM40dgqH1Ju9O8Af46gbwCr5OblHv89Emm62T1Ex
	W+GBKI8wInKo3ac9ehaKdRqfPats9pveAWv+KlZfI0A==
X-Gm-Gg: AeBDietvUKwC/T4TK45Qd5q0Py+i8ghzk5AbR6ZGikgYkoVItJfYjnAHxhU0rkQUnCJ
	JJz0XussjrGGwqazLoZiftKK/fMd1jkScRAsKFmS49g9eaFe3zlZS8IZ3RhOz9cFmGIdCltvblu
	bes7Nn5xJQdkN4EsT6ETlX+zED6uwL/53wgXnMhJxBqhEWZC/+szDR+6frImAQ5bYBYFOfEfsld
	hkYU/gQM6BcrtNAAx5GAxt3D5WIGuW0r9RDefje+k1SKv6VONc7l/J29vLgNshx34Bb8LNo0Yl2
	7WGcXDqsqtWnTSmM9NAzquTOk+HTMkIzmhIfCcReSFOT7Y8EZwTk
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr5034063a12.13.1777484010328; Wed, 29 Apr 2026
 10:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 11:33:18 -0600
X-Gm-Features: AVHnY4KBveuXaT50xXGT561BJAnz_p9YSdb7SJnI5b60PkMgL6_ZMJ8SGU0KF-U
Message-ID: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9F589498363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35805-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,ti.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, April 29, 2026 10:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver
> > > > > > struct virtio_gpio_response {
> > > > > >         __u8 status;
> > > > > >         __u8 value;
> > > > > > };
> > > >
> > > > > It is the same message format. Please see the message definition
> > > > (GET_DIRECTION) below:
> > > >
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > >
> > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > >
> > >
> > > Some changes to the message format are necessary.
> > >
> > > Virtio uses two communication channels (virtqueues): one for requests and
> > replies, and a second one for events.
> > > In contrast, rpmsg provides only a single communication channel, so a
> > > type field is required to distinguish between different kinds of messages.
> > >
> > > Since rpmsg replies and events share the same message format, an additional
> > line is introduced to handle both cases.
> > >
> > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > uniquely identify the target controller.
> >
> > I have commented on this before - RPMSG is already providing multiplexing
> > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > one GPIO controller.
> >
>
> You still need a way to let the remote side know which port the endpoint maps to, either
> by embedding the port information in the message (the current way), or by sending it
> separately.
>

An endpoint is created with every namespace request.  There should be
one namespace request for every GPIO controller, which yields a unique
endpoint for each controller and eliminates the need for an extra
field to identify them.

> Shenwei
>
> > >
> > > Shenwei
> > >
> > > >        Andrew

