Return-Path: <linux-gpio+bounces-31764-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHObK46RlGl3FgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31764-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:04:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECE14DD92
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A0813006028
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EA536CE08;
	Tue, 17 Feb 2026 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="O184zeHB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A34A32;
	Tue, 17 Feb 2026 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344263; cv=none; b=Sws9Ux2F+ysFX1DquRTh2sVh5Ohx/pj6reCzzVzPgiRrspQqqdAFmC5fvtsX5v3Kq06zzm15pOuNHJgVGHvkBvGKPpZQNeJjNZuT4zPOc5eWeOKrU1lvDSblASkaKgGzBd+4L3yV8P5pCF0RhXo+CiW3fuATYumhL+RL7j845Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344263; c=relaxed/simple;
	bh=FQZbNzd4m+QYH9O7vW5IbP7JQoYIpV07a+cg+y9WElE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtXRFfWBnTRgrYPGK+GoH2ONC6WKgkhnRd0og4SA1SRTeGZGDDxo6WfoAPuxwxoZH7hnap2a+UWYgb96PISYQdkUpSDLPnExcgs9/mZ1eUrZy2tugxS3YJhuO4qHdCmot66VgmTNsI4TTF033H5kg/NhihGE20sdghPQy+i+Bcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=O184zeHB; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YJvQbUAYPOHHdhMsnaDKPfDHpvpii52/olOjUmHqws0=; b=O184zeHB/6IIcsw/GSwPrsnRnN
	jpzPbPs5Ghbd2y2Eee2yphxzUQuQp87oiOpLfFT+K3DRKQnbeHB8ilWs6HVQxWZMxly7bhFvhufjk
	WWJ/pk16xBWoBbex+OOblMl9fVvEVZq5wwPA2UWk7qRFcjaPN65TARsZ+QPOqH5tddAhq/xWUmlGl
	90PGAEVSUV3nHXkcVIkja/PSxwvso1X1YVKOTZen1bXgFy2VQtdN/KXtnHwA5CPaBCNmkobusnOcx
	rvHORGR9nGGlGSSpw0d262IOE4A0rdlpsNKR2fh2AffrXxbuI1oGp7FkH+qy0Lj6vKSXhk0lsPmXg
	7ZDsQ4gw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44828)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsNYf-000000007sc-0WlE;
	Tue, 17 Feb 2026 16:04:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsNYd-000000001KV-3uct;
	Tue, 17 Feb 2026 16:04:15 +0000
Date: Tue, 17 Feb 2026 16:04:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
Message-ID: <aZSRfzXNnzzc9MiL@shell.armlinux.org.uk>
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <a97f726e-58f0-4cdc-8e4c-a11c1e1c76ef@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a97f726e-58f0-4cdc-8e4c-a11c1e1c76ef@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31764-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,armlinux.org.uk:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5ECE14DD92
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 03:55:47PM +0000, Jon Hunter wrote:
> Hi Russell,
> 
> Mikko recently posted this fix [0]. Hopefully, this also works?
> 
> Thanks
> Jon
> 
> [0] https://lore.kernel.org/linux-tegra/20260217-i2c-dpaux-irqsafe-v2-1-635a4c43b1a7@nvidia.com/T/#u

Looks like it probably would do, but I note that it fixes two problems.
What happened to "fix one problem with one patch" ?

From Documentation/process/submitting-patches.rst:

  Solve only one problem per patch.  If your description starts to get
  long, that's a sign that you probably need to split up your patch.
  See :ref:`split_changes`.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

