Return-Path: <linux-gpio+bounces-11467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F89A128B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DFD31F22622
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB562141C0;
	Wed, 16 Oct 2024 19:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tl81W5mM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BC18870B
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107095; cv=none; b=lt6YrNeNr4V28kN3ZMzExUgvVJFUx05KKaHfApw6CLGZe192oAGcWpbKg9TxPU07Bk0rk7k66rO35oVvbmAejffLdPw+roMPI3kmwWl8jCt70m9R28xeUxas1mCeAZZv+l8Gc0XxQNtBm34HfN7oJbevD7yAXKyfk/AxtitaZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107095; c=relaxed/simple;
	bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zu1sBUkAVKkXV7ajB/lW1usYWuQMejSXNP55Puq/9UKM0Ocysbj/dIZTiwNKUGWnDwZrqoAoCJQzByhmbqRF9tsmhps5XP1ukd+CLDwNnudT8I6sw3APBuP3IDNLDG7ez23GpvKV4Cy7ckuOCt+eI0jJF+ZWL+RQugZkbJzllIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tl81W5mM; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3a97a6010so3496237b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729107093; x=1729711893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
        b=Tl81W5mMy6m1ze5VpvNgYl4cBEZKK6jA/KEXvPLODB/TtoexjHpEVYIfT+8qyPm1Ga
         0oj6Y2rlCn5/VdzFQ05oW8c0s5KjdBPl73qKsJSrG/qeMEdGqw9I8JQjpy4Nf+WTzslX
         t2mZXiWGnbSM+qFhNcsglWGPIVx+5nVbAy527IWKQrX05C0pjP8x23MHSpfPOgZ8oq5Y
         GNyS0NACoVzs8Nv5cuybjycNCjEY9h0xcFymmeBVRQTxAof56Ubln8RhY8+olQaP3vpk
         xar3Rm0/QxeyTV5h2pvtUF9n/+J7iT9lDW8O1TxbfJcdCOOueUGBwlZ8KRGOn8km+dTG
         moqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107093; x=1729711893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
        b=avq/Jxvw6gc1+YvXUVYnK7cmpo3heJb34NdLDeqjqYkHv1t8BeAfUZQ9Vf9H9fG05r
         4PAeUfmn/0bl/XkZg9zb8gyZtZ0ftYPdt6lVvM/NIDw91QsQV4KFzXLF8ct2YZQlMls2
         R8nhTSEsrhLdB4wY2757a3SRKKyrtiD0DWUT2PyN72cFw0QnwriJd+2YM540IsOJc7q6
         lNn8FFZYsmMjGqbhLIGWUjyxRozIlmCUY+3mnzRr+Ukqq3x9rvJxVsk3d+Pt0qfdv0iv
         yIIo2LZT2rMqer6Gcyw0OgjpS5mVVXJMzED3AAD1G8f7Ufn19B1cZbLkFbdbKPSNiBcf
         OEww==
X-Forwarded-Encrypted: i=1; AJvYcCWqkDMBozQgU0wHtWrlalwh9wV1KWrsEpY7W06Rpc6yQvqIi1EpSlZHUIL6pJeao8pfdCuaSZPvUK4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1guQx8fRszr2A8lLdIAeApS7Wa7XSo3pUbV12SuTKGQAcQzrk
	glo9sYzKsuGRZUplYbThV/o5QUqkoXCifHGdS16P6F5zW8QbV12NUueOJ3y146SPg/hSWHMI0V7
	4A+C52Mqsos9iagTPiRE3362SfLt+aV8JpzYw7A==
X-Google-Smtp-Source: AGHT+IEfazOyIOYKe6O7/B0E/863g1TCnOGYzblSEZ50USkJojuTTGw6xgDiEhcc3FeeiHPALgKRQd4IOs6OQp4o8tI=
X-Received: by 2002:a05:690c:6288:b0:6e3:410e:bb84 with SMTP id
 00721157ae682-6e3d40cb773mr54288407b3.20.1729107093430; Wed, 16 Oct 2024
 12:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016155655.334518-1-colin.i.king@gmail.com>
In-Reply-To: <20241016155655.334518-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:31:21 +0200
Message-ID: <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
To: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:56=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The initialization of muxtype deferences pointer func before func
> is sanity checked with a null pointer check, hence we have a null
> pointer deference issue. Fix this by only deferencing func with
> the assignment to muxtype after func has been null pointer checked.
>
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied, added Reported-by Kees since he mailed about this too.

Yours,
Linus Walleij

