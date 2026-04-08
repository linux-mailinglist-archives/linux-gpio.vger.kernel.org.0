Return-Path: <linux-gpio+bounces-34870-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI3nEssL1mlnAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34870-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:03:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7683B8B00
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC243300FEF6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 08:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C473C39B967;
	Wed,  8 Apr 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmXigSd7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EA37F749
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635385; cv=none; b=uOMg6OzH1Ed/nrLITO8XEYeTUS/GI5ZCQxiqgHPdoyzebCpVwTul7JMnnlJ8ovoYWVSs3eEKrBAc/tm55KIqpslU0EJgO8YxC0o3oyejvcS+pfekYJQQxtHrk7TT1pl8oMZF5DJhDq78OK1z+Tr3DIQ4eyhyPz2AbYQ+Z1mhInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635385; c=relaxed/simple;
	bh=q3m6wCafPPHnDhGN/jVfGwXg9ud8SIGXMM4cDcDzTb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gv5AVsIXAVi1yZLTkw/VZlyE93IBe9MfcIfChjGLD/XHuE/t2F7qb6cLiDE55Y7hhBbjU4xWFgP6jEJe7rU4zdjM4k+GcLcQ7KHQOmTEMYQ+KejKCxwqt1Dz6MBTK+nmxjMeLmEK3oMROhzmCV5WXp3X+XJ+nYfEtkkIrfykcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmXigSd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D02CC19425
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775635385;
	bh=q3m6wCafPPHnDhGN/jVfGwXg9ud8SIGXMM4cDcDzTb4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OmXigSd7dUjgYicAwaScNhN259Z7kjeTittgYtUSTjZUy8G+MSfxFsS5cOIA2WZwf
	 K7qW3zB6NxEYhY0BJJjvc/OKDsC2nfRZGP2t38wXsk4yDHsW2tOzTakg+uBElctxM5
	 U/W3SOKavtDuyoLb0zhgmsfBvVo10IzqtI+w+rrQ8kQgfMHSomAdW0pc3KZBPG+Xjy
	 ssAaEkbpmP8G9+FiPHDSDfQjM3yjEDE6DtZL/puKc2isV919jJsKpedzhXvqlaBBCR
	 9a8s+HUBw0BzW/DbmqySbLNDruNWiWtRDKlJGslm9eSQbZ13+gazDnuW3ysc1A87Eg
	 8xzpwviJPsHHg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7986e0553bdso58842487b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIisyUpvvbUWs4AEasjudLye87WNuuswpNzR8qNzOQHogTgvyMw0jpX7NUfdG9ZMnEJde7t/YwcPG5@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzaQ9oHzH/MoakYErDFQn24ildPUfgXjbO18qND4d4PcgNoWe
	mOXtTe9scUWorMkza7QJ+bB7U9Af1C0N0F1rFy37k1OMHfmY+l8hF0Rs6P2W978qZB19/8JEZK0
	j4HfuoQUOvoOOTW5EdXzbxTrio6J71lY=
X-Received: by 2002:a05:690c:6e84:b0:79a:1f7e:fca7 with SMTP id
 00721157ae682-7a4d2ff2407mr203983157b3.12.1775635384512; Wed, 08 Apr 2026
 01:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:02:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCGH1aOyprFpXEpo5G3pyDbGaxw+V1GyJjc89kx9kqQQ@mail.gmail.com>
X-Gm-Features: AQROBzAP4gjmXq6GtnmeMKyxAcxNOuzOxwPpSgs8d0UzMVk7Bb90YznRPcjpNSM
Message-ID: <CAD++jLmCGH1aOyprFpXEpo5G3pyDbGaxw+V1GyJjc89kx9kqQQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34870-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB7683B8B00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 6:39=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The original reason for this series is to make sure ti_ads7950_get()
> returns result in range [0, 1] or a negative error code to comply with
> gpiolib requirement.

This looks awesome. Thanks for all attention to detail and elegance.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

