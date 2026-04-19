Return-Path: <linux-gpio+bounces-35237-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPMxIv9G5WmygQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35237-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 23:19:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCB425879
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 23:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CB693019F05
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 21:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317D92F39C2;
	Sun, 19 Apr 2026 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBLgetj9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE326E706
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776633594; cv=none; b=caShGJrsxTMZQL563AwYMPnMbDFoQ0Yni44gVnmX80cMKZQoS3CxPJEfqJ2QRK8RNFjB5Z9jmioNESEmkJzx06Gxv/SEtG7B57DXhjHytpGrrEkcjfm+81bfr2Dm3w0pHLav3ZEfq6yraMMg1UVq5KPX6M/nVGLF9c6emYOWzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776633594; c=relaxed/simple;
	bh=z9YbvWBNcBN/kiRFkQ6KPbSsQhW/tBBXUVGnpF4Bmp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+vqfwihCA14In0Zedb4xKaGHC4TRZObesRAFvLFizoEwA7Bo2Fm4QBgidVfLso/QjJ0uQW57/cqIuVpuwQTSGcyCuFqrufEC7I52ivDDNenqYrflAvaGTdGpYJ1T3YFZ7CI2haDKzUhfhZOR8W0muK9WUXeiZ/YY6W/3YGt5VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBLgetj9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10EAC2BCC7
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776633593;
	bh=z9YbvWBNcBN/kiRFkQ6KPbSsQhW/tBBXUVGnpF4Bmp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EBLgetj9NxEaAOYhlFeKYGK4lGLnbVmRASOWvmVhBRsyIPQhrMOwZ5KWaLROJdv5k
	 MA8IG8AJWcIYLALvFc1iS6yV97tskuiGJD0BHr5wfBXSziCGItvYeGoMsFJ2WNm+nm
	 moZklfet4zaMrHYF4XNT5uAQ6NKOfB/Va66TkwYqHAg8ExLX8sKH3Iz3RNAoNLrVFq
	 lmfAsD4BLMVHgBnx49J5/Q3pP6N2z1j+f1Oy9sW4hQHtv/c9mJManCMx2URT7Gudo9
	 YTdM3+LSbdnp2+xEpZJU9eJ3qQL23cOoPulh2d5cxsWThnqO/EF39rnL47ZaZ9J5bp
	 afbCo17nvO0Zw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so3438932e87.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 14:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fM47VFeZEY3RO+QH0eXH2GRdVAHlmwtFBo91wM4Kypi3K39Zb8ZpTGx0YlKYaCIjWe5pi1BBhYNik@vger.kernel.org
X-Gm-Message-State: AOJu0YzUc4ugvkC1ZG31nP5oILfd58qmxnblNyh86hYP1lIrcglNwo7f
	jrgfdsnTvgX3gTOkjwggermsBbHbjyZYt8oG6isBMzQzKzY4+KSKe4HKbzynAeG0ArLQ0f6KznZ
	iOFx0FEIvL35NuC3UoVoBPfeKwKPLWJw=
X-Received: by 2002:a05:6512:ad1:b0:5a3:ff5a:d6c with SMTP id
 2adb3069b0e04-5a4172c756amr3690813e87.14.1776633592265; Sun, 19 Apr 2026
 14:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com> <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
In-Reply-To: <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:19:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
X-Gm-Features: AQROBzAE2Y02h6LgmsVRXzFjBD7tYm8hngF_phTFw6dYL2PfXyxOmjtiC-kfPNE
Message-ID: <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>, 
	Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35237-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,realtek.com:email]
X-Rspamd-Queue-Id: 33CCB425879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Yu-Chun,

On Fri, Apr 10, 2026 at 11:39=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> We did look into gpio-mmio and gpio-regmap, but they are not quite suitab=
le for
> our platform due to the specific hardware design:
>
> 1. Per-GPIO Dedicated Registers: Unlike typical GPIO controllers that pac=
k 32 pins
> into a single 32-bit register (1 bit per pin), our hardware uses a dedica=
ted 32-bit
> register for each individual GPIO. This single register controls the
> input/output state, direction, and interrupt trigger type for that specif=
ic pin.

Isn't that attainable by:

- setting .ngpio_per_reg to 1 in struct gpio_regmap_config

- extend .reg_mask_xlate callback with an enum for each operation
  (need to change all users of the .reg_mask_xlate callback but
  who cares, they are not many):

e.g.

enum gpio_regmap_operation {
    GPIO_REGMAP_GET_OP,
    GPIO_REGMAP_SET_OP,
    GPIO_REGMAP_SET_WITH_CLEAR_OP,
    GPIO_REGMAP_GET_DIR_OP,
    GPIO_REGMAP_SET_DIR_OP,
};

 int (*reg_mask_xlate)(struct gpio_regmap *gpio,
                              enum_gpio_regmap_operation op,
                              unsigned int base,
                              unsigned int offset, unsigned int *reg,
                              unsigned int *mask);

This way .reg_mask_xlate() can hit different bits in the returned
*mask depending on operation and it will be find to pack all of
the bits into one 32bit register.

Added Michael Walle to the the thread, he will know if this is a
good idea.

> 2. Write-Enable (WREN) Mask Mechanism: Our hardware requires a specific W=
rite-Enable
> mask to be written simultaneously when updating the register values.

Which is to just set bit 31.

With the above scheme your .reg_mask_xlate callback can just set bit 31
no matter what operating you're doing. Piece of cake.

> 3. Hardware Debounce: We also need to support hardware debounce settings =
per pin,
> which requires custom configuration via set_config mapped to these specif=
ic per-pin
> registers.

Just add a version of an optional .set_config() call to gpio-regmap.c
to handle this using .reg_mask_xlate() per above and add a new
GPIO_REGMAP_CONFIG_OP to the above enum, problem solved.

If it seems too hard I can write patch 1 & 2 adding this infrastructure
but I bet you can easily see what can be done with gpio-regmap.c
here provided Michael W approves the idea.

Yours,
Linus Walleij

