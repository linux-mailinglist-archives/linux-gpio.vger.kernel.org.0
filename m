Return-Path: <linux-gpio+bounces-34483-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLxOM3/My2luLwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34483-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:30:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648636A488
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FF14308C5DC
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDED23126BF;
	Tue, 31 Mar 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM21eHI6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F53E3D93
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963519; cv=none; b=MLX9EDws7i0VXkIHWFniiKvSv2jXi0oGUPsVijoafCiIHNPsmE8+06US9EW1AAXQ1WqGYlA0W0py+6EDKJvtHQ7CYs4ADyxW3kDPQ+0agnncGb/d7NcI0HMPR1YKYwzNvjkBrzbmQ8N+u7lxry6rRBuRe52JMxlmU/VLDey4lMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963519; c=relaxed/simple;
	bh=JJjEn2iUPSf4WRGWtUsXPbnxCbplNNFpjO81ol5F2rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCP+iBNUHWZcAMPe6ITBuLWTOjBlYS43wW5PRmGAd/rBcehHNFgjF8fKUveQFC4nHTlWIDs60jtkjPyE/gci23PVXr51n7FwpgYKK8stXZA+PcUAw5LOeB0BhQIM/gXKHBTrMIetAEnbiAnQ78Z0XM0fBSjYTjUAdM/SVeFLidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM21eHI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572AEC2BCB7
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774963519;
	bh=JJjEn2iUPSf4WRGWtUsXPbnxCbplNNFpjO81ol5F2rM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZM21eHI6xZODtooYh0mRdZxdkIYM29ObMGGYF+6Dtt+FMubi2pKylWYY+DpBcUFyW
	 s8lp+pZN7vOeFa0YzvWn6lxy+07OSbeaZAxgGkX5qXtvO2g/SfINVJEGzvX45l2olU
	 Vm7OvdkPnTyUC5llUqS+6DClYyT1NpvvR873nDpHErD4EEf3QFt+YAX97jC4UXS9Ck
	 sEJIIwMoYSr4xo9E5BDpiI8K/YmxJMn9l+W2v9AJcE7tzjm+BkEE07GGEsRcZhboU0
	 w65oGdlkxxbjDzG/CEB7i7ApTEYDAaAxHYGdG7qV6/DCBP6YoE0jXsqQc1K6V9RLKP
	 7VjB4z4aGDYow==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so57930371fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 06:25:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YwS1c8O+QFn1hQaqjs4VxgLPqAC1nxjIgjedSSC0Nq8SnJl4rKe
	pSERuq1G1JZozR3fP+BNHx5+7iMX1ZKWqDrvEBsLC5XAf/ZD5Yl6LByYFr7+GMALnN9AZ/Pp1OZ
	nJ93kA6NO816sZmUwx6mJCYJqZpiH6x6V2W0fc5ROOg==
X-Received: by 2002:a05:651c:98f:b0:38a:f5a6:9173 with SMTP id
 38308e7fff4ca-38c7327714cmr48990831fa.27.1774963517984; Tue, 31 Mar 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gift-nearest-fd3ef3e4819b@spud> <20260331-dominion-conjoined-c87ec5bc7db2@spud>
In-Reply-To: <20260331-dominion-conjoined-c87ec5bc7db2@spud>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 31 Mar 2026 15:25:06 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfx7ydjbxonz3FL3s9WQ+y54kjzBTFy=dVm5o9Zmbb5Cw@mail.gmail.com>
X-Gm-Features: AQROBzACLRfJow72U-jm039a1d3t4rocpkEZVCM2cWqqZAHN7AaCnQuWh8wdx0M
Message-ID: <CAMRc=Mfx7ydjbxonz3FL3s9WQ+y54kjzBTFy=dVm5o9Zmbb5Cw@mail.gmail.com>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Herve Codina <herve.codina@bootlin.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34483-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 4648636A488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 3:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Yo,
> >
> > Here's a v3 with an extra patch updating the gpio binding from fished
> > out from my old branch, fixing the examples and setting the permitted
> > values of gpios for the controllers on polarfire soc and the existing
> > binding patch's example fixed.
> >
> > [...]
>
> Gonna interpret the ack and lack of response to me asking if the gpio
> change was mine to take as it being the case.
> Applied to riscv-soc-for-next, thanks!
>
> [2/5] gpio: mpfs: Add interrupt support
>       https://git.kernel.org/conor/c/e57b53f0f36a
> [3/5] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrup=
t mux
>       https://git.kernel.org/conor/c/5f3575cc73dc
> [4/5] soc: microchip: add mpfs gpio interrupt mux driver
>       https://git.kernel.org/conor/c/bd34cdd6d214
>
> Thanks,
> Conor.

Ah, yes sorry, your email went under my radar. Feel free to take them.

Bart

