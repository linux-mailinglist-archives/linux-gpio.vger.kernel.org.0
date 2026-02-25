Return-Path: <linux-gpio+bounces-32178-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MAXBgggn2lcZAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32178-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:15:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023819A5C9
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F81F3114D5F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 15:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2863D667D;
	Wed, 25 Feb 2026 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTmiCBJ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E7E329C71;
	Wed, 25 Feb 2026 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034783; cv=none; b=Mxg9sSIu5E/za+IHX6eQzj6o3KddsiUyiNqe2+umLTzqgszTdPbrzRUe7sD+0GAoSeuPeEKh4zuZueJ80B1O+WsgyvmY5jyK9pHGHMEl4zawcuZYxTa3MLUFFNasUuzrd5e8Ep4URqZ2jysVZbgfechcUlrLnQJzbRrVs0oj0T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034783; c=relaxed/simple;
	bh=65NJR9v+2VXT8tO+CIhNjHjbKMDdbI3BustHA0JNcQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0KEDEMnRiahcQK5DuL9ajiutGWtTjIQ8X1vbNMr3cQiC7uyjMUkhyD14goSsBFlzPgQ+WpRYdlSYOy70Qm/OeO9EsUNjEKZzaRRJz5wXgeBpWVLI1XBrt/fOheCYi6LqoVuAkDrGG54oFIBYBb9aI14Fum2qq5nXO6aDqAa2QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTmiCBJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409F1C116D0;
	Wed, 25 Feb 2026 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772034783;
	bh=65NJR9v+2VXT8tO+CIhNjHjbKMDdbI3BustHA0JNcQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTmiCBJ5x5EEOTV+q3XNkcVoA8aJnoLFpSDedyYeJbIG06p7fsX4ckW/I2QLSIRWc
	 lBNR0EvSgglKT9eroiWsl+LJIB7XwTPdId31tbUqEIRuhSvelj0OtefP3+cAoRcCH/
	 1TtQXLLt6D/fTN27xk1qtSJEeihRhbylFsnup2xwf1jgCXFfVJ8cZJm1rM4Af5/Am8
	 B4maN/n2UPJE7PYgDMq4IfRWRoioWpym9ALaxVFAg0iIjrv1VJivRLBAXNPYCa6T7o
	 0zNSSBABTPJWbab5InkJZtbouLPrw2LaDn+eYZh+Y1EdWzV7ru01gI3Y+ToHe7oz2o
	 ILQAdUcCVN2zg==
Date: Wed, 25 Feb 2026 09:52:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
References: <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
 <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32178-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,linaro.org,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6023819A5C9
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:43:06PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Tuesday, February 24, 2026 4:15 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Bjorn Andersson
> > <andersson@kernel.org>; Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > Please explain how you would design your generic rpmsg-gpio driver
> > > which is derived From gpio-virtio?
> > 
> > We have already seen the virtio commands are pretty much identical to what i
> > suggested.
> > 
> > You could just replace virtqueue_add_sgs() with rpmsg_sendto() and reimplement
> > virtio_gpio_request_vq() to be the callback registered with rpmsg_create_ept().
> > The rest of basic GPIO handling should not need any changes at all.
> > 
> 
> Creating endpoints and calling rpmsg_sendto() is only a small part of the picture. You also 
> need to manage the service announcement from the remote side and handle asynchronous 
> notification messages. That entire flow is already implemented in the existing virtio_rpmsg_bus 
> driver. Re‑implementing those pieces just to mimic gpio‑virtio over RPMSG would essentially 
> mean reinventing the wheel without any real benefit.
> 

I can absolutely see a benefit to this, there are multiple different
rpmsg backends supported in Linux, so a gpio-rpmsg driver could be used
by any one of them.

I don't see this to be a case of "reinventing the wheel". Instead we
copy what looks to be a very functional wheel and make it fit rpmsg.
This will result in some "duplication", but rpmsg already provide the
life cycle management and has a clean send/callback interface, so there
shouldn't be any inventing...

Similarly, I'm guessing that there's a firmware-side implementation of
virtio-gpio in Zephyr, it should be straightforward to transplant this
to the rpmsg interface.

Regards,
Bjorn

> Thanks,
> Shenwei
> 
> > Interrupt support does however need some changes. The
> > virtio_gpio_request_vq() replacement would need to see if the received message
> > indicates an interrupt and call the equivalent of virtio_gpio_event_vq(), since
> > rpmsg does not have a separate mechanism to deliver interrupts, unlike rpmsg.
> > 
> > At a guess, 90% of the code would stay the same?
> > 
> >    Andrew

