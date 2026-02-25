Return-Path: <linux-gpio+bounces-32192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNDGJ25jn2lRagQAu9opvQ
	(envelope-from <linux-gpio+bounces-32192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 22:02:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCA19D8DF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 22:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDB84303E6AA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 21:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0ED30E834;
	Wed, 25 Feb 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a23zWkRX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF530B52A;
	Wed, 25 Feb 2026 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053345; cv=none; b=lE0Jtvg/TEHTNLsh2ucDE7odT43h9S2IsmJxyRLrEusSAsv4FQV3XZy4NT3vs/7RvPD/+TTNB/WiEUe/w+9BeZs1DImHhijwhSoP0SAe2kzYkTNC04pSDg9an6t5e04BRCgLnhUrY6VRntUEiB3TPbmVHghr7DZ0UGIozY1RKvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053345; c=relaxed/simple;
	bh=Jy6N4IhDvASBtWTrPNraJpD5E/n58S/X9rF10vWsGxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLnqgjL3pEiG8X0TzwXgG8epLV8LrwxZfbpVRa5hMeMHZP9F1WGNaqNu9kkmzk4rX9ANa2dyRLnW+fkie+ThiFgTSw/HmuTIFDLqaeGWz6rPzNtnsCLZUcXNzw+xGT9vysGFfGWKruDxFjAJs0psRmdiPnV7rCAzIN6hGFO5SH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a23zWkRX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D99C116D0;
	Wed, 25 Feb 2026 21:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772053344;
	bh=Jy6N4IhDvASBtWTrPNraJpD5E/n58S/X9rF10vWsGxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a23zWkRXy8vl9KpsWM3WnIQDHv5KYZxIkD9EzaTAuYeMVllHnEtvD7eDFZIOvpovG
	 NyT3pHLz6vBKDacWjPBF2Y7YLvtK+UpcOHVeAlr6IVFmUMqOKUyLUHoxeLCIefGe/4
	 KDA1ElBAy3D3WtzRCmMr1IRZmeKwexlOtSozi568vaUtgwtjjov2SRc8vLAmc5upa8
	 fpy5OHgptojo/HYMS3m2GA6hFJcObfwfN0rCVE7s9b9LwjKgcEot1q8FAEhsyU6svv
	 huy/XM8X573n77N53VjBQ3iJdQ/gcaCcs++iMY0V9TjMjmLkJ5YpeyAvbI0yX0qepC
	 WUD4dpEJBnxZw==
Date: Wed, 25 Feb 2026 15:02:18 -0600
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
Message-ID: <l7vmhr5rg444pqp47x2k5ejamjnisx5rqwfmfr6m2tjazxpbm6@wq2vd4hcxco2>
References: <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
 <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
 <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <2b72kkgwe5hio4uwrxj5oi72llkxhx7egw442fugq6unv7unah@5bfve7k3mvky>
 <PAXPR04MB918508A39832000D786E8F938975A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB918508A39832000D786E8F938975A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32192-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,linaro.org,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	BLOCKLISTDE_FAIL(0.00)[172.232.135.74:server fail];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CAFCA19D8DF
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 08:31:33PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Wednesday, February 25, 2026 1:44 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Arnaud POULIQUEN
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
> > 
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> > 
> > 
> > On Wed, Feb 25, 2026 at 05:54:00PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Bjorn Andersson <andersson@kernel.org>
> > > > Sent: Wednesday, February 25, 2026 9:53 AM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Andrew Lunn <andrew@lunn.ch>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>;
> > > > Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > > > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > > > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Frank Li
> > > > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah
> > > > Khan <skhan@linuxfoundation.org>; linux- gpio@vger.kernel.org;
> > > > linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > > > dl-linux-imx <linux- imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver On Tue, Feb 24, 2026 at 10:43:06PM +0000, Shenwei Wang
> > wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > > > Sent: Tuesday, February 24, 2026 4:15 PM
> > > > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Bjorn
> > > > > > Andersson <andersson@kernel.org>; Arnaud POULIQUEN
> > > > > > <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > > > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > > > > > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> > > > > > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > > > > > <conor+dt@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > > > <s.hauer@pengutronix.de>; Shuah Khan
> > > > > > <skhan@linuxfoundation.org>; linux- gpio@vger.kernel.org;
> > > > > > linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > > > > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > > > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > > > > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > > > > > dl-linux-imx <linux- imx@nxp.com>; Bartosz Golaszewski
> > > > > > <brgl@bgdev.pl>
> > > > > > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg
> > > > > > GPIO driver
> > > > > > > Please explain how you would design your generic rpmsg-gpio
> > > > > > > driver which is derived From gpio-virtio?
> > > > > >
> > > > > > We have already seen the virtio commands are pretty much
> > > > > > identical to what i suggested.
> > > > > >
> > > > > > You could just replace virtqueue_add_sgs() with rpmsg_sendto()
> > > > > > and reimplement
> > > > > > virtio_gpio_request_vq() to be the callback registered with
> > > > rpmsg_create_ept().
> > > > > > The rest of basic GPIO handling should not need any changes at all.
> > > > > >
> > > > >
> > > > > Creating endpoints and calling rpmsg_sendto() is only a small part
> > > > > of the picture. You also need to manage the service announcement
> > > > > from the remote side and handle asynchronous notification
> > > > > messages. That entire flow is already implemented in the existing
> > virtio_rpmsg_bus driver.
> > > > > Re‑implementing those pieces just to mimic gpio‑virtio over RPMSG
> > > > > would
> > > > essentially mean reinventing the wheel without any real benefit.
> > > > >
> > > >
> > > > I can absolutely see a benefit to this, there are multiple different
> > > > rpmsg backends supported in Linux, so a gpio-rpmsg driver could be used by
> > any one of them.
> > > >
> > > > I don't see this to be a case of "reinventing the wheel". Instead we
> > > > copy what looks to be a very functional wheel and make it fit rpmsg.
> > > > This will result in some "duplication", but rpmsg already provide
> > > > the life cycle management and has a clean send/callback interface,
> > > > so there shouldn't be any inventing...
> > > >
> > >
> > > Interesting — could you walk me through how you’d structure the driver
> > > with the new proposal? I’d like to see how you would layer it conceptually.
> > >
> > > The current RPMSG solution:
> > >
> > >      On Remoteprc                      On Linux
> > > GPIOs -> RPMSG -> VIRTIO == VIRTIO -> RPMSG -> GPIO-RPMSG drivers
> > >
> > > The VIRTIO solution:
> > >
> > >      On Remoteprc                     On Linux
> > >           GPIO -> VIRTIO == VIRTIO -> GPIO-VIRTIO driver
> > >
> > > Your proposal:
> > >
> > >      On Remoteprc                     On Linux
> > > GPIOs -> RPMSG -> VIRTIO == VIRTIO -> ???
> > 
> > What I'm suggesting is the following:
> > 
> > GPIOs -> RPMSG -> VIRTIO == VIRTIO -> RPMSG -> GPIO-RPMSG
> >        ^                                    ^
> >        \-----+------------------------------/
> >              |
> >              |
> > With this interface on being directly derived from the existing protocol (and likely
> > the implementation as well) using gpio-virtio.
> > 
> > You can have multiple "GPIOs" (presumably a "bank" each) instances and that
> > will be reflected in having multiple "GPIO-RPMSG" instances.
> > 
> > I haven't made any attempts at implementing this, but it looks very similar to
> > gpio-virtio in concept and it looks very similar to the exiting RPMSG tty in the
> > sense of being a generic implementation.
> > 
> > To reach something functional on the Linux side it seems to be a matter of taking
> > the gpio-virtio driver, register a rpmsg_driver instead, change _virtio_gpio_req()
> > to use rpmsg_send(), and perform the actions of virtio_gpio_event_vq() in the
> > rpmsg_driver callback function.
> > 
> 
> Thanks for the explanation. If I’m understanding correctly, what you’re suggesting is 
> essentially a driver that merges the roles of a virtio_driver and an rpmsg_driver into a 
> single source file. There may be opportunities for a few function reuse, but overall it 
> would still result in a fairly distinct codebase.
> 

Most of the non-boilerplate code in gpio-virtio would be impacted by
differences between rpmsg and virtio. So combining the two
implementations in a single source file would add complexity to an
otherwise straightforward driver, only with trivial parts reused.

My expectation is that it will be better to just have two separate
drivers - but reuse all the design-work done in the gpio-virtio.

Regards,
Bjorn

> Thanks,
> Shenwei
> 
> > Regards,
> > Bjorn
> > 
> > >
> > > Thanks,
> > > Shenwei
> > >
> > > > Similarly, I'm guessing that there's a firmware-side implementation
> > > > of virtio-gpio in Zephyr, it should be straightforward to transplant this to the
> > rpmsg interface.
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > > > Thanks,
> > > > > Shenwei
> > > > >
> > > > > > Interrupt support does however need some changes. The
> > > > > > virtio_gpio_request_vq() replacement would need to see if the
> > > > > > received message indicates an interrupt and call the equivalent
> > > > > > of virtio_gpio_event_vq(), since rpmsg does not have a separate
> > > > > > mechanism to
> > > > deliver interrupts, unlike rpmsg.
> > > > > >
> > > > > > At a guess, 90% of the code would stay the same?
> > > > > >
> > > > > >    Andrew

