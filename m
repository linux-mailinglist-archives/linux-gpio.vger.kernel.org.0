Return-Path: <linux-gpio+bounces-32249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFaeD5HDoGnImQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:05:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B075E1B02D6
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 157E33032DD8
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 22:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACD93C1984;
	Thu, 26 Feb 2026 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO3WD0yX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E043E481
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143495; cv=none; b=Mv0viclY3HWsvUgox+4K65bK6MQgquEYt10+pu1J/sLQfoEF1hpu4JphQbxp0KuEDJ2Kn1pThEUqMvDefbpRuBgpmGTIOYeCRWgcqnsq6JP2felzDa1qNeYDIirQqGKYWX+2HAQLTd6gdud9S0kuSixMHuieplqIdmsIDcOn7xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143495; c=relaxed/simple;
	bh=LBgQY94cj6yf9auzS2kHOl5M2UyIRu3YEERS5NjXHVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMISEUm40NHKY4OJXZo3NN9qEoc9jkxHXB/PlLsZ/Q68oT4k7cdo80S4AmEUToFhOca05AAzucCu04udsHsUkX67cgBIwAgC6Ec0S1p05ZaRBLGyWz87zgZTEmyC8YDGNH16CGt3EiiIxtfgiXR8GLdyQzm5FtTr3iczytJA3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GO3WD0yX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF33C2BC86
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772143495;
	bh=LBgQY94cj6yf9auzS2kHOl5M2UyIRu3YEERS5NjXHVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GO3WD0yXyDla/U+CgZb12QMPjaRovXpUZQvMyc5V3gGuDLtx2efjsSOA5FF4WaZa/
	 O7tFaW83+Ar87sY5f0lWoDEatOs3aItk8Eh+CCT9JGgHstXZgT6ojQpPoJBWJ55tS7
	 qZbmBvJ4UrjwX8RoTJ7Xuab0fwQ2hEY5lnXBlxnWz5ZSpET+bu8cdrb7cHF3iGJ7ug
	 ZOGAE6sP92fo9CrPVm5Cf4eu9soUB+wajJhq6/CRT8C49gHESngi5zGENpeP++lQRX
	 7keELVq7yuxeXHORnXehlzFaTONn3Hbd/ksDdntkFTjuPedB6PLHVgflR7FZglz+cm
	 NghVV8RILQEZw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79801df3e21so13653477b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 14:04:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyIwVXqBmaubTbNC0QQcIz7xtGGUpqMa+bWRuGbOorWy3tHeLEOtNvXBE/FSru7doSGwmWwAsgqHNu@vger.kernel.org
X-Gm-Message-State: AOJu0YylfWm+t9iYBCh3tglUOVdGLhJQfuuVt/V+e9lddoAyqJUEjCpZ
	LO/fb+ZFDOZT2ppaGuYeGG3WnxUrFUDrUUdHtD0BY5If1J445Ppla9qtfWhJ7uXX7TqY/bAi3MU
	c8ZMZqhokakNTtLcAyO8rC87kQVgSG3k=
X-Received: by 2002:a05:690c:3804:b0:798:6af6:a40e with SMTP id
 00721157ae682-79885652ca2mr7910817b3.65.1772143494888; Thu, 26 Feb 2026
 14:04:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224162606.645147-1-pranavkharche7@gmail.com>
In-Reply-To: <20260224162606.645147-1-pranavkharche7@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:04:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkTyRfPR2KKb39E9EhCcz+qroMMGzah2oqLKq06t2W5g@mail.gmail.com>
X-Gm-Features: AaiRm50cNJgl-9aCBhzyy5gAwqTMUdec09V1oDMlhNF2_Iw-2C0sYyFqq7rCqyM
Message-ID: <CAD++jLmkTyRfPR2KKb39E9EhCcz+qroMMGzah2oqLKq06t2W5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32249-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B075E1B02D6
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 5:27=E2=80=AFPM Pranav Kharche <pranavkharche7@gmai=
l.com> wrote:

> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>

Empty commit message, NACK.

Provide a detailed explanation to why this is not needed anymore.

Also I don't belive such an explanation exists.

Yours,
Linus Walleij

