Return-Path: <linux-gpio+bounces-38846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aGkQKICjOmqBCQgAu9opvQ
	(envelope-from <linux-gpio+bounces-38846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:17:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D66B83E7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:17:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=JUvMZgGl;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38846-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38846-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 087E3307254A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 15:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896963D88E7;
	Tue, 23 Jun 2026 15:17:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77B03D667F;
	Tue, 23 Jun 2026 15:17:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227827; cv=none; b=G98L/zfK2Ng7DnH5m45v8vLfExgAWeYVsEhcJ2Qsy7txFpm20quN36ptb6eevMovOG1V7KFc/Eza/+7ZtHCG6E3Tj7gpqqXiVMr59uzUEPOzF5ItM+RGzN2l8VFq6QbX3XsshSzN5I6dHbOrvdL2ulMlxztv9c2zUb1dvWW4eLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227827; c=relaxed/simple;
	bh=95oYhnwJjow7KcN3v08zC/1DlUFrdeFuCxK1iUP8SJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlaWZznR/TQeqHxREJ/+Poq8ui1axmiZpwlrK/MNaJ12hod7Y/fbjCmpNyAky4PIEMNebA07dVGL76A08bVx2fBk454TMu+9F61ArUUsgeRnJyZoTK8EUZS3WaTj5Q9AViMn61niq71cHAj8siDZs2LJHF5nZDAYznhojFi61C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JUvMZgGl; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D041A00;
	Tue, 23 Jun 2026 08:17:00 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C5383F62B;
	Tue, 23 Jun 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782227824; bh=95oYhnwJjow7KcN3v08zC/1DlUFrdeFuCxK1iUP8SJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JUvMZgGlP4HRty3ryEVXkuOhRN9ySLzZNcIXnxPZvcV05cwAHn/EBq9aWDFdc96Oe
	 p3njUnNRxo6cjMwkCYAQhYYjgL8IWLfycVFDuwvOjRZ8kdq+JxpgD6ovDmRH/3GjU1
	 k7Saym62kS/LxX/5nZy4jEiPkjOx+K2V1+J2ETRA=
Message-ID: <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
Date: Tue, 23 Jun 2026 16:16:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-38846-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:v@baodeep.com,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:heiko@sntech.de,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,sntech.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E12D66B83E7

On 11/06/2026 9:26 am, Marek Szyprowski wrote:
> Hi Viachesla,
> 
> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
>> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
>> the underlying chip's can_sleep, but under that lock it calls config and
>> direction ops that reach sleeping pinctrl paths. On a controller with
>> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
>> runs from atomic context:
>>
>>    BUG: sleeping function called from invalid context
>>      ... pinctrl_gpio_set_config <- gpiochip_generic_config
>>      <- gpio_shared_proxy_set_config (voting spinlock held)
>>      <- ... <- mmc_pwrseq_simple_probe
>>
>> This was reported on Khadas VIM3 and worked around for Amlogic by
>> commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
>> sleeping"), which marked the whole meson controller sleeping. That
>> workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
>> no longer detects devices, because its IRQ-disabled read slot calls the
>> non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.
>>
>> Patch 1 fixes the proxy locking generically (always a sleeping mutex).
>> Patch 2 then restores meson can_sleep=false, fixing 1-Wire.
>>
>> Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
>> gating on gpiod_cansleep() change behaviour. No current device needs
>> atomic (non-cansleep) value access on a shared GPIO -- every report
>> (Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
>> (eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
>> which is what the proxy exists to vote on. An alternative that keeps
>> atomic value access (split locking) is possible but adds a second lock
>> and new race windows. I went with the simpler, verified approach and
>> would appreciate guidance on whether the atomic value path must be
>> preserved.
>>
>> The two are a unit: patch 2 must not be applied without patch 1,
>> otherwise the original VIM3 splat returns on boards that share a meson
>> GPIO -- please keep the order. I have not Cc'd stable; I will request
>> stable backports separately once both patches have landed.
>>
>> Viacheslav Bocharov (2):
>>    gpio: shared-proxy: always serialize with a sleeping mutex
>>    pinctrl: meson: restore non-sleeping GPIO access
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> This probably also affects the similar changes in Rockchip GPIO driver done
> by the following commits:
> 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
> 7ca497be0016 ("gpio: rockchip: Stop calling pinctrl for set_direction")
> 
> I've checked this patchset with these two reverted and no warning was reported.

If it hadn't already been fixed, then indeed I guess this might make 
20cf2aed89ac redundant. However, 7ca497be0016 is still an objective 
improvement either way, since that driver never needed to call pinctrl 
at all (it was seemingly just an artefact of how the GPIO code was 
originally implemented within the pinctrl driver itself).

Thanks,
Robin.

