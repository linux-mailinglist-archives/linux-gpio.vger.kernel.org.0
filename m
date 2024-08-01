Return-Path: <linux-gpio+bounces-8506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB629445C8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1872848C0
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 07:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E78216DEA6;
	Thu,  1 Aug 2024 07:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VZM+HAtz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ymQdWITh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O7Cp5fR8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Me77ATGy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC216DC30;
	Thu,  1 Aug 2024 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498353; cv=none; b=aoNIZArP0MTpI6xlraVMhcd15MouklpUz+iVPDYwnEmAL2ZxL8I6/YidWSjVMOR0aZPDzkzE4QUFvQZH9AIeFV7qmu2KTZtdJuWwmlwYMhTdxPan/6CNZCmZo12AJxoLpsSq0TD3UqzlLlWKC+A0osdKuMCbrFf/TmVxPtoKO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498353; c=relaxed/simple;
	bh=oi6UItZeuUJ+GwMXqfK528KOTtt4vtQq69CPBbAKfWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyZFNyLC7S2/gShOWnFN9IKPmf0cI0MTERift6euZce/7R53yQoMJa3IMnhCS/aspAmKz3CWnOh+mVUxpCSnH82X5Nnl8xgKD+ZOlYHw0qX/OzaKz7Z49GiGb6wifaOUBnwodMO2HDnzNWpaOABxy6SEgyfVc1q6Sip669Oi3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VZM+HAtz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ymQdWITh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O7Cp5fR8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Me77ATGy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E5ED01F8D7;
	Thu,  1 Aug 2024 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucpO8yMLTFgfxZzPiWQryJ30gvtGY2NZE1jEQIbebwM=;
	b=VZM+HAtzkzq9i6xhEsWFVIBUQHsHYkhZMdn61dndJ/JrdhLMarx1irZYw43lJBk+TWDJto
	th7bY/ig6Ns+zYrUPSt/JwBOyycKnH/w4f2xURyZN2Gtl6xS5hqDux551sk5LYrYTnS+hp
	TtILmJyDzXIE7NJ785XAGNBvS1Uh74s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498350;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucpO8yMLTFgfxZzPiWQryJ30gvtGY2NZE1jEQIbebwM=;
	b=ymQdWIThetOkPC8UlPlRBa5vVa1+kXTKF8FPc/bH6UBYYVRTjL3QyRYWCHpRee9pEz4w/2
	s5DrjmoUrxoSWCDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucpO8yMLTFgfxZzPiWQryJ30gvtGY2NZE1jEQIbebwM=;
	b=O7Cp5fR89mNR2fJUGoFK7j11WxyHeX2wNhyMgE8U4mPtaonpqTtsk7mYBRBARsNeB0mQV1
	tPbpfcWtHst7FXRcHsWZNJK/0QioZSmjXz9n30GWcfUYVreS5d2+Gh4GBuyYX2NoLUblSZ
	Vjwz59sAOA5ZzCNciPmKFyGNMEXwsHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucpO8yMLTFgfxZzPiWQryJ30gvtGY2NZE1jEQIbebwM=;
	b=Me77ATGyXZqo3Zl1a8JVCAgt6bH1UNJii/QJQiLt2xKOa8N7uNF6CAGrLeguJsqqFSKR3Q
	p7mjb4bmxv8qELAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C363513946;
	Thu,  1 Aug 2024 07:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KiFqLS09q2YTBQAAD6G6ig
	(envelope-from <iivanov@suse.de>); Thu, 01 Aug 2024 07:45:49 +0000
Date: Thu, 1 Aug 2024 10:50:03 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wahrenst@gmx.net, andrea.porta@suse.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: broadcom: bcm2712: Add UARTA controller
 node.
Message-ID: <20240801075003.ghbxzmzzttevmo5u@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-8-iivanov@suse.de>
 <f1b19a03-9509-4d1c-9e54-9c07a372cad3@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1b19a03-9509-4d1c-9e54-9c07a372cad3@broadcom.com>
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmx.net,suse.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

Hi,

On 07-31 15:13, Florian Fainelli wrote:

> > +
> > +/* uarta communicates with the BT module */
> > +&uarta {
> > +	uart-has-rtscts;
> > +	auto-flow-control;
> > +	status = "okay";
> > +	clock-frequency = <96000000>;
> 
> Would not the "clock-frequency" belong to the .dtsi node instead?
> 

Perhaps.

> > +	pinctrl-0 = <&uarta_24_pins &bt_shutdown_pins>;
> > +	pinctrl-names = "default";
> > +
> > +	bluetooth: bluetooth {
> > +		compatible = "brcm,bcm43438-bt";
> > +		max-speed = <3000000>;
> > +		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
> > +		local-bd-address = [ 00 00 00 00 00 00 ];
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > index 3c0663dc6712..e972f94d6828 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -305,6 +305,17 @@ gio: gpio@7d508500 {
> >   			brcm,gpio-direct;
> >   		};
> > +		uarta: serial@7d50c000 {
> > +			compatible = "brcm,bcm7271-uart";
> > +			reg = <0x7d50c000 0x20>;
> > +			reg-names = "uart";
> > +			reg-shift = <2>;
> > +			reg-io-width = <4>;
> > +			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
> > +			skip-init;
> 
> Also an undocumented property upstream, what does it do? Is this to set
> UPF_SKIP_TEST?

It is U-Boot thing [1]. I suppose I can drop it.

Thanks,
Ivan

[1] ... "
    serial: pl01x: Add support for devices with the rate pre-configured.

    For Raspberry Pi, we had the input clock rate to the pl011 fixed in
    the rpi.c file, but it may be changed by firmware due to user changes
    to config.txt.  Since the firmware always sets up the uart (default
    115200 output unless the user changes it), we can just skip our own
    uart init to simplify the boot process and more reliably get serial
    output.
    ..."

