Return-Path: <linux-gpio+bounces-37130-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNoVMkgjDGpqXAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37130-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:46:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EAA57A6A1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95B01304AC26
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 08:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239C83E1D15;
	Tue, 19 May 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K251MoNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996D3E1CFD
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179695; cv=none; b=cMK5TxZsaHJKrBIYbaJwrwqtmxG4OKDBNR1YKpfIQa+ZJ07yj8tRsz79sU2vWck/L5PxEy+q6Ohz4r6mC0zkYREY0symX4fkAENeWB5YHm2g/Y1LCIBSRTspq/Kn3lHnS2x+DXH6Pc9HqdWMutXexv6qqrUDIwjSiN5xzJN7WoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179695; c=relaxed/simple;
	bh=TPUWNuFjul6GyDaPo8DNJstqVMEAvTYdB3hPzpRN53I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8C03TrPRrRfD95V03BlTsQ4rzrqDIiyhIh88xxkHeH93EnGcoKntV/avS2fXFOnsbWuEKdZqq30MS1tI5NrPO2XiSaTLLyQIndlBOyLBZKjXy86I2SytqEBOoEk4TCQ+/qR0LM7DABx91jkLySKaSH4bN8+g2KVMUhv+K5hjH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K251MoNp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713BFC2BCF5
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179695;
	bh=TPUWNuFjul6GyDaPo8DNJstqVMEAvTYdB3hPzpRN53I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K251MoNpkDLu5l2eL96nXhIPlZQaNoNYOHLGn5rsNLCzx/cGv/VZ7ml720zulDonB
	 e436dYvsWrVeIejofHZsmkB5fWwt02jQlTukFv1c9kV7+UYVKBT1dRL3PF2zyjJFpf
	 xTQuLTWv7ubeecdIwjQgri1jIWfehsNt81eBOhyuD+kDeuVxKr8UdvDwVzhE4LDScQ
	 bQmUDkJ0mK5ppcX0bOCQSxaRLvVnLHqATgzYoEkOneGvX08W06Llk+4TO0a2VkhU5F
	 uPTdXTquwccTOT3877JzGZlVqmeiEjQW9xo+VNiHFzo6ggl1iY1ktS/qMbjJaJbP21
	 Gwd6Xso+eyAbg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8738c178dso3069739e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 01:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84hoparaew3S6vEwNjAWzfbbv+0jBwRGzQfKbdQBquTQ+a0Rcj7xktLmPAoS0YcgAFYj/y5qJ9bYnp@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBnYjU2/mHv6ziSVsNsYDhQT92IW+zDDjSlL16ryjEPb+uT+5
	NRob/LrAFixcuxzi7YPbZQehkQIe7QMHadxtyUUapWXI+lx9oSSi5cZd2necCn3XmRkQhHNpdu6
	4+fFVLpxSqoDtdKJOlsrV3c9a0RKaJ0U=
X-Received: by 2002:a05:6512:3c91:b0:5aa:b6a:6025 with SMTP id
 2adb3069b0e04-5aa0e74e16fmr5062857e87.42.1779179694175; Tue, 19 May 2026
 01:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
In-Reply-To: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 19 May 2026 10:34:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=jL=YLOTy2JP8WfXZw-7K8Tf3KoJQz0+e353JCYxBx8Q@mail.gmail.com>
X-Gm-Features: AVHnY4JBeDGHH3EDJa5H4ja2GxjF7Up3qxUoCexRFThktjKJK3DPSgObi9xbgl8
Message-ID: <CAD++jL=jL=YLOTy2JP8WfXZw-7K8Tf3KoJQz0+e353JCYxBx8Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: make the voting mechanism adaptable
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37130-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,nabladev.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 39EAA57A6A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The current voting mechanism in GPIO shared proxy assumes that "low" is
> always the default value and users can only vote for driving the GPIO
> "high" in which case it will remain high as long as there's at least one
> user voting.
>
> This makes it impossible to use the automatic sharing management for
> certain use-cases such as the write-protect GPIOs of EEPROMs which are
> requested "high" and driven "low" to enable writing. In this case, if
> the WP GPIO is shared by multiple EEPROMs, and at least one of them
> wants to enable writing, the pin must be set to "low".
>
> Modify the voting heuristic to assume the value set by the first user on
> request to be the "default" and subseqent calls to gpiod_set_value()
> will constitute votes for a change of the value to the opposite. In the
> wp-gpios case it will mean that the nvmem core requests the GPIO as
> "out-high" for all EEPROMs sharing the pin, and when one of them wants
> to write, the pin will be driven low, enabling it.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy=
 driver")
> Reported-by: Marek Vasut <marex@nabladev.com>
> Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev=
.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I like this idea.
Reviewed-by: Linus Walleij <linusw@kernel.org>

BTW was this "voting" system inspired by the hardware "vote" thing
that Qualcomm is using for power management? That's the only place
I've seen it before.

Yours,
Linus Walleij

