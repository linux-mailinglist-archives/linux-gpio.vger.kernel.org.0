Return-Path: <linux-gpio+bounces-31885-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OofD1lJl2m2wQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31885-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:33:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 999021613C8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D76243013699
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC77D34F481;
	Thu, 19 Feb 2026 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJv3SbhR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51334B1B6
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522384; cv=none; b=pH3wQG78alSIyMNqtR5T9VfNGeER3DVjfslqguCl2lj2xLcYb0ECVSZxl4c/0cQnBNgiij23Sn0KNzZL8i2qOHQfkoh+w+hz/StqGWydd/6eqRnQrVR4wDO5/raakWyULjp7eeJ8BN0yZop6wke+K9j78e/E+bFsbmxh5FH0FmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522384; c=relaxed/simple;
	bh=mhfH1YCxY4h0vniwJRFdrAU2DJHY0+0BRZD/Lx5t9zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbUxq1f7nrD/cBXa0WS8LstPzQA2xMcT8vTyVSix4hUJZRvYtIagEqghhDtl4sDfAq9Ku0baZ681alrM3BqD/S+/LHUu0tSyYhti96KPpz1PUxNToTKCPZqME1zPfxF9a0slfkW7DNL7e0+pZrv3Idk8Zg/MMLG9TLVzNbAW8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJv3SbhR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CD8C2BCB2
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771522384;
	bh=mhfH1YCxY4h0vniwJRFdrAU2DJHY0+0BRZD/Lx5t9zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DJv3SbhR3VQY4Qa7cqlO0VA8+868gZJl44PMEOvPAyEnUVQsrXftOeq6J04hpA+6B
	 AHZoyJXoIWkFpk/7bAaW2olFRmMN3nMyafbIFfKrIi/cqsAPtG10291Jf/tMDvUJYF
	 yLtT+L7IAAFnlqHoqpz7W3qvR6M5683/RGk0U5LiXjixSVJCeh/KBvq11l5iy03H2m
	 HS8mcm1ja5NV6lXgI6WocO52/8KlmhHPB/Z9SvDuOnfJsg0b6kpTP/zPC5aCcLqEos
	 +vMBCdoNhRIaeEHwCuML/hOvsFeBKhnp1ygbBWViU2L5qzMaERfQqyiRftgpidovLs
	 Cyvml8JCdXd+w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7980ca83937so5652437b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpAMLN3ZmCGs4hJL+9rQAJILlaa1Trpvh38v8TblC0EQjUseQPDWDSEIjdNjK2gy2oe7S1++Ngs8i4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0DCKuoUV6DU3uzevSq88Je/tsRz+fxi5/6xRGLKfVgD7a0z4
	hfoS/KDpE2Dy6r3Ll7fIur+3eVO2cHOqISqGz8iMa8XOFgohiSHtRSJvSBFYQsQnxBTpjcateb0
	THfJ2g+SI/Y4P3wJJU7VJqkMqDYnQJo8=
X-Received: by 2002:a05:690c:368a:b0:78f:f3c6:f303 with SMTP id
 00721157ae682-797f7351bd4mr47545367b3.38.1771522383649; Thu, 19 Feb 2026
 09:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYmtq2CAWhMo1Eb@google.com>
In-Reply-To: <aZYmtq2CAWhMo1Eb@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:32:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLnW+_7s-y+BhG1RsNhhRHV2Y3GQfDYpkrzkHuXSrgvYEQ@mail.gmail.com>
X-Gm-Features: AaiRm53McWvIwdXvg3dKOb5rdu922CkUzFQUckWM45T2G2qvJWiaqZs5Q-YanTY
Message-ID: <CAD++jLnW+_7s-y+BhG1RsNhhRHV2Y3GQfDYpkrzkHuXSrgvYEQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9286: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31885-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 999021613C8
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:53=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by max9286_gpiochip_get() is
> normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

