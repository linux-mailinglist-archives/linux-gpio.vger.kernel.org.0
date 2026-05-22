Return-Path: <linux-gpio+bounces-37306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPjCC3O0D2oMPAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 03:42:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 215EB5ADB9B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 03:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBF7E3002F5A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 01:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6ED2BE05A;
	Fri, 22 May 2026 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="p1R3k6UN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E633F1A6811;
	Fri, 22 May 2026 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779414125; cv=none; b=EIa01RffciStEL9uneg4baZqGYTH7FFQAO0vW6EzZED0CghmJQcL1gH2czsYhRtiu8svK1TXR/boLSLKL7MAu/IHeJ0bofjWejshWHpJ1lul+wiwlcDcZlIpIHfYvKcyvcftC8YCq2b94ogoaY+tVgpmWpUA1JzUgc7Nve3HlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779414125; c=relaxed/simple;
	bh=2fOLw3/RT45kkS5VtnWa1lOAQl+gFKe0cz2RSJkVzkM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=nS4rZ+6QMExQAHaFNUnVje8qUCPfpuaEvwAyOaI8PnfU8MjJFmr+IQ6S+Njw7SsRmQ05JIBaiwyMi2KhxNOgWHzfxht8oPayEjsDi42SHwm+H/VH7GmzWHFudRxE1lij3Pnz1PL6p5Dy0IKR16RdvlqFoAHrTs86g2koVwQtEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=p1R3k6UN; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=QGmcYiYzYw/IB3qtN9ab6o2F/9In5z7ml
	BZmn+PXyBE=; b=p1R3k6UNNCG2JRd/hpfU2BA+qDE9cm5B0juD619IzIc/sQ5Ab
	dohVg2HMGmO83tBrnw2D11FOvISusxt+Il7KLLNv+xFJhogBb+Tpk0u5lud2Jui/
	ZFRggWcdt+2wISgD3t04sWPWieId8UE7MBQyyIMPYbfuvgBITnd+bUzMc4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKAtA9qVxoFAA--.7362S2;
	Fri, 22 May 2026 09:42:24 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260521-trusting-busybody-15315a5955b7@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-brink-dealer-d0610c0dbc7b@wendy>
 <177935715446.943957.13292482270209644157.b4-reply@b4>
 <20260521-trusting-busybody-15315a5955b7@spud>
Date: Fri, 22 May 2026 09:41:43 +0800
Message-Id: <177941410382.4069225.2339477191046049135.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779414104; l=1079;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=2fOLw3/RT45kkS5VtnWa1lOAQl+gFKe0cz2RSJkVzkM=;
 b=CVBitQVmkITShABB+y95MDIv0iaHjf7VkZZYUeoOsknIY9+V2+sm2/0rnli6pmAHyYVNOO19u
 JckEqHwV5s9AulerQsvpcku1J2Z6SgHMYdUWrCOULOT2f/0f6gfwkbq
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUKAtA9qVxoFAA--.7362S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4rArWfJw13ArW3JFyUGFg_yoWDCFX_uF
	W2v347Cw4UCwn7ZwsYkr43tFZYya1xJryrKa4DX345Ary8XF4rXrykGry3K3W8uayrGF9I
	kF9avrWrZr1I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAOEWoOgUUACgAIs8
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37306-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ultrarisc.com:dkim]
X-Rspamd-Queue-Id: 215EB5ADB9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 11:23 +0100, Conor Dooley wrote:
> On Thu, May 21, 2026 at 05:52:34PM +0800, Jia Wang wrote:
> > > Additionally, these pinctrl patches should be sent standalone to the
> > > pinctrl maintainers, they're likely to go through lots of revisions and
> > > a different maintainer applies them.
> > > 
> > 
> > Just to confirm — for v2, should I completely remove the pinctrl
> > binding/driver from this series and send them as a standalone pinctrl
> > series, while keeping only the pinctrl references in the DTS?
> 
> IMO yes. And cite a link to the pinctrl patches in your cover letter.
> 
> Probably you're better off submitting v2 of pinctrl as a higher priority
> anyway, since a) the biggest changes are needed there and b) the dts
> changes depend on a clock driver/binding being created.

Thanks, that's clear.

I’ll prioritize submitting the pinctrl driver/binding and the clock
driver/binding as separate series first. The DTS updates will follow
once those are in place.

Thanks again for the guidance.

Best Regards,
Jia Wang



