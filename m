Return-Path: <linux-gpio+bounces-24525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80406B2BB9E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 10:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F021885AD5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 08:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195C2311588;
	Tue, 19 Aug 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PRvo6MBh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDsEzmyW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PRvo6MBh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDsEzmyW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7223101CD
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591558; cv=none; b=A0Rj1o2pGwdkpFC73wWZVINvad3UeaKRDf48pk5wLkRzajG1BfKRpjuZeaKBO/lQnmP0ycEuE3/UvUPFSDbxG1ka9kUmFshuVRa1vP0nnRVmDqeKLv2DabThRfzCtFDVRMj2ICVKryRMIsLOVuMjIlxGWjN3LuaXAX9zRTTNL5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591558; c=relaxed/simple;
	bh=1Z40yJofA3/E+76G3mBV6f9lB33I5PYoxMxw3VB1F8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRI8L1tfL0WXsqyW+8PjTEYmObIuMJHUscI96fPTNMyR0YxmGmM9Ns1I/IHML7stUAjk5vQgfNCnQLpA87EIIglFTrZhsxFlWTRxZB3a7hG80MB8nS/IObQiTaidycgx5z+x8bOp950Sf3yS7M/SRAGIGd9CwvgiP0QaiMHXw/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PRvo6MBh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDsEzmyW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PRvo6MBh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDsEzmyW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 681102125E;
	Tue, 19 Aug 2025 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755591555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPl+L2c17TgIniY4vYM1AwB/mzaniLIQARemsHNrxDg=;
	b=PRvo6MBhGhadrTQy7iYxlvNSKC/DqFvsWvJNRyMqSwPYMQhkAgHqp08Kh+iw0BmQioqxTL
	bwdiPqBPZgyeC+o3vf/h2hMVGVg+ULlOJdgC/WyabG8sneunKeKXki7L5FRNvR2zxMC+0E
	uX6KDCH2ntCU2kFUEDN9ekPQciuqgkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755591555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPl+L2c17TgIniY4vYM1AwB/mzaniLIQARemsHNrxDg=;
	b=gDsEzmyWD4hkDrugvp/dOHUvVEYEx4yL+d11RPxuFCWd4Q5V0kz5AQ8cynWqmFfIZnKssJ
	uoC5wNknSSLyFTAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755591555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPl+L2c17TgIniY4vYM1AwB/mzaniLIQARemsHNrxDg=;
	b=PRvo6MBhGhadrTQy7iYxlvNSKC/DqFvsWvJNRyMqSwPYMQhkAgHqp08Kh+iw0BmQioqxTL
	bwdiPqBPZgyeC+o3vf/h2hMVGVg+ULlOJdgC/WyabG8sneunKeKXki7L5FRNvR2zxMC+0E
	uX6KDCH2ntCU2kFUEDN9ekPQciuqgkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755591555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPl+L2c17TgIniY4vYM1AwB/mzaniLIQARemsHNrxDg=;
	b=gDsEzmyWD4hkDrugvp/dOHUvVEYEx4yL+d11RPxuFCWd4Q5V0kz5AQ8cynWqmFfIZnKssJ
	uoC5wNknSSLyFTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2DAA139B3;
	Tue, 19 Aug 2025 08:19:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uX9hJYIzpGiIMAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 19 Aug 2025 08:19:14 +0000
Message-ID: <9af1eb5b-7eb1-4686-869d-eda597145819@suse.de>
Date: Tue, 19 Aug 2025 11:19:14 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 Stanimir Varbanov <svarbanov@suse.de>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, florian.fainelli@broadcom.com, wahrenst@gmx.net,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, mbrugger@suse.com, Jonathan Bell
 <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de> <aKQyViTbXAsFEuT7@apocalypse>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <aKQyViTbXAsFEuT7@apocalypse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,broadcom.com,gmx.net,vger.kernel.org,lists.infradead.org,arm.com,suse.de,suse.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,raspberrypi.com:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80



On 8/19/25 11:14 AM, Andrea della Porta wrote:
> Hi Stanimir,
> 
> On 10:40 Tue 19 Aug     , Stanimir Varbanov wrote:
>> Hi Andrea,
>>
>> On 8/11/25 5:46 PM, Andrea della Porta wrote:
>>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>>
>>> This driver provide pin muxing and configuration functionality
>>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>>> instance of the one used in Broadcom STB  product line.
>>>
>>> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
>>>
>>> Cc: Jonathan Bell <jonathan@raspberrypi.com>
>>> Cc: Phil Elwell <phil@raspberrypi.com>
>>> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
>>> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>> ---
>>>  drivers/pinctrl/bcm/Kconfig           |   13 +
>>>  drivers/pinctrl/bcm/Makefile          |    1 +
>>>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1197 +++++++++++++++++++++++++
>>>  3 files changed, 1211 insertions(+)
>>>  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
>>>
>>
>> <snip>
>>
>>> +static int brcmstb_pinctrl_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct device_node *np = dev->of_node;
>>> +	const struct brcmstb_pdata *pdata;
>>> +	const struct of_device_id *match;
>>> +	struct brcmstb_pinctrl *pc;
>>> +	const char **names;
>>> +	int num_pins, i;
>>> +
>>> +	match = of_match_node(brcmstb_pinctrl_match, np);
>>
>> The 'match' variable is needless, you can drop it.
> 
> you mean something like this?
> 
> pdata = of_match_node(brcmstb_pinctrl_match, np)->data;
> 

No, I meant:

pdata = of_device_get_match_data(dev)

Also as a bonus you could move brcmstb_pinctrl_match[] array after .probe.

~Stan

