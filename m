Return-Path: <linux-gpio+bounces-35554-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4InDGItB72lP/QAAu9opvQ
	(envelope-from <linux-gpio+bounces-35554-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:59:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9726471611
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A899D3008D1E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1221F3B4EB4;
	Mon, 27 Apr 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mLv5x2EL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13EB3B5318;
	Mon, 27 Apr 2026 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287511; cv=none; b=lrlRnJyypypX79GmNmf7lRQbk1mqXy0czGidKC+yFS/4wS10vnQBj3hH5XilVzAGuZeiefhlKNGJbgv+al1IRIzkowSZTOY48ru8RLgBC4uDPEsKBM6lG2EEVvLJ4Dwh5RGb4d+ZCkUAUgmLb3g2oklqLWAo3/y2D11BxafTbJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287511; c=relaxed/simple;
	bh=AxO39i/Ry0AFCTDc63f1eUWIAon79ipzzE9TkiozzB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLO5SHCefdHnfC32IcITrdWPzKmBMq8+06tbpFAkLJ88j/hITdftXIt2wHScTnLhFE8q03Fq142c34z9EOedY50TlYGM7yqPaTCBrImcyQLe+H8HkdVc3XHDX4ctf0wZvHebYbWePFJpYMcWvgEvFdG27N1qB3OaJWgRclWYHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mLv5x2EL; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dGBdavIaqnVL2bFEtTe5Ml/xW7w8rZK2JeFY/jWQ3kI=; b=mLv5x2ELnnYv8KJwqrsZ6PgyMF
	xIRHSKxzYv/IWoSBMYF+aHJxWRNUmzb25/HRQlzPl0kBlk/xwvz/mCaXX8qarfsw4a3rdhzQCxDwq
	DNKhiPptxpL1nEakVi7Fm4053EN+BaAbPTQyC4p0L/iQdvXOwEFrJummjJNqUKDR0nHE5vOsfefAV
	+5mVEwhxV3pdCWhPI8eZn0ruQn2KdC3ICZbvpjXapeQ6Z2k3ZOIL49UX4QNB/wWLsfyNkcSE69+fG
	EZOcFlQ6x0OB3rBVLdwNo/0Z/WJ2j8D21QBnQj2xDG1U3lBeUZFghSaJE80b39SSyBCaPQHSXQ5dd
	IDYlSPxg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48392)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wHJfO-000000006tA-0MDk;
	Mon, 27 Apr 2026 11:58:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wHJfL-000000005JE-339f;
	Mon, 27 Apr 2026 11:58:15 +0100
Date: Mon, 27 Apr 2026 11:58:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ARM: pxa: pxa25x: attach software node to its
 target GPIO controller
Message-ID: <ae9BR5vW_6jvNOYY@shell.armlinux.org.uk>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <20260427-pxa-gpio-swnodes-v2-3-86fc24b9e714@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-3-86fc24b9e714@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Queue-Id: A9726471611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zonque.org,gmail.com,free.fr,kernel.org,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35554-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.606];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shell.armlinux.org.uk:mid]

On Mon, Apr 27, 2026 at 12:14:34PM +0200, Bartosz Golaszewski wrote:
> Software node describing the GPIO controller for the pxa25x platforms is
> currently "dangling" - it's not actually attached to the relevant
> controller and doesn't allow real fwnode lookup. Attach it once it's
> registered as a firmware node before adding the platform device.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm/mach-pxa/pxa25x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
> index 70509a5998142ec6b9c484e5f094751eda6db6cd..6875774f2cae1db4798d18c813f445bdc31b15de 100644
> --- a/arch/arm/mach-pxa/pxa25x.c
> +++ b/arch/arm/mach-pxa/pxa25x.c
> @@ -179,7 +179,6 @@ void __init pxa25x_map_io(void)
>  }
>  
>  static struct platform_device *pxa25x_devices[] __initdata = {
> -	&pxa25x_device_gpio,
>  	&pxa25x_device_udc,
>  	&pxa_device_pmu,
>  	&pxa_device_i2s,
> @@ -240,6 +239,10 @@ static int __init pxa25x_init(void)
>  
>  		if (!of_have_populated_dt()) {
>  			software_node_register(&pxa2xx_gpiochip_node);
> +			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
> +								&pxa2xx_gpiochip_node);
> +			platform_device_register(&pxa25x_device_gpio);
> +
>  			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
>  			ret = platform_add_devices(pxa25x_devices,
>  						   ARRAY_SIZE(pxa25x_devices));

Why do you need to explicitly register using platform_device_register()
rather than leaving the device in the pxa25x_devices list and letting
platform_add_devices() do that for you? platform_add_devices() is just
a wrapper around platform_device_register() which calls that for all
devices in the array.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

