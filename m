Return-Path: <linux-gpio+bounces-36515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iORFByWWAWqXfAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:41:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD950A3AA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 979C1300D4E7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217303C0633;
	Mon, 11 May 2026 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E06F+O+4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122D73B776F
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488599; cv=none; b=TTAVK5cyuFIf6jtnujDkUE9E2oWJMjYykMGP+3HQ8ZEDfuFB0/Agme9LDatE9T82haCaJ4cmf8U4jfFvS1Ag0eEbW96XkEO1XdPQG7fkxvLog7GueVr5AsEuKjzXcQVEi4oa6ITEOiO5+GlMYfZlNWJMw+AIAoOSPXvBmwGJcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488599; c=relaxed/simple;
	bh=4PF51G6c0G6Gi1ayiZRPE7NCSn5Hkpz/tk0EfS0p0yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECLxMyRYNU8UcT1nrogQTHTH2pMexGvB+J4C1asRSfxpGGIhZH4+6GXfc5XbF4aC1/UH8LorsokCZHbq2DcaXK6wteozB3+0t8nh1zAIZ+SsSVcDbN4AdqjgA1XhX7QbjJgKUGHtj0Kj0VDB9ymJnG0bJ74EAIDL16KcScK/tDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E06F+O+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C79CC2BCFA
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778488597;
	bh=4PF51G6c0G6Gi1ayiZRPE7NCSn5Hkpz/tk0EfS0p0yM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E06F+O+4HxqCDU69Q2RZ4XRqFkC+C3AktblKIhN+NySNVGkBAeqwV75jFY8Y8iEP/
	 8DGhvJ88CHZoGUAw8uxY3TqmVi3pO+VzE2hb/wn6oUF3Cu/GcXRHSod4878//2wPU9
	 hlbP093r+faF6cGw+0jJSIakT42eS1D4UsVtfedLqXFyv97xgQb+rfhUhmvtweng+0
	 eNbPQPVV6gTY0KrGn0rhfdHuq9vDxZ2g/mVPgBcSQM0YyC80dNQHf76DDGxCI6teSY
	 vHcYNzSmZfDTSHIT6VYF7t+k25EH63+Z/NTEgt9h1gbQ3D1O+cK5egmiUznouI3ZyE
	 kFavRoZLWeCRw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4197797e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 01:36:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8XoYcomlkJGVX/WB4K79Yo/M/IbDZeLM0wxg+2X25PNn9QtinCCzfk1iiq8kiwKmWqZgAN6f6ShPAt@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNc7bAukOT22zd/uE4zxHasp4BtkD9Bjc+XNmNwm7eqoUT6v+
	C5s32KBN1qxssVBuGg8P2hO3W6JDYH4DaxnHJe3HqAX1Ttvy5AG36SUGTjOHNqJ1Sly6mzRq577
	hnR+u8FaGjtLsaPW9TUOWZsqfOb7vMZY=
X-Received: by 2002:a05:6512:3d03:b0:5a8:99bd:12dd with SMTP id
 2adb3069b0e04-5a899bd13aamr5773584e87.31.1778488595742; Mon, 11 May 2026
 01:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
 <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com> <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
 <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com>
In-Reply-To: <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 10:36:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
X-Gm-Features: AVHnY4IfT9q6KDLm-dZHjUsaH-0X6qvevfw7aCysYd229WzlzaOSgUqxkeXu0ro
Message-ID: <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AEAD950A3AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36515-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,axiado.com:email]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 9:57=E2=80=AFAM Petar Stepanovic <pstepanovic@axiado=
.com> wrote:

> For example, when SGPIO is configured for 128 lines, the hardware provide=
s
> 128 input bits (DIN) and 128 output bits (DOUT). If modeled directly, thi=
s
> corresponds to 256 GPIOs in Linux, since the input and output signals are
> independent and are not bidirectional.

I don't get it.

Linux internals are modeled after physical GPIO lines, actual rails
you can control. ngpios for example means the number of controllable
physical lines.

What kind of bits exist in some registers does not concern this
concept.

Please check this presentation page 24 for example:
https://www.df.lth.se/~triad/papers/pincontrol.pdf

The fact that there exist many weird things inside the SoC
doesn't alter the fact that "a GPIO" is an abstraction for a single
physical I/O entity such as a line/pad/pin.

> Similar to the gpio-aspeed-sgpio.c driver, the input and output paths are
> fixed by hardware and cannot be configured dynamically per line. These ar=
e
> not interchangeable directions of the same GPIO line;

Are they connected to the same physical output line/pin or
not? That is the only thing that matters. If they in the end control
the same physical entitiy, it *is* the same GPIO line from Linux'
point of view.

> Because the direction is fixed by hardware, the standard
> lines-initial-states property, which encodes both direction and initial s=
tate,
> does not map cleanly to this design.

GPIOs with fixed direction is nothing new for Linux, we've had
that for ages.

I would just have the driver reject configurations that does
not apply and bail out.

If you absolutely want to enforce the lines-initial-states to match what th=
e
hardware can do, then use YAML schema restriuctions on what
values can be encoded into that array.

> For the output lines (DOUT), should their initial values be described in =
the
> device tree, or should they be configured by userspace, with the driver o=
nly
> providing default initialization?

I don't see why userspace should deal with that. The Linux userspace
ABI is for hacking and odd usecases (like industrial). The nominal
use is kernel-internal consumers and those must be able to
request their GPIOs as well without any userspace shenanigans.

But avoiding to deal with initial line states at all is a solution
of course.

What I don't understand is what purpose this dout-init actually
does and why it cannot be set dynamically by the driver at runtime.

Yours,
Linus Walleij

