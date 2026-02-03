Return-Path: <linux-gpio+bounces-31384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF9oLkLZgWlYKgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 12:17:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7DCD826B
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 12:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2757B30A3086
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 11:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4A2332EBC;
	Tue,  3 Feb 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANM4LHK2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418632EBB8C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117365; cv=none; b=Ndc+6gEIlFs8Kk/UqHiAv4Ph9PgqU8Yjb101byzn5I4nj+CjtlDm0NIm+b2iCgZqpPys2tAfB/D3aFOD3NOXjBEGXlpFOVF46B34CogbuGjwDo+KpU7M8AkK2WTgZsjIR7sFMhGVirSeyrkVipo9E+/aHLl6oKibr+fvH2D+Koc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117365; c=relaxed/simple;
	bh=M+36pLPI1PCw6oakVdm76x4ZLR67Guu9hsS57Z1XcAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnWBgoonEJuK6x+y+trQ9HdhvSBXrbZM6dP+W3VG7eaaIESEZX4wR/NSAH4exXI+3Wg6cySSxspXFh2t+iB0lfivDajkUpY7NCluJJT/IBZYJNCINJLKIQoh7o1fhzgMat1EMrRzZ6saeHwpFx/L10G/dZwlK/7Hi+77oX48H1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANM4LHK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAE0C2BCB4
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770117365;
	bh=M+36pLPI1PCw6oakVdm76x4ZLR67Guu9hsS57Z1XcAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ANM4LHK2AHYsZMRkgGxze9xu58fiGkAXKEU0Vk91vkSP3zcMzIjtjax/cWBvzTwJ1
	 /PoSqsgtUYyNujgKQTMIMPOaaRlsaflHl6grCbVpEs28R5BGUXgiboIX0R+630l/FL
	 X0m3vUPjFDNUPL2AboH/FBcD50QMMjaQukRJfcivfKBO6JEZpI/5vKB1Z2aabt/jMk
	 ucQqyoIDDiyFlljItspNoV+lyLt85YOTZPD6nk8H3WAwPkNTOSVms0CE/rh70gJC7t
	 rkq+k5TW/t/bo7M2eLnHMEygr3Nwu3yEURxyghv+6IBXHvuR4eYc2dfEOj4mcRdm0u
	 h3Y+/gNkyPQYw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-386714da2a2so14691051fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 03:16:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgAf7DnGIXCaYp7/KIW8NJmMIuE8Ln0cvOXwd9KfTj3WzYsWknHcQBsYLqhUvSpgV3gsgwRNJyEQjf@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4d4NB/OQOw1WdSCXZBDjPzg2rbLIacIHswDJDyvh1zS+djB8
	BZO++ZrG/9DeQumxiUULWooDdcD1TNn90qbcCw0ON6yfaLR+PwRnJFPdg73JpPDnJr4zIAjBUgH
	LYSPm8SyIZ4egDvjPd5d7yu7eVMUN3QB/sDSl2h+vmA==
X-Received: by 2002:a05:6512:31ce:b0:59e:1880:2f01 with SMTP id
 2adb3069b0e04-59e188030d4mr4316313e87.9.1770117363567; Tue, 03 Feb 2026
 03:16:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org>
In-Reply-To: <20260203061059.975605-1-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 3 Feb 2026 12:15:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=McKJmiWz-1o6qHbOva70J_SAdFwxngGFta31DDy5vU=Dg@mail.gmail.com>
X-Gm-Features: AZwV_QjnrFqFq1xNP3hWNQDHJBBSneRRwu7M_Myg4co_V6k5Nb11nnuqn1tJT0o
Message-ID: <CAMRc=McKJmiWz-1o6qHbOva70J_SAdFwxngGFta31DDy5vU=Dg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] gpio: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31384-lists,linux-gpio=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 1E7DCD826B
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 7:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> This series transitions the UAF prevention logic within the GPIO core
> (gpiolib) to use the 'revocable' mechanism.
>
> The existing code aims to prevent UAF issues when the underlying GPIO
> chip is removed.  This series replaces that custom logic with the
> generic 'revocable' API, which is designed to handle such lifecycle
> dependencies.  There should be no changes in behavior.
>
> The series applies after:
> - https://lore.kernel.org/all/20260129143733.45618-1-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org
>
> Bartosz: the series was planned to send after -rc1 comes.  But I think
> it'd be great to send out for your early review and testing if possible.
> The series base on v6.19-rc8, driver-core-next, and gpio/for-next.
> Please use the temporary integration testing branch
> https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.g=
it/log/?h=3Dgpio_rev
> if you'd like to.
>

This is not a Reviewed-by yet but FWIW:

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

With this revision there's no impact on stability or performance and I
haven't seen any KASAN splats or kmemleak reports.

I'll try to review all the patches individually.

Bartosz

