Return-Path: <linux-gpio+bounces-38152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uFMADbGvJ2pO0gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:16:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2765CA91
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gnkwVPhQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38152-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38152-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F845301AA67
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 06:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71CA3C81BE;
	Tue,  9 Jun 2026 06:16:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6A2E7391;
	Tue,  9 Jun 2026 06:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985773; cv=none; b=WL2y4VXjUaJuFUNxpiY+fIYt/gPHIHS+Fn8NYh0evploJF//U10eh+0Hst37/YLEKU1iKg/IF+kl11Is1BpIghegs1kV4z5vAcCpUu80Q2oplu9pFUVolgfCnkmHVrq2voLSTsJXGeszEQWIcpAr3lttNpsEsCPmqPq/5RDGBVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985773; c=relaxed/simple;
	bh=gZ1kkCFzmNSbTCDKfw8Q0P/VBoZB9c/r9Yianq/IU14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYl40FhjOJShObgIk+KMjFgaKC+t3HKHCKiK//uDGrUr75N9Tm9xnhfSUBjTFlgXuazJnMlSBPosWc9P9djR3hWqZXvmgn8lo9BO7qbudAnUBwuNLqIZvFeNUMnOUa9kspGtle/uEzurlgxBJqQMfpr/ROSeg+J3g9QR+exQDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnkwVPhQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A581F00893;
	Tue,  9 Jun 2026 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985772;
	bh=GRmx4DwqEvH8Sj/Hh6Skbn6x441MCdzscjye44bXYhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gnkwVPhQb1ZwNiquck1wvt/I4u7Xwi7KfygraCnUeVOcnNjZoHwgzswIY7tGx4q21
	 9xqTDQdDBnROooohabC/eJx7QexicCmG6FBAPHdY5lC7YXSGxW/AM8t+XAVWxjkLgQ
	 f5HCzHfyyLcNsmqOf+WPOHLJANZnbEuvwb1vjdJiABe1OFQuXv2W/0UURrRaIVk4na
	 gaNBLcthN5C57QLJajeCAn8uMU+eq6ohIfBWseszie91vLW2b8SbBmPrnqMFHLR3Iz
	 Ocj0FlWFqf2FqQEWX7v82OtzUcllX4I+cnPg1oNqK+xZyxvrGyKK6/6fvh5OMcTubt
	 eupEoMmaF6uvA==
Date: Mon, 8 Jun 2026 23:16:11 -0700
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
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
Message-ID: <aievq4dae3GHHq0c@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
 <aiehUzl-qZeZDjXP@thelio>
 <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38152-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,thelio:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AF2765CA91

On Tue, Jun 09, 2026 at 01:35:11PM +0800, Icenowy Zheng wrote:
> 在 2026-06-08一的 22:14 -0700，Drew Fustini写道：
> > On Thu, May 07, 2026 at 04:17:01PM +0800, Icenowy Zheng wrote:
> > > The MISC_SUBSYS clock controller on TH1520 SoC is a clock
> > > controller
> > > mainly controlling USB-related clocks (which isn't utilized yet)
> > > and
> > > MMC/SD controllers' AHB bus clocks.
> > > 
> > > Add the device tree node for it along with the missing bus clock
> > > references for MMC/SD controllers.
> > 
> > Is there a functional reason to modify the mmc nodes in this series?
> 
> When the clock isn't referenced, Linux will disable it unless
> `clk_ignore_unused` parameter is passed.

Ah ok, thanks for explaining.

Drew

