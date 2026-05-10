Return-Path: <linux-gpio+bounces-36487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMKTC6Ds/2lhAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 04:25:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2E50246E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 04:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3896A301C88B
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 02:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F06244661;
	Sun, 10 May 2026 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e79y6hL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06263CB;
	Sun, 10 May 2026 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778379925; cv=none; b=VYNBMYSQ5yCZIX+afyPaDhFPED4GwsworXwI7soW4z2isHHpgA9Gr49zwwJF3FMi4t+2tKYpnyi7ss8dykUJyNVpOtVb/pEcf6tp8T7LP2sxOcP+EaM23UpgvbKAV8DZmP5epr7FIPUs3yCA/JcM6gV4M8MzTPD0kSRIeb/yta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778379925; c=relaxed/simple;
	bh=DuPHI1LqOFfQCPwSGvE4XxVWrva8Uk84ODEwZHi72xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDthOCx1hjB4wtUbH7QD+lhf7laJs3isYUsV3b3L1hoeQEgpV433gt0fFA2if/beEMC2+EmfPzx7fcPnLVYaR1+okP72/SU3Jyo+fxZ6A+uEVz+oPVhZFfM3tcOdBIhp0geQGDdWmQOmKEHxKFeJmJqJyk9RMi7sKhntecFsmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e79y6hL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAE5C2BCC7;
	Sun, 10 May 2026 02:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778379924;
	bh=DuPHI1LqOFfQCPwSGvE4XxVWrva8Uk84ODEwZHi72xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e79y6hL/mgDvOZD8UHrjx/yvvGE14Vi42uRup1vVa+BwGGuz0tI3FboKrX6KCcHYW
	 RzREP9nAcxXgbOLsICt59PEujBZfc43refGEy/MqJqsWO96s+Q3AgEvXjdaDOJlAAS
	 iXt5onlnEIiRTPA221E7iqjKkNnVa/ou5prZT51yvrxvmamwRnnTONClO46LkwR6wZ
	 t2IFlN52kGo0lvKsca1tHoXbtX8d3ZNYB/HRYPyRw5jkTtawLddwbKxR+1rJEj3vIi
	 eoZSgqm4WxQI4AKYACjQH26b7yHJFcZfpkAvmuGCkgkL1k/4LZuGB+A3395nol8DbQ
	 i0nDH3HyM9r4g==
Date: Sat, 9 May 2026 21:25:16 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>, 
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, alexandre.torgue@foss.st.com, 
	ast@kernel.org, boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, 
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com, 
	inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com, 
	livelycarpet87@gmail.com, matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, 
	me@ziyao.cc, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	richardcochran@gmail.com, rohan.g.thomas@altera.com, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <af_sarCs9E5M7NLE@baldur>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <afycOwz5TpkegkZd@baldur>
 <3c78f48c-6478-46d0-87c2-581bb58637dd@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c78f48c-6478-46d0-87c2-581bb58637dd@riscstar.com>
X-Rspamd-Queue-Id: B8C2E50246E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36487-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:37:09PM -0500, Alex Elder wrote:
> On 5/7/26 9:12 AM, Bjorn Andersson wrote:
> > On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
> > > diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> > [..]
> > > +
> > > +  gpio-controller: true
> > 
> > I don't have any concern with the use of a proper gpio driver to model
> > the implementation, but if I understand correctly this relationship
> > between gpio controller and gpio consumer is strictly internal to "the
> > PCI device".
> 
> (I think you're already cool with this but I still wanted to respond.)
> 

Thank you for the further clarifications, and added details, Alex. This
does look reasonable to me.

Regards,
Bjorn

> That is not correct.  These GPIO lines are used two ways for the
> RB3gen2:
> - drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c uses GPIOs 2 and 3 to
>   assert/deassert the reset lines associated with the two exposed
>   downstream PCIe ports on the PCIe switch within the TC956x.
> 
> - Each of the Ethernet PHYs has a reset GPIO.  On the RB3gen2, the
>   GPIOs used for the purpose come from the GPIO controller embedded
>   in the TC9564 (00 and 01).
> 
> These are therefore "exposed" (they are *not* strictly internal).
> 
> > Is this connection variable or is the link merely expressed in
> > DeviceTree to mitigate the fact that you choose to implement the
> > responsibilities of the two parts split into two device drivers?
> 
> It is variable.  These resets might be implemented by other GPIO
> controllers on other platforms.
> 
> > Are there other consumers of these TC956x gpios which would result in a
> > board designer (and hence dts author) to ever reference this
> > gpio-controller in a different way?
> 
> They could.  Nine of these GPIOs are exposed by the TC956x pins
> (GPIO00-06, GPIO12, GPIO35 and GPIO36).  The RB3gen2 uses 00-03
> (and possibly 04 but that's for a PHY we haven't tested yet).
> 
> 					-Alex
> 
> > Regards,
> > Bjorn
> 

