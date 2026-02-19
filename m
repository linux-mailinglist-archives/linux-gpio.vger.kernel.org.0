Return-Path: <linux-gpio+bounces-31900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIuZAahjl2n/xgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:25:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653B161F63
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E2B230072A0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE701302753;
	Thu, 19 Feb 2026 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="o14AFEFW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794FC8E6;
	Thu, 19 Feb 2026 19:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771529122; cv=none; b=c6NSGjvmNlGnNQE31Ay3GBwMTd7ZsQw3cUQ320vvrL2GzCjpC7S6SsV/yYDXdO0GWodZfFbYicjC7IIhvvTAZdUhLAlOQGyZ5QQ3/CPEVYkkfGvNGz7Lr0lx1smKSSG6QZAM37VNt1Y0QzllRLkGzUJMz6087S4RL6CBbPXNFnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771529122; c=relaxed/simple;
	bh=5wXfDNgjYs99AmeEzQZ7yzbacQJewjjR6R0dgn3B7qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cP+vs4yocGfKcNfsc0XPXW+sNQeeQ7kUi25QocSg3X/aLY59b09krHtN8yDt6P8um4+wOoosvc4Evdk9WVhUVuIMX2qm8aoastLYLK69BYV5ifabmG/ZR9OVz12NuD+z8qt16+Z2A8DsWNSQT4e3dcs+XHh7t3QaGbYl2l5j6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=o14AFEFW; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dPP/cIarqO1P9h9eWlYa372Rs/GIxWfK5Giq5Q6Jtr8=; b=o14AFEFWgr4pXheJHwdZbvcLVX
	H7IWEeMLSvtYiqinwiXG68B+CxFS5PshaScxPl5Kc/wg4ZXrMcK+OZsRvuW/O2pNbPNPZLTEZvTe5
	YL2XTPxup0UUF0P34vmXe3UZkj/ZChdsE+KslfVEM7eS/hb1UNw//4S/P0dpenrlFIvPfR/DZDZBo
	ceRP++HlA46ZXqXNlGFBfDAq4MMA/Mo5LV3WHNSBPe9n3DE0QRAUAxTTsTx5vFd4r8xAtKEiTHHqv
	yI1ViidDr/qHM031HgJ4BqBvEUVNNd7LAtsMkce2iVxNSkQMoXFXjWMMtpq8vrEeC10MX+W9ikSKm
	wisGstpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46806)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vt9e9-000000001EC-0CuB;
	Thu, 19 Feb 2026 19:25:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vt9e5-000000003ZS-1kp1;
	Thu, 19 Feb 2026 19:25:05 +0000
Date: Thu, 19 Feb 2026 19:25:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
Message-ID: <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com>
 <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
 <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31900-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,bootlin.com,nxp.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-gpio,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,armlinux.org.uk:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2653B161F63
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 08:11:13PM +0100, Linus Walleij wrote:
> On Wed, Feb 18, 2026 at 9:55 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Wed, Feb 18, 2026 at 09:36:17AM +0100, Christophe Roullier wrote:
> > > when system suspend or unbind, need to set pins
> > > to low power state to save IO power consumption.
> > >
> > > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 067b17f03cd09..3d4f0e4cb53fb 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -8071,6 +8071,9 @@ void stmmac_dvr_remove(struct device *dev)
> > >       mutex_destroy(&priv->lock);
> > >       bitmap_free(priv->af_xdp_zc_qps);
> > >
> > > +     /* Select sleep pin state */
> > > +     pinctrl_pm_select_sleep_state(dev);
> > > +
> >
> > I'm not convinced this is correct, there's nothing to match it in the
> > probe function, except what the driver model core does. However, the
> > driver model core also doesn't clean up the state if probe fails.
> 
> I think it looks right, if this state is indeed for the sleep state of the
> device pins, and this is what you want to happen at remove().
> 
> The non-cleanup of the pin states is a (maybe ugly) feature: there
> is an "init" and a "default" state. If the "init" state does not exist the
> "default" state is selected in the dd.c call.
> 
> These states are just some values in dev->pins, allocated with
> devm_kzalloc(), and devm_pinctrl_get() for e.g. dev->pins->p,
> so IIUC this will befree:ed on driver detach,
> also if the probe() fails, at least that is what the original devres
> design document says
> Documentation/driver-api/driver-model/devres.rst
> 
> There is really no other cleanup that can happen: there is no
> before-default-or-init state we can revert to (that would be the
> power-on values), so there are just these states in some pointers
> that could be accessed by e.g. pinctrl_pm_select_sleep_state()
> that get free:ed up, and muxing and pin config that happened
> in the pin control hardware just stays around.

What we seem to end up with is that on probe failure, we set the pins
to init or default state. However, on remove, it's up to the driver to
decide whether to put the pins into sleep state or not.

Shouldn't a driver be consistent, and place the pins into the same
state in both these scenarios?

Conversely, I'm slightly worried that putting pins into sleep state
when we're not powering down may be bad if they're allowed to then
float, which could cause the PHY to interfere on the network.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

