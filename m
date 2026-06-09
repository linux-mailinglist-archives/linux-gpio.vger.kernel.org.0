Return-Path: <linux-gpio+bounces-38140-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9aXcG3t1J2psxQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38140-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 04:07:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D465BCD0
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 04:07:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ultrarisc.com header.s=dkim header.b="GYVSD7/B";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38140-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38140-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ultrarisc.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A893304DA23
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 02:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5453603E8;
	Tue,  9 Jun 2026 02:07:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4D01C862D;
	Tue,  9 Jun 2026 02:07:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970857; cv=none; b=MKWb5XS8ZfLW/4nnWfyK/jXFBCj0Mu6bCajGS+0PL/ibv+ydd/N5SYmaQEf5pz9zS9D4ODpgnn1yojEM6JH3vcyKHCItEgr5Jq6MEFHk4ST916xC7CCP6YVUVgjvkfOgQXrvu2cPsmFVGmgmjVwxe69iJiycBgvdC4BOy4Zh4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970857; c=relaxed/simple;
	bh=pXLjhYA/HKccNSiWZJ1vD2CM10FqSwMsW43GeFxnlMc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=IapEb70+NXnvYmFiDgiWzE/1gz0/KigeZZRH5F4GC58gIZBrYA5vS9sCZK8VdMV99nJ3jNRqKy+y370ZuknYukhjRcLEBNQO+c9hd0+fap9gfxS0T1JtlJUXaHV+RSJB5PCqLbotFn4S99KZwcFGR1JGwhJX+9Pi+8iM9h+zB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=GYVSD7/B; arc=none smtp.client-ip=218.76.62.146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=XbcfAkbt1ZemCkeMzHuWx9v5CdZZxTUV3
	6RmpJC+uBY=; b=GYVSD7/BHc7fjkCMe2fKJ8ImNQ9fsYC6shhhnfhjHjwlQU8lX
	PER20SC7Nfr7XElTxcEbesiFuPgPINAo93m1j1IMZOJJQPYW4eiKvGQ5k6mOz/5r
	nhFXtR7jMUSqfO9iZQkD1deE5xO5efsFyOkkF9ZUgftoa0JhxdT04udVfs=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEJ7dSdqC6AJAA--.8834S2;
	Tue, 09 Jun 2026 10:07:55 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000
 pinctrl controller
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: wangjia@ultrarisc.com, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260608-cheer-diabetes-02de68030e0a@spud>
References: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com>
 <20260608-ultrarisc-pinctrl-v3-1-30a09ed74275@ultrarisc.com>
 <20260608-cheer-diabetes-02de68030e0a@spud>
Date: Tue, 09 Jun 2026 10:07:18 +0800
Message-Id: <178097083811.1947369.16656545397888680932.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780970838; l=1116;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=pXLjhYA/HKccNSiWZJ1vD2CM10FqSwMsW43GeFxnlMc=;
 b=iB/8vN/XfQBrk39/Bm7UzI9hYu5F9fJd5P6MFOs5a1pZuf3VzleVmV5eiFUOlg//xH1VoJCgY
 KGStpw0coOvAdxkHP9alFdMqEdREYKCSaL6PtvjefTVxTCTtRbj1685
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDXEEJ7dSdqC6AJAA--.8834S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF4kKr4rZF48AF4ruFWfKrg_yoWDurbEkF
	W8Zr97Xw47GFy8JayDtr17J34YkFsF9Fya9FnrXr4DGry5GryUZa4kK345Aw1fJr48Jrsr
	Jr1SvFW0yr1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgA5s-
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:wangjia@ultrarisc.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38140-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ultrarisc.com:dkim,ultrarisc.com:email,ultrarisc.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D98D465BCD0

On 2026-06-08 18:17 +0100, Conor Dooley wrote:
> On Mon, Jun 08, 2026 at 03:50:48PM +0800, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 131 +++++++++++++++++++++
> >  MAINTAINERS                                        |   6 +
> >  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  63 ++++++++++
> 
> The driver never uses this file, so just stick it as a header in
> arch/riscv/boot/dts/ultrarisc instead of making it a binding.
> 
> Otherwise, I think this is okay. With the file moved,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 

Agreed. I'll move the header to arch/riscv/boot/dts/ultrarisc/, submit
it as part of the DTS series, and remove all references to it from the
dt-bindings documentation. I'll carry your Reviewed-by in the next
version. Thanks.

> pw-bot: changes-requested
> 
> Cheers,
> Conor.

Best regards,
Jia Wang



