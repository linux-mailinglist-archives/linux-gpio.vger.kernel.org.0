Return-Path: <linux-gpio+bounces-40075-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cobJERBmVmo/4wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40075-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:38:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB12756FEF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=vSMk+Qbc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40075-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40075-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49F033070F05
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 16:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F1D4D8DB0;
	Tue, 14 Jul 2026 16:35:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082E4A13AA
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 16:35:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046957; cv=none; b=bmnFAXHDoXVwvsz0tprANr4DE0MWXcEP0Yqqyoce0s8WNSM6xE/WxOoRnn+Sro3Pq0ZEcLeTyztRUJ+ADyS5iEKaHDjH9F/FUuVMEqfAyx1+7trhJCGLQDNnG+UVjVdJUh/32wLPW7Y0IwGWpdVjw0C8IJNmCRwshr9RM7JGo/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046957; c=relaxed/simple;
	bh=6z8HsUuKgrLx2/y0WOD8TNbRYLVORNbEn2kqa03cmH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhPlI6UAF+d1n8RpN1+zUeLWPbmC8BAWMQGIlPfse/XEZQrvxgQMkQNSMxkrzIafW0YCCVuDuUASuIV9IWiA+qZnfr56n/yUt/8rWit/bHB2hDM7nWISE/jtubAzDw9SeEeBaxo335i4/J/FJ3XKH9BxxMGNi9snywxtMNmZTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSMk+Qbc; arc=none smtp.client-ip=209.85.215.170
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2530693a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784046954; x=1784651754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=;
        b=vSMk+Qbc3yvPgDFdE6nIolheCycR3uFJqJ16O7pDifdEgkNQWNLd4swS0Hiks75zPA
         v6KJy+gmkUBfCBNlWm0I3PFzkEJTqU8AF2/0ptKqx3lZZ+UNNJ76FXyVmCb99j5mRgYK
         qo4GeJ7heGYDXCMfBFj8OJDkBq0yeRJRRfKpkiAPikc/Hb2V8L8VQLiYhKRj+XJSC+qq
         7/W9ppwyE67539RzM6EULzRQuUiPIjgUyq/rN3RW+Q2VeGZ7nNWVR/c92O2Go9jPjrKx
         SrK+gZgFiWUJcCMMV+/eIq//2ebVGRIWM26aW1RskGMmYS3ueEGOeCUpNVXqw6SUhiNC
         dggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046954; x=1784651754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=;
        b=EhAB0skK5NXzpwI9glemrqb9T8YsWeX9WyTDk06VciS2zx/afzWcVv30FQTAM1TfFJ
         QKYsE8MqzzuUBB2PteGrUmh8FmAh8BdrcSTTr382Or6BzY7EpNu8K1QbRPKSF6IiJwAg
         NOp2NKO/odznJJJL8T9A0t65mN/7uK0KuVaJ/sOwoo63AERCLX5f6Y+8BWTwraJE78+o
         8GIvpdsTw2HiSTB4jlNiR0E/89cr2z3QTFNNRh0nCyDkypwkxkH8RWZMvHc2EBMXsEtB
         5vHE5Du0LGLVLYbB+7UORqPysisRfH40g1Y9yuBc3UKounxglsZt1R5suyLkHh+XA/6d
         jNxA==
X-Forwarded-Encrypted: i=1; AHgh+Roxh1dDHDWxH3J0uiYiD/9cpT8/aE55KZgJWu1VVgwTaTrNwVk6JiaDdafvSIYd3uHYzZn6zIJS7L7z@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHrgRov2FqtiZAXG1FJav6zourzV/aN/JIMasMG8KshW8/Nsj
	s8wlXlKd9U4yJ/op5FYTOXQlVrjed9Nf39OaOriipbQiaWLLhDBpns3w4k1ib9KWx04=
X-Gm-Gg: AfdE7ckHDnkryDoXJ0F099iISmyiOuH0GXyZs5QLvoJHy3Qg63bQC+n92iHjzLcJ7EP
	jKXsuvzoYab6lBAMtIuO204MIjY6ckWcMlzHsNVTPfcwuRCRzkcqY+cj+TTfXNsuwhhciWpVa0Z
	xb+tG+E7m5w5LQNlGISmQBjysx9f3RMNIP8Oyc7JTb2+nh68HMIMXuSMJ6wH0FSgiBRIA51SM8Q
	hJbG2rKHJAM6T+2AS/KefnVba2d5ZH36kYdD6m4IfWq9HfoIBtSiRTicduicUG8wZgMOTNOFrv8
	F68GvCV73wOcIxAePZvDprM8HAKz0u1PuzKm0CiamOFZZIARjfsSD++f2wFFwbIxaGkJfNePnRI
	mnrujMU9ZPbJE3A4Q34yHqy3FpZqLdlU4crwSyQtnxR9dcsOZARR7hG+OHUDAV/1mP4ffIly9T2
	H0S68U7hV6PueuswWC
X-Received: by 2002:a05:6a00:124f:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-8488975aac2mr12250820b3a.39.1784046953503;
        Tue, 14 Jul 2026 09:35:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:24cc:3af8:4244:12fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dada6sm1772036b3a.42.2026.07.14.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:35:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:35:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alZlZvQQwq-g6VL3@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-40075-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCB12756FEF

On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, July 13, 2026 12:17 PM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> > 
> > On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> > > From: Shenwei Wang <shenwei.wang@nxp.com>
> > >
> > > Describes the gpio rpmsg transport protocol over the rpmsg bus between
> > > the remote system and Linux.
> > >
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > ---
> > >  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
> > >  Documentation/driver-api/gpio/index.rst      |   1 +
> > >  2 files changed, 272 insertions(+)
> > >  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> > >
> > > diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > new file mode 100644
> > > index 000000000000..7d351ff0adb0
> > > --- /dev/null
> > > +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > @@ -0,0 +1,271 @@
> > > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > > +
> > > +GPIO RPMSG (Remote Processor Messaging) Protocol
> > > +================================================
> > > +
> > > +The GPIO RPMSG transport protocol is used for communication and
> > > +interaction with GPIO controllers on remote processors via the RPMSG bus.
> > > +
> > > +Message Format
> > > +--------------
> > > +
> > > +The RPMSG message consists of a 8-byte packet with the following layout:
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |     cmd     |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > 
> > Here and throughout, please remove any mention of 'port'.  This is handled by the
> > endpoint device, i.e one GPIO controller (port) per endpoint.
> > 
> > > +
> > > +- **value**: See details in the command description below.
> > > +
> > > +
> > > +GPIO Commands
> > > +-------------
> > > +
> > > +Commands are specified in the **Cmd** field.
> > > +
> > > +The SEND message is always sent from Linux to the remote firmware.
> > > +Each SEND corresponds to a single REPLY message. The GPIO driver
> > > +should serialize messages and determine whether a REPLY message is
> > > +required. If a REPLY message is expected but not received within the
> > > +specified timeout period (currently 1 second in the Linux driver),
> > > +the driver should return -ETIMEOUT.
> > > +
> > > +GET_DIRECTION (Cmd=2)
> > > +~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      2      |    line     |             0             |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status | value  |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +- **value**: Direction.
> > > +
> > > +  - 0: None
> > > +  - 1: Output
> > > +  - 2: Input
> > > +
> > > +
> > > +SET_DIRECTION (Cmd=3)
> > > +~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      3      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Direction.
> > > +
> > > +  - 0: None
> > > +  - 1: Output
> > > +  - 2: Input
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +
> > > +GET_VALUE (Cmd=4)
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      4      |    line     |             0             |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status | value  |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +- **value**: Level.
> > > +
> > > +  - 0: Low
> > > +  - 1: High
> > > +
> > > +
> > > +SET_VALUE (Cmd=5)
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      5      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Output level.
> > > +
> > > +  - 0: Low
> > > +  - 1: High
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +
> > > +SET_IRQ_TYPE (Cmd=6)
> > > +~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      6      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: IRQ types.
> > > +
> > > +  - 0: Interrupt disabled
> > > +  - 1: Rising edge trigger
> > > +  - 2: Falling edge trigger
> > > +  - 3: Both edge trigger
> > > +  - 4: High level trigger
> > > +  - 8: Low level trigger
> > 
> > I'm in agreement with cmd 3, 4, 5 and 6.
> > 
> 
> How about cmd 2?

Yes, I forgot cmd 2.  

> 
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +SET_WAKEUP (Cmd=16)
> > > +~~~~~~~~~~~~~~~~~~~
> > 
> > I already commented on messages that are not part of the virtio-gpio
> > specification.
> > 
> 
> I don't believe virtio-gpio needs a SET_WAKEUP command.
> 
> In the RPMSG case, SET_WAKEUP is required because it performs an operation on the 
> remote processor, so the remote side must be explicitly notified.

What operations would that be?

> 
> For virtio-gpio, however, everything is handled locally. The other side does not need to 
> perform any action, so sending a SET_WAKEUP command appears unnecessary.

What is "everything"?

> 
> 
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      1      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Wakeup enable.
> > > +
> > > +  The remote system should always aim to stay in a power-efficient
> > > + state by  shutting down or clock-gating the GPIO blocks that aren't
> > > + in use. Since  the remoteproc driver is responsible for managing the
> > > + power states of the  remote firmware, the GPIO driver does not
> > > + require to know the firmware's  running states.
> > > +
> > > +  When the wakeup bit is set, the remote firmware should configure
> > > + the line  as a wakeup source. The firmware should send the
> > > + notification message to  Linux after it is woken from the GPIO line.
> > > +
> > > +  - 0: Disable wakeup from GPIO
> > > +  - 1: Enable wakeup from GPIO
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +Notification Message
> > > +--------------------
> > 
> > "Interrupt Messages"
> > 
> > > +
> > > +Notifications are sent by the remote core and they have
> > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > +
> > > +When a GPIO line asserts an interrupt on the remote processor, the
> > > +firmware should immediately mask the corresponding interrupt source
> > > +and send a notification message to the Linux. Upon completion of the
> > > +interrupt handling on the Linux side, the driver should issue a
> > > +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> > > +
> > > +A Notification message can arrive between a SEND and its REPLY
> > > +message, and the driver is expected to handle this scenario.
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+--------+
> > > +   | 0x00 | 0x01 |  0x02  |
> > > +   |   2  | line | trigger|
> > > +   +------+------+--------+
> > 
> > 2 things here:
> > 
> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> 
> Interrupt masking and unmasking are handled entirely on the local processor.
> 
> When an interrupt occurs, the remote system masks the interrupt and then sends a notification 
> to Linux. After Linux processes the notification, it sends a SET_IRQ_TYPE message back to the 
> remote system, which then unmasks the interrupt.

This is the kind of information that should be part of this documentation.

> 
> Thanks,
> Shenwei
> 
> > 
> > 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
> > protocol should be about thar:
> > 
> > +------+------+--------+--------
> > | 0x00 |       payload         |
> > |  Q   |                       |
> > +------+------+--------+--------
> > 
> > Q = 0 requestq
> > Q = 1 eventq
> > 
> > The "payload" part is simply the format of the messages as found in the virtio-
> > gpio specification.  From there, the only thing left to mention is which messages
> > are not supported, i.e get line names.
> > 
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > > +
> > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > 
> > Not part of the spec - remove.
> > 
> > Given the refactoring work that is still needed, I will not look at the
> > implementation.
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > b/Documentation/driver-api/gpio/index.rst
> > > index bee58f709b9a..e5eb1f82f01f 100644
> > > --- a/Documentation/driver-api/gpio/index.rst
> > > +++ b/Documentation/driver-api/gpio/index.rst
> > > @@ -16,6 +16,7 @@ Contents:
> > >     drivers-on-gpio
> > >     bt8xxgpio
> > >     pca953x
> > > +   gpio-rpmsg
> > >
> > >  Core
> > >  ====
> > > --
> > > 2.43.0
> > >

