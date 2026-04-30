Return-Path: <linux-gpio+bounces-35911-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA+yNt5G82kMzAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35911-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:11:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F54A29CF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 281FA30097CD
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B471401A2E;
	Thu, 30 Apr 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXFyrHDV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA303FFADC
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550909; cv=none; b=txIWvO3VQszK47P5RzQKTh65lRXQ2s/cuQLo4kenyR9/SUQgS4hww2hlmc1+Bbq052g9tXWIoBqdhj+A+J9eTaW37n/B05etBwZaTLC/cnjy99AJ1bhaUThM9aVihfhg3YZvWf+pYF+rwpgsqWUKrlLbZtRjHHtMrPq3R8nJkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550909; c=relaxed/simple;
	bh=Z0SrwckcmMEhYsq872vQn8z1xxHWcTPFIyYdkrVQ7t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b78vAnvyJZ8TMvH6Hqm0EGu2PQjGixnx0DhuQauS+EVFco2W2juEW7a+qUT3bxHQWd/BFH9FSK+aaH+Z9j/+NIE5aMFaBMCCztMLefLEzpSpcDZu3uJ9HRFM+NQVzIJWBxGQK5ntBqlHGmwXSx+Qro34Ru9CEek3OajpLnnRKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXFyrHDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7025C2BCB3
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550908;
	bh=Z0SrwckcmMEhYsq872vQn8z1xxHWcTPFIyYdkrVQ7t0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mXFyrHDVW4CzmTPPXSkWX6ArMnD83/YLIYYNUXvi6hTeGxU8w1aZEMreLS+LlFeuz
	 JNjSrJxdsoUruqZyDNVoF3x8r6vW7lWkoS37KDkqf2xZjtgLEeWHqGBxj9PRKj71DI
	 rNpIML4FsvMecBomBPQ+nvWg1W7brrNDYjRr13tkrnqHvzwQL1R2CLPqAW5lK9KdC0
	 74Fajb3bOmjJZPQSVV/E14I1CmAhXqUd1jAjcYvuYH2xTOnjqVIv+cVIWAjS29k5/j
	 fvbV6zUeC2YLdDNeF/8z38rzq3cIoXkqmIwpT4vQCbVBx9pRUus60EfwYcVweVJiRX
	 +XwMJ0hyNuEYg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso934513e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pG6Nxo3aUSnqHy9UG7FE2BmOhB7PZLVKuBCd+ggWMGa6oF5kzoBPGEpoY+reSSOEvsD+n1koY1OGB@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKFs06uBpsQ24Bifm/RORfrXxemxVNUiK26DSVeViyKOA7Hyf
	HWBMGGL7JsygShwiKKlqLjYbm8H19dG7cS1Y2SbgqrI47IARBAAESqPoGTJC2kn9NaEfMlltMXA
	wDumBHNehOf44FPyM/vOEsBFN+b2y+xQ=
X-Received: by 2002:a05:6512:1394:b0:5a4:1798:31ba with SMTP id
 2adb3069b0e04-5a8522d4e93mr847311e87.21.1777550907436; Thu, 30 Apr 2026
 05:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <20260429035134.1023330-2-happycpu@gmail.com>
In-Reply-To: <20260429035134.1023330-2-happycpu@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 14:08:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLk43uWNojmajzKUGm-UzP8Z7qxC2nwMrRE6=WVbTt=-Ww@mail.gmail.com>
X-Gm-Features: AVHnY4I0ki9rGDzmVa6bSPlog4a2U1FZNKcs6D7nH0y5brqxdc8g0KW-DN9bc0E
Message-ID: <CAD++jLk43uWNojmajzKUGm-UzP8Z7qxC2nwMrRE6=WVbTt=-Ww@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: fairchild,74hc595: add
 lines-initial-states property
To: Chanhong Jung <happycpu@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5C6F54A29CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-35911-lists,linux-gpio=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 5:51=E2=80=AFAM Chanhong Jung <happycpu@gmail.com> =
wrote:

> The 74HC595 and 74LVC594 shift registers latch their outputs until the
> first serial write, so boards that depend on a specific power-on pattern
> (for example active-low indicators, reset lines, or other signals that
> must come up non-zero) have no way to express that today: the Linux
> driver always writes zeros from its zero-initialised buffer during
> probe.
>
> Document support for the existing lines-initial-states bitmask, already
> defined for nxp,pcf8575, so the same convention covers this output-only
> device. Bit N corresponds to GPIO line N. Because the 74HC595/74LVC594
> family is push-pull output only (no input mode, no high-impedance state
> under software control), bit=3D0 drives the line low and bit=3D1 drives i=
t
> high; this differs from nxp,pcf8575, where the 0/1 polarity reflects the
> quasi-bidirectional nature of that part.
>
> The bitmask covers up to 32 lines, which fits the typical 1-4 chip
> cascades that appear in tree. Should longer chains require seeding in
> the future, the property can be extended to a uint32-array without
> breaking the bit-N-equals-line-N convention.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>

My old email but who cares.

> Signed-off-by: Chanhong Jung <happycpu@gmail.com>

This works for me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

