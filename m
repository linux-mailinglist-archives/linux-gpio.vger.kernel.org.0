Return-Path: <linux-gpio+bounces-38510-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WaxhA0NJMGqLQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38510-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 20:49:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DA6894C3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 20:49:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="l513tM/b";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38510-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38510-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46A45303D0AD
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 18:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFC33AC0CB;
	Mon, 15 Jun 2026 18:49:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C991399368;
	Mon, 15 Jun 2026 18:49:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549374; cv=none; b=ucuI7aP4V3TUOHNfAWfA4mWJmx4Wtu+5BQJvHJ3y/0LozHZhMwtRQHXI0exkGvIPF7nHHXMvK4Nhodg8hz0P7TxXnOsoSA0MZpUnZaOps3BiLmssqSqTwiR0+Vu00Uwpban2GMi96Wi7+eKCU0BrwktQvxsTYnJ6I5opM04oIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549374; c=relaxed/simple;
	bh=XkeWSh+TrjayHJpdwnvpla+DnXMb1VFCr+9OQ2rdagg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKuJX5YFLvsVWVFhItl9guQuNSsrDUwvp/IyXLZOTUcYhSP777x1Um5XWx5JVumlKuV1t6ToZiaJPv9Wx9Au15RbFOPFpQMWui0y2OsPs8aThEe9NEPSbhSslnU03s2YJrobuoKZMuSUITj0yfay/jXJakmNCabT0OLY0TY+hEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l513tM/b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8918C1F000E9;
	Mon, 15 Jun 2026 18:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781549372;
	bh=f2otcKXkniiTUp+5VDPJ4fsoaaEOLI8QZLmJsjDf69Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l513tM/bCEM2Tf1QvNXpkj3A38IB27Wahc8y6yfI20PkKouMUKFPAKku0Oe5l8PBJ
	 3Zw4u8r4LYVoEiGoecclxDStWyNSo+B+MREw1zJyd+2iWBsUmKkLweN9srUDqIxaBP
	 pvpQeoNgdggDFzee/qClUCPY9ZvT4ZlZD9o6IRsofqhWE3WpV24KQ1jIKdkI5ZdEWh
	 sjRcrQKgcUHKJSeIUfb/vUZN7sBS3HRXaQBuNpcmfdIZFGHRT/OgYU04pD+3UZMgyL
	 DMjmR3IQqlBRuZM3FLqOIk8SdrSNV2N46wXH3F7BBybdQ81WlMPhBE46mLEM+Ffk7T
	 TFmps+X/rBlwQ==
Date: Mon, 15 Jun 2026 13:49:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Eric Chanudet <echanude@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Alberto Ruiz <aruizrui@redhat.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Chester Lin <chester62515@gmail.com>, imx@lists.linux.dev,
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
Message-ID: <178154936898.1633409.13595893947195422422.robh@kernel.org>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260610132116.1998140-5-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610132116.1998140-5-khristineandreea.barbulescu@oss.nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38510-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:khristineandreea.barbulescu@oss.nxp.com,m:linusw@kernel.org,m:rafael@kernel.org,m:echanude@redhat.com,m:clizzi@redhat.com,m:s32@nxp.com,m:larisa.grigore@nxp.com,m:vincent.guittot@linaro.org,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:aruizrui@redhat.com,m:mbrugger@suse.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:festevam@gmail.com,m:krzk+dt@kernel.org,m:ghennadi.procopciuc@nxp.com,m:aisheng.dong@nxp.com,m:chester62515@gmail.com,m:imx@lists.linux.dev,m:lee@kernel.org,m:linux-gpio@vger.kernel.org,m:eballetb@redhat.com,m:shawnguo@kernel.org,m:brgl@bgdev.pl,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:ping.bai@nxp.com,m:srini@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,nxp.com,linaro.org,pengutronix.de,vger.kernel.org,suse.com,lists.infradead.org,linuxfoundation.org,gmail.com,lists.linux.dev,bgdev.pl];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 729DA6894C3


On Wed, 10 Jun 2026 15:21:14 +0200, Khristine Andreea Barbulescu wrote:
> Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
> external interrupt resources present in the same SIUL2 hardware block.
> 
> Besides the MSCR and IMCR registers used for pin multiplexing and pad
> configuration, SIUL2 also contains PGPDO and PGPDI registers
> for GPIO data and EIRQ registers for external interrupt control.
> 
> Add GPIO controller properties because the SIUL2 block also provides
> GPIO functionality, and gpio-ranges are needed to describe the
> mapping between GPIO lines and pin controller pins.
> 
> Document the interrupt controller properties. The SIUL2 block
> contains EIRQ hardware as part of the same register space. IRQ support
> itself will be added in a follow-up patch series.
> 
> Update the example accordingly to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
> 
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 90 +++++++++++++++++--
>  1 file changed, 84 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


