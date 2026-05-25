Return-Path: <linux-gpio+bounces-37430-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAlBNpcJFGrVJAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37430-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:34:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD75C7D09
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC7293004F24
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097463E2ADF;
	Mon, 25 May 2026 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnSp8BvJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB03E2AAF
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698066; cv=none; b=ZWO/dPiFUry9lN2MPDMrH91sIoe3G0XtVbRswQu5KEK6EJC9ySpgN5FlpbSJ7I/BSH47OFOh5lig/sXdUD/xs/JB542sT7OF/yec6Yr6ziHPL3Rfr3Xjg8mBBMSW2nI8VNUYlld0r5r430SJRpwgu8/TpEBI8Yy69KE42oiqPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698066; c=relaxed/simple;
	bh=ocdluSnvPrajohiha17GJ29fdKK8Wu3tb+aFtvggHIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAbVU1Gtw4OymPmKZkDUMK2lXK2FLOHVxZ4akxDuym2THzblI6YtR4qpsNHhcccZ4kGuwCbxKDbwGthZwE+OQ94CiObALXT96ULor2FHorru9Zr8xG8IFVxw8qsGs6S6ulR3rwR4qBqUY1hTl6DI/gG6s0Tj5uVLjQjLgh9e64o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnSp8BvJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA261F00ADE
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698065;
	bh=ocdluSnvPrajohiha17GJ29fdKK8Wu3tb+aFtvggHIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fnSp8BvJfPkA04wxA7mKTPbAve6r/Z636vOY7whORBxplpYMAfV/wkIzs/q3/i2kU
	 WSylGbm5FPI/FIZ80h8rBFkcL7YIWfl2Tvmv4Hn8GME56dJw454mXQsmyz580RiJib
	 gyU/S97sGNd5c/GiPD36dhMtBWOTRXGKlC5f592aABylxp/uZgKFZ7gPRY9Mlfr5w1
	 7Kyiz37jA0NydxK2lw2LEDAySWkh1EwjDUNIwJXUojPX569EN+Wdv6msvBVo4DCfoJ
	 SfjcCp3DkU5Q5/fmn938Q7HVJfEXHnMiXnIP1cAEe5NLoxt0DU81yDyuYOBf/PzOFr
	 /RtWzh9XFxLhA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso3790924e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fjRmai+hvlU8p7avRk0iPkI6TGsocakhjlaRxNOeZjSX/hRmOgom1Yb79jZTEzHmf2sX5zU0eLv3w@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+p7G2lgBoh+LegTqIQOiqTd2eUIbmKusV4VK8LLP4LtCWc3o4
	yceuIdTUPyZEzRG0qc798OJSg933QGI5RJYr4KQNHUGoAIOqqKSsf952dkdA6WotcyD5W/HfzKA
	3xgn9KGL8CDuJRck+sLJsDEmEPkYS5bA=
X-Received: by 2002:a05:6512:31c4:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5aa32369f4amr3970074e87.9.1779698064269; Mon, 25 May 2026
 01:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:34:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
X-Gm-Features: AVHnY4IyGTi3BnZWsq4c-wualt0vr2BsufA5tdx1c0CYn_gbaKAGwoMKhoJOICc
Message-ID: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37430-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amlogic.com:email]
X-Rspamd-Queue-Id: 73CD75C7D09
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

Is this a regression? I.e. does it cause problems on a supported
system with mainline?

Linus (the big penguin) is unhappy with too many non-critical fixes
so I wanna check this before this goes into fixes.

Yours,
Linus Walleij

