Return-Path: <linux-gpio+bounces-39839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xZPVAOsXUWo0/QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:03:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3873C747
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:03:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UPenvW+m;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39839-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39839-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BFB13094718
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BF143933E;
	Fri, 10 Jul 2026 15:55:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46593064AE;
	Fri, 10 Jul 2026 15:55:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698937; cv=none; b=J56b7thSfNxJ/7sOzzqagF7F62Cz7EFaXTeyRmIh7XebSL1N9ujqv5219tePwgWggSQT8gYQyRpeZ60jClid1+CCAYa5J1/dw+rpCi9ymvYpFUNl0CCZZEIa0cLonhesSiHH0UOOyALK4hXpVhXVZR/tqvB+/a+hFw/dnWMKkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698937; c=relaxed/simple;
	bh=hODZdIRLKtZI2OTDibqWc8vf1QCRK5j84bqQrg4FUKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geyv2gdmBfX22j8x1i9d8ucZuPAcShy8WB+BeKtPRTG6CEDl2B7DjjqCBtFhNnJ8NPrksFdeDO3VWUNUUpL/ZJbigpTINAvdrx9nBdrGBcTru6hii3XelALqPIOWwt4J4KobPwpdyw3O+gD9DdiWCB3rBvHyshlnOvyxLfF4sLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPenvW+m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C31F000E9;
	Fri, 10 Jul 2026 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698935;
	bh=SuBn+qM9tZrJlvXW+nzoxQ4e9HtFDIaF9zBrPfyVFeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UPenvW+mFXYRa5Xjsm6aXAqYufOqCJ5V7fxPkJr2mIKaD/B0InGGoaeo1ry1282gY
	 AKm5H+mLP65IpFPClBzRBZkk1fVyz+2KA6R4USZWlbw3NxAH1sCRKDSuxbd5xRWFoe
	 qG/9OoIrV5HUXKI0DQSKkd8vxf+nCDV6NZpa7GSZJtpHqyQzFJcA+EcpyJbc/YfGMC
	 ss0/TyqbVZdom5eYeAoAIDtmYbVvZntsEud+VeGpomsb648OJ3lhr6X1B64K/dkdK1
	 AKoIEXnVP11RNyMIAsXL6yCd1UhMyxG9mx6yfj7Fk92OCkFdnzvZhI+i8410pJGon1
	 lY1HoUNgUt8yg==
Date: Fri, 10 Jul 2026 08:55:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH 11/12] riscv: dts: thead: Add Lichee Pi 4A IO expansions
Message-ID: <alEV9XJ2pr23CJ3B@gen8>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
 <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:emil.renner.berthing@canonical.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39839-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org,canonical.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gen8:mid,canonical.com:email,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EF3873C747

On Fri, Jul 10, 2026 at 10:56:08PM +0800, Icenowy Zheng wrote:
> 在 2026-05-07四的 16:17 +0800，Icenowy Zheng写道：
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > 
> > Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
> > I2C0/1/3 busses.
> > 
> > Add device tree nodes for them.
> > 
> > Signed-off-by: Emil Renner Berthing
> > <emil.renner.berthing@canonical.com>
> > [Icenowy: added commit description]
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> 
> I am going to send a newer revision of PATCH 9~11 in a few days,
> because the I2C1 controller is already added to the mainline device
> tree for Wi-Fi support, although the already-merged patches are a
> little weird.

Thanks, that would be great if you can submit the series again. I'll
make sure to promptly review this time as it would be get to have USB
support upstream. Hopefully there is a way to configure I2C1 so that it
works for both USB and WiFi module.

Drew

