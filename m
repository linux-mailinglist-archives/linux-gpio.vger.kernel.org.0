Return-Path: <linux-gpio+bounces-37265-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHVoE0fXDmr2CQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37265-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:58:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11D5A2D13
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02C623048C11
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1588C37E2FF;
	Thu, 21 May 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="a0paDOav"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3074337D116;
	Thu, 21 May 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357191; cv=none; b=OjpAaYT3bBjD0A/5/DLt34ixKJ8mO+yCOyHj4JJt6Zc9ISE9N2tcG09BGqLp9V1ODXV2y/or0qZc+7vZzKjGhrRulmSVSkdxCmFYK9cfXbU9gylzTLwq3uvSlFSn4aRtjAaMnJkNXKgu3x5zMBPvtDVCr/QbiFVuNjaL2rDHWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357191; c=relaxed/simple;
	bh=oQuciAhPofGRVn6oybq8MD+S9f6md4Z7crcETX1NTeU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=U8aashk3X34Kypac6ReGsB88WvVzPIer75vqXd+UrYqppS/9bN/DFj/INsuneRaBB4GEonzKxPTB4fKa+P+4s3K/GuwdoEc6pspDM1S5iIbbybaRwkycbiuIQzVFn/RSz/CFQNijHOJncz4m+kk6hjCNdG6Vg75ub1/7s/0JZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=a0paDOav; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=yeSeqiLDR0f7egc07t/OdNUi/rJU7dHEP
	sFmSaMZ6gU=; b=a0paDOav8lG7Lwvzwtk6z4Z30Ca3tacQvMY1PicBH2DrENQvQ
	MyylQdyVnCbqX/0gPUoBY376UO0A/CUP+jEqsWKKGPwKkhRQnqwMyWyWk1IYT1fj
	1O/O5q0fQ5LR60lgQvb4VjuqE9t5I3cQR7Lf47ASjyC1X9L+ThBDG2Sgpk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIL1g5qXQgFAA--.7169S2;
	Thu, 21 May 2026 17:53:15 +0800 (CST)
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
In-Reply-To: <20260515-brink-dealer-d0610c0dbc7b@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-brink-dealer-d0610c0dbc7b@wendy>
Date: Thu, 21 May 2026 17:52:34 +0800
Message-Id: <177935715446.943957.13292482270209644157.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779357154; l=5927;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=oQuciAhPofGRVn6oybq8MD+S9f6md4Z7crcETX1NTeU=;
 b=SSpb+MDjxdd6C7Rj9vlOM1y+DLUOhQ8FDQ/MtJWlWgutMQIL9GFLLY3KudiFG40M3FTrcH6T6
 1Imgfz40EvkDfsxI31VhFiLQTPNVyZV9GSgy4TMO5TSQEYPC0Q7fnsx
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUIL1g5qXQgFAA--.7169S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFWrJw13JFy8Xr17tr1xGrg_yoW7CF1kpF
	43WF45AFyDJFWfKFWIq3W8C3W3X3WxArW3W3W7t3srJF45Z34UJFykKw45XF4Dur4DXryY
	yF1jkFyxG3WjvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoNL8UAJwADs0
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-37265-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0D11D5A2D13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-15 11:05 +0100, Conor Dooley wrote:
> Hey,
> 
> On Fri, May 15, 2026 at 09:17:56AM +0800, Jia Wang wrote:
> > This series adds initial Devicetree support for the UltraRISC DP1000 RISC-V
> > SoC and two DP1000-based boards (Milk-V Titan and Rongda M0).
> > 
> > The series introduces the required DT bindings, adds the DP1000 pinctrl
> > driver, and provides the initial SoC/board DTS files.
> > 
> > Notes:
> >   - Clocks are configured and enabled by firmware before Linux boots. Linux
> >     does not manage clock rates or gating at runtime on this platform.
> >     Therefore the initial DT only models the fixed clocks required by
> >     standard drivers, and no clock controller/driver is provided.
> 
> I really disagree with this approach. In my experience it never ends up
> working out and ends up being disruptive, because it is either an over
> simplification of the clock tree and condenses multiple different clocks
> into one where rates are similar or because firmware changes mean clock
> rate changes down the line. I would much rather you modelled the clocks
> accurately, even if that just means that a read-only clock controller is
> implemented. Alternatively, if firmware does all of your clock control,
> you can implement this using rpmi/mpoxy using clk-rpmi.c
> 

Understood. I'll implement a read-only clock controller in v2.

> >   - The DP1000 pinctrl binding supports two child node styles under the same
> >     controller compatible:
> >       * legacy DP1000-specific nodes using phandle-array properties
> >         "pinctrl-pins" and "pinconf-pins"
> >       * generic pinctrl nodes using "pins", "function" and generic pin
> >         configuration properties
> >     The legacy form is kept for compatibility with existing vendor DTs.
> 
> Why would we want "legacy" stuff in mainline when this is a brand new
> platform? "legacy" vendor devicetrees are not something that mainline
> cares about, sorry.
> 

I'll drop the legacy pinctrl node format and keep only the generic pinctrl
bindings in v2.

> Additionally, these pinctrl patches should be sent standalone to the
> pinctrl maintainers, they're likely to go through lots of revisions and
> a different maintainer applies them.
> 

Just to confirm — for v2, should I completely remove the pinctrl
binding/driver from this series and send them as a standalone pinctrl
series, while keeping only the pinctrl references in the DTS?

> >   - The bindings for "ultrarisc,dp1000-uart" and "ultrarisc,dp1000-pcie" are
> >     being reviewed in separate series, since the DP1000 SoC DTS introduced
> >     here uses those compatibles:
> >     * Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e274@ultrarisc.com/
> >     * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com/
> >   - ARCH_ULTRARISC support is being reviewed separately:
> >     * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/
> 
> IMO, this patch needs to be in this series so that it compiles.
> 

I’ll move the ARCH_ULTRARISC Kconfig patch into this series. Thanks for
pointing this out.

> Cheers,
> Conor.
> 

Best Regards,
Jia Wang

> > 
> > Testing:
> >   - dt_binding_check and yamllint (all new/modified binding YAMLs)
> >   - dtbs_check and dtbs (RISC-V, including dp1000-milkv-titan.dtb and
> >     dp1000-rongda-m0.dtb)
> >   - Kernel build for RISC-V and boot-tested on DP1000 (Milk-V Titan and
> >     Rongda M0)
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> > Jia Wang (9):
> >       dt-bindings: vendor-prefixes: add Rongda
> >       dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
> >       dt-bindings: riscv: Add UltraRISC DP1000 bindings
> >       dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
> >       riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
> >       pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
> >       riscv: dts: ultrarisc: add Rongda M0 board device tree
> >       riscv: dts: ultrarisc: add Milk-V Titan board device tree
> >       riscv: defconfig: enable ARCH_ULTRARISC
> > 
> >  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 ++++
> >  Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
> >  .../devicetree/bindings/riscv/ultrarisc.yaml       |  27 +
> >  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
> >  MAINTAINERS                                        |  15 +
> >  arch/riscv/boot/dts/Makefile                       |   1 +
> >  arch/riscv/boot/dts/ultrarisc/Makefile             |   3 +
> >  .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 107 +++
> >  .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 182 +++++
> >  .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++
> >  arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++
> >  arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 851 +++++++++++++++++++++
> >  arch/riscv/configs/defconfig                       |   1 +
> >  drivers/pinctrl/Kconfig                            |   1 +
> >  drivers/pinctrl/Makefile                           |   1 +
> >  drivers/pinctrl/ultrarisc/Kconfig                  |  23 +
> >  drivers/pinctrl/ultrarisc/Makefile                 |   4 +
> >  drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 112 +++
> >  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 746 ++++++++++++++++++
> >  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  71 ++
> >  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++
> >  21 files changed, 2577 insertions(+)
> > ---
> > base-commit: 50897c955902c93ae71c38698abb910525ebdc89
> > change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803
> > 
> > Best regards,
> > --  
> > Jia Wang <wangjia@ultrarisc.com>
> > 



