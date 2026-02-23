Return-Path: <linux-gpio+bounces-32041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA+sKQ1onGmsFwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:45:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B917835F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF77B3036631
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 14:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E69634F48B;
	Mon, 23 Feb 2026 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SN52Eh6I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76527E049;
	Mon, 23 Feb 2026 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857768; cv=none; b=oWK0Fjb69x/TFSf8dk+JYns3pxxcIj7jYgarQLZPGWdrotbP01l0iDZVhQ3id4gPHnHokCpfLJNO5ugXuWwZkvdEtAg7ECPJ+LLx+VdcMohG4Fl0ELlaB9xVg1aZEZ9cREbsXSEGnTfY664uG9d6H5G0chhw2Gd2uvqF8ietEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857768; c=relaxed/simple;
	bh=+cWvpV653gRQnu0cW4AkcHRnKnqyVn6i1wzLUAvgpoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxIXfE2EoqMaoRRKyhCMTcCG9yedRjiqmTMz5Cf+SESofurlLf1rljvN9osbUH+u0pxoTKcoscaHP8c3O0CKDvjz2wFg65hsmtlaU4vWht1q1H68sVbTFpFZJvP1fJLWeylyhXYCu21Sm0qIvDA5NhdpEYMV6d6S0S2vBgBd89g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SN52Eh6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C39C116D0;
	Mon, 23 Feb 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857767;
	bh=+cWvpV653gRQnu0cW4AkcHRnKnqyVn6i1wzLUAvgpoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SN52Eh6IPc+fMk02ASHGoqIk/WWHlmCze5iqsWGilw5FjPFcEpklbiwgngthxUjKn
	 RvUOedFR9DoWuDgmn2MuNhqjmhFg/eQPHOMi6tlCRztm1bBMNJCza3xPKzBz1u034n
	 eVs4KS/hO3cYK1T5psrqopoItFerpSO5h9aw87pUE0OPFPX3IkxBOWGAXQ2Z9IZpLw
	 X7SCZUpHCsuUKMcIU6ERuZZHmCb2FA6wCIKI2xfVhBD5Z/NjsR4HwR8WWEGrRskA3d
	 H/6JeuXNV1UH+1uH9dqPYQ82jvUH14TQxht/v9QrVNsrLXBb8gWQBgOOdwU1Urad3O
	 uc1qMxDY0I6qQ==
Date: Mon, 23 Feb 2026 08:42:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linusw@kernel.org>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32041-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,lunn.ch,lwn.net,linaro.org,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 2F2B917835F
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQUEN wrote:
> On 2/22/26 15:48, Linus Walleij wrote:
> > On Fri, Feb 20, 2026 at 7:57 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
[..]
> > 
> > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver" and rename
> > files etc accordingly. Maybe it can share code with the actual generic
> > RPMSG driver once that arrives, that is more of a library question.
> 
> I would like to (re)express my concerns regarding the creation of an
> NXP-specific driver. To clarify my concerns, ST, like probably some other
> SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in downstream with plans
> to upstream them.
> 
> If we proceed in this direction:
> 
> -Any vendor wishing to upstream an rpmsg-gpio driver might submit their own
> platform-specific version.
> 
> - If NXP upstreams other rpmsg drivers, these will likely remain NXP-centric
> to maintain compatibility with their legacy firmware and the nxp-rpmsg-gpio
> driver, leading to platform-specific versions in several frameworks.
> 
> - The implementation will impact not only the Linux side but also the remote
> side. Indeed, some operating systems like Zephyr or NuttX implement the
> rpmsg device side (Zephyr already implements the rpmsg-tty)
> 
> Maintaining a generic approach for RPMsg, similar to what is done for
> Virtio, seems to me a more reliable solution, even though it may induce some
> downstream costs (ST would also need to break compatibility with legacy ST
> remote proc firmware).
> 

Could the virtio-based mechanism be used directly (without rpmsg)?


If not, it would be good to derive a generic rpmsg-gpio protocol from
the virtio protocol, and land implementations of this in e.g. Linux and
Zephyr to establish that option.

Regards,
Bjorn

> 
> In the end, I am just trying to influence the direction for RPMsg, but based
> on the discussions in this thread, it seems others share similar
> expectations, which should probably be taken into account as well.
> 
> Thanks and Regards,
> Arnaud
> 
> 
> I just want to
> 
> > 
> > Yours,
> > Linus Walleij
> 

