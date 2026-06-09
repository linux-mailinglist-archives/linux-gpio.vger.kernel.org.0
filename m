Return-Path: <linux-gpio+bounces-38146-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RZxNNV2hJ2qTzwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38146-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 07:15:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FED65C627
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 07:15:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=POEG9hwK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38146-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38146-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF54F3014299
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 05:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50B93C0624;
	Tue,  9 Jun 2026 05:15:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4103ACA5D;
	Tue,  9 Jun 2026 05:15:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982102; cv=none; b=U/YMtg7FqMXSK0of1Ckbbsi2yPDsYck+swtWhvjdVK5xetiCC/6HrrGYtR3gtX/SBXt/6aJVucalZF8UWj/jSN+GA53OMCLRZq1LB8AURyi1bTnb86gYPfjvnZQF84f+H01m8odTFvE1Lz6Eu1n35kABhbMUrONOLJN+oZheAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982102; c=relaxed/simple;
	bh=an4i9S4XuDMHGGVBv0SgvGaw33HajoLbXwZBW65HnRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDWZn/UCZ2azWeV8Qy9c3/sURKixQgkvhg61MIiI6FQn3CjFT5r4ZT3imp8/zVbCigLPZpMIN5B4k6P0imtqG5EOn566q4WelnLolk6bjasIY7fls6HAVekPR7tPLDflW1mV+Jl68FqPyxR0J6d72G5wyJ7Gy4cMWyDFVEdz6qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POEG9hwK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B518D1F00893;
	Tue,  9 Jun 2026 05:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780982101;
	bh=/mWiyJV71B6TZ8JXu6VdyFVLqLGyT2eKcg2M8VPgZzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=POEG9hwKBWmaw+Vc4biZ0wBtkhMqw8sNzWx4GqsPAmgQrO5zrCtTUmr7xXYQB0LGs
	 eGNpccNF0PWSOXBqoT0Dq9tSPWEbe0i/We4X1MJo5cAs3zCOCi4WBKz58C3nLchCS1
	 bNzYUDm/1lRyQKh4HUy4iYtg33CK79DFFOmGKq3BZ1M/yX7Y+frpBoO7ynxX/6zKi5
	 RqElCxNNmsI3YOXEA5AnrXaiVoVJh5QAfY42XCrDlYCwtf5kP0iXl1AgJmiAJlgbIr
	 Q+VfDBo3R1LUC8VWLk3jxa16869D/OZ30gfLZmwYenDmJzrfnRBasHKePoZ2vE0WHb
	 pYTt9PNkWAzWw==
Date: Mon, 8 Jun 2026 22:14:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
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
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
Message-ID: <aiehUzl-qZeZDjXP@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38146-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:uwu@icenowy.me,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thelio:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27FED65C627

On Thu, May 07, 2026 at 04:17:01PM +0800, Icenowy Zheng wrote:
> The MISC_SUBSYS clock controller on TH1520 SoC is a clock controller
> mainly controlling USB-related clocks (which isn't utilized yet) and
> MMC/SD controllers' AHB bus clocks.
> 
> Add the device tree node for it along with the missing bus clock
> references for MMC/SD controllers.

Is there a functional reason to modify the mmc nodes in this series?

Thanks,
Drew

