Return-Path: <linux-gpio+bounces-38313-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bkCeHzhxKmqepQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38313-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:26:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03066FD68
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:26:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=WP5fVf7b;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38313-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38313-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A143300CEAC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 08:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC058379C53;
	Thu, 11 Jun 2026 08:26:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06558379974
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:26:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166388; cv=none; b=O/iX3MK7KFoKoPi9cMm+rr5e8/5NhrTcn87pSWW2jZia0AU2QMUb8/MH3oDtvXMBYLJXZ8B5u42FiSqgNiVVqinlRQERuYuspEMQRciC0KCcvWZcWj6ZzxkHDT4Wn61fxuRhnqCCjOOiIavGhoiUrGSTiv+Osj9FTvd2K3aN6yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166388; c=relaxed/simple;
	bh=yrHk8vQXuFVs66bjErYiRp21ChFTNAqXmEMeBmKpI4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=lqgiEbOeBCG6bTpS9k2uASj0MEMoap7A2WH85ZNJ/25RTWexzr/GzWWLIK+YTQSI3LWZpBcORv6zOuY5ng4/f7e9FZriXAux/2bqXCyjhzMXMOi3l2XbVDR9kQJVSFmrigy94zzroDpuF1GoE+G1PV89IST7Kqb9UA6eSoOhJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WP5fVf7b; arc=none smtp.client-ip=210.118.77.12
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260611082616euoutp0259c3b49b7cf8a5fd610eb2b7b77de723~3_WHQ3-G02244822448euoutp02Y
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:26:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260611082616euoutp0259c3b49b7cf8a5fd610eb2b7b77de723~3_WHQ3-G02244822448euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781166376;
	bh=DhwGhRTjppBgNw8HHFKEmC3YfseR6UOeLF4WLAZNcaw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WP5fVf7bqkbo4VdgHWn8qqtBKF+RHRqV6LI00ZwUCFzhaBP9Eq70e7Py9u09YikTW
	 Fm6zSKjRTYXbF6SnqgLbnVCAvgIU09OXFAIR8ifTes5554DpJgawudUQOPqaZxhgZJ
	 BjdWLYKrK2SjvkVRm9a5LiwWmJee0pVSsXSXo/Mo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260611082615eucas1p2e0d075707c644743cc2b745ed838d646~3_WGwPZ402819828198eucas1p2c;
	Thu, 11 Jun 2026 08:26:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260611082614eusmtip15addb285747362b715188d44fa381fda~3_WGD3M962800828008eusmtip1H;
	Thu, 11 Jun 2026 08:26:14 +0000 (GMT)
Message-ID: <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Date: Thu, 11 Jun 2026 10:26:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy;
 restore meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
	Blumenstingl <martin.blumenstingl@googlemail.com>, Robin Murphy
	<robin.murphy@arm.com>, Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260611082615eucas1p2e0d075707c644743cc2b745ed838d646
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260610153425eucas1p29d20a835114a28b15cb12ea00534e074
X-EPHeader: CA
X-CMS-RootMailID: 20260610153425eucas1p29d20a835114a28b15cb12ea00534e074
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
	<20260610153329.937833-1-v@baodeep.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-38313-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:v@baodeep.com,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:heiko@sntech.de,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,sntech.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF03066FD68

Hi Viachesla,

On 10.06.2026 17:32, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
>
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
>
> This was reported on Khadas VIM3 and worked around for Amlogic by
> commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
> sleeping"), which marked the whole meson controller sleeping. That
> workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
> no longer detects devices, because its IRQ-disabled read slot calls the
> non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.
>
> Patch 1 fixes the proxy locking generically (always a sleeping mutex).
> Patch 2 then restores meson can_sleep=false, fixing 1-Wire.
>
> Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
> gating on gpiod_cansleep() change behaviour. No current device needs
> atomic (non-cansleep) value access on a shared GPIO -- every report
> (Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
> (eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
> which is what the proxy exists to vote on. An alternative that keeps
> atomic value access (split locking) is possible but adds a second lock
> and new race windows. I went with the simpler, verified approach and
> would appreciate guidance on whether the atomic value path must be
> preserved.
>
> The two are a unit: patch 2 must not be applied without patch 1,
> otherwise the original VIM3 splat returns on boards that share a meson
> GPIO -- please keep the order. I have not Cc'd stable; I will request
> stable backports separately once both patches have landed.
>
> Viacheslav Bocharov (2):
>   gpio: shared-proxy: always serialize with a sleeping mutex
>   pinctrl: meson: restore non-sleeping GPIO access

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

This probably also affects the similar changes in Rockchip GPIO driver done
by the following commits:
20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
7ca497be0016 ("gpio: rockchip: Stop calling pinctrl for set_direction")

I've checked this patchset with these two reverted and no warning was reported.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


