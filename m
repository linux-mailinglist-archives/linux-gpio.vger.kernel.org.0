Return-Path: <linux-gpio+bounces-19955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABCAB3984
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 15:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5881791B7
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46975255F51;
	Mon, 12 May 2025 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zP5U3VrW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gvKon7yM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mrNRbP0b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a5UtLZDe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348BF25A651
	for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057367; cv=none; b=Ea2VW+LXELqU2GrXNCzyE37JVsnhjgZYqRLtU9O5mi0aeLITD9XaEs32SIX5KH8AvSo6laSqpw6BTGdVZGwPBUW3mM3/Yv+eOpjvgKa6eyNdh9o97XTfDuUe9EYwsTyU7Q6nZNsxY6sBFhol0dLSP3BE4elN4jfShKTwk8NNgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057367; c=relaxed/simple;
	bh=VeCDMgkzyL+iMixGYU/gMkR9Q15A/DHrJuIO2Xaxb8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTAsAQwqa5loT2FiJcIlAxFMIKwhIwZYtEB9b2HVto/KjWzVFT8koHXmGQZrc2/knibtkBd1m5TXz7MLfItEoTfc4vfusuAjERDAjYDo9ROMH0/I8hVF901Kf+l2inLTC6E43R32/mlRlJcNilKRtYbKqMncEcW8NRugMbTGO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zP5U3VrW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gvKon7yM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mrNRbP0b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a5UtLZDe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77C721F38C;
	Mon, 12 May 2025 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747057362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=zP5U3VrW3t8DldETQ2m3ra/g9SR/7BfZECcIwt1ffozAv53i4FQNTbZqDlArwMGydwaBj6
	rtCzxLUs79hYV9o0Zzc4IUjfIraGG048FWChP1WvdFVRQhYgY2kGiXmYA2HbBvn4MP7iQJ
	GSdeERGDIVxWiZR/A6vqbWOAeUUfRIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747057362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=gvKon7yMqsoG257e/+tjFmrYEyugtB0QHKk7RcncstuvNHkWJgUu0gzu6xzHS1AJNvI2QX
	OVlRskUcVxR7BmBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747057361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=mrNRbP0beD+FA3kIigtZ4Axve0L82Sl8oc2EvXufjmPE8pwINqFDZxkHovVpcbgQ/vNB0m
	vqZplir1glSp40FziCgR2C0aHfwbrJD8wBoBU9Cl2dt07JUr0xad4PyPKPg0CEt0K23we7
	KQHa5h307RnZsk+FTfdGFKXqvDVJ65I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747057361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=a5UtLZDe1eN/4R0G6f8q7lUB9f46NVeH/gmYLEhqmnN5Pvsl5Tq/jEozyj/EDghnESjMQr
	YROgoHf7h4tvWhAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 539C613A30;
	Mon, 12 May 2025 13:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2MYKEtH6IWi/LQAAD6G6ig
	(envelope-from <iivanov@suse.de>); Mon, 12 May 2025 13:42:41 +0000
Date: Mon, 12 May 2025 16:42:40 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	andrea.porta@suse.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arend van Spriel <aspriel@gmail.com>, kernel-list@raspberrypi.com
Subject: Re: [PATCH 6/7] arm64: dts: broadcom: bcm2712: Add second SDHCI
 controller node
Message-ID: <20250512134240.hg4we6sxemxeufka@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-7-iivanov@suse.de>
 <a563971a-45f4-4404-a622-21c940d96250@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a563971a-45f4-4404-a622-21c940d96250@gmx.net>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmx.net];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,broadcom.com,suse.com,vger.kernel.org,lists.infradead.org,gmail.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]

Hi,

I am sorry so long delayed answer. Shifting priorities.

On 08-02 21:01, Stefan Wahren wrote:
> 
> Hi,
> 
> [add Arend and Raspberry Pi devs]
> 
> Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> > Add SDIO2 node. On RPi5 it is connected to WiFi chip.
> > Add related pin, gpio and regulator definitions and
> > add WiFi node. With this and firmware already provided by
> > distributions, at least on openSUSE Tumbleweed, this is
> > sufficient to make WiFi operational on RPi5 \o/.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > ---
> >   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 55 +++++++++++++++++++
> >   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 13 +++++
> >   2 files changed, 68 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index 06e926af16b7..b6bfe0abb774 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -46,6 +46,20 @@ sd_vcc_reg: sd-vcc-reg {
> >   		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
> >   	};
> > 
> > +	wl_on_reg: wl-on-reg {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "wl-on-regulator";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		pinctrl-0 = <&wl_on_pins>;
> > +		pinctrl-names = "default";
> > +
> > +		gpio = <&gio 28 GPIO_ACTIVE_HIGH>;
> > +
> > +		startup-delay-us = <150000>;
> > +		enable-active-high;
> > +	};
> I don't think this GPIO is a regulator from hardware perspective. I
> guess it's the same reset pin we have on the older Raspberry Pis. Please
> look at bcm283x-rpi-wifi-bt.dtsi for the wifi power sequence.

FWICS, "mmc-pwrseq-simple" is more about proper reset sequence while
here we need power to be applied to the connected device.

And this is not a precedent. Just grep for "vmmc-supply = <&wlan"

> > +
> >   	pwr-button {
> >   		compatible = "gpio-keys";
> > 
> > @@ -80,6 +94,25 @@ &sdio1 {
> >   	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
> >   };
> > 
> > +/* SDIO2 drives the WLAN interface */
> > +&sdio2 {
> > +	pinctrl-0 = <&sdio2_30_pins>;
> > +	pinctrl-names = "default";
> > +	bus-width = <4>;
> > +	vmmc-supply = <&wl_on_reg>;
> > +	sd-uhs-ddr50;
> > +	non-removable;
> > +	status = "okay";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	wifi: wifi@1 {
> > +		reg = <1>;
> > +		compatible = "brcm,bcm4329-fmac";
> > +		local-mac-address = [00 00 00 00 00 00];
> I think we can drop this?

Sure.

Regards,
Ivan


