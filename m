Return-Path: <linux-gpio+bounces-32695-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKXPJGYHq2kMZgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32695-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 17:57:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B42258D8
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 17:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D19A1301AB89
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 16:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8781F3ED5D2;
	Fri,  6 Mar 2026 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EnZ7nDp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97C39E6D6;
	Fri,  6 Mar 2026 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816218; cv=none; b=pQo3YmO1rgfjNLjoJTETifVHf2X/dDpfzCCq0q9u7w3+AkP8LeU3CnwR7yjvXFB7ISex2aIyYblx5BLblUqtLhFCF8HbiES8t+O9N0z7EmU5mS1PVJ9fIGAyNr9NmZXRvc2KuAiPTA5TB8zA9WEi4oAg+JQi+bDnPSWA2uQ8fFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816218; c=relaxed/simple;
	bh=ICmXdsuRx9SCp63uA3rtTqclNutbwaaYpNgkn73RSRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLxvVLSCsJN47WmeaHqDmTpEtmQR9CZ31AN48CzmRw7YKySuNN/VoJIyzeculT8qAYCF4doi2+dGO/XJjL+LqH1IR0ZuK6hBjqTy+Ds2NyQAFN4svEJhkjslf40+tTrA3jy9GHns64pPbQK28VqiechzOhCJLpAPFs5dJ4k7wLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EnZ7nDp6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WshcvYtkXXe1rUX6+z4QlVhkmQAJ3iSCBEssBtgD1BA=; b=EnZ7nDp6Vhm1GkvWzTfn4nSwP4
	mvy9s71m8Cs6pMx1IfA1XvwYAqK6/kE2I9a2dvQEdd8snSHf7S6XwypDUc5YHR/HCEC/3cqhV3/Km
	tyZCeMQkwyu4NMLtloJ/XsLkhVXfb8//uCGLIMSr86y/atlcUay6U7O21y2nOUA0bPXI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vyYTl-00AVkK-Sf; Fri, 06 Mar 2026 17:56:45 +0100
Date: Fri, 6 Mar 2026 17:56:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
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
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <8f83ba5c-bda0-485c-bf9b-052f1fc33879@lunn.ch>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-5-shenwei.wang@nxp.com>
 <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
 <AS8PR04MB91764DFDA8D3BEF64F583969897AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB91764DFDA8D3BEF64F583969897AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
X-Rspamd-Queue-Id: 4D2B42258D8
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
	TAGGED_FROM(0.00)[bounces-32695-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,foss.st.com,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lunn.ch:dkim,lunn.ch:mid]
X-Rspamd-Action: no action

> Other vendors may add fixed up handlers in the same way to support
> their existing products.

But that is exactly what we don't want. Why bother adding a generic
protocol, if vendors then hack it around to make it compatible with
whatever their legacy systems have? We want to discourage such bad
behaviour.

How do we discourage this? We add the label 'legacy' everywhere we
can, so it looks bad. We put the legacy code into a module, behind a
symbol with LEGACY in its name, which is disabled by default.

The messaging i've seen from ST is that they will use the generic
protocol. We reward them for doing this by not bloating the code they
need with legacy support for other vendors...

     Andrew

