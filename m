Return-Path: <linux-gpio+bounces-37512-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG+ZJ0RwFWpbVAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37512-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:04:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5F5D3E62
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9EAE300D141
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE8F3D7D89;
	Tue, 26 May 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxo6ihjw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F6537B02A
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789287; cv=none; b=IGxjALj3aGNQh2igR+q7VI5TA75J32I7D2HiyLrLdMtNW4O5u579goNSlOgJAmOmL3mT86+7ZrUxswLoTtKlFJ6v3ANNstopcp/t1ikwNKYM8Kmf54rFe8xcpBklw3UID7I7QjmwOwNc5i03+UQ0Roo/LOKH+krjUZNlBLV+oyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789287; c=relaxed/simple;
	bh=1ZLjE0blDgs8rIXohnrgIdGtGyxBNGZG1NuH9Cx+4Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmlAnDVxDd+6Q6eES1Rv2FUnsbs6RTwl3u7JXhlFZ4f17LKqAb3a2YCcmoboeFeYZIfS55oE2ZmOG8v3zQkH9Jr9nf93luEyGXe7s1mmofikxOBTTMuPHw33uwli1vrtrZrLhM8VI38kAErxixyIqvOtXcxeoiddBzwtV1EFVNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxo6ihjw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0221F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789285;
	bh=1ZLjE0blDgs8rIXohnrgIdGtGyxBNGZG1NuH9Cx+4Uk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dxo6ihjwxavCdVOP1XWBGE+CkJ5yd5Rv29vX2ChuIA1yStvCAP5yhZmBA2tSp+SLN
	 ZGYgq6fL8aF//hkfq4hea9/4p6nNiRRn1dd7RvQhkgriGbpd7AYgtf8nzrgv54pEkL
	 FtnwdVnuu3caxpfCEQ5XLQ6YbK2i9zWas0+SvodAnE9U43wB2ibokvXXHXRlv9SFoj
	 2ws8LUYedbQAAdtLXRPngPkW+VeYpO99ar7J/DGDCTnuVY6GIPrlTa8o3e2rGupwlQ
	 AgNihSRCENfYI7yCxNdbQIm2fOyl9OJ1LTb8E026FUtVnmeJo9h/IGPeMYHcSj1nox
	 wt4ZOQCcbEjmg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so11105269e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:54:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hmr2scXBYwSqexZd8YK6GneZhO2CoWduhUom38wqgDvy7mv+JUidgRmvUs+oXpTidWG+lDDzZygxH@vger.kernel.org
X-Gm-Message-State: AOJu0YyaDg42W1HaOSXwf9QrxwxoGkvawDTucfc9RVbGntiFnLsYFoaB
	hnJms+KLo6u0L+gttWUwH0pWCJPEgAZJDECI6BJCeSsRRBzpaKdOUtnw6ass295UwMbkShN2BUU
	nlxqsLE1gk+z9dNA39cG42B1hXCGm8pc=
X-Received: by 2002:ac2:43d3:0:b0:5a8:ee4c:8ae2 with SMTP id
 2adb3069b0e04-5aa3237c1e2mr3443175e87.30.1779789284401; Tue, 26 May 2026
 02:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:54:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0NVSdZ6jMprK0W+5h8gSoxjZRNqrHmfTSMPf0obTnJA@mail.gmail.com>
X-Gm-Features: AVHnY4LigDhYSCnaPwhQTYPGRYJs6hffPdPcGze_-mYukq-oq5Xsx1gQevrGyvU
Message-ID: <CAD++jL=0NVSdZ6jMprK0W+5h8gSoxjZRNqrHmfTSMPf0obTnJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37512-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 02D5F5D3E62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 10:26=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> When the system transitions from bootloader to kernel, the GPIO is
> expected to keep driving high.
>
> However, the Linux kernel first configures the pin direction and then
> sets the output value. This may cause a brief low-level glitch on the
> GPIO line, which can be problematic for regulator control.
>
> By configuring the output value before switching the pin direction to
> output, the glitch can be avoided.
>
> This commit fixes the issue by swapping the configuration order.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied as non-critical fix based on my gut feeling.

Yours,
Linus Walleij

