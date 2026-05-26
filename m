Return-Path: <linux-gpio+bounces-37539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJB6DEyYFWqNWgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:55:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3025D5DB4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D715301417F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0949A222590;
	Tue, 26 May 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuYrGK15"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAB1F875A
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800120; cv=none; b=Yd4QT1X3hzrL1aBiCBLDoLT+YG94SmtD8QjTDGj6KfAV0inLzpi4huX6rLqQKimz8db21p6/12W/ETFzaTyOFmO6ZBeqDghAvU7Z6R5/GHHXIyJXiM4wpnLvh1CUhnNrRnJsmRzJlxReYD3UbM1IiOsq5WQlkdR8Dh5TlAsEsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800120; c=relaxed/simple;
	bh=oRTj/AyTf1D41vyH8Ti9NiTXQsrvNptDpBM7QOVrG5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3uDsx1iY7XIyfPcmmDpUhjKxXyFzQTM/JPj1zuxZxHlDdaQL0eS3cprl+Xwl9zjJ2YYJIE7flsNlCmLu7NTRP+V4om+HyNB85byH8WrbmNfyaz8jvp9s9eyqp7Sm9KgvzOKiWOOTzIOTZe/38MbBSGtNNJBnp3pMKu+4hgJD+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuYrGK15; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956671F000E9
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779800119;
	bh=oRTj/AyTf1D41vyH8Ti9NiTXQsrvNptDpBM7QOVrG5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GuYrGK15jOmQowe5sMQ+kqpixWvzV9Hnx/TtATtLdtlejSMPYjyNKmoPOfqyUM1ee
	 9womWI8HosVs4lPCxhsuTk72akWRpMzBVTHZCuLX5/chG5Ik3XGSCooss6f5epK8EU
	 xflebi91ZEH/RAosREMY+FWFYjCsijNSh4WxgsSyq+12MvgFYz02ZYrN3ZWsU9Hwnx
	 0QDkBweB35yGbodt/te74579+M+MicayIHLTnjiQs3uVAffbS4GDuCcC3yi9jpLoUx
	 IIpkU03kokRzIeAivFxF4Oh1a6vZSh5C8hdzxSr7IRLRUbubaErqSb+Bhg010ATvSI
	 n0SBeu//k3UjA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso9592058e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 05:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9a8eFFf+EGviqFGi4YOuH3T8TNsU1+7qzBS769eysjZqAdE9x/MD00shgMvEANkz73Q0WJFu0QUugK@vger.kernel.org
X-Gm-Message-State: AOJu0YwbcL9eUXDpL2xmbkkHUnZhGwMezndBJa3lttSB78TmVk/tHGyw
	l3Y/JFH93tvZGMkJmoZkNfkHBrne0jmdZeHtZTkH5hFqCWWZxwcgmNG/0a9nEz05Kq05iswbM+4
	w6MtIu8hbKZ2bL0WIsYKEzd71XFHsG38=
X-Received: by 2002:a05:6512:6c6:b0:5aa:106e:5dd5 with SMTP id
 2adb3069b0e04-5aa323aaf36mr5724532e87.10.1779800118338; Tue, 26 May 2026
 05:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526103424.3246915-1-arnd@kernel.org>
In-Reply-To: <20260526103424.3246915-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 14:55:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLmynKz_U4oZLoAshLzAjAyN4BU9wW1-80At=nfDvx1a_A@mail.gmail.com>
X-Gm-Features: AVHnY4K3Gg5lfxwXrrT-xZMaEqSLOOh2W7v1CVWE4JK0y6UBYoxLgrUG37FWvC4
Message-ID: <CAD++jLmynKz_U4oZLoAshLzAjAyN4BU9wW1-80At=nfDvx1a_A@mail.gmail.com>
Subject: Re: [PATCH] gpio: ts5500: remove obsolete driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37539-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: CC3025D5DB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 12:34=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The ts5500 platform is no longer functional because it is
> based on the removed AMD =C3=89lan i486 SoC. Remove the now
> obsolete driver.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

