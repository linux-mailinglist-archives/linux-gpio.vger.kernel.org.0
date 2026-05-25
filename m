Return-Path: <linux-gpio+bounces-37426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCbCIV8EFGpSIwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:12:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E54925C7818
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F80E3038539
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C565E3DCDAA;
	Mon, 25 May 2026 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0a6IpFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659DB3DC4CC
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696621; cv=none; b=Id5Y8pfb27f/ZpjcodHWBv5I4y6BO7QkRZAWtjYUCK7ExHufFN7x5yFRlqCqqoRgp7sGCxpm5CDGCL0Ihf/Qq8Y1BxL6ryqOoPQ2InOIAICaP97cDvap0E499u+z/UR5Kbqh7vaMg+T/e/zmous48K31iBcC62KzNrJ+lNiE694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696621; c=relaxed/simple;
	bh=kppKC02SPWGevMCIBIKVt+x2mcxmdbvbJlks0CtpFXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeeJCjEwPyPMQkjr9YazJk6JGugyVDrEBPBvULGrWBjRcEOUhmVlHXUgv3r4CbKs87Em0ELSJxIWoizEpqYrhT2zP7ryK4/8rwbXbNQZzLL0Zl4tugr6HP0jtaCZMNbgw3nJzJ6AzS3Y83KT0C8puQ4s2BY8qt7E+UFOvSiReaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0a6IpFf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1951F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696617;
	bh=kppKC02SPWGevMCIBIKVt+x2mcxmdbvbJlks0CtpFXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=o0a6IpFfh+9K7uPekwzkGW3kZ8NOcX485sQJ5+Q0LkPJv73atNadBbvjUTzQJhCYT
	 6OxdlhdM7nJ4rkdCyfO3OCBn1nP4NI7qXlyllKVRiOhS2fVPuMAW0ty08y0HPEHz70
	 GK1DyDkzrmKsYGOoUufkpcbA6nvAO4HUqea8Mw9pT9wETR7mRZ4oJXQyaa7tzpSxi0
	 PBsh1Mv926/sBd6xK11Py3clytTeQ4TNiyGcR1n93hoXirS1UMgvTIjh8e6cOoLkr6
	 nz6djIFKuwDf6gmVqsCKpuKdDzHsJ2Qr1rMtEG98gCCdgwNEh9l99XVdIr4hySJgUW
	 /MDDT/7VzAYrA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a746f9c092so13160195e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:10:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/14d7JWX2F1HHL/ZKg3/JyPUEaVoKr/aPUSHTai4IBlP41fToYWU+Hc7JVSaGZs8AD/A2iNbH89IyN@vger.kernel.org
X-Gm-Message-State: AOJu0YwzLiWMgbwi5NRdTDkQW9AzfdA51pRF7HyT3pA3mbUZKJ7tQkTm
	tAc1I8AoyezuuxzuxyzlxP7SaRqo1PlYh10/OqDzawf1YITboSAoGfshuAav5vgrZ98k0e6Swvu
	x0PGBK3q1AY6Q7HFNR4B08NuTrfGzS5w=
X-Received: by 2002:a05:6512:6486:b0:5a3:ff:cf83 with SMTP id
 2adb3069b0e04-5aa2ba69220mr4159280e87.7.1779696616626; Mon, 25 May 2026
 01:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516105737.45174-1-len.bao@gmx.us>
In-Reply-To: <20260516105737.45174-1-len.bao@gmx.us>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:10:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5W56YAgJ8o7XXZRJQ_LJxW87SPc_C0VEYW0EccxpJ5Q@mail.gmail.com>
X-Gm-Features: AVHnY4L4wsU4sQ0-5AxCn0tp1JcG0jEo8KLQSs8UJdS_b33DPk9WQZ0hZbchbQQ
Message-ID: <CAD++jL=5W56YAgJ8o7XXZRJQ_LJxW87SPc_C0VEYW0EccxpJ5Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Mark gpio_devt, gpiolib_initialized and
 gpio_stub_drv as __ro_after_init
To: Len Bao <len.bao@gmx.us>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37426-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.us];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.us:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E54925C7818
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Len,

thanks for your patch!

On Sat, May 16, 2026 at 12:58=E2=80=AFPM Len Bao <len.bao@gmx.us> wrote:

> The 'gpio_devt' and 'gpiolib_initialized' variables are initialized only
> during the init phase in the 'gpiolib_dev_init' function and never
> changed. So, mark these as __ro_after_init.
>
> The 'gpio_stub_drv' variable is initialized only in the declaration and
> never changed. So, this variable could be 'const', but using the
> 'driver_register' and 'driver_unregister' functions discards the 'const'
> qualifier. Therefore, as an alternative, mark it as a __ro_after_init.
>
> Signed-off-by: Len Bao <len.bao@gmx.us>

Patches like this should be CC to linux-hardening.

Anyways it looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

