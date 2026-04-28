Return-Path: <linux-gpio+bounces-35691-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAgqOeeV8GmrVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35691-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:11:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E3E48363D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDFCF30BB0C0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674643F54A4;
	Tue, 28 Apr 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtnZOetv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB263EBF1F
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373338; cv=none; b=ZgkJwYE5evrDxpdFppv52TWQntfaV0CAug/XsETUP9BYr0ASw3zKoBPGC6ypxhR5qOccQaUYUCh5F4HQSZ4Fa3wgMKpoqr3YweGUfyPMT+hy6hRXzWzP42+6rQR8wLShbKXYs9cxhs90qYnE5pAeWml3E0COXYK1RATlUlgWwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373338; c=relaxed/simple;
	bh=zRRLxCTMFdXGHczu7lhZcXF7CCENkqKUh9uDDOxrXZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsLzPTJuHm2nrJq4XQXnh6XQpzmrNr+LCcj8e7FTrKt8WqzXjtzsJ8n3MplcOxTWEfZnWLwmUp8Z6ZIhYBEpXZXF7rGTIIu/jrPlykU2NGpCnnu2hXNG86c0H9Nm8tLXX+iHrw4VOqlqJ1aNM8L7kvtd/1qcDiRdUT5n6+gvTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtnZOetv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74CC2BCC9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373338;
	bh=zRRLxCTMFdXGHczu7lhZcXF7CCENkqKUh9uDDOxrXZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JtnZOetvlFS6qtORFdprF1g2YD3cl16GGsklOWk9R6hwUoiF4mPOfGg8SjchUjDUY
	 YE8tNvHSZSd61CPZDl9HODthjK8WGDX2463+x4w00sG//19j2ZWGaG+o8tP7rUOhUh
	 wfSy6wJmlC4y21kO3gzQroPIrHw/Vc8Vue3wlDK6z9WQbOBDfeU4hru7Nli1C3dK1N
	 7BHwzRSOfNwu/QOUUX6Sz9Fy9cLbVS6QjE67dV+H8LAJcVuZs0hwgMroMaXY46eNw8
	 GKuGREU9gjvzr9TgZC3iXJsJTHauOnYPSsOQ4XoxPNP+oeCu9JiNSPw6C40/KU1SX1
	 37IyBs2Ciie3w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38df1889fb9so109101161fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8nsqOLl2WCcSsJIKsFSO03lgb5KR7MZ8K4lJwIefIuDlzfEc9Z7XwosFJj16AZPCtwgpcVK7NsPRU@vger.kernel.org
X-Gm-Message-State: AOJu0YwfV5/skOirrMT10qBNnDGTAxE2nDnrkNVQYViF8U1oRBRVCIL9
	zC4vGxiRvYWTLkdk1xUMtlznq5UfA3nDQfer/k7pw0oYmOZv10DqfJMTOhAHn2ohgkFdNRSc1LF
	jKIixLsLXQzlp/ORSzfNaz7WkHxGIk5w=
X-Received: by 2002:a2e:a994:0:b0:38e:9277:6990 with SMTP id
 38308e7fff4ca-39241005c6dmr8960211fa.30.1777373336622; Tue, 28 Apr 2026
 03:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427061720.2393355-1-wenst@chromium.org>
In-Reply-To: <20260427061720.2393355-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:48:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjDozkjL-136ut4OsX5PoCe4aKrfXVyq0jtEOc4LX1dw@mail.gmail.com>
X-Gm-Features: AVHnY4IQ9pWQR3XwMVHEmg2y70n-2Cqf_AoJsV8Bvhx3LjreKPa329xly69LAug
Message-ID: <CAD++jLkjDozkjL-136ut4OsX5PoCe4aKrfXVyq0jtEOc4LX1dw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Directly modify registers
 to set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 84E3E48363D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35691-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email]

On Mon, Apr 27, 2026 at 8:17=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> Since the Mediatek hardware has separate clear/set registers, there is
> no risk of clobbering other bits like with a read-modify-write pattern.
> Switch to directly setting the GPIO direction register bits to avoid
> the mutex.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Here you need to at least delete the assignment of mtk_pmx_gpio_set_directi=
on()
from:

static const struct pinmux_ops mtk_pmx_ops =3D {
        .get_functions_count    =3D mtk_pmx_get_funcs_cnt,
        .get_function_name      =3D mtk_pmx_get_func_name,
        .get_function_groups    =3D mtk_pmx_get_func_groups,
        .set_mux                =3D mtk_pmx_set_mux,
        .gpio_set_direction     =3D mtk_pmx_gpio_set_direction,

^ Here, it should no longer be used, right?

Yours,
Linus Walleij

