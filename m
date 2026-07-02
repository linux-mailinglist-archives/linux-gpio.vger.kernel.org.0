Return-Path: <linux-gpio+bounces-39343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mZNqL08FRmrdHwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 08:29:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16C6F3D09
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 08:29:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ultrarisc.com header.s=dkim header.b="pOEg/AEv";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39343-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39343-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ultrarisc.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4A203035F2B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 06:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E563876BB;
	Thu,  2 Jul 2026 06:27:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293BC386C1C;
	Thu,  2 Jul 2026 06:27:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973630; cv=none; b=Ep6pqbXAScvNTEO3GRvQpGL4jgSN4semiNFGaqOqrXEM3z6oYhpzcgu+zEvbCsBkxSR4LhqQVulHt2Hdbc2zEmxUv+d9ekn3E9wSO30nuVFhjeRhpeC3NGNcWNoKlY3hCNrcVJ0IqMvUk4ojzU3yVM1dVlEuRd+283/almVDTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973630; c=relaxed/simple;
	bh=kUR8YD6WrAPXvJRilFbNNv5nrpqnyztwTDZppV5QxYU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=MhXZKt51RWdJ21BWFbuXqoodWf7yRiuJnJ6sKH1SldtTVPhg95zwfPfehon8gonhlJ8/QEDhdXVPSTe1gmYzjyAUyBjjL5jmJ4VcSguTZAH1iEUIN1NcQdiXwisf8J2RjcJAgw8n1IYkQ9WPY9l3LD0ZTzURol/IhUdHmsBoVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=pOEg/AEv; arc=none smtp.client-ip=218.76.62.146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=XbRQZYbv+PNVoC9yVR/lElmT8CFhcyXks
	2dHEFNL0ms=; b=pOEg/AEvrkzYTSvo/dCOovJLcNQwBi7cyJr2AobNc/cIrRCvM
	vGYGr6+WVRIX4wjdi6rDyL2kmjUoFvn3Y4kC8kms7zSTefgVE0jjMhKY3eWEEpps
	Ka0e2wLJgu8LlobnqfeNAye5p5AiEf2+LT1ImaviNU5ebicMBlvKqAv9FM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYULOBEZqb5gOAA--.14657S2;
	Thu, 02 Jul 2026 14:27:26 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] gpio: dwapb: Defer clock gating until noirq
From: Jia Wang <wangjia@ultrarisc.com>
To: kernel test robot <lkp@intel.com>
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, oe-kbuild-all@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
In-Reply-To: <202606291736.mAgOeA65-lkp@intel.com>
References: <20260629-gpio-dwapb-wakeup-v1-1-3394f02317da@ultrarisc.com>
 <202606291736.mAgOeA65-lkp@intel.com>
Date: Thu, 02 Jul 2026 14:26:53 +0800
Message-Id: <178297361311.1082377.388930263384975483.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782973613; l=2927;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=kUR8YD6WrAPXvJRilFbNNv5nrpqnyztwTDZppV5QxYU=;
 b=/3p/c9N9Mur2dKmu9ZZzefavmBkgNRdLoE/lt76o42Sszn9ezTSyLbWmIqeIR4aRV95KY54Ne
 GDG6mh2XY49CC42qU7VS4dOpjB9XKyQaFxL5TXIrS2dh6K1676d6bGP
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYULOBEZqb5gOAA--.14657S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWfWFy5ZFy7WFW7Zr4xJFb_yoW5WF15pa
	18Ja4qqrW8try0gFW7XF48Zwnxtws3J340kFZ7Cw1fZ3y2vry5AF4I9ry3uFya9rWkKrWY
	qws0gFyrZw15Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAQEWpF4E0ACQAAsL
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:devnull+wangjia.ultrarisc.com@kernel.org,m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:brgl@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:devnull@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39343-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,wangjia.ultrarisc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,01.org:url,ultrarisc.com:dkim,ultrarisc.com:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A16C6F3D09

On 2026-06-29 18:04 +0800, kernel test robot wrote:
> Hi Jia,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on dc59e4fea9d83f03bad6bddf3fa2e52491777482]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Wang-via-B4-Relay/gpio-dwapb-Defer-clock-gating-until-noirq/20260629-135404
> base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
> patch link:    https://lore.kernel.org/r/20260629-gpio-dwapb-wakeup-v1-1-3394f02317da%40ultrarisc.com
> patch subject: [PATCH] gpio: dwapb: Defer clock gating until noirq
> config: sparc64-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291736.mAgOeA65-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291736.mAgOeA65-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606291736.mAgOeA65-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_set_wake':
> >> drivers/gpio/gpio-dwapb.c:377:7: error: 'struct irq_data' has no member named 'parent_data'
>      if (d->parent_data && !!ctx->wake_en != !!wake_en) {
>           ^~
> >> drivers/gpio/gpio-dwapb.c:378:9: error: implicit declaration of function 'irq_chip_set_wake_parent'; did you mean 'irq_set_parent'? [-Werror=implicit-function-declaration]
>       err = irq_chip_set_wake_parent(d, enable);
>             ^~~~~~~~~~~~~~~~~~~~~~~~
>             irq_set_parent
>    cc1: some warnings being treated as errors
> 
> 
> vim +377 drivers/gpio/gpio-dwapb.c
> 
>    362	
>    363	static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>    364	{
>    365		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>    366		struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
>    367		struct dwapb_context *ctx = gpio->ports[0].ctx;
>    368		irq_hw_number_t bit = irqd_to_hwirq(d);
>    369		u32 wake_en = ctx->wake_en;
>    370		int err;
>    371	
>    372		if (enable)
>    373			wake_en |= BIT(bit);
>    374		else
>    375			wake_en &= ~BIT(bit);
>    376	
>  > 377		if (d->parent_data && !!ctx->wake_en != !!wake_en) {
>  > 378			err = irq_chip_set_wake_parent(d, enable);
>    379			if (err)
>    380				return err;
>    381		}
>    382	
>    383		ctx->wake_en = wake_en;
>    384	
>    385		return 0;
>    386	}
>    387	
>

Thanks for the report. This is caused by using hierarchical IRQ helpers
without guarding them with CONFIG_IRQ_DOMAIN_HIERARCHY.

I'll fix this in the next version of the patch.
 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 



