Return-Path: <linux-gpio+bounces-2173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15482C2B1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921B41F21AE3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF416EB46;
	Fri, 12 Jan 2024 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNINrZaS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A706EB45
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e69b314e0so751735e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 07:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705073183; x=1705677983; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3hL1JDBB0djuFsZpVk6YXbkh1dr+5OryswpqKszv3Q=;
        b=SNINrZaSGdKWmH+ZVZr9fO97QNPPhCtOP8HJvU3AGD+CVVWHNvF2X9s/Ps42qKwfEG
         Ebsa3ca3phnjp4xgK8m5uqCA3B2xxlR27n5i1PT0wGQMKej8iVAvB2q8/y6Zch9ZfJy8
         bxMOWzLPcP3DcoN56uO6faR/oZ2i0D1uTXERQNZLEiEnmoL083vCno07uq+In2ywKCY9
         JJxpPu2ndu7Pq5D7BsWG4MKlCh3+oXfkFxhDkBX0utjm+GZKB6x83oYXRB9DzeYYepH9
         pxad/CtpnxXWynQ1pDNTc0KQV7V0bW9EeuaM/bJJA0HZT/c84ZH1Y4NgAIYn88hhagdh
         ac0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705073183; x=1705677983;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3hL1JDBB0djuFsZpVk6YXbkh1dr+5OryswpqKszv3Q=;
        b=b3H+WhBIEKfkAa3d9/WGa3BeSjkPK3EI5w9pZt+bjJQGK12hifgaU15RJzIe7lTupA
         WHWCpaJ3sOjiaFD5rpzmyKKInn3uLyc3ELWQt5usjqIBg3wEgZBAYn8M5ILoYH0Vd8h5
         p79m7iKFOfYrB3l1vpkGX8ARLnkSQ34yG6L3h44XSd+5MeIkCdT1dUscx5V4jNQedErY
         BjXcCrKjAJZUwdUaayk6L8MYLfvKK7GAwY+6hrjTPxFa9TF3s/2eKDsdP84PVJ2VfBL7
         +hYYQg/ZqHAlkIkWsAUPWZbpD4+U3rLxno0UEsm/8T7USV2B2uASCr2X/jbZQXlXENfq
         T2/w==
X-Gm-Message-State: AOJu0Yxt2UWVYTTwGepxjYATtIIQM70NxH3L21+Ips78dLBE9/rC5ocK
	Q4u1UcIPHF7Es6GIGQqvMqYFa+7tYid/mEHomp5aQCZt250=
X-Google-Smtp-Source: AGHT+IE9oXezcRpt0sMa0TxauVxKt3Zj8Ym8Mr3wRKRiXGn2XIp/F0FKbThc5R6JAwRpLDOD3THAJQ==
X-Received: by 2002:a05:600c:3510:b0:40e:4833:8141 with SMTP id h16-20020a05600c351000b0040e48338141mr945146wmq.4.1705073182856;
        Fri, 12 Jan 2024 07:26:22 -0800 (PST)
Received: from localhost ([2001:9e8:d586:b800::f39])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040e3b12052bsm10130247wmg.5.2024.01.12.07.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 07:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jan 2024 16:26:21 +0100
Message-Id: <CYCTZY7PE9TQ.1SJWALQUCVPAC@ablu-work>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Kent Gibson" <warthog618@gmail.com>, "Phil
 Howard" <phil@gadgetoid.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240112150546.13891-1-brgl@bgdev.pl>
In-Reply-To: <20240112150546.13891-1-brgl@bgdev.pl>

On Fri Jan 12, 2024 at 4:05 PM CET, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The github page over at https://github.com/brgl/libgpiod has been reopene=
d
> for bug reports and discussions. Add a link and a mention to the README
> file.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  README | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/README b/README
> index 69128dc..41237f4 100644
> --- a/README
> +++ b/README
> @@ -294,9 +294,14 @@ Those also provide examples of the expected formatti=
ng.
>  Allow some time for your e-mail to propagate to the list before retrying=
,
>  particularly if there are no e-mails in the list more recent than yours.
> =20
> +There is a libgpiod github page[7] available for reporting bugs and gene=
ral
> +discussions and although PRs can be submitted and discussed, upstreambou=
nd
> +patches need to go through the mailing list nevertheless.
> +
>  [1] https://github.com/kward/shunit2
>  [2] http://vger.kernel.org/vger-lists.html#linux-gpio
>  [3] https://docs.kernel.org/process/email-clients.html
>  [4] https://docs.kernel.org/process/coding-style.html
>  [5] https://docs.kernel.org/process/submitting-patches.html
>  [6] https://lore.kernel.org/linux-gpio/
> +[7] https://github.com/brgl/libgpiod

The repo only seems to be configured for PRs. Issues and discussions are
disabled for the public.

- Erik


