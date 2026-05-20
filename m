Return-Path: <linux-gpio+bounces-37173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKLDLl5bDWrBwQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:57:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADD5888A1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 535FB307A63A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 06:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F36365A03;
	Wed, 20 May 2026 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIodqNHF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36C33DED1
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260130; cv=none; b=A99mI5DH9grPp+zPpddlsfI8HPPsMLhG6pr3DVSDw86nZ1x/FoF8/wZd7FbiG29S5j9J5fu4dWrTDNx9c6mSeQVl+daPyq9/Av9GB8lih6opE2ozJ1goQEnU9GrGsa9cO98P4ZWPAgfVD5wd1mXu1IyI8lymhcHuvGPfteNxYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260130; c=relaxed/simple;
	bh=F5OWh7vDe8NWAJEl7Un5LdCvfs5C5QmSjVqPyrD3i3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpL3092exPpAJEW8F9RArsI4QbdDYHZ8rRRccHbMXOz8llFV0Fkc/9L4oxl7UQLiICWMpmwrmcHlfpjgtImlRX8FUhg6uVtQ55+vB3JeSKPBEm/roknut3JcZJNvdIuj27I1BshUZhuea4xa35+80801aqWO2v7WoqsfUldc46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIodqNHF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461CA1F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260129;
	bh=F5OWh7vDe8NWAJEl7Un5LdCvfs5C5QmSjVqPyrD3i3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EIodqNHFKu2VMguG6saeXE9j+edQmczdI5zoWCbdBCwLYJVQfJlf/HZ+K2qBe+XTE
	 433t6U49lPuiqljHcabKaf//T/Ivu/dyQKc4BaXvdX4djVhBUNMag7oYL1NkNgogXo
	 EM5ac0RkE9gFIzlgt1MzQPfqcW5rPGqZBbxVchG0vCsQDN+qVou1OWDjyM3YrD6Zbf
	 cCmS8YYShE+bOPmlbpujetiKd33MxxlzzdJ000XqgzkfSNSGBZxDqNciAeozQZ4tZQ
	 weSOz1HzuK17mh4DwrHTOkvugB0nGBFiehKFfFegymqqe5RDgFSNsZadrrDVuBzajM
	 0+6grBEBV+Vew==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso6109384e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 23:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9wqot+12s7Bl9TpFEQ1Zr8LCsUznqe+iNvIc2MOXBTN7UCpWEAjyB1MxOX6cDa6yjTCRPCDxJyYIS0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NUf1DYSDB1klg91BpAzWYDNqhs40pKdl30mk9pseNXGr9csX
	NP1tTTykhwzPbGbdeMR0VOtdM8PYvxLxxoE5IbUjqber7nwUiZEqc6076llKvlsLjBmzCertfBz
	sb5bIxbIpqowOgCtxV09FL7gg2DMfiOFur9sFHCwt9w==
X-Received: by 2002:a05:6512:3d88:b0:5a8:6747:b053 with SMTP id
 2adb3069b0e04-5aa0e7322a9mr9105074e87.27.1779260127999; Tue, 19 May 2026
 23:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
 <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
 <ag0Dn66ZVnbTc7J2@google.com> <ag1GJygtLgngKQqj@google.com>
In-Reply-To: <ag1GJygtLgngKQqj@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 08:55:15 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc=EohSiLTnmpVKJ_ECog0Km3iHSic0V_f6wKqB2z9aLg@mail.gmail.com>
X-Gm-Features: AVHnY4L05DYyj4JGkURacGAhkQpr2W67TrPmN7V2hcVAFkR5gQz7mSESeVfBauE
Message-ID: <CAMRc=Mc=EohSiLTnmpVKJ_ECog0Km3iHSic0V_f6wKqB2z9aLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpio: remove machine hogs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Frank Rowand <frowand.list@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37173-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 29ADD5888A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 7:27=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> >
> > If there is no replacement maybe we can resurrect this? Or shoudl we
> > have add swnode support for hogs?
>
> Hmm, I guess it is already there so I should simply switch. Sorry about
> the noise.
>

Earlier in this series you have examples of using software node based
hogging, I hope you can use it?

Bart

