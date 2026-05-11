Return-Path: <linux-gpio+bounces-36612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL17B0E2AmocpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:04:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A15156B9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97C7B3019E4E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9673379EFE;
	Mon, 11 May 2026 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzCl32cH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E62F8E9E
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529846; cv=none; b=GTuwunYEmPMfNttRjfFmTH8ii8X4SgT9aQdH8TtjbTsBjQHMnQULc6XIDFMbL8FlYICsY6p7BaKgrHQN9pjjeDgfj7K7QajZK/Lq18mv1+1uS/mInB+JNkDihySC3/EBVVU4fvDl/yk/5YrdgqYfJXvMfB/p63ngNxMAYPptWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529846; c=relaxed/simple;
	bh=odtlCf4rIw0DAK3X4l8eqMLcnAKeYn+1YikUttO1+3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fE0zRfZwanrqW9ViBJnO7naEXCw8txlr3XAJZhWHkb9NDoe+6S+dDyapH79NoDFtOXbEeFZUhulHAybAb7D399ZKEZOshZDyZwBj2AnesQuhq4RVG/VKgmD564jgizhfewripHCQdAgjkpboGYaF05el/d0zA+bVeTxNA5JAgl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzCl32cH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A815C32781
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529846;
	bh=odtlCf4rIw0DAK3X4l8eqMLcnAKeYn+1YikUttO1+3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uzCl32cHmsLYYMmy4oExJqEv8+Di9wjh49qyk9KHzEGnYFtXr8W7PJiyJnE0EVVHz
	 bT0F6XVNgJ+UcgiaWUL8qlL82z+ixmAAN7sjUUe88/W2i3uPs7Pngw+oj3/aLmqGxI
	 TMM6s6yoayzX8p+OXRNa9m/Ruq4eP00cnT+/Uhg6UWtc1DXgo1LyF5qGxLeUz0Ydwm
	 v57sQJs2UUFbwOdx9+NWFiv1/eR6spbuNXCbPUXxX9uQABg7+Ku/bL7u/0FkjfLYaA
	 ikHf55Pi/jAekAJZ8vyV/sXmOtSzoCH1wPAhFc/+6W2eNWsvellSmzZdCZKbdmLZNw
	 fBhgHT23UcBdA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4733280e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jboXvsHFYvjRZGEMN9cjSVNOwAfw2S43jlmCNFxWRqMDebz6CJTf+QSwxwNJtom/txmLyCdVa2NoF@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFo4tXV2Gt+dhKe97j0B9ObYmSPO7utbk0fbUlNsIIDBULLTA
	8iBL0Uc5y5AXZiVotgKQ80tF4hgQzQfbkpQ4z/ztJuyLDm7jk/uup5VSGD2Q88JpgaWesO9T2am
	YyF8IMUTTVuxyoi8iJp1KwQhVkvjusqQ=
X-Received: by 2002:a05:6512:1053:b0:5a8:6ca1:425c with SMTP id
 2adb3069b0e04-5a8e31f2461mr6054e87.36.1778529844902; Mon, 11 May 2026
 13:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com> <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:03:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMNFJ699OnHmddO+xRWgLCVj5BoSzOsooM3U3QuSOdrg@mail.gmail.com>
X-Gm-Features: AVHnY4IeBgb1SfMX7B73p8P9k7dubKkRwUr_eFji7cM7YkQeG5UUDe_o_9aehh8
Message-ID: <CAD++jLmMNFJ699OnHmddO+xRWgLCVj5BoSzOsooM3U3QuSOdrg@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 039A15156B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36612-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,aspeedtech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 10:12=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied!

Yours,
Linus Walleij

