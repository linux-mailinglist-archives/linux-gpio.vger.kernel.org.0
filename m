Return-Path: <linux-gpio+bounces-34270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKIPFOuBxmnQLAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:11:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC32344D34
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68FC7300BDA9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 13:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48F13E5EFC;
	Fri, 27 Mar 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOpYot00"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892732F770
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616636; cv=none; b=oz46AdQN8hpHz0yVP5e2HDLNEP7KYiTnT26GurLoYLEw8qKn6BjsyvtyTSJbVAUfMfbHyOg/04lbwv/+BA04YC9RUmiLGOeI54iFBgIqhsPpZWO/7Bchh4nlNCL6T5KDPO6ZtGxsciz6JoiCn20yDPDKJZ+ZHEUs+1yMN4oszX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616636; c=relaxed/simple;
	bh=Q631Oqw0ZISbaZruj/xtEA3A6Iah1CZkcKaX/jg5vjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9Tf4OK4OiQr2c7YAjjGcMbvFgFSTjUnrQNxiJmqgIUFVzre/R/cpdAKgBToxbCbH4zd1aF71gIa//GfefddIE/GgonByf1P9+pWKVHBojhk/ghXrJ2x0aL38PXiIxr1aI6YC9rp4z3ibYDapqNHUxH03TBFkX3b9DyltdqKZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOpYot00; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658EDC2BCB3
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616636;
	bh=Q631Oqw0ZISbaZruj/xtEA3A6Iah1CZkcKaX/jg5vjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aOpYot003uoG26Sc46oGD5+zx/X9KKz9khWSftKsNimSqbpu55ouaYhau4lL6rN7S
	 /mzn6ZjMS6UxtieeM0H0fwh3tq2fNbI0vV9kr00NtMrXlvqrgE+9Mu6lqfHePNJtIM
	 QErdGzHpyL5coiTzbWR3h1W4aSHgPEOmEjk+FQH9H4pFBSd6Wh7xxMQzWFOY5z723L
	 HR2j1TwyxKZJBGIGcMuSCNKFZZcWP9rUqCubHYxiAsTGi5faF7bCMvD3UhoK//8O49
	 2qxriCQUQgBEkHGzxykQqNLKTmmSnuK/OfMO8gZdPKO9ErkEzNBcCg5c11SHVWFSyA
	 ibGgwo51dCGnA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6500040ef83so219490d50.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 06:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW//Y2l5Swwb/kUdWDt/Rmv6Gt1QH9CEsIwCNOoBcwYiXQlLuSWF+JTDtIJY6dSU8zCb/4VuDTHL9K4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PsFzQPwDHtQuNW2CifVDN+tYQfXroJy6LSt8y5RrAhvqMra2
	kPL1Qj5j0ZcjxK7lSy6BDa4H9xfsdfM0wiLIkR83kXFRbPtipyK2LZxnWypWrcgohi7NHcU8hLd
	Xt0AwUiiOIsIjJM+CIB7nK6y3RidGiC4=
X-Received: by 2002:a05:690e:4005:b0:64e:a408:4326 with SMTP id
 956f58d0204a3-64ff74428a7mr2104976d50.70.1774616635573; Fri, 27 Mar 2026
 06:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 14:03:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLnyVZqntVThzVo-nTCQGAckR-_+MDy7_5D_mfoy5DRAZA@mail.gmail.com>
X-Gm-Features: AQROBzAT1fbdVY9U2Jk7XBs4SqGVLjy-lFIY6t7k7psMt75QOA1H-2KBpEGjAdA
Message-ID: <CAD++jLnyVZqntVThzVo-nTCQGAckR-_+MDy7_5D_mfoy5DRAZA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: kill dev-sync-probe
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34270-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AEC32344D34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:31=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> I came up with this elaborate mechanism to synchronously wait for the
> platform devices activated over configs to probe, involving notifiers
> and completions (which was later factored out into what is today the
> dev-sync-probe module) because I didn't know any better. It turns out
> there's an idiomatic way of achieving the same goal with much less LOC.
> Port the three drivers to using a combination of wait_for_probe() and
> device_is_bound() and remove the dev-sync-probe module.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

That looks way better!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

