Return-Path: <linux-gpio+bounces-39232-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PqO9BsTRQ2p7jQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39232-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:25:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CD6E566C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:25:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="P637Hau/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39232-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39232-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F60530E190E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB5C419314;
	Tue, 30 Jun 2026 14:17:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F26423149
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:17:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829060; cv=none; b=dMW/kREOlKnerGhEfS4KYkxNMaPCL0NrIGrUigMmLezZt6na2FYzm+Yzp8kxz9gX2lPZ8xOQ/ZXaB3aq1dpslmLV/jpRDg62s70xFirB6pdrjh/kPbDBOgGQv0X1ynwtInShJY86WMAYb9JCUok45tDcUA9gc7VTaoE0SP9E5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829060; c=relaxed/simple;
	bh=kzGbN6aMPEi6epmc0Dym/QucqWf60zZaYskH3TdzwNw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+buwTlB2e5u7+4vWxrYSPyTkI/Sr4Ikd+zVcjGDCkC1VPA09gDqLdfrMBtwZO8KQhneRkNA84BLU5dL/FhfrlwC/ZEQxInp5luDP3O5rB/Vo9l0YqePyMfIhP6Gt/9S2yiBiQy+gmNkxDFYV1usNrtleOJopOWGbM6f3jX9n2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P637Hau/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD761F0155B
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829058;
	bh=3RVh7ELT7+ihJdj5fgzKjSJM96uGbDJC2dUuDhp5cEw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=P637Hau/niy511z7KS9YXNOCl/Dbi3sP9CPxfVkhCzCIaT2kVOmowDD1rqQ+tiGon
	 NvzB7ud8I+Mbxp47bo/GtEfWLx3S1T4dKLecht1Fjh9ueOnr9b8zmO9oHSe8giKfD9
	 yEZEY+GB96wOQjB9xmx4lotOZV1RxnU3Lk+aJYSAE3SULx+QPTwyFzxY9q4K07Bvbl
	 Qtc/1Ssh5y5w0RbT74x4pvCuIhyqqUjp4Jjbo1tGezZ36eKXCzpTsiusEA0U4wPuko
	 xkMbrqaubNskzx+ic8J1sIu9R/nCZp6PyznqBCaZInuJP8xdeTLVs5xbu/APu71HVy
	 ZvM+mjFeTc9Yg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb89359a3so2100901e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoiFwwqbneLnufPZUfZ2NKJ7jNXcz/uKPJ+Jw79kS1r4djuHEm5Xzsa7AFpqXyAimKjqFgHMZ7QNqsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gS8nkDUkiHcqwugBnyuBLZrcWBrCA0uXJNgs2BLaLnZUuv8s
	FjtbTO6Oi4h6Rn4rDOUjkjDWOqC/9ZfLelSm7DExMLZziWUyHcFRKBAhpwtk1+PeoVvLums4jUj
	+JTXN9o7MqXkQ7DV8ASFohr7nCIJEQc7Eha9MT14UXA==
X-Received: by 2002:a05:6512:ba6:b0:5ae:b900:15b7 with SMTP id
 2adb3069b0e04-5aebdbd3532mr1090636e87.55.1782829055964; Tue, 30 Jun 2026
 07:17:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:17:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:17:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629130329.1291953-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629130329.1291953-1-arnd@kernel.org>
Date: Tue, 30 Jun 2026 07:17:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfh_2CDcq19XLozgZbyq=u4o+KjnBNi1HAOec0gW3CGDg@mail.gmail.com>
X-Gm-Features: AVVi8CfXTc1e_mSHjfkWFS-QUSVUX85SudluvtZvZQ5siNjxDoww7y3bpjgfSpk
Message-ID: <CAMRc=Mfh_2CDcq19XLozgZbyq=u4o+KjnBNi1HAOec0gW3CGDg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] gpiolib: fence off legacy interfaces
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39232-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[arndb.de,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp,arndb.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 734CD6E566C

On Mon, 29 Jun 2026 15:03:23 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is the remainder of the series previously posted as v2
> in [1]. I've changed the version to v5 for all patches to
> not confuse b4 too much, but the patches are mostly unchanged.
>
> The patch "Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY"
> was not part of the series last time, but the build bots reported
> this as a regression since I had dropped that since v1.
>
> I hope that all that remains now can just get merged through the
> gpio tree. The gpio-keys patch needs a bit coordination with
> another patch addressing the same issue that is already in
> flight, so I expect that I'll rebase my series once more when
> that is in a stable branch, but the state I have here should
> just work as-is on top of v7.2-rc1.
>
>      Arnd
>
> [1] https://lore.kernel.org/all/20260520183815.2510387-1-arnd@kernel.org/
>
> Arnd Bergmann (6):
>   [v5] sh: select legacy gpiolib interface
>   [v5] x86/olpc: select GPIOLIB_LEGACY
>   [v5] Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY
>   [v5] Input: gpio-keys: make legacy gpiolib optional
>   [v5] leds: gpio: make legacy gpiolib interface optional
>   [v5] gpiolib: turn off legacy interface by default

Why this weird formatting?

Anyway, for the series:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

