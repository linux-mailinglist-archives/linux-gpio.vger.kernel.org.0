Return-Path: <linux-gpio+bounces-28251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45EC410A1
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0084211E3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C04334C1B;
	Fri,  7 Nov 2025 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gjE3elCV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE011F03D2;
	Fri,  7 Nov 2025 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762536467; cv=none; b=q6S91yRR3E006HauyKUOZY4whSCIC4bzfi4Osjqqh/Ewzu9hZnqGFxYU4JZ55VqCZhYvhnnb5WxnAwx4j8RynVMPTIQ5vi7/zeuGjohhzGIFf6kIcwJ9bJvpqvS4zqtCFD+Gi5CGDpMokvdcn0Ysnu9L596Rn8Lc8HVF5OGemM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762536467; c=relaxed/simple;
	bh=E74RBG0cAvccvJgzcVT8lXWEYJpmGIAhsol1RsQ57ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnW5M2f1Ma+Swi94QxN4KsnEN7aDSTU/wfV9XeFtopFm8E8MePnZcUt3+6iEKABiRe925p7hbrM0Hh2qDQ3wt+p2ct32qpPiY2yJSCEm2lk53RJmEw1VEvB6qDjjNmtYl24drQA9AMhs9fMVW3yPUw9ELjkNeTsSauqGzMBDSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gjE3elCV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xK9cdU7Jd08ydspHZ/LYkJ6UQeomzAplwBThlP1vwpc=; b=gjE3elCVS4gAloZakaMWCavQF0
	VVu0WRaiT/L3wbBnqluVfYLju8y6wohorJRj0IEcmb8E5DSUzE5LC0FFiLQqAz/pCdpm+tNEZ6ODD
	oQ/M/uhYaW+ycEkvcICDP+IxH1BBnfOL2y1dxJBnHf+gFXwlgTxSiJ3HiXH3VxHRE2HY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHQFI-00DFmK-VG; Fri, 07 Nov 2025 18:27:32 +0100
Date: Fri, 7 Nov 2025 18:27:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <7db35257-de36-4eb5-9205-ca7fb8343401@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
 <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
 <PAXPR04MB918581030A9FC05E13874BDB89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>

> For your information, I'm facing a similar issue with my remoteproc_tee
> series [1]. The advice I received was to look at the PCIe DT implementation
> (I haven't had time to explore it yet). This advice also seems relevant to
> your series.
> 
> Do you also have a look to rpmsg_virtio_bus ? it seems a good candidate to
> match the device tree properties with the rpmsg device?
> 
> In the end, this is my point of view. Perhaps it is better to wait for
> others before deciding on the direction...

There might also be some ideas which can be take from greybus. It also
implements remote devices over a communication medium. 

	Andrew

