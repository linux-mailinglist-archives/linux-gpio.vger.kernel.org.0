Return-Path: <linux-gpio+bounces-34753-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aElZLNyu1GnvwQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34753-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:14:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1033AAB0C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 768F730056C2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 07:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC7D3921E7;
	Tue,  7 Apr 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6RHv0Yu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A2C2FF
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546073; cv=none; b=uZ6JXLI26RU9kotAlWs/id8hSOtU387e+G0bg4lNY/Ugr5Vd7QoJCSY490sY00MjlS6pXQ4KIyy2Gz9vdEKWOZfZG/YMG2AjsDugzmecxo1cEgkamJqIUZ6HFLF2ODh0b6+Zbsq7mXgkbpEKl/7kZIBb0KIhj0gbPexBpuqG6dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546073; c=relaxed/simple;
	bh=eDYNJnr4ETlKa/GKXVghhxv0mku2PXdivqbDDAcFYYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIXlmMRXO23ERG8DgpzuAO9x4Z3J6IzjlCE1mWxDOMirD0i9thGawwkuNrh/K8mbEbukQKJXhUW/Clmr+rfrmWibYig4XIt/c1TVL3HNmwkDlOiplTtqMKrt23t57uRuhbN70EkWsHEpbyhdvispFCk/FmJ5nrSeEEsmFQpbmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6RHv0Yu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF25C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546073;
	bh=eDYNJnr4ETlKa/GKXVghhxv0mku2PXdivqbDDAcFYYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e6RHv0Yu9urVko13Ln68xAueF738ZXzS7tdsaS/46PUUOPlP5CuLpl91YXHvKXBgk
	 PDw1oakAOBB/J13Ko+DJMWeaTOv/oUniEwsd5v7ULt2Dst3BuuY8GARf99TUM1rHx9
	 NpCDf867TsKWmxmsIhCZdqhcJwNxWczRo109DvsvawKWBJtf7FUoNsDmTg/nGNLbT6
	 /kZyEheo9OQs7hBmcqiWaIUvO9hvVdd0tFdqRxvEoHIw2RkY12FRzMaf+VBucAFrAz
	 b2H7LLkAMITli4l3763xxC3gAX5dOUj2AgzMCUN5vvem3rFZrC4EGFeZljhu+oBlFx
	 XS6pkfloyDCMA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6501e465a8eso5180630d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 00:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVulC5DlRI9D3C/RxSPTs0ylDnY2YP8R/f7I2uVvOo+fRyH/uAY4NDq4YnEpBNqHgKuPRkiTN028VFc@vger.kernel.org
X-Gm-Message-State: AOJu0YymtPsH3qDgxZKKFngW4YryOB5h8aWpP6UmqKDT3Olsbl+vhSQJ
	4PLbbfmExXNQbevbspdw3WzCtcajWuTXP3i66sitA5O9Hiwa98OlgMzDJ1em3OGtzZP985UwvqO
	Nx5ajqOfM2qEntO7gKBbdm/srSUBjLGM=
X-Received: by 2002:a05:690e:d07:b0:650:7b78:2bf6 with SMTP id
 956f58d0204a3-6507b782cc8mr1364136d50.21.1775546072903; Tue, 07 Apr 2026
 00:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:14:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLmEstHo0CYq=ifqm367UXqFcMgs7669s-1P1Y96rKcTwg@mail.gmail.com>
X-Gm-Features: AQROBzD3uIlbGSM9X7dypNf0x3ZZt8RrcOHCg4-dWSS6NmwEI15IRO13jTknXdg
Message-ID: <CAD++jLmEstHo0CYq=ifqm367UXqFcMgs7669s-1P1Y96rKcTwg@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: pxa: attach software nodes to the GPIO controllers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-34753-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: ED1033AAB0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:11=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> I was looking for a use-case where automatic secondary fwnode assignment
> would make sense for a DT platform. With the paz00 issue having been
> addressed by Dmitry, PXA looked like the last one that could match the
> idea but it turned out that we can just easily attach the software nodes
> to their controllers enabling fwnode lookup of GPIOs.
>
> After that the only GPIO consumers that still use label lookup with
> dangling software nodes are ACPI platform devices and a single PCI
> use-case. In that case, I won't be doing anything OF-related and will
> limit the x86 tablets series to an ACPI-centric solution.
>
> With that being said: here's a series attaching software nodes to GPIO
> controllers on the PXA platform. Since everything happens in a
> bord-file, it's quite straightforward.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

This makes things better, thanks!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

