Return-Path: <linux-gpio+bounces-32256-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODCvKbHeoGk4nwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32256-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 01:00:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B51B1165
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 01:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BA24302441E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 00:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4DF2D781B;
	Fri, 27 Feb 2026 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laueYUpu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C92D837C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772150443; cv=none; b=WlDkNxrbCQYnJtRgrNtXJHl6KTVfjaU9ZWyXJoDeIEkFSU6DIDj8aNGETSbKxyZedq3oJj0qhlXw/hjoFpptr6hPNUwWd1qzCgPiQNiz65QINCtFD6Fbfmyigfg8j/fH6q4Qp+rOmHtcQPdsVWnehltCYefRCelDNzezpAQAFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772150443; c=relaxed/simple;
	bh=9DezwKPafh4uiqbk/gjEzFUtqzlwBbzlI4BmHc11dhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXtKnvDpXKE/zvHc3g0yyyE0EddT93SM48yBTp3wdn2PJsx0L1FmhMM0HzI8zp15fmQESF1CX5lkHZqQ+qaWg0P5ILrkdcJQoqrkqHa71boWqleMIDcHbhMbiMp3o6Zz/il6uI0YjMvgNFoZHFVfeX+5QBfofkOOMWlk9d36P+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laueYUpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0970AC2BC86
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772150443;
	bh=9DezwKPafh4uiqbk/gjEzFUtqzlwBbzlI4BmHc11dhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=laueYUpuuYc+GxWvK+6ILshWte/ihb4gEMV5tn8EimGyWRJbCpY8dx/vP47+MjMyf
	 ZZTJ6DdinA6SMT84gvU7sNGo+VKSSR6mtYLODZL9sSQ6a23FFUXXy34e+wmf5TaovF
	 XKrKIAHiK1uv6C0KdrMjWcKTWNLHmVjV9QPZWQATjSUXFLYbrJGJWV/2dLCRenitK8
	 bxCyWB2Ho8IbADrr2cM+0TKxt6mcID7k42E6sTDD1Pn+XGC7u4SkbeItZyNmbo3vih
	 lyVwoqgWyLT1xDk20EITFGsewzbURcw9jot23Fi/2MW9MXmJBTrR2JL+Azovw8+T/Y
	 UNOtkcpcJPCNw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79801df3e42so20345757b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 16:00:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCJTSsQCDxeXmqmoSSgFXQTOZWjseq2p7QBCk7MDu/KFlZyBS03SPahkp/cMC96vYWplkkEPI3n6aF@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRCxazNkLDJolVKaxqggC0WiKOW54jM6Gefg9hvSd4cig/JgP
	3F7GTTYv+PaQECGSwq9Rr8GjcHgONm/GeuUFDMt3QPlaqQ+IfZpHbLLCcEbLkPol2qpdph4H9H0
	98WqaVodR1jSmVhV38qYHVCHbGYks1Qk=
X-Received: by 2002:a05:690c:308a:b0:796:3e25:3e95 with SMTP id
 00721157ae682-79874d00f80mr36642507b3.18.1772150442330; Thu, 26 Feb 2026
 16:00:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch> <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
 <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <2b72kkgwe5hio4uwrxj5oi72llkxhx7egw442fugq6unv7unah@5bfve7k3mvky>
 <PAXPR04MB918508A39832000D786E8F938975A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <l7vmhr5rg444pqp47x2k5ejamjnisx5rqwfmfr6m2tjazxpbm6@wq2vd4hcxco2>
In-Reply-To: <l7vmhr5rg444pqp47x2k5ejamjnisx5rqwfmfr6m2tjazxpbm6@wq2vd4hcxco2>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 01:00:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLkTFHqQRgNeaOmEDOL7AEM8WLVKxU-ZpRyLuw3whOK2ug@mail.gmail.com>
X-Gm-Features: AaiRm53DnshMNxnGb5s2nvHBLr2HJwlmre0-C9Elu3HkLIEYq6Sfix20f-OwTTU
Message-ID: <CAD++jLkTFHqQRgNeaOmEDOL7AEM8WLVKxU-ZpRyLuw3whOK2ug@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
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
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,linaro.org,foss.st.com,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TAGGED_FROM(0.00)[bounces-32256-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: D94B51B1165
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 10:02=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:

> > Thanks for the explanation. If I=E2=80=99m understanding correctly, wha=
t you=E2=80=99re suggesting is
> > essentially a driver that merges the roles of a virtio_driver and an rp=
msg_driver into a
> > single source file. There may be opportunities for a few function reuse=
, but overall it
> > would still result in a fairly distinct codebase.
> >
>
> Most of the non-boilerplate code in gpio-virtio would be impacted by
> differences between rpmsg and virtio. So combining the two
> implementations in a single source file would add complexity to an
> otherwise straightforward driver, only with trivial parts reused.
>
> My expectation is that it will be better to just have two separate
> drivers - but reuse all the design-work done in the gpio-virtio.

I agree with Bjorn.

If there is indeed code to be reused, just create a library
module .c/.o/.h file and export the symbols. modprobe will
bring it in, Kconfig will configure it in if compiled in. One or the
other or both modules can use that. We do this
all over the place.

Yours,
Linus Walleij

