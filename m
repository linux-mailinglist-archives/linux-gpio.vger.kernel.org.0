Return-Path: <linux-gpio+bounces-37006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO1wOHqCCmqv2AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:07:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B5565516
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29379300B56B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 03:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BEE2F7F1E;
	Mon, 18 May 2026 03:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="cKxFTmbZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78B35E937;
	Mon, 18 May 2026 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073654; cv=none; b=mZ1kV8ALu4eqak5xrBXfdA7Ec8dCiVtbhPITrpyGBXpqTal54cvdfu5pmjQVcWhqZKyXoNHdwQMbLMaLo0xRe7UV82+kECXeZ04fdWlvkry71/pVdKVIGnttInWtmX7Ej2peSDBMX5btlVMQ4XPs2BtmipBe1eUwgvY6S+1Ckhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073654; c=relaxed/simple;
	bh=opbHcjGJhGN0V2AsfKdod5Ei6jme1uyutNohcVTuoK8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JYrh3i2trZRR5BdSjw2Z+vs1HX3WV7hLXoU0fRTb3ie8oi8JSaHVsxHQPI6aNaM9eEBed2ZAvTDN1xB5/rNoo0BKtNnBpfOS7e8Bo/Dbx3MYOHA2QlVLMnXLQjpBTxRhNvB0YLWDt5U7iPf2rMv537wIfgzr3+CwJVGnqHa/iMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=cKxFTmbZ; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=XJKd3+IiOKB10QoMgGQXKpCTm/heRFRR4
	1Tj2dK9CTI=; b=cKxFTmbZIVOMI5YiR3XYzSgIoSFAeXhjsUMYC+0MnpoKekS4a
	zuICeD/5YuWkITQAlg+2zv8OEP9xPCdn/IOubBnQwqzpXQNUak0P/82JIbjqqSI9
	SF8VRx/mJV71ArzPOTeOlz4nu/3Y4wYRboB4VscCQeSkIIkIymvdI75ZPs=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUJ7ggpq97MEAA--.6085S2;
	Mon, 18 May 2026 11:07:39 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add UltraRISC DP1000 bindings
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Rob Herring <robh@kernel.org>, 
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
In-Reply-To: <20260515-cyclic-frequency-50d690821af1@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-3-bf559589ea8a@ultrarisc.com>
 <20260515-cyclic-frequency-50d690821af1@wendy>
Date: Mon, 18 May 2026 11:06:58 +0800
Message-Id: <177907361849.2045074.12347174714063726227.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779073618; l=2538;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=opbHcjGJhGN0V2AsfKdod5Ei6jme1uyutNohcVTuoK8=;
 b=ZwWPpWn2mi3LpKg0v1Bzfdt07pmYtp4BrxR/JtKv7lBsuzhxrfCg+njdaEqN60m/eSVi2fEC6
 f7NZxRIHuwFCQgMIGjSWK9Sh6x2Y9bh2B6BKMJDoDGj/MTuL1rmBY+m
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUJ7ggpq97MEAA--.6085S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1xWr45ury3ZF17Gr1rZwb_yoW8KF43pa
	18GFn5AFyxJr13Can3t3W3A3Z5Xr48uFW5trsF934jyas8WFyjqrZ7K345u3WkAr4UGF42
	yF17uw1akw40vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWoFRsMACwAWsg
X-Rspamd-Queue-Id: A48B5565516
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37006-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email,ionos.com:email,ultrarisc.com:email,ultrarisc.com:dkim]
X-Rspamd-Action: no action

On 2026-05-15 11:08 +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 09:17:59AM +0800, Jia Wang wrote:
> > Add DT binding documentation for the UltraRISC DP1000 SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  6 +++++
> >  2 files changed, 33 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> > new file mode 100644
> > index 000000000000..d4421c2ef945
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> > @@ -0,0 +1,27 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC SoC-based boards
> > +
> > +maintainers:
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +description:
> > +  UltraRISC DP1000 SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rongda,m0
> > +              - milkv,titan
> > +          - const: ultrarisc,dp1000
> > +
> > +additionalProperties: true
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b2040011a386..5bf971ff48b2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23082,6 +23082,12 @@ F:	include/dt-bindings/power/thead,th1520-power.h
> >  F:	include/dt-bindings/reset/thead,th1520-reset.h
> >  F:	include/linux/firmware/thead/thead,th1520-aon.h
> >  
> > +RISC-V ULTRARISC SoC SUPPORT
> > +M:	Jia Wang <wangjia@ultrarisc.com>
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> 
> You work for ultrasoc, probably this should be "Supported".
>

Will change S: to Supported in v2. Thanks.
 
> > +F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> 
> There's no git tree here where patches for the platform will be applied
> before sending them on to the SoC maintainers. Are you expecting me to
> apply patches for this platform?
> 

Will add a T: entry in v2. Thanks for pointing this out.

> > +
> >  RNBD BLOCK DRIVERS
> >  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> >  M:	Jack Wang <jinpu.wang@ionos.com>
> > 
> > -- 
> > 2.34.1
> > 

Best Regards,
Jia Wang



