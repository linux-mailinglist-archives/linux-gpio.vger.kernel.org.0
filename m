Return-Path: <linux-gpio+bounces-37427-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED0xEx4FFGpSIwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37427-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:15:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62B5C78CC
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFC1D303432C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAD03A9DA9;
	Mon, 25 May 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWiBFVJt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5E3DCD83
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696800; cv=none; b=NPXdwl1q8bwNH3vGXIXI8Cc9+zotiBpiBbD92HE04O44h2Z7Oj1LZcLFFW3jE3d25DwG4jpcxwwa0aZtW0cD5NsDEdq50B0ueHik1GZQB4H6dLenXzB3edj7NARgX7dryq1o+UPqhcY2t2eg+bjD/RGMl5PEhOEaHrB7vPb4hAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696800; c=relaxed/simple;
	bh=4X8VfEgtynQvkRUQ78d4BHm3Hijx2XsryIkyquHe10w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZnJQInf40tWhraP8A/HNk1n54cZa4qf17Wsae7fPHpJrX5xxsaCRrDaunjZ30EhcZxEP7gPeMjp61WnTiVQQmonBUkBVsWIeW8pdJ+Usk3EgUA99KH6VewKiffiej08PWaoMZVeEJ5OAOm7lFj17Zs1CnG8HIDlD2FAE7oTkl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWiBFVJt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB07E1F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696796;
	bh=djik/NyBClnw3R4F4UGKM2JB/KJ8BBucJTMUN+ykxwU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NWiBFVJtOpi8kLKWTj2nPyM5zzicJL2YLTjfqbqQJRlW7j3ExmOkXK5dhKMCgSdDO
	 BDcIsebDB+QdKdAloPf6z357mMwakV37+duOhOxuy2eUR6VEcHH5Wc0NDzJ06rzbVK
	 fUk++MygEGvwfY55IYUnFanvW6CuxI7/dXvp9s5jsmGn3GLvdBfKVzFwj3ugvEFT3C
	 pbTdduOPQU3MWA64cCNNOwJtlYFPR52coEonYA5HURUij6G91EioUnpPy8X8STYlK2
	 AqM3JkqAj/GZOWVlvYaosu6B8lTuhmtbzDrtfubkHM+bXyCuZJrffhkn+Gg4mMW211
	 yCCChaHSQ8FPw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so15028228e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Ux96ZZbfgMc7ljjn1muebP9JDMBDIHpnLhlCAXOvhy7Pye+YYSph4pV72GnGw81WFY3YCw6psjUlB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9DzTz7t3gJ3lEAdtjLY6xhFE+QI63TNntLCJpC1Wv8GkY+vl
	8xYD+ka0RrVsKFqUcomO0kpOl87l40MGd19XHsX6SCelp5WBV0veDmxHd3K3m9NnraPlsd+lqlD
	uzWH8wQwQfIil5PCYYeM7/q/+vGfXZa4=
X-Received: by 2002:a05:6512:31c2:b0:5a2:874e:8a1e with SMTP id
 2adb3069b0e04-5aa323c56bbmr4080347e87.26.1779696795660; Mon, 25 May 2026
 01:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518-jh7110-v1-0-fdb0daae5a4b@kernel.org> <20260518-jh7110-v1-2-fdb0daae5a4b@kernel.org>
 <CAKxU2N9jD5Mj+ZeQbtQV+hJ5zknEbVOiniGUdJysFOSLTzMKEw@mail.gmail.com>
In-Reply-To: <CAKxU2N9jD5Mj+ZeQbtQV+hJ5zknEbVOiniGUdJysFOSLTzMKEw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:13:03 +0200
X-Gmail-Original-Message-ID: <CAD++jL=n34pTH01v_wPukRfGJ_gBCgK-SMMyRMvzPrh5UrAtrw@mail.gmail.com>
X-Gm-Features: AVHnY4IFRPE3qmOHetw4UlfepyIDwS5QEDWWNGUZV8mpVdGPJ6G3XVgslclmt-g
Message-ID: <CAD++jL=n34pTH01v_wPukRfGJ_gBCgK-SMMyRMvzPrh5UrAtrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: starfive: jh7110: Avoid ifdeffery
To: Rosen Penev <rosenp@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37427-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9C62B5C78CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 4:39=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> > -       sfp->num_saved_regs =3D info->nsaved_regs;
> > +       sfp->num_saved_regs =3D num_saved_regs;

> yeah and this is used absolutely nowhere. Both for loops are of the form
>
> for (i =3D 0 ; i < sfp->info->nsaved_regs ; i++)
>
> I really don't think __counted_by is worth it here.

__counted_by() is used by compiler instrumentation, i.e. by hardening
code that is not visible directly in the driver.

During compilation, code will be inserted that checks boundaries of the
array at runtime.

Yours,
Linus Walleij

