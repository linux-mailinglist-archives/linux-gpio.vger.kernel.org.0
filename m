Return-Path: <linux-gpio+bounces-34025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKaPNvFBwWmqRwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:36:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF02F30BD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E85D7303C289
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 13:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA973AA1A2;
	Mon, 23 Mar 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5qnR3HO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2139182F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272405; cv=none; b=mca6H1Y5lRihj8I2fvNjwsdF8CJFwDBICSrCQ+0yRkcjb7Gzfva5PV76wvCeVGo7oQ06g2ld0d1wDJZv9DvYbshWua+HueYRilXPYCUn+/gmf0XI5o3IA1dxanpZ5eXj3wZlZLhwmKh1ji2UJiwsdyepXeuIvtyfljJGsmEstz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272405; c=relaxed/simple;
	bh=1nm6SOmbAdyE8jNGWZXC2DpIDvWoUpHEkSCMdIvsKF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XX0jBfrO+hV3BngmW11Ny/tFZ2hVb4YnukIE1xtSMxwn8q/sSvV2/39sJLUPRLJYOrX6LwKUbwC8C8CYPf7DO8IcC4F4+7fePYYALtCB02EVx+my+niodQFJ3IzWM6sAsBvMYxxmYQStbNHEMoYHTYIRU+/SbW6lHUp2KlKOCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5qnR3HO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9C2C2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272404;
	bh=1nm6SOmbAdyE8jNGWZXC2DpIDvWoUpHEkSCMdIvsKF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q5qnR3HOZZRlYKpzOIah8/QDXe1UNfYTyjAsxZSS9fJCNbKMqb9BlF1I3zpEQuAI1
	 V6PMiJgB9XTxFuCJCCi7APdnTl7Gjn2CDe1JJgIyNgQotuAE6WaI5I38qgtZtUoXA6
	 aL7IURxgy+VXHQEpOO+buoRi8VRrDNwWjEKbvZ1WYnuEIdtuaOwwuz1FTuIiB7qtPU
	 k2Hc+44akW+atl/8oupCEqELcgydqAvqF0nV0vKfGghEquaEAvekCD3FBu9AyuB3VD
	 VsWKjW5WMXY1AfNL0UPoX8pSBSI9Nz0R2C6jSZN/q7ksC3y22s1B5fXtghcW+LfTqx
	 X8oSATU7OswWA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad9238d8fso5317676d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 06:26:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1XSNQjTOvha3k2KGwD7ZDilvT0Lxk+jDEizOSHNB2ZCq7mOhVPAazZvcEriDQ5ib4EmK7iZDq234r@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXypES3V24sY9U0vYOd7dRKoSMBiglHr05VbWtY/kD36B9k24
	g7cCINPHJy8y29y/i2fUaDV7vZ7RGE2YuVbJ+fy5Lwp/s41z0ibDyO9KH3TpBx5rHRlf8/TYZYt
	qPa+3qUbh9iCVLS6ZT+1KjW7Si3f8t0k=
X-Received: by 2002:a05:690e:16db:b0:64c:bae1:2168 with SMTP id
 956f58d0204a3-64eaa6a30bemr8671486d50.12.1774272404188; Mon, 23 Mar 2026
 06:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320151506.10679-1-eleanor15x@gmail.com>
In-Reply-To: <20260320151506.10679-1-eleanor15x@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:26:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9NS93nLndM1xyHGDdEdwGTZz7XSe581yM+JY3s4-4EA@mail.gmail.com>
X-Gm-Features: AQROBzBc5ESQ52ylUmYjA0iAQoSQobKB7oj7GrXJiTdufMGkti0CEO2UD0X63gM
Message-ID: <CAD++jLn9NS93nLndM1xyHGDdEdwGTZz7XSe581yM+JY3s4-4EA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: abx500: Fix type of 'argument' variable
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, matt.porter@linaro.org, 
	syin@broadcom.com, csd@broadcom.com, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34025-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 07BF02F30BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 4:15=E2=80=AFPM Yu-Chun Lin <eleanor15x@gmail.com> =
wrote:

> The argument variable is assigned the return value of
> pinconf_to_config_argument(), which returns a u32. Change its type from
> enum pin_config_param to unsigned int to correctly store the configuratio=
n
> argument.
>
> Fixes: 03b054e9696c ("pinctrl: Pass all configs to driver on pin_config_s=
et()")
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Patch applied as nonurgent fix, thanks!

Yours,
Linus Walleij

