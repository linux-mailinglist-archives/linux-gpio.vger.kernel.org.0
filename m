Return-Path: <linux-gpio+bounces-36120-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KxGDwa4+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36120-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:27:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB64C9A78
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E0D73023530
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A36031E82B;
	Tue,  5 May 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqiatuw+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F231F985
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973186; cv=none; b=Hc3keRndWSWkZWSLElUwX/ZmGONJpPNPqSoxz9/ns9S1HDZGvhV/NoQzgWXs6o9iot/84DTWahG8+X18RSeDsNt0NbJdyDQST8BmdTHycbMFCy2oorLsl6bhC5KqSyOrKe7uee4LmFv+81PKCA/az0/kvVnZDKiIasSyDzH6dwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973186; c=relaxed/simple;
	bh=BiETUYGBdA6U6OoG8HOJZeeTR5ZTz0XpLfvjy4A7y8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb6KIPgYsYKHuNPpBo8FL5CCgvt9zaWJuGRdm3UY3n+fNND5SZk/oIJy1kRzTFbRkxLxLdDQPeMz931iHm5GJnEJfDxKENrHAcEKFLx+D8oVmVy6P2qBjVVZYaVXQ1RTWGgiVFHigz44I7t8ofUYPiyQMxVRsnzQ6MSt6JGROiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqiatuw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CF1C2BCB9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973186;
	bh=BiETUYGBdA6U6OoG8HOJZeeTR5ZTz0XpLfvjy4A7y8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bqiatuw+F31Yuyoyo8LoEyVfRW3HPwHTDRebp1rK4BMrtJwqiA/ehvA6BeODAu+bt
	 Fh5S9NOONoE2eOGNNiOsU0Mtv+sSZxpix2vGFIAXFvTlOGJkXUA8KWA8Sx/EwqSkDW
	 R0+EwFg/rqq0v34ez6QlHT/ciTnOwE4Q857yVeIznIU9uD9K/bQQnxKmRogHYVSrdz
	 P98VKbcN/5GnBX0hBG5VHALMEHfI95rMmAAQ89K8CXwWEkjN+j66d6y+15g0FnRyD9
	 MOZyGFxQxe7BaPMbtajV4taehBXjgHEjL2H+T9Q0p6sOaCDByrIsULDgqwxhKs7NG6
	 aNpUu3y/fHm+A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so3822793e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4KrYVKrqL83Ak7nvGt77nUhZ6wgwOwVrMksjH5MVHBneZkXl9zmzRG+s0oosnFtDGkA7exQ7y9+sS@vger.kernel.org
X-Gm-Message-State: AOJu0YzixT29YOgqbe5zt7Q40k5jzgRUPR2b/TTHkpsLbZtBoSfWRbRg
	FfDjSqHDk+IY5r6LKp2x219A+GjDS4V+xOdzu4J0fa3JSPnnJkLmIvf4VG4ZCG2vwYhtaXdvLoP
	GMd0bkiLUdsgkbAB+fwmJMthlw2A9W+0=
X-Received: by 2002:a05:6512:3a83:b0:5a4:1a2:1d39 with SMTP id
 2adb3069b0e04-5a862ebe3a4mr4549164e87.6.1777973184715; Tue, 05 May 2026
 02:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
In-Reply-To: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:26:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLki-QEVAGwO5YfYAeVWs+Ey1WmFY-+XNkn_BA+6T7u6WA@mail.gmail.com>
X-Gm-Features: AVHnY4JN0IoEyvASti40bogeQWlWZiOgk0WDse555_qDzC-5oeg4FV2OdHIN3wY
Message-ID: <CAD++jLki-QEVAGwO5YfYAeVWs+Ey1WmFY-+XNkn_BA+6T7u6WA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: fix regulator leak in sunxi_pmx_request()
 error path
To: Felix Gu <ustc.gu@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E0EB64C9A78
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36120-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

On Mon, May 4, 2026 at 4:53=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> In the error path of sunxi_pmx_request(), the code calls
> regulator_put(s_reg->regulator) to release the regulator. However,
> s_reg->regulator is only assigned after a successful regulator_enable().
> This causes a memory leak: the regulator obtained via regulator_get()
> is never properly released when regulator_enable() fails.
>
> Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator=
 handling")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied as nonurgent fix!

Yours,
Linus Walleij

