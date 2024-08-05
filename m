Return-Path: <linux-gpio+bounces-8581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EB947842
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 11:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983A61F21F81
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DF2150990;
	Mon,  5 Aug 2024 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4+CwEpG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uDaECnp2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4+CwEpG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uDaECnp2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E183398B;
	Mon,  5 Aug 2024 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849810; cv=none; b=NyayC3QlmQua32d5MMW/QQ32mktuLQwev06EAYBFzzGnBsCT4WJKS3Yjfz8APQUyHsp81kPYS4ixNIAGjbktNLLQuzzO4ffMBGCMWWOJ4DpXWEr69pglhhXPhcZsdSAFWQ4QkaYPRcY6WR1D+biTATiNl2CaJioikdSNbThV+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849810; c=relaxed/simple;
	bh=c2wieSEzw++vG6H1MHrkOL7q0EXKK/2eHibuJBYSG3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SB7+5e7a+zyKEe6Trqg54oyvtTiPjNVqgHScHSKq368m43AKsrUnsryhS2/5Jv9kMFvb9utjrx3h8/jMbnkhK2bfvjY7eidvHbkNXcndoIXRHOx5OnjT3ft6EE1ce1cy2m9XWhi6kFTk53mPYXnzWVldewS6P8AIvg1NKByrvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s4+CwEpG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uDaECnp2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s4+CwEpG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uDaECnp2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF8AA1F798;
	Mon,  5 Aug 2024 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722849806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaT75JYYPlqgjMk3go7rQSA2nvxuJVn+blOG1IrRK+k=;
	b=s4+CwEpGcBdUOk9u0M5AVO9mlso1+TmNIfcyfmN49PJwyu0sO5WXvv3o8IO+3OWBOodC1W
	HtJuzsmClKzsGzNQYhm3oRl4H2EUAU3kdEHKiL4v49Bz6/hOY/WvUXmmGd3XjUCJuLkzQe
	iUOIimZh682/jvI2kV7sWqf/GK9N4JQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722849806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaT75JYYPlqgjMk3go7rQSA2nvxuJVn+blOG1IrRK+k=;
	b=uDaECnp2Mj2FDvB+gs8aDc6Dv7jSNG5/6uwiC0eTpvUTQC/LUjsXzM+RxUhBKQvXnzc1op
	6S4w6C6usYglM1CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s4+CwEpG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uDaECnp2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722849806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaT75JYYPlqgjMk3go7rQSA2nvxuJVn+blOG1IrRK+k=;
	b=s4+CwEpGcBdUOk9u0M5AVO9mlso1+TmNIfcyfmN49PJwyu0sO5WXvv3o8IO+3OWBOodC1W
	HtJuzsmClKzsGzNQYhm3oRl4H2EUAU3kdEHKiL4v49Bz6/hOY/WvUXmmGd3XjUCJuLkzQe
	iUOIimZh682/jvI2kV7sWqf/GK9N4JQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722849806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaT75JYYPlqgjMk3go7rQSA2nvxuJVn+blOG1IrRK+k=;
	b=uDaECnp2Mj2FDvB+gs8aDc6Dv7jSNG5/6uwiC0eTpvUTQC/LUjsXzM+RxUhBKQvXnzc1op
	6S4w6C6usYglM1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8925A13ACF;
	Mon,  5 Aug 2024 09:23:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D6cpHw6asGYLbQAAD6G6ig
	(envelope-from <iivanov@suse.de>); Mon, 05 Aug 2024 09:23:26 +0000
Date: Mon, 5 Aug 2024 12:27:42 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	wahrenst@gmx.net, andrea.porta@suse.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
Message-ID: <20240805092742.yutqiom4tlfbluiw@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-2-iivanov@suse.de>
 <dcc13c9a-ea74-4fa4-9c74-57e576e01ae6@kernel.org>
 <20240801083820.5my7yc3zxq64gmt5@localhost.localdomain>
 <3dda0b7e-36ed-497c-ba6c-9b25ca2f0738@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dda0b7e-36ed-497c-ba6c-9b25ca2f0738@kernel.org>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AF8AA1F798
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,broadcom.com,gmx.net,suse.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Hi,


On 08-01 16:19, Krzysztof Kozlowski wrote:
> 
> On 01/08/2024 10:38, Ivan T. Ivanov wrote:
> > Hi,
> > 
> > On 08-01 10:17, Krzysztof Kozlowski wrote:
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> >>
> >> bcm2712 is Rpi, so not really STB. The name is confusing. Please use
> >> compatible as filename, so:
> >> brcm,bcm2712-pinctrl.yaml
> > 
> > According Florian it is:
> > 
> > https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> 
> OK, title can be like this, no problem, although then please expand what
> "STB" means.

Ok.

> 
> Bindings still are supposed to use compatible as filename.
> 

IIUC, you suggest to rename compatible string from brcm,bcm2712-pinctrl
to brcm,brcmstb-pinctrl?!

Regards,
Ivan


