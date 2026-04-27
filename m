Return-Path: <linux-gpio+bounces-35622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GL5NKfE72lsFwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:18:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6F479E7C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D19F30378BD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 20:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAD3332EC8;
	Mon, 27 Apr 2026 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X62oOp9+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC362D7DC6
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320802; cv=none; b=Kr6qmP+AXB27sa78lhh/9VfMOj+6fcxxQ8I0Fpf0GVySdKt2em7Qyt7Oyj6I9Y6kWTYSmVh7SkISNpkhT12Ec0jb/2q8Y2qjAfwFIZLdZHcLddtvtHJTVDp0csqzTd2WbNIszHy8LsRDglxdwBvCGDy/zFUw7Aco1IDux5+NoNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320802; c=relaxed/simple;
	bh=H9oPMfVXhKNXMx4hu/5oVUQqt5YdfabfQiIjpaTE0Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rupNz7HNjb7GVXIBicTcAZOhSqMEI5pw0EWNdLRXFIVy+U8bHf5vyKGC8p6jY9agmaRm8DMA9jXYXhAUWXNOm/N9Fp9QAStKy+EEWnAeiALiwL4A4mKcOxuq22Cp+TD0Jc2WAW5f2qE92cN3moCkGu5IWKiBpdvn3xtjNmKo8Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X62oOp9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B23CC2BCB7
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777320802;
	bh=H9oPMfVXhKNXMx4hu/5oVUQqt5YdfabfQiIjpaTE0Yo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X62oOp9+5JBKHJ2nAO8sR73so7y945QkUC3SEilBztiipTimdhSwdAiAObYnj0TeL
	 BFu9/9DuvFyfwMwIIxtxyVN4Ab/oEolnaQc6TcoiBkbSZ8GLRO2cOlwUvcGw86l4Ul
	 6ky3+ncccbHDeeDy0IFwjz4C4i/e528+8UBw5DoS1DDwh/DR/7tYrRD977uF09h26o
	 jc7V1f3iYmz+jnAYmcs9yFb8EoYWMNaY7ESXmT20Y4e+wdYzHxY5GfAw5KXgMoCE/I
	 LOESBLY+7uOxbTPWTgtjoRR2P9H3JdqUHJbd3VY/Djc8mWDSl+rs1Cg4S9P/1W+ZjP
	 ccNEeshwA3Kjg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so16097793e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:13:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lMP8KkyQv0Q23fr4mjJu/YivqsYlobApatTgz2qAtzB+fY7So2PkiheG8bIRnu3MdqIoSILNUBdJu@vger.kernel.org
X-Gm-Message-State: AOJu0YySuUgxI9Vf/IWJW2sETILr+ZywoLtBnoXaDURC4b54ToQ6U+pg
	KRzOOsLyWvoCuHiPMc/O9l9WWIbxC0enqBQrmueapHZGH2FgfOReygt0PK+2pvYLo6zXMjTej2q
	0bE7CNk5WWocNySKDJeIYsaXl6KYEpTs=
X-Received: by 2002:a05:6512:3e0c:b0:5a1:33b6:2b6d with SMTP id
 2adb3069b0e04-5a74641607bmr104652e87.14.1777320800734; Mon, 27 Apr 2026
 13:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427144338.3436940-1-arnd@kernel.org>
In-Reply-To: <20260427144338.3436940-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:13:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
X-Gm-Features: AVHnY4JDIiI5bvymAJ7HAS5SNrAk9hl5BHOGYymwNZn-O6C2HER0F4cjiges0zo
Message-ID: <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 53F6F479E7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35622-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,alien8.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 4:43=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The OLPC GPIO controller sets up a fixed number space that is used
> by at least two drivers:
>
> arch/x86/platform/olpc/olpc-xo1-sci.c: In function 'setup_ec_sci':
> arch/x86/platform/olpc/olpc-xo1-sci.c:358:13: error: implicit declaration=
 of function 'gpio_request' [-Wimplicit-function-declaration]
>   358 |         r =3D gpio_request(OLPC_GPIO_ECSCI, "OLPC-ECSCI");
>       |             ^~~~~~~~~~~~
> sound/pci/cs5535audio/cs5535audio_olpc.c: In function 'olpc_analog_input'=
:
> sound/pci/cs5535audio/cs5535audio_olpc.c:41:9: error: implicit declaratio=
n of function 'gpio_set_value'; did you mean 'gpiod_set_value'? [-Wimplicit=
-function-declaration]
>    41 |         gpio_set_value(OLPC_GPIO_MIC_AC, on);
>
> Select CONFIG_GPIOLIB_LEGACY for this platform and make sure the
> sound driver portion cannot be compiled without this.
>
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I started to try to fix up this driver but it's such a mess. I feel
the OLPC XO1 support needs to be deleted unless someone
steps up to actually test and maintain it.

Yours,
Linus Walleij

