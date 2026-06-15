Return-Path: <linux-gpio+bounces-38443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nEkuFH6TL2oICwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:54:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C54D683988
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:54:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ultrarisc.com header.s=dkim header.b="q/tQbe3g";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38443-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38443-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ultrarisc.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25880300B3F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC2C3A7597;
	Mon, 15 Jun 2026 05:54:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE0C21CA13;
	Mon, 15 Jun 2026 05:53:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502842; cv=none; b=S631SouF+i2Z0keFr+g4Gl13ByHcuI7BV2Sw2MW7J4i4q54FVOppEKHf32PnY3Qy/ebIkQ/9V6lafYHyjBbNXdsjhlQX4sIugAbIx9tIZr0En5IYUvzyL8DZVipjU3cfKupUc4RVqEf5gGaWh4Olms+5MNdJMbi5gdT3Zw9tor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502842; c=relaxed/simple;
	bh=s6MkBKkL7KkX/54kFyStpKLZehEKhWB7yqOFQwec0gg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YZpQ8Pq7l09MiKxYAEkMf/FqQJXzIxgFcwf9BmDw2uwNb6eVKUyfnhFdzUzFC01YFcVUtaxabP1mj0luyZa/UWBsZW1ezff/Ges654E3IzNAn/GnRKrWeftNliX9lXqAhvCL5LPWo2pWvo0eyACHXUqWUHoqa5RQ9D+ncOBkRis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=q/tQbe3g; arc=none smtp.client-ip=218.76.62.146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=RD6IFqqA64fWbNujyh27RWGWo9/Gt94mg
	Ko/bPQycco=; b=q/tQbe3g0807L0wXpolXzILprd20LPs14NmVgW9fa/r5Y+2te
	k6IbVqb0eWHJS4VsnLCKZnBifH1S2XpKQA3zh6icgh7McgG1lq4PEI/kI+ygkfMI
	MuRu+rgqgOcXPnyXXymTUcomm/tYJkQ766H73MbrPtDehGMKKyCaPNCOHM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOPky9qDIMKAA--.9492S2;
	Mon, 15 Jun 2026 13:54:23 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000
 pinctrl driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260613164847.GA3152104@ax162>
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
 <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
 <20260613164847.GA3152104@ax162>
Date: Mon, 15 Jun 2026 13:53:46 +0800
Message-Id: <178150282681.3055943.1995305447824579927.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781502827; l=1880;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=s6MkBKkL7KkX/54kFyStpKLZehEKhWB7yqOFQwec0gg=;
 b=Ubq91bhZ1+m5Bye0NwEhFyxXPmIpR2wNUJiYmc1abqBarJe8eaikuCWgUpYWzA9cf2wi9cyBS
 +/llFWfAGE5Cxg7C26iaNb+9vaJ8bUHlcZNukqHuRdd1/Bh6i/+lyR/
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkOPky9qDIMKAA--.9492S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryxWFy5ur4xXr1rury5XFb_yoW8Cr43pa
	n3C3W7CFy3JFW5AF17Jw1F9Fy3W3Z7JrWUC34rt34UZFZxZF1ktFn2gw4rWa4DCFyUAry2
	v3W5ZF9Fkw1qvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgBasc
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:wangjia@ultrarisc.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38443-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C54D683988

On 2026-06-13 12:48 -0400, Nathan Chancellor wrote:
> On Wed, Jun 10, 2026 at 01:29:56PM +0800, Jia Wang wrote:
> > diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
> > new file mode 100644
> > index 000000000000..8fb5b0ea5b93
> > --- /dev/null
> > +++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
> ...
> > +static bool ur_function_is_gpio(struct pinctrl_dev *pctldev,
> > +				unsigned int selector)
> > +{
> > +	const struct function_desc *function;
> > +
> > +	function = pinmux_generic_get_function(pctldev, selector);
> > +	if (!function)
> > +		return false;
> > +
> > +	for (u32 i = 0; i < function->func->ngroups; i++) {
> > +		const char *func_name;
> > +		int group_selector;
> > +
> > +		group_selector = pinctrl_get_group_selector(pctldev,
> > +							    function->func->groups[i]);
> > +		if (group_selector < 0)
> > +			return false;
> > +
> > +		func_name = ur_get_group_function(pctldev, group_selector, 0);
> > +		if (!func_name || strcmp(func_name, "gpio"))
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> 
> The usage of pinctrl_get_group_selector() in this function breaks the
> build when this driver is a module because pinctrl_get_group_selector()
> is not exported for modules:
> 
>   ERROR: modpost: "pinctrl_get_group_selector" [drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.ko] undefined!
> 
> Also reported by the robots:
> 
>   https://lore.kernel.org/202606130210.ytVPxHlm-lkp@intel.com/
>

Hi Nathan,

Thanks for spotting this and for the report.

Linus has since proposed a fix by exporting pinctrl_get_group_selector():

https://lore.kernel.org/linux-gpio/20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org/

Thanks again for catching this.
 
> -- 
> Cheers,
> Nathan
> 

Best regards,
Wang Jia



