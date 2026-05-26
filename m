Return-Path: <linux-gpio+bounces-37489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNgdOOxHFWqLUAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:12:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09F5D18B2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CD873008CBE
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 07:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CE83BAD9F;
	Tue, 26 May 2026 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="ExW3m2pT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CE13A75AC;
	Tue, 26 May 2026 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779549; cv=none; b=KTkGaGtFB73Q2dPe9HUyigRM7EBtPa+AQT8VfZeVj1Flkvi/V4IZG5JLlIodyTUwPMp/vsO17gmxzy+6K7ia/QnCEcOpoR63jFql9lRJWEwBFyOCC5k9FKMffENIGciTz7QMXnAG+Xa4Cy0AiygptmMgpjyAToVrxbHohiRGZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779549; c=relaxed/simple;
	bh=Kxhh7KR6iwJWM3QD/Mg3E6gH0ENEw3j5HM3LIkiOX8M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=U4muMWHPYZDaucfP7IFMXu9HZ5hYH8HriB/wtO5lP944uj5/jZceLouctwhfLhdSrODCReQRWVK94i+BH6DXcd2lSg/pa1lm6abLWNAlcIPP4DijdIoa6++4DawJpJCQC6vseZYFFrfbQ47PUs0Rc1Tqwvn6tisWbojcpsLs8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=ExW3m2pT; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=xdLV9XCgYqsM5OHnHy0sw5i8Vew1uihlr
	uMczZDwmYg=; b=ExW3m2pTqQLrnnqiAOLQ7nd6qeE6M0/6cZS8n2SwH18A73SCx
	xV0UUjkrV4+HKQ/R50qrxcs8t/Z3kerAs9VWGT4S0JJ1KMNt76pZgynWVG2Ou8Lr
	FvLVNXW/3owW5zRIOfARplQUdiYb5crOWkGHaRusrQnoovFBVegW3hgIGg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkPrRxVq0gMGAA--.7913S2;
	Tue, 26 May 2026 15:12:43 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: add Rongda
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <51dfcffa-1f8f-4a51-afc4-2999748421a7@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-1-bf559589ea8a@ultrarisc.com>
 <51dfcffa-1f8f-4a51-afc4-2999748421a7@kernel.org>
Date: Tue, 26 May 2026 15:12:03 +0800
Message-Id: <177977952368.1243441.14554680726787022592.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779779524; l=686;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Kxhh7KR6iwJWM3QD/Mg3E6gH0ENEw3j5HM3LIkiOX8M=;
 b=ti5d/XWaly+TePGbcsCTGPdS7xDmz9VMatjcxDzr3AFRI03LMtglkK2UiKuL0YX97CaHPaMxu
 y//z916nWBTAQHrrludAf8B9sIy+WZ6mx5fAakXRmQJ9nwSKCeCZmTw
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkPrRxVq0gMGAA--.7913S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF47XryUCr4xWw4xWrWrGrg_yoWxArg_ur
	Z0y3sIva4DXFs3tan3AFs3G345tFsYvryY9348Xwn7C347Ary8uw4kCr4akwn3XF4UW3W2
	kr4Svayq93W3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAOEWoOgUUACgASsm
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
	TAGGED_FROM(0.00)[bounces-37489-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DE09F5D18B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 22:51 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:17, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.
> > 
> > Link: http://www.shenrongda.com/
> 
> So your prefix is shenrongda.
>

Thanks for the clarification.

I'll update the vendor prefix to "shenrongda" and adjust the compatible
accordingly in the next version.

As discussed with Conor, this patchset will retain only the pinctrl binding
and driver. The DTS and the related bindings will be split out and submitted
separately. 

> Best regards,
> Krzysztof
> 

Best regards,
Jia Wang



