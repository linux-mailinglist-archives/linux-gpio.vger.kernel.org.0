Return-Path: <linux-gpio+bounces-33917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKZnL3RFvWkR8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:02:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078A2DAA13
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24C03038282
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D003A5E73;
	Fri, 20 Mar 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2FyKNYo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050092139C9
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774011695; cv=none; b=MzG/4BPtFUYqDHLlSPsmqIqhDDHog8cjj8Ze/hL0SkpIu6qLImAST2tH/WhTvV9zWBi4Dk4AJOdbDjiiEMQCyJ7GXrcjeAwgsemvfPgR6guD8uLzXhJU53gXp/7KGeTTXL7saeC4Tn81v5tPZFb4i/ZkrBGCNiLTqJNPjG7WHH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774011695; c=relaxed/simple;
	bh=ft9rf8Rf5SBMUWLWL9lzNo9iFxMUnMLxk5mkkO6wvkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKH7hu/OcaMindD5ofy09Z6fyJ6TiCvZ8D++dl10bdysvx3+cWqWfDomGbFnbJJfwUJzCNKurfpC76zHfA76A26c60k0d3x2FpIdCRpG33bsHOhnDQM0H3zGK0+L+L8pUIturNpbl2tWI0RfthNfo7ZQxJo5TwmgSolyqPBQ2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2FyKNYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B8FC2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774011694;
	bh=ft9rf8Rf5SBMUWLWL9lzNo9iFxMUnMLxk5mkkO6wvkc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p2FyKNYorQ1gZLgklkjlwb9uy1me9keQ2o80e1E6oIcNKVGmXVZyxSKrfXKNFP0Jw
	 qlUST9ymdNR0GiUQPC+CQhXBVj9GD6vPOQrgtgWZcJ4Q4QVPyBprjXdZXxmPQCNTFF
	 yKfV+mDBf5db2gC3mg66839cM52dvud/ny+H54C8aitmBjvncoHfdT1ryYLnVb5jHZ
	 HMOV+7mPYKvRKi9m9BZTTiQJBGt1lDDaYcLMpZOYSNI8tzw87+xYZ5bWanSsIABSuI
	 UfuUXS381wMOxkiAyY39rjiaav+/jabCgbRtaTj2xJJCvtIemCbHop15OJQDM8rdA+
	 hCAmIqg8AGKUw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a5ad7cc52so21254777b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:01:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YxlOQyg7e/cdtBVl6Ye7duCiEKiKkY+RXZi2NI+I3SF67994o9q
	j/LVmaHkU4Evq1G0MiZ02JMDlyh7PQq5dnj4DSSp4zIsbahgmcjyfCsRomm5pWlF8Iym6ePcvZy
	ZO7A8zBElh1tEGVcawGdpsNLY21whjlo=
X-Received: by 2002:a05:690c:e059:b0:79a:8e70:e3e2 with SMTP id
 00721157ae682-79a90c1da1dmr24585607b3.50.1774011694012; Fri, 20 Mar 2026
 06:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gift-nearest-fd3ef3e4819b@spud> <20260318-fondly-tradition-90b8241f0cc8@spud>
In-Reply-To: <20260318-fondly-tradition-90b8241f0cc8@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:01:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLncq3YPeAOi=2A+mVV=Z0nuoWS_1cGJP3gPUQ1C2=Nczw@mail.gmail.com>
X-Gm-Features: AaiRm53Ce2l7MamKLYOuY5ZyQXcZOamVTEaSdvWkIylypWTwGTBZlqqQvGq_X8Y
Message-ID: <CAD++jLncq3YPeAOi=2A+mVV=Z0nuoWS_1cGJP3gPUQ1C2=Nczw@mail.gmail.com>
Subject: Re: [PATCH v13 1/5] dt-bindings: gpio: fix microchip,mpfs-gpio
 interrupt documentation
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33917-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.937];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,microchip.com:email]
X-Rspamd-Queue-Id: 2078A2DAA13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:04=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> The microchip,mpfs-gpio binding suffered greatly due to being written
> with a narrow minded view of the controller, and the interrupt bits
> ended up incorrect. It was mistakenly assumed that the interrupt
> configuration was set by platform firmware, based on the FPGA
> configuration, and that the GPIO DT nodes were the only way to really
> communicate interrupt configuration to software.
>
> Instead, the mux should be a device in its own right, and the GPIO
> controllers should be connected to it, rather than to the PLIC.
> Now that a binding exists for that mux, try to fix the misconceptions
> in the GPIO controller binding.
>
> Firstly, it's not possible for this controller to have fewer than 14
> GPIOs, and thus 14 interrupts also. There are three controllers, with
> 14, 24 & 32 GPIOs each. The fabric core, CoreGPIO, can of course have
> a customisable number of GPIOs.
>
> The example is wacky too - it follows from the incorrect understanding
> that the GPIO controllers are connected to the PLIC directly. They are
> not however, with a mux sitting in between. Update the example to use
> the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
> the example - rather than the strange looking, repeated <53>.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Makes sense to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

