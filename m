Return-Path: <linux-gpio+bounces-37127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGVWCUkgDGqoWgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:33:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8757A2CA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F39AC305817C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 08:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F313E0C6B;
	Tue, 19 May 2026 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGEzQ6cY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84D29B200
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178831; cv=none; b=b/Ie92NzCbwSZlebMMZjeCf03A0OBwUIIJKa6PaUoLyVia314g67LosIpyCRFbWPkocpkXgj9Y9ej6IU4H5cX4cF0xXJ4VZIs7uv4BYhDTLBbrovIQnKsOtDdRLTISr1sPOw8/Kb/oRAFl3zNJF7ZeLTUU4xPQ8UqBCu4UeDYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178831; c=relaxed/simple;
	bh=tdlXS4X4Js09e7+y47FWZzFffN4E+l1FKGOV4ZFb2QY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZJW0qDm82fFsVD0uSgJ+RfVQF/t8TvvDlnDkz2bJQxmYH+17kmBnrN/uI/k1O7ixGMmG73VFTfF9g7ehqGEHm7se2sN8dwmwzhslWw7w7cjd6Rx6K1wWgfNY64WaDjiX2CidCq6VAA80X13C4tVoiUKGZ0/jWnKjp+SZH8XldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGEzQ6cY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DD2C2BCF5
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178831;
	bh=tdlXS4X4Js09e7+y47FWZzFffN4E+l1FKGOV4ZFb2QY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MGEzQ6cYEHdEN3fBZpO0WYVqePSzbrchcBK229CqIdgv4P8tGGl7NHgBPGm9CVcOe
	 pMH0Twb7/nyNwyqRRgnF9yUGc6puOMtyVB8PZ4tUhHedwJD4FtYjpTJFqwp12RIhmJ
	 uNawKsXW2sU/rOEARikZwSVuhRCPfFX/77mly0n8mG3iZBSWLxVy1wmHv6/gYqHYjG
	 HQB/9jSefCX5oqdQnRIO8yefFFXQ1DJ30rrHQ99fz4gGxfzbtAzsTSsl8DO3qtD+CR
	 j0r4ZIHq4L1m5Syb0ZXEoN3eJLvESymg3vWt5OFLeF+qODCJmMsl+7EJiROzrVDrkG
	 ANoHoRp+Xa1nQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39556b00a85so30013181fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 01:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80XAeGf9mJK/DgsxcJoX1QR6+2xrW3vz76NA/fCvQ06k47E9IZr8pxlOo7sU09ftHoMt0e4I8SHrsI@vger.kernel.org
X-Gm-Message-State: AOJu0YwgrgBn5A7oh1kziwPDkB3FK3On9M8avZTLf4ALR7AwAMZ2GD30
	IbSErf6SiiGVl2yBrlNwTNtbzFPbmPfEx5wqqcpvS75vvUbXfnqicILYZKbB5G0QpCfp+bJRfTT
	IhZtyhejvWOr2b0xYiQFnFWR9kAMtNyAhFUXF7BkhzQ==
X-Received: by 2002:a05:651c:4203:b0:38e:a181:9e41 with SMTP id
 38308e7fff4ca-39561c9484amr48844421fa.12.1779178829684; Tue, 19 May 2026
 01:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
 <3612f5f6-eeca-49e5-9662-72729bb48c9f@nabladev.com>
In-Reply-To: <3612f5f6-eeca-49e5-9662-72729bb48c9f@nabladev.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 19 May 2026 10:20:17 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf_B+=adsEu+4TTBdKHdVSf2uWH+11WH9uz-h4Q0BS-VA@mail.gmail.com>
X-Gm-Features: AVHnY4KXp0FHGOiTD6CovfJJSgfvg2xySfPPR_2g3nt20lAqMwdn66_evodztbE
Message-ID: <CAMRc=Mf_B+=adsEu+4TTBdKHdVSf2uWH+11WH9uz-h4Q0BS-VA@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: make the voting mechanism adaptable
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37127-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nabladev.com:email]
X-Rspamd-Queue-Id: 44D8757A2CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 5:59=E2=80=AFAM Marek Vasut <marex@nabladev.com> wr=
ote:
>
> On 5/13/26 11:13 AM, Bartosz Golaszewski wrote:
> > The current voting mechanism in GPIO shared proxy assumes that "low" is
> > always the default value and users can only vote for driving the GPIO
> > "high" in which case it will remain high as long as there's at least on=
e
> > user voting.
> >
> > This makes it impossible to use the automatic sharing management for
> > certain use-cases such as the write-protect GPIOs of EEPROMs which are
> > requested "high" and driven "low" to enable writing. In this case, if
> > the WP GPIO is shared by multiple EEPROMs, and at least one of them
> > wants to enable writing, the pin must be set to "low".
> >
> > Modify the voting heuristic to assume the value set by the first user o=
n
> > request to be the "default" and subseqent calls to gpiod_set_value()
> > will constitute votes for a change of the value to the opposite. In the
> > wp-gpios case it will mean that the nvmem core requests the GPIO as
> > "out-high" for all EEPROMs sharing the pin, and when one of them wants
> > to write, the pin will be driven low, enabling it.
>
> Shouldn't this polarity inversion be handled by DT GPIO_ACTIVE_* flag ?
>

We could but that would require DT changes, you probably don't want
this? That's a different thing though too. Here's it's purely logical
- either we default to high and vote for low or default to low and
vote for high with at least one vote needed to switch.

> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO pro=
xy driver")
> > Reported-by: Marek Vasut <marex@nabladev.com>
> > Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nablad=
ev.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > Hi Marek!
> >
> > Please see if you can make your setup work with shared GPIOs with this
> > patch. You need to enable CONFIG_HAVE_SHARED_GPIOS on your platform.
>
> Why can this shared GPIO not be enabled generically for any GPIO
> controller ?
>
> [...]

That's the plan. I enabled it in arm64 defconfig for now (via Qualcomm
platforms selecting it). It caused quite a lot of fallout and a slew
of fixes so I'm doing it slowly. But yes - eventually it should be
enabled for all OF systems and potentially also verify software node
references as there are some intel systems that have GPIOs shared by
platform devices described in ACPI *and* software nodes.

Bart

