Return-Path: <linux-gpio+bounces-38149-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N5zbAX2tJ2rp0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38149-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:06:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E22165C9A7
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:06:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icenowy.me header.s=zmail2 header.b=o8LjYXGp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38149-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38149-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=icenowy.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5813089E5E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 06:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C123CF202;
	Tue,  9 Jun 2026 06:02:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87B3CF1E9;
	Tue,  9 Jun 2026 06:02:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984948; cv=pass; b=Y9WrIYqQCi5HLxMl2ENhKrArN4IwrwYu3wlJrpG55i7J4fb83cGrqqje8me58hhFEgiUsmQWnzqU+n0lpUtl1RuoOVAf7JqIWdsOGlbcIPBHGxPOmVcjEIJecZtxl2RoCmp7nWCKB3kqPcQRAlcHiLimoqmp+6UQQyp6ZyIFkdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984948; c=relaxed/simple;
	bh=eLkDF1Xt++OsYNLKAMEoqTd5wXql6NUCJQTLmDSgolE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f2lmZ9dkfrzPsU0vNrNHFMnPS2nJImI9Yz0A9tp/zRV4yO+6oWxLciFbUieBXDHi94lK/b4+eYxNxjcA7ynIvZCZ0+lG4mafyoplZ5ArKSw8qow4XEcxfRUljIUAnyojB2qW7cB80nGa9K95mcsmHeOIaIZswGCXVhiTCg4u3wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=o8LjYXGp; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780984918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kQ86I763szj5XrihC4RMO3UE7e3pCv/7CyXlBorZ0jHp3QvBRgLnFSH24G967x/5+T3kClFVe8pDngKIlRkyr7qVuHjPBRh7WjWDCLy30Gh5huBE+K1U8LYEmroy6T6oi0RwMzNFyBTM1QFUsZE8C5HM1wiMhEIaC5+NVPeL9/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780984918; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Fcjd/zlFVY0nunhgxmUeD2hlkM4IOvznVuILW3ZgAOw=; 
	b=Bke2SxBJiCOvWxu2RG3hDa4nW57QZzGjHqbfkAST3rsrhc5tN9MyumSLPybp0K2Kp03JJLExtngQH+T/WkuudMozeDUVFqrwrrFUZz+Low63tkWPtyQON6kvMt1kBvZ74DS6dK9ymbvleIvYkWQkeQbPXw0+egp5X5I7nuEoKMc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780984918;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Fcjd/zlFVY0nunhgxmUeD2hlkM4IOvznVuILW3ZgAOw=;
	b=o8LjYXGpCPngeralFGsnJ0EzL2xpelUI5SHz++VBOxpCkvHmWBmgrpwPuwP1pQcs
	WLSqG/kvtXU/jL8Rj4VGaR2cVX7M6Ayx2Dnp8nMhr2aovEpMFnuQwDa+IEMBwJGWja/
	YYWRRZlBwjK9yGT0hMXHcJKcAt9mjH+qwF033ZMAH0xhEM3QNM3GCfNYmGke5tuvEtP
	hpsaIiu4f4YGRer1sn0uRVmZ1+Rfncnbk+AaogeJ7+1b86cOwUSwyt0fAnxCSX1C8JA
	KEyiSh2PW+VPTBRqi0EchwOPGEWL95bVdRLaYzjiCEqR3uJ571JNXVELiec/4Ky01P2
	uTD4g4WAmA==
Received: by mx.zohomail.com with SMTPS id 1780984917247708.4348995858405;
	Mon, 8 Jun 2026 23:01:57 -0700 (PDT)
Message-ID: <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC
 subsys clocks
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
Date: Tue, 09 Jun 2026 14:01:43 +0800
In-Reply-To: <aier9XppLeCkJydw@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
	 <aier9XppLeCkJydw@thelio>
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
	TAGGED_FROM(0.00)[bounces-38149-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,icenowy.me:dkim,icenowy.me:mid,icenowy.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E22165C9A7

=E5=9C=A8 2026-06-08=E4=B8=80=E7=9A=84 23:00 -0700=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng wrote:
> > The TH1520 SoC contains a MISC_SUBSYS clock controller, which
> > allows
> > controlling of USB related clocks and MMC/SD controller AHB bus
> > clocks.
> >=20
> > Add support for this clock controller, in order to enable USB
> > support.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0drivers/clk/thead/clk-th1520-ap.c | 64
> > +++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 64 insertions(+)
> >=20
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c
> > b/drivers/clk/thead/clk-th1520-ap.c
> > index 3a6847f1c950f..24f785f0b329a 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> [...]
> > @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct
> > platform_device *pdev)
> > =C2=A0			return ret;
> > =C2=A0	}
> > =C2=A0
> > +	if (plat_data =3D=3D &th1520_ap_platdata) {
> > +		ret =3D devm_clk_hw_register(dev,
> > &usb_suspend_div_clk.hw);
> > +		if (ret)
> > +			return ret;
> > +	}
>=20
> Should usb_suspend_div_clk.hw instead be registered under
> 'if (plat_data =3D=3D &th1520_ap_platdata)'?

Do you mean misc_platdata?

Yes, this is an copy-n-paste error that deserves a fix.

Thanks,
Icenowy

>=20
> Thanks,
> Drew

