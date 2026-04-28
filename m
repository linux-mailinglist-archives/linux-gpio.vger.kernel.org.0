Return-Path: <linux-gpio+bounces-35728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACXqE//28GkwbgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:05:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AC48A654
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC6C3024A0A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846794657DC;
	Tue, 28 Apr 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GEcDleAy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B74534AE;
	Tue, 28 Apr 2026 18:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399543; cv=none; b=Cxu/PI6+2E47Mi99ClobjA14OSdsN8FEpTZcIBkJbzc4xKTpBXaahIH5i6wYtk+4R8bsTQ7mhxDoo+bPl3QO2+x7KCWpR3W1zss32C0kWnGBFegJnKLiwuAC3jykR+DDSjQ8iyWAvYjHQynHsAzc11B4MehSA0gCFvVAQqqzJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399543; c=relaxed/simple;
	bh=P64k85N3daHnIev8xOmxmzWEX56aQBjsUVihR/XicFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvRTzzX04BVulm1nfQCmIrG/UrZJS7FNriZBXaRVbaLx13PgA/CfV3yjTN7nfIRduHZRIEjuMAs4KhrVFUaVZHWeIUbf9P2mVyDkuTAIM1OqiBfEnFc59lIHMrvOjtKSy6qEY7a29JG+ZzLPFZTFD6tCApeCe8hDwQ//B6DjaL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GEcDleAy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=f7TAcOXxPnUVfil+ay330gPo4DxhAxhPDiY4u2086e4=; b=GE
	cDleAyqqdGmQWx/Ex+NIq0ne4BoHv7ryPiIH1R8l8YNsCRw9rQeCVAVmE7beTtd1Yo536uB6pXloi
	WWskddRMmJeVNtUfwGqet9BpI13iSU7xXwav46OeSpPSwq1hR5ThEGC/B6lnz+iaXWp5r7OfLbUBV
	s64aKyNSeep6o6g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHmoJ-000NwR-MD; Tue, 28 Apr 2026 20:05:27 +0200
Date: Tue, 28 Apr 2026 20:05:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <8d9801cb-0c66-48d8-a946-89a7771e73ea@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
X-Rspamd-Queue-Id: D65AC48A654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35728-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,linaro.org,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:mid]

> Remote side learns the endpoint when it receives any message from Linux
> from the dynamic endpoint.
> 
> Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When
> you send the message from this endpoint, the standard rpmsg header
> would have:
> 
>     85 struct rpmsg_hdr {
>     86         __rpmsg32 src; // 1026
>     87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
>     88         __rpmsg32 reserved;
>     89         __rpmsg16 len;
>     90         __rpmsg16 flags;
>     91         u8 data[];
>     92 } __packed;
> 
> Remote side tracks the dynamic endpoint by reading src = 1026. And while
> sending the response it fills the header as:

I've never used rpmsg, so this might be a FAQ. How does the remote
side know what the endpoint is to be used for? Here we are talking
about GPIO. But the same hardware implements I2C, and a few other
things. How do we indicate this endpoint is for GPIO?

Maybe also related, this hardware also supports a number of GPIO
controllers. There has been some argument about if one endpoint should
support multiple GPIO controllers. Or, like gpio-virtio, one endpoint
represents one GPIO controller, and you instantiate multiple
endpoints, one per controller. How can you tell the different
instances of GPIO endpoints apart when they are dynamically created?

   Andrew

