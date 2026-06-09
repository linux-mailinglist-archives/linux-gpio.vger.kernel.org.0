Return-Path: <linux-gpio+bounces-38147-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NiSNCjumJ2qj0AIAu9opvQ
	(envelope-from <linux-gpio+bounces-38147-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 07:35:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 749CC65C78F
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 07:35:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icenowy.me header.s=zmail2 header.b="GBX+wSO/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38147-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38147-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=icenowy.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038E13013247
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 05:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2029A3C4553;
	Tue,  9 Jun 2026 05:35:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257025B081;
	Tue,  9 Jun 2026 05:35:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983347; cv=pass; b=CDNRKVPBVYFhuDbEs5UP6IO88Ri7WLmbWnd+EXzCdmfJfX/v/qLEGks7NjeP5ZFBhj4fav5Z5Yfky7bIYLAOc933dF/38/VApXZ/aUL9mDAyjfZe0m018sNZ2A7GYaVl3AMVarEKFmBhlLLMujjJQ5uwFJEuF47a6NpS4qgK6AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983347; c=relaxed/simple;
	bh=aeyRk661Z8pMzzMr6vizd11aGoPyzX0vz8JfiH5ebRs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rfS7e/Q9aJ1MgvBC/jKvuZnG7FnwyXE2xQpfMA1QQ3R1JrCJwgDRrszHnZQLfD4thQO1wKmJcvFwbGOr6rN1/bhm+vEU2KcS3HE/Qsh4Ckr3AHpcWNxuCJTxSgxtJgC2IJjCIMgf82n/aDw/Gi6/DuT2U5/cghNy8MMrHkd9CpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=GBX+wSO/; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780983323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PVW9w59KiqODY+5AC3EOr1QN4kqQw1VMcG020fokPnJ6vmQinqKfDpnipyU4S3JznovbCVzKCRTUOzFPLo7bNAHMNhFf48e5M+6jfEFMOPPPwg/O4+eRvMm6lvtBKWKJzGKa98ePF1+qTA81dPBXrNRmwaD/Z815Biyvc1WnRuo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780983323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aeyRk661Z8pMzzMr6vizd11aGoPyzX0vz8JfiH5ebRs=; 
	b=X0l1rbTmOwFsso0BkZxalGmfPDVUdnnSSkv+fW86sbVCKL0N63dm2xcr0e/Qf3gE4zW79W5fyL0lCYRcvbp23jQwzBHnDTNjCZOrZUCdqfrqqTx2ra4pJr6n3o3SncObsiTvfOeIpUXReO1FPJ/RiPm4h0jWEfBArHjY2K5gxtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780983322;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=aeyRk661Z8pMzzMr6vizd11aGoPyzX0vz8JfiH5ebRs=;
	b=GBX+wSO/sD6gTvgRkNoKNACIb8KP2A1OCKjUn03fEQ9YRERDNuPHy70jdqBQizJe
	E16Td4uLRmNwu6fRtEBLihtpmsiW1StMTgH/m+2dGRNCEW8c9B6L2rjese5buX459eK
	nz9l1ky0avX/B4XDOg7G5jBFAP1UfRYZ8AtsGbCW/RfLjOnEK5lLRXbR63IoHvaZrq6
	4EL/nx1CdthUtyQC0fXrjf6PDj2VrVww3bQ/JXQUws18HScCYGrKlgCQf1DA7Tp4pVw
	bYEhJHUsM5H12u7Td+vR7msim8kEoGU4wehoThgnmJJF+/++Akso6zBoY8eFkKp6UAC
	gl3+OlNeYQ==
Received: by mx.zohomail.com with SMTPS id 178098332120521.424882624077895;
	Mon, 8 Jun 2026 22:35:21 -0700 (PDT)
Message-ID: <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Jisheng Zhang	 <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-usb@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi	 <ziyao@disroot.org>
Date: Tue, 09 Jun 2026 13:35:11 +0800
In-Reply-To: <aiehUzl-qZeZDjXP@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
	 <aiehUzl-qZeZDjXP@thelio>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38147-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[uwu@icenowy.me,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,icenowy.me:dkim,icenowy.me:mid,icenowy.me:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 749CC65C78F

=E5=9C=A8 2026-06-08=E4=B8=80=E7=9A=84 22:14 -0700=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, May 07, 2026 at 04:17:01PM +0800, Icenowy Zheng wrote:
> > The MISC_SUBSYS clock controller on TH1520 SoC is a clock
> > controller
> > mainly controlling USB-related clocks (which isn't utilized yet)
> > and
> > MMC/SD controllers' AHB bus clocks.
> >=20
> > Add the device tree node for it along with the missing bus clock
> > references for MMC/SD controllers.
>=20
> Is there a functional reason to modify the mmc nodes in this series?

When the clock isn't referenced, Linux will disable it unless
`clk_ignore_unused` parameter is passed.

Thanks,
Icenowy

>=20
> Thanks,
> Drew

