Return-Path: <linux-gpio+bounces-31618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGr0EoDsjGlNvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:54:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF851278C9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1E033042B41
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 20:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4549A352C5C;
	Wed, 11 Feb 2026 20:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVRXV0Ug"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40FE33FE1F;
	Wed, 11 Feb 2026 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843241; cv=none; b=jKqmeZ+nKKU3ncw3GwXqYtPi6xFuAGffNYyiZ31/wZwP7vppvGFbRLhMUMH6679nPs4s7KZz2TQ6kQZV1fu0Xxs0WdeDkgwbY8spneuzmAkUJ02JTxgWPY+RVmK8+dmawi8UaopX0XUqmAGzaCdNXMea6Skeu4i0QqQQNjHMCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843241; c=relaxed/simple;
	bh=C4fSmQS1/v4DY2auUQM0mERpX0iAPLQEIrmOl7DFfdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP5vuTZGcTn1Z4ORZK0/nO6kf73ifKUCXw89SCFXk5ZNoUFHKHyxIBbTDq+MRSdBOWutIYuHw656nvkiV/5h66tFxcHsrCHwdjZiTT1LKkd4ta9aDs970THnbi+GyBpp3IkIHsZynEL/WqU9vCiQPnQOUWDCkq6SsXL5dRdieLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVRXV0Ug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DCDC4CEF7;
	Wed, 11 Feb 2026 20:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770843240;
	bh=C4fSmQS1/v4DY2auUQM0mERpX0iAPLQEIrmOl7DFfdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVRXV0Ug9R/cLEODGVGo4nB6dunr0Yn0nzsRZgG0XJ2omurxmlKFzRm7KpEajUB3h
	 dTDUSSBUYQJhA6aEs2UJ24MbO+4kx5LUTyzcuz/NhRbIR+jl5XAa8mOW6Okb0wrS+0
	 CYhpx19GyRhtprbEo/OY0Cyz3UGhQUHyBQ29VmMqSsxMJce7qHpQoBZP5UTQibBP1p
	 uifAqfE5eOFdz0XVpwgU61Mqhk2PNuuL9c03IZthg5xyAZbFAR6MLb7CrqNCsWsfyu
	 V2Cn1OEVmzRTc+WTzPRF0v287JIe0zqE5XRz7WtOWv9qGSz9WWqglCwSyYvrAZpVZm
	 j0VW0ujuvCtBA==
Date: Wed, 11 Feb 2026 14:53:59 -0600
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20260211205359.GA3857648-robh@kernel.org>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-2-shenwei.wang@nxp.com>
 <177075649333.2817738.5507371747833844104.robh@kernel.org>
 <PAXPR04MB9185556E1A3DD990697E721A8963A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185556E1A3DD990697E721A8963A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,vger.kernel.org,foss.st.com,pengutronix.de,lists.infradead.org,lists.linux.dev,lwn.net,linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-31618-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEF851278C9
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:26:06PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: Tuesday, February 10, 2026 2:48 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bartosz Golaszewski <brgl@kernel.org>; dl-linux-imx <linux-imx@nxp.com>;
> > devicetree@vger.kernel.org; Linus Walleij <linusw@kernel.org>;
> > arnaud.pouliquen@foss.st.com; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> > linux-gpio@vger.kernel.org; Bjorn Andersson <andersson@kernel.org>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; linux-arm-
> > kernel@lists.infradead.org; linux-remoteproc@vger.kernel.org; Peng Fan
> > <peng.fan@nxp.com>; Conor Dooley <conor+dt@kernel.org>;
> > imx@lists.linux.dev; Jonathan Corbet <corbet@lwn.net>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Fabio Estevam <festevam@gmail.com>; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add
> > "rpmsg" subnode support
> > 
> > On Tue, 10 Feb 2026 11:08:11 -0600, Shenwei Wang wrote:
> > > Remote processors may announce multiple GPIO controllers over an RPMSG
> > > channel. These GPIO controllers may require corresponding device tree
> > > nodes, especially when acting as providers, to supply phandles for
> > > their consumers.
> > >
> > > Define an RPMSG node to work as a container for a group of RPMSG
> > > channels under the imx_rproc node. Each subnode within "rpmsg"
> > > represents an individual RPMSG channel. The name of each subnode
> > > corresponds to the channel name as defined by the remote processor.
> > >
> > > All remote devices associated with a given channel are defined as
> > > child nodes under the corresponding channel node.
> > >
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
> > >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
> > >  2 files changed, 108 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> > >
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > Warning: Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml references
> > a file that doesn't exist: Documentation/driver-api/gpio/gpio-rpmsg.rst
> > Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml:
> > Documentation/driver-api/gpio/gpio-rpmsg.rst
> > 
> 
> The .rst file mentioned in the description is included in this same patch set.

Then can't the .rst doc come first?

Really, bindings should not reference kernel docs as they are used 
outside the kernel. However, since there is no other definition of the 
protocol, I think it is fine here.

Rob

