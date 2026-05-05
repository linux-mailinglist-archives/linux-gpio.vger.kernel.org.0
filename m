Return-Path: <linux-gpio+bounces-36190-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHLKEELd+WlPEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36190-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:06:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 805714CD333
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18673300F9D3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CE240629A;
	Tue,  5 May 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+9QHRIh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE06401A34
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982504; cv=none; b=Zn0mdo7zq8Pz6datdSgxjuMj1ItkxBtjeQyitRSiElY4RI1W73ElrUV4gSk/mhU4abydDriCLsLC4eoY6EUU8oXAWwX3cVYWi9PCnUeFEnd66sDjj+Bbab6ZkEqJtt/J+sdeigxtuVzfH3r/9V7okohx+0MmPKPsNjpIurY0uPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982504; c=relaxed/simple;
	bh=zjOUqmnVlxzn/jhh27mtHYwDsEUKzKnrEhLxdccdfQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUTRjOIL8fNUyXWC57AcdVfalxd09n88ngpov2Jmpq51DfH78P06K1q95qipW0KiY7pw6APvCZQ7B6TtXAHgeirwgq4fqgHc/LjsYaC54wBhWGn/cQp0LrGIPXKVS+TD5jSFdmuHffTFzvfS3mgcGfdsoXnpKylcu+wWXWoBzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+9QHRIh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C52FC2BCC7
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982503;
	bh=zjOUqmnVlxzn/jhh27mtHYwDsEUKzKnrEhLxdccdfQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V+9QHRIhVjgDjskMrzKAB9GA1JLu8ERyirz5PSM7ljTSvu9T+YPB4jPCebIyH6Epv
	 RQ2Dod5qFnmPxG95vgMR3QuuwKtQe0oUP08cTNoHklsHoZZEDHGDTGm89KhSipXG5k
	 bjrV4OUnykxMD4OFtCDTi4oKn26cfBh9vc6YlTaY3xSvnHda42i8gVbOK6thoKzMh6
	 j0Cxd4eDz9//snPs5AH2ASThc3yfjj/0QZdwVr7+ZaVH7FoqvSDI5AaLRG4msZ0K3Y
	 BSGBd3uvmW+iiOgeUv7bk+aUeRXfal4LeoDPAfrEbqegGBqjKWCYh+HidihEYaE1au
	 wcjrNbalhqHrA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e97e73234so49934351fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:01:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jXZvri9N10arfVZ5bwAZYVmETzj6Q/TSHAVgTxrN7JVyw4ZMhH3Kq0X705cA98XZa5JIMEkuYq9b0@vger.kernel.org
X-Gm-Message-State: AOJu0YxUabtdmoSm/a9lB9/9nZGM2GhHjT9r8F01R2WfIJRefCca1WSB
	HQkma9jIZ50I3AQG1JNXNchWNWhZ+awU2+weD+XJcP8tZSupo9QUohEtzgGDYJTUGKg7xB3Mk1g
	U99GueCr2GM4LenZaP4m28olsl94gdU4=
X-Received: by 2002:a05:6512:1250:b0:5a1:38c4:4247 with SMTP id
 2adb3069b0e04-5a862ebe341mr4599132e87.1.1777982502024; Tue, 05 May 2026
 05:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
In-Reply-To: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:01:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
X-Gm-Features: AVHnY4IO6x8dSZgK4ST5fVqGPK4i0BUOY6dM6Z0Yp7EnMooB7Wjw-itWE-dYdkM
Message-ID: <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Vicente Bergas <vicencb@gmail.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 805714CD333
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,secretlab.ca,linutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36190-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Vicente,

On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@gmail.com> =
wrote:

> drivers/gpio/gpio-mt7621.c is registering 96 GPIOs,
> all of them capable of generating IRQs.
> But the `struct irq_chip` can only handle 32 IRQs,
> so, 3 banks are instantiated.
>
> The DTS file specifies the interrupt for one device as
>  interrupt-parent =3D <&gpio>;
>  interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> which should be routed to Bank0 GPIO0 but
> it is instead routed to Bank2. This is the bug.
>
> The call trace that leads to the problem is:
>  drivers/i2c/i2c-core-base.c:i2c_device_probe
>  drivers/base/property.c:fwnode_irq_get
>  drivers/of/irq.c:of_irq_get
>  include/linux/irqdomain.h:irq_find_host
>  include/linux/irqdomain.h:irq_find_matching_host
>  include/linux/irqdomain.h:irq_find_matching_fwnode
>  kernel/irq/irqdomain.c:irq_find_matching_fwspec
>
> As a way to prove that this is indeed the problem,
> the following workaround makes it work.
> It just inverts the sorting order of all matches,
> so it picks Bank0 instead of Bank2.

That's a tricksy bug, I can't exactly see where the issue
is.

I think to solve this you might need to allocate an external
irqdomain that deal with the three different gpiochip
instances when translating the irqs.

There is gpiochip_irqchip_add_domain() which is currently
only used in drivers/gpio/gpio-regmap.c, but it should do
the trick I think.

Yours,
Linus Walleij

