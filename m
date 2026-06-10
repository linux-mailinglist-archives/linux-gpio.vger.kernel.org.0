Return-Path: <linux-gpio+bounces-38210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EMvEKkXpKGp5NQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 06:34:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D869665C36
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 06:34:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NEoNRuHm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38210-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38210-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8D9430C9236
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 04:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4209370D56;
	Wed, 10 Jun 2026 04:33:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6255370ADE;
	Wed, 10 Jun 2026 04:33:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781066005; cv=none; b=JNP/Cx9Ohsj0d8YNf3nplnUxI4Qg4Zo95yn1RTJxUBzwsgupTZeE5wpGg7Pk/XNLPBBgsjdhVh3DOedJIDQxP5dAIV2zxb88r/f72z1PVrwZo84lIcOKZik+XwcDvjLXEuyc1y7a9asLbt4MahrvfjZ4gBGF4TPhtJl36qvzbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781066005; c=relaxed/simple;
	bh=8laxQoJT2lNJwHR3JwIshfZrBXuOnFnyYIPjA73bC3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L28FKbExDer1Zqx6ZiRrCqAt2hZMrLI7L3a/ykp8tKHuFzrj5Bo2vqBagiCG/Ms10hpeSdMkqJU+W7hS9/NJVRQ6imSwcqBlg7rYfgQw5qV24R1vdOyyqO4AsV2YHcCtjYcTR2dT1uxWy9eeZK7fh9JPL9mVNe64F8VfiG1HTto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEoNRuHm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020371F00893;
	Wed, 10 Jun 2026 04:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781066004;
	bh=oXYfUS9iAnPAsRhuciPrR5ndvfboUA5NSi/Wj0ODlDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NEoNRuHm4G3lOhwacyNXbaBQqHrh1KHHYSnPmxbF2pO3gzLvNecXW9RqfuRtvavNR
	 kCqQ2xsdcbbYwLCHtOqYp4dajl2MbsnCLkHk5qJ8ky4sbFj/KJH88T0VDjNYT11t8B
	 7ohqtNPGTJAYnV2tUYCcGH8nd7k+/O4zRcrU6r0ip1d1GvBQecEa3PobFqQ7/drA0M
	 5gOJ3ZNlrju7JiplgapmU8c+tbPufpIpSDp7pShLMDW6pbUm8Fk19TDboesVTu4U4X
	 l2p2W65uiqCXIspXWUtzZ75EaYRw5TcEm2fCDBQ7GMQ+9EBlDPtt7MBX7TzVe8Hot5
	 yvgHY6+mS/87A==
Date: Tue, 9 Jun 2026 21:33:22 -0700
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
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys
 clocks
Message-ID: <aijpEqzJ7fM7rGMH@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
 <aier9XppLeCkJydw@thelio>
 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
 <aievi0s-3SO8hV6a@thelio>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aievi0s-3SO8hV6a@thelio>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38210-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email,thelio:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D869665C36

On Mon, Jun 08, 2026 at 11:15:39PM -0700, Drew Fustini wrote:
> On Tue, Jun 09, 2026 at 02:01:43PM +0800, Icenowy Zheng wrote:
> > 在 2026-06-08一的 23:00 -0700，Drew Fustini写道：
> > > On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng wrote:
> > > > The TH1520 SoC contains a MISC_SUBSYS clock controller, which
> > > > allows
> > > > controlling of USB related clocks and MMC/SD controller AHB bus
> > > > clocks.
> > > > 
> > > > Add support for this clock controller, in order to enable USB
> > > > support.
> > > > 
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > ---
> > > >  drivers/clk/thead/clk-th1520-ap.c | 64
> > > > +++++++++++++++++++++++++++++++
> > > >  1 file changed, 64 insertions(+)
> > > > 
> > > > diff --git a/drivers/clk/thead/clk-th1520-ap.c
> > > > b/drivers/clk/thead/clk-th1520-ap.c
> > > > index 3a6847f1c950f..24f785f0b329a 100644
> > > > --- a/drivers/clk/thead/clk-th1520-ap.c
> > > > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > > [...]
> > > > @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct
> > > > platform_device *pdev)
> > > >  			return ret;
> > > >  	}
> > > >  
> > > > +	if (plat_data == &th1520_ap_platdata) {
> > > > +		ret = devm_clk_hw_register(dev,
> > > > &usb_suspend_div_clk.hw);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > 
> > > Should usb_suspend_div_clk.hw instead be registered under
> > > 'if (plat_data == &th1520_ap_platdata)'?
> > 
> > Do you mean misc_platdata?
> > 
> > Yes, this is an copy-n-paste error that deserves a fix.
> 
> Hah, yes, I also had a typo :)

Assuming that gets fixed in the next rev:

Reviewed-by: Drew Fusini <fustini@kernel.org>

