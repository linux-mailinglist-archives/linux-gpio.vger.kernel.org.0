Return-Path: <linux-gpio+bounces-31767-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHOANwyalGkoFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31767-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:40:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DED14E565
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B5123008D3A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F6536E47F;
	Tue, 17 Feb 2026 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ahdydcGd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC94C6C;
	Tue, 17 Feb 2026 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346416; cv=none; b=lMkYVtMYtEYS7RHEnAjJhN9Er+B7nn9fcvYxKYm44k36dn7eOFosBPh0zo+9/tSNQ7Ks4bdvddUu4sf5O0IvLJ4A3RuTXEFlz4J31GRjrxwVtWtq9tA9tmIODz+xow3w7C5XZFVjYXEZtP04rXw9s+1lDHebuOCDjbROfzFhFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346416; c=relaxed/simple;
	bh=43Y4ejpI0F8jkybj59ArQB97mEQewzJ5PBPgAgGLfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0017zBkYM3LucQydoLw6bdLgVWK5CnA4IN5p3x/gsazvJ4LQAg69Lq9t7RLIel7cSgWNNCPbVbv05GWWMUJdvCFRvYiK8EXJ2dG8cR1kEFPcWSi2rcO2Sk+F4vkRa5R45Wni/axaLVv201yPZUSYk/K47SAXteBubwBbLrxu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ahdydcGd; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gi3TPsyX4UImxZLMaop9EMiZcFk74EX10OrxMdJjg5Y=; b=ahdydcGdRxzdJpypXxS0RGot9F
	j5MZHGBO5pGFturUOUIxCyiIzT8jIBwdTSKI4+5WZrZ6+aTBabvYMIpiyK3gxlo4TnTzvmorX6g/o
	YkXZ+TKmJidpc49nEHq0X3oPsnxyWKChbqbpgLgJAKqs/MzykiMTnvt231sD7xt5ugxDXZxtoFv8B
	4670bedwEw/uqloj3OXTDSSRVfP9QRGvcBWinhOQVOcMi8KwhcAQSBbEg4eDd++FHcuf+5jQoqxm7
	6oz/TlYhgahTtavPdXikDi0WVuphNr4Sw3qrwE9Hg+gfB+KQloYcttonfEbBHtkQg+Hv/hSe+6dYY
	+AgtMzEw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60772)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsO7N-000000007uC-1fRQ;
	Tue, 17 Feb 2026 16:40:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsO7L-000000001Mr-3ngC;
	Tue, 17 Feb 2026 16:40:07 +0000
Date: Tue, 17 Feb 2026 16:40:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
Message-ID: <aZSZ54oZS9C1Qf1h@shell.armlinux.org.uk>
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <a97f726e-58f0-4cdc-8e4c-a11c1e1c76ef@nvidia.com>
 <aZSRfzXNnzzc9MiL@shell.armlinux.org.uk>
 <8907b3dd-058b-4c28-957f-9948f23b9c1e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8907b3dd-058b-4c28-957f-9948f23b9c1e@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31767-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07DED14E565
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:15:07PM +0000, Jon Hunter wrote:
> 
> On 17/02/2026 16:04, Russell King (Oracle) wrote:
> > On Tue, Feb 17, 2026 at 03:55:47PM +0000, Jon Hunter wrote:
> > > Hi Russell,
> > > 
> > > Mikko recently posted this fix [0]. Hopefully, this also works?
> > > 
> > > Thanks
> > > Jon
> > > 
> > > [0] https://lore.kernel.org/linux-tegra/20260217-i2c-dpaux-irqsafe-v2-1-635a4c43b1a7@nvidia.com/T/#u
> > 
> > Looks like it probably would do, but I note that it fixes two problems.
> > What happened to "fix one problem with one patch" ?
> > 
> >  From Documentation/process/submitting-patches.rst:
> > 
> >    Solve only one problem per patch.  If your description starts to get
> >    long, that's a sign that you probably need to split up your patch.
> >    See :ref:`split_changes`.
> 
> Yes we should always follow that rule. However, in this case, I believe that
> the build time dependency on the PINCTRL subsystem was only exposed by
> adding the 'i2c_dev->dev->pins'. Unless I am misunderstanding ...

Yes, it looks like it.

However, I wonder why the dependency has to be complicated.

ARCH_TEGRA in both arm64 and arm selects PINCTRL, so we can assume that
PINCTRL will be set for ARCH_TEGRA. So:

 config I2C_TEGRA
 	tristate "NVIDIA Tegra internal I2C controller"
 	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
+	depends on PINCTRL

is a shorter way of writing this, and it makes sense - pinctrl isn't
required because we're doing a compile test, it's required because
the driver itself fundamentally requires it with this change whether
or not we're doing a compile test.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

