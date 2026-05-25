Return-Path: <linux-gpio+bounces-37437-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAX6FTAOFGpeJQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37437-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:54:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 105205C82B7
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75DC93020C38
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AF43E5A10;
	Mon, 25 May 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH/zaoKq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E83E51D5
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699122; cv=none; b=I50ZUcoCTkOMSPvvS50UMhYm6N9I3IYVFaGxR62PmTZfKbtMSktsD7uplE/mhlhN12v3S521QHgfsbVnoe/wZwYqUDH93hQyM4VUxkDNOdcugaSJKEdM9Ut9ZConR0EDOy2QCNs1ElrMAgvosr3c/jWDUcvPFeofrdsQzrkHF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699122; c=relaxed/simple;
	bh=KSP9ghkSHvUp2PCGytYvBDkp55Rj/0JPKZodyzb8klM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5Od0Glw4kitlrCSI431fjUt50VDzqSTlgpK7lV0vjDs/uozXa0V1pI5IUxdtNK9Rz43Pkx/x1kxW3OfhjLkz+OWzm5u0wGdrkJj2DXv85FoTeBP+foXes2MPUrgvbkOmqVON/lEgmf0WbKbZ9HfYSYKBmZIwxb+dWPYKr4R77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH/zaoKq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4356F1F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699117;
	bh=KSP9ghkSHvUp2PCGytYvBDkp55Rj/0JPKZodyzb8klM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RH/zaoKqPFg1kHJxLv7osW2qAgegDvDuTPbyBhjuwLHRX7kBifXM1xYIPjAfXFBc8
	 qVpWt5METORC290pdJ0H5Z504SsQhbKBj/P6kaISUfAoNrP0uUu5JMl483+etk/yS+
	 t1i6fqdknyWXH66fenwS03DgKLmUrkv+qZPX3QTTRzt/EiMxfAuncJOcZ9U5WJwJwa
	 7UfraiSLvg9zHnNd1dmAksmvDDxhp0UbLK6lM5zGiSjYgRk1cVrOuiWAaaRd3LVqNI
	 3DOutuBsagB30Ou2GNuWgyWb2eT1uGbbidogLsGnzixWqldmefe9iC4PetM5Nzhbcg
	 w30P/IjKBNxdQ==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4859b1fc7a8so142527b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:51:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XWJN+JXLax1OaSIlREb9MOUk0p0GuHt8MKndsBzJdUsbaYdJdImAc78j8q4YXTuRsU2/Ha2Be4x6o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1w/g/LvhEDBh7opX1tILMtOdzd00Z1VZcq/NBBUBcaoHTo/Jo
	DdEwLDG6wPKKZweEBRoMlliK1ybBZPEkQWTKcpEZjNbIOycQBzkV9ciu0wvIfrRx2zULeuX+4Kp
	AUt8O6RLLMmZPjZypyQ9An09A6qipyr8=
X-Received: by 2002:a05:6808:4f53:b0:485:4396:91a3 with SMTP id
 5614622812f47-4854a3b9ed3mr7761797b6e.30.1779699116694; Mon, 25 May 2026
 01:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
In-Reply-To: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:51:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-ojs+-cb8ktp=-G-_KJFHapT-ShkDnoQpB6ECogQfQw@mail.gmail.com>
X-Gm-Features: AVHnY4K5_2zkPofWM9BEGLoSdLlr7XA1WZ0CFt3YNcp-WKDVPYF5rhteGOuoNrc
Message-ID: <CAD++jLm-ojs+-cb8ktp=-G-_KJFHapT-ShkDnoQpB6ECogQfQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: add kunit tests for GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37437-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 105205C82B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 10:21=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This series adds a first batch of kunit tests for GPIO core. I intend to
> gradually add more coverage for functionalities that can't really be
> tested from user-space with the existing kernel selftests or libgpiod
> tests.
>
> Merging strategy: with an Ack from kunit maintainers, this can go
> through the GPIO tree for v7.2.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Pretty cool stuff! I wish I had the energy and grit to do the same
for pin control...
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

