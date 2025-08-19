Return-Path: <linux-gpio+bounces-24520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C109B2BAF2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 09:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D8174E2C27
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 07:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D1C3101AB;
	Tue, 19 Aug 2025 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="16OiyQRu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qj4wKi0w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="16OiyQRu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qj4wKi0w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70791FFC6D
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589254; cv=none; b=esTGZR1rcS8zSvt2ts0bONNnQOJcqvFo8FwTAh2wjuyAgePVGimRn00zI6XjWlxWGjh5X9Zgdh4eXCw2cBLbUKLRcmooKsOC2Zd9XEV3DgIDU3jaGRDtog82Vrs//eRMQnXcMWKybiehmpSOPAtxunM98B6mLgcCCX5qcpO29Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589254; c=relaxed/simple;
	bh=yopjTQXBKWKUWhjvUrfDeafGaZ0qAwzQN2abpdSmfOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FiTPCmhhFIn3WK1oPlicIcUpgVKtzhKIjfXgp/0z1N+WPpUTFXQWH/iscifp7eawGUnTO+xn12nfRvBi1psnRiIzBS+TS7Wh/Iuh6T66VRkocD/xpGVZpB2aVhMAAlanZgAmgU+tSmT4wqskkc/EGhXyezQwJb72w/r4mI/5S0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=16OiyQRu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qj4wKi0w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=16OiyQRu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qj4wKi0w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED13C21251;
	Tue, 19 Aug 2025 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755589251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zC8+fLVFG+3OTa8Z2AsJkI4qy5ecQS3/x/aq/r42Ztk=;
	b=16OiyQRuMZk0XiAebs7FL6KciCZ8OxUYBjxEBHW7PEtYQ4LiYz3OqVfJBEznjvayLcGWFQ
	OVeXTmb/VyxBIdhNbTc+jMgIPeyzR1CLP7FekI9ozBqaCPosFYkAR2yCUfz4036QxgCchI
	fD6Nl/5DQOpYT0wWdnTxMLW/SgW0fXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755589251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zC8+fLVFG+3OTa8Z2AsJkI4qy5ecQS3/x/aq/r42Ztk=;
	b=qj4wKi0w0mXXWMH54ePbCqnNfpTCvPIGzeyVTPr8O5ZqP2tJQg3bop8CyLflFi9vFolfuG
	XPWlamTkIKn18VBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=16OiyQRu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qj4wKi0w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755589251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zC8+fLVFG+3OTa8Z2AsJkI4qy5ecQS3/x/aq/r42Ztk=;
	b=16OiyQRuMZk0XiAebs7FL6KciCZ8OxUYBjxEBHW7PEtYQ4LiYz3OqVfJBEznjvayLcGWFQ
	OVeXTmb/VyxBIdhNbTc+jMgIPeyzR1CLP7FekI9ozBqaCPosFYkAR2yCUfz4036QxgCchI
	fD6Nl/5DQOpYT0wWdnTxMLW/SgW0fXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755589251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zC8+fLVFG+3OTa8Z2AsJkI4qy5ecQS3/x/aq/r42Ztk=;
	b=qj4wKi0w0mXXWMH54ePbCqnNfpTCvPIGzeyVTPr8O5ZqP2tJQg3bop8CyLflFi9vFolfuG
	XPWlamTkIKn18VBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29BE513686;
	Tue, 19 Aug 2025 07:40:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fhD7B4IqpGgSJQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 19 Aug 2025 07:40:50 +0000
Message-ID: <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de>
Date: Tue, 19 Aug 2025 10:40:41 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[suse.com,linaro.org,kernel.org,broadcom.com,gmx.net,vger.kernel.org,lists.infradead.org,arm.com,suse.de,raspberrypi.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: ED13C21251
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Hi Andrea,

On 8/11/25 5:46 PM, Andrea della Porta wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
> 
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/pinctrl/bcm/Kconfig           |   13 +
>  drivers/pinctrl/bcm/Makefile          |    1 +
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1197 +++++++++++++++++++++++++
>  3 files changed, 1211 insertions(+)
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> 

<snip>

> +static int brcmstb_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	const struct brcmstb_pdata *pdata;
> +	const struct of_device_id *match;
> +	struct brcmstb_pinctrl *pc;
> +	const char **names;
> +	int num_pins, i;
> +
> +	match = of_match_node(brcmstb_pinctrl_match, np);

The 'match' variable is needless, you can drop it.

> +	pdata = match->data;
> +

<snip>

~Stan


