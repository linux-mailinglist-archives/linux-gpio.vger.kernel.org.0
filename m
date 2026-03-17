Return-Path: <linux-gpio+bounces-33644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMIyOjlmuWkyDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:33:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1F2AC078
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4850C308C131
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E0F3E63A2;
	Tue, 17 Mar 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="N+dDSJ2H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B73E3C44;
	Tue, 17 Mar 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756724; cv=none; b=Qovv4/4bOP8ZsWvmhdpF2wsorV1s6RvUe2eFHcThDs5pE7CV/IR2Af5Y81G8yidLlpcKRjfE1sTUfCG4jHrGZuRoT+BoDj0jvKVFskeOkwbKHr1nmUUNPsKPMcE+5Xf9D7zmLo8v4QJGPRCWoIwlIHo6jLUrbnBlD6zyo5QsjtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756724; c=relaxed/simple;
	bh=UcmRX+iIkZwytJqVNJodQzwRiiKSnbEQOAtWHuJEfn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkyWJkKpKn9UllB2KF9Em0p/sZNem+5V/f1Pe+HCOBHrvOi/5lr5dzg6Z6nxdFJNgAJJkmdwaYCueM2xr8vfddXGG7McH4alLPUHeJHgz3Qk2VJv4JA+BCcaoXMDArcC+Aq5KZrpw/bdDDl07nySXxlauLssNPHpQBhfCNZzksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=N+dDSJ2H; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8I4GJ6VYY4sAkpPtIoMg3PlbM8gWrHzgVlQtnkD+cJ8=; b=N+dDSJ2HU0OM2CcLn4jv+usPjd
	A9wdkncTUcJn9notW4QhMgME5kzWZfjThVZ2iXhKee3kFdfO9g3pq4hnExXaG/dDDz3gIj3W3JgL4
	wXUtVec4QUwzHQP2wbKIu2ac3PcBp/nHnJnwaIruyb5KuldwzIx57kVDbrjp+jnghfHQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2V98-00C2BR-78; Tue, 17 Mar 2026 15:11:46 +0100
Date: Tue, 17 Mar 2026 15:11:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33644-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,linaro.org,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid,lwn.net:url]
X-Rspamd-Queue-Id: 97C1F2AC078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > +struct rpmsg_gpio_info {
> > +	struct rpmsg_device *rpdev;
> > +	struct rpmsg_gpio_packet *reply_msg;
> > +	struct completion cmd_complete;
> > +	struct mutex lock;
> > +	void **port_store;
> > +};
> 
> Except if I missunderstood Mathieu and Bjorn's request:
> "reuse all the design-work done in the gpio-virtio"
> We should find similar structures here to those defined
> in virtio_gpio.h.
> struct rpmsg_gpio_config {
> 	__le16 ngpio;
> 	__u8 padding[2];
> 	__le32 gpio_names_size;
> };
> 
> /* Virtio GPIO Request / Response */
> struct virtio_gpio_request {
> 	__le16 type;
> 	__le16 gpio;
> 	__le32 value;
> };

The core of the issue is that Shenwei is stone walling any change
which makes it hard to keep the legacy firmware. It is possible to use
these structures, but it makes the extra code Shenwei needs to
translate this protocol to the legacy protocol more difficult. It
might need to keep state, etc. 

Two points...

The firmware implements more than GPIO. There is definitely I2C as
well, the first version of the patch has bits of I2C code. Looking at:

https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/

There is also RTC, and a few other things which don't directly map to
Linux subsystems, but maybe do have Linux drivers?

Give how much pushback there has been on the existing protocol for
GPIO, it would be wise to assume that I2C, and RTC is going to get the
same amount of pushback. If any of these three, GPIO, I2C, or RTC
decide that only a new, clean protocol will be accepted, no legacy
shims, the firmware has to change, breaking compatibility to legacy
protocols, and the accepted shims become pointless Maintenance burden.

Point two is that the customers who are pushing for these drivers to
be added to Mainline probably know that nearly nothing gets into
Mainline without some changes. There is some short term pain to
swapping to Mainline because of these changes, in this case, firmware
upgrades. But in the long run, it is worth the pain to be able to use
Mainline. And those customers who don't want to upgrade the firmware
can keep with the out of tree drives.

So, what are our choices?

1) We accept the code as it is now, with the shim?

2) We keep pushing for the virtio protocol, with the shim?

3) We keep pushing for the virtio protocol, no shim, firmware changes

4) We pause GPIO where it is today, and restart all the arguments with
   the I2C driver. We can come back to the GPIO driver in a few months
   time once we have a better idea how I2C is going. And maybe we also
   need to see the watchdog driver, and argue about its protocol.

I also understand ST has a generic I2C driver nearly ready, if that
gets merged first, that probably kills the NXP I2C protocol, and maybe
the NXP GPIO and RTC protocols.

My vote is for 3. If not 3, then 4.

     Andrew


