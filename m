Return-Path: <linux-gpio+bounces-1089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948A8082EE
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA9B1C21987
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D862E41D;
	Thu,  7 Dec 2023 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xvgTdpFL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E9D122
	for <linux-gpio@vger.kernel.org>; Thu,  7 Dec 2023 00:24:45 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-464dcdaa83bso108877137.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2023 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701937484; x=1702542284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMcgPtxedE6RMJpz2dDYWTEHuZvSSox1/TA44eUbS6E=;
        b=xvgTdpFLITonXaZaCGxoBpNPhwkqXM87THzNhuKUbLEy1FtqbzNB4+CsS0r4Zisac/
         ViQh2c9GC5PXde9iel/fV9e49wpkFUm0yBXuNQWYcL44xPWcTk2biOxQPrxBPfGc0uV6
         m5lsdVsw2qZmYluxbEGikI+B4h1GX4zohGRB8eVC13PUIAbNLyoJBenjesbpL3XFzyAx
         4lM2bgpdsx7kRWBBF+2IKldgcoqLuF7eVg7ZBFB/TUROjBI5yxR9PW3fIOjGgClbqY6s
         onw5W7+nk/xU3hFaVxmfiC26bNFYoSAp75TH0ogupgkf/qdKoFd4LUWjq1QGB+PYc/oo
         TjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701937484; x=1702542284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMcgPtxedE6RMJpz2dDYWTEHuZvSSox1/TA44eUbS6E=;
        b=jYUt8dZKM48vG/c+C48IRiQDmeheYfu4Tj8JirWClvXQzx4NtewFFjVKrmPUSk+/7P
         lUYv5xKLnCJ4Howolxqiar+JCCE6FxCWaQTfkVvqY772logrQ/pQRZov4z/qxarTzAxV
         2PyoE+LdRr5Vs85vFHUkzm3KMrlcmq5dRNtmaJquAecH9swSULu7rOAPIjxoCevypQHv
         K8jPYbeH41ykc2xAjGZ7Id72V8ai4bDdqRR1MAxyAuOC55KV0xO3WtEYw3U6KFhCgY/7
         fnvdsYJGB+GdxllQELf3CYuavbcb362P1rrULrZmrGFuEGL0C7Ho4kINjI628LnYki1E
         EVLg==
X-Gm-Message-State: AOJu0YyrULiLF6QrMhuqrAtD7Lzo8oRTLgNj4qX65icDoGyftf4cKedx
	YvYLvXqIXFMBNnsPF03f6YKuwLiEVClspSf89bM4AQ==
X-Google-Smtp-Source: AGHT+IEZflt6LGcPeoXvYp4U050gUi6Al3p5Q8rF1gVNp9yJ4fO2/kBMQx2FxV0uSx5HLUQFyjVCnvYa+MWpjW0vb58=
X-Received: by 2002:a67:f708:0:b0:464:8c0f:2ab7 with SMTP id
 m8-20020a67f708000000b004648c0f2ab7mr1364976vso.14.1701937484627; Thu, 07 Dec
 2023 00:24:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206030523.302-1-rdunlap@infradead.org>
In-Reply-To: <20231206030523.302-1-rdunlap@infradead.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 Dec 2023 09:24:33 +0100
Message-ID: <CAMRc=MenMowQVw70XXpKW3F99Pu4T77FghvsUEPZxDGz6jMh1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: max730x: don't use kernel-doc marker for regular comment
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 4:05=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Use a common C comment (/*) instead of kernel-doc notation to prevent
> warnings from scripts/kernel-doc.
>
> gpio-max730x.c:3: warning: This comment starts with '/**', but isn't a ke=
rnel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> gpio-max730x.c:3: warning: missing initial short description on line:
>  * Copyright (C) 2006 Juergen Beisert, Pengutronix
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  drivers/gpio/gpio-max730x.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -- a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
> --- a/drivers/gpio/gpio-max730x.c
> +++ b/drivers/gpio/gpio-max730x.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2006 Juergen Beisert, Pengutronix
>   * Copyright (C) 2008 Guennadi Liakhovetski, Pengutronix
>   * Copyright (C) 2009 Wolfram Sang, Pengutronix

Applied, thanks!

Bart

