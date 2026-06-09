Return-Path: <linux-gpio+bounces-38145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OCNmK4egJ2plzwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 07:11:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB265C5DE
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 07:11:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icenowy.me header.s=zmail2 header.b=N2MDDFGD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38145-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38145-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=icenowy.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C528306C107
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 05:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96683B7B84;
	Tue,  9 Jun 2026 05:11:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C634250E;
	Tue,  9 Jun 2026 05:11:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780981886; cv=pass; b=fUMbk491n64U95KzAKsggkq4T6X3xzr7k7GzGyRwPIJGKycu2UT76O46q3gs1BS3NyIH/70F85dE/3QuNFAiZTv9q17fgUi1vRqS5yYygTm2iVCUQZ6hdxAYN50nsWjWurCW/rAMTgAgIOKhCXHsDFLf4dsEMxZPhy5D83NW4yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780981886; c=relaxed/simple;
	bh=LnM4xxDaTA6sPdy7VmjbiznxS/a0dU1GXd9YzU2Jenc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QgwJy+7bsuyhwN2ojtAzuheL0s+HVhjPpeXNWfV3G7hEvU3LuZL2xjdF81FXowhq9lh20ldGMcgrYmvCI+xCwD8e19NbMaIXDAZbUqqB/9WMqF3I9GjyRsbPQgZ2pV0+EACwlM6YwV12HwR1NFkhmqUZ41bxwAM6qEnuQ+K1kjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=N2MDDFGD; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780981855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A/UWqSIgnGtvXOLP4BBnY3FE7VuGSiuGjdfDqWQlKItkmHTwtGQfbXVGAyLMk68i41HF8m0Pr1ihkLXvybsReWYCHb8lEnoRdKUUt5CUbMSTU3dJ9D+gdUeYinI7u/3mOdv0YCa8eTt8fyK25q5piyzX62GL8/hd3mW7ECYjXBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780981855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LnM4xxDaTA6sPdy7VmjbiznxS/a0dU1GXd9YzU2Jenc=; 
	b=JozwoV0QlRRH7schWe8oMPFwJ2QO6cp/v+vLOf/qBmbWSkWpgUPwQubYJi4vl0Dw110PHkUVGFZzjC9GytUDu50I81rLS8fTy+J18Xl5qMYpdfOXBP5zVuGvbIottNLD5pYN5C2RWe5EoecwtZkFB28LroC6G/1lJKCFf4KRa5w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780981855;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=LnM4xxDaTA6sPdy7VmjbiznxS/a0dU1GXd9YzU2Jenc=;
	b=N2MDDFGDLjgRjA2UtlUSuiJlLzCqU98xulMPqUnXDDuOh6Bjs4qDXaWeAKtZOj7l
	YmKyi0JlpfkvcCSoLCIoj7HjY/1wKpgemkaLFx6Oaaqw2KOCpMOnLPD3ax45yG26ar4
	Yw4jaH0dbl967ohZx3ldZH12hAwLZsDU5Gv5BOLqFRyv/Vf6/VihDpc8uff4oWlkGhg
	S7y0guMF2zhRPxk5Rdnyj4zJBmXfCiqoSuROEpnCoyb10X3sOY2agzGMVctouzkSGGX
	J2vUmf0kXp1gkjbc5vtk4gcZ/GP+48XOW1vAMvKMaUicETtT2MleSZOyf5xLYuesrCW
	oCSfeQN0mw==
Received: by mx.zohomail.com with SMTPS id 1780981852365784.4413352514897;
	Mon, 8 Jun 2026 22:10:52 -0700 (PDT)
Message-ID: <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
Subject: Re: [PATCH 00/12] Add TH1520 USB support
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
Date: Tue, 09 Jun 2026 13:10:41 +0800
In-Reply-To: <aieT4WmWK9416M9E@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <aieT4WmWK9416M9E@thelio>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38145-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26DB265C5DE

=E5=9C=A8 2026-06-08=E4=B8=80=E7=9A=84 21:17 -0700=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, May 07, 2026 at 04:16:58PM +0800, Icenowy Zheng wrote:
> > This patchset adds support for T-Head TH1520's USB functionality,
> > and
> > enabled it on the Lichee Pi 4A board.
> >=20
> > The first 3 patches add support for the MISC subsystem clock
> > contrtoller, which contains some USB clocks.
> >=20
> > The next 2 patches add support for the USB PHY of T-Head TH1520,
> > which
> > is a wrapped Synopsys USB3.0 FemtoPHY with a little integration
> > quirk;
> > the controller itself is a properly configured DWC3 controller with
> > sane
> > default register values set.
> >=20
> > Then one patch adds the USB PHY and controller nodes to the TH1520
> > DTSI
> > file.
> >=20
> > The remaining half of this patchset dedicates to enablement of USB
> > on
> > TH1520, because of the onboard hub of that board -- its USB2
> > signals are
> > behind a switch that needs to be toggled on, and Vbus supplies for
> > both
> > the hub itself and downstream ports are managed via I2C-expanded
> > GPIOs
> > (because the SoC does not have enough GPIO pins).
>=20
> Hi, thanks for working on USB. I tried to apply it to next-20260601
> and
> several of the dts patches no longer apply cleanly. Could you rebase?

I think the reason is that one of the GPIO expansion chip is added to
the DT for enabling Wi-Fi.

I am not sure whether the next revision of this patchset will contain
all things, maybe I will split out at least the USB PHY part.

Thanks,
Icenowy

>=20
> In the meantime, I'll apply to 7.1-rc7 for testing.
>=20
> Thanks,
> Drew

