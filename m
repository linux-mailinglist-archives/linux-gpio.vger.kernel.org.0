Return-Path: <linux-gpio+bounces-1309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB780EBE0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 13:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56DCC1F21379
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677865952F;
	Tue, 12 Dec 2023 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnM0wMWV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0239EEA
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 04:32:57 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d34f8f211fso55576557b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384376; x=1702989176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4iQ3WOkHEblQ3xu0B39kuBfSgqaQxZyrXhGlk5rPik=;
        b=AnM0wMWVUuiYWw4wNu97nWbdaoKXFgBgbLDt9rxZkcVyKxx9E6Mi/Zkvh97AoyrSEH
         ZJlLfgOS43VfjCmDOir0qxdYfTG8wrvuvubl+cF2tnucGD5QPAHntUo5UYLgbVWI7xaK
         lB44IDsb+/U2CizSq50gyN9mLevxwuc4Qp9KYSViTPWn7ntCHME8zv9gOLh9wnge/Kg4
         4Y8jQmtl6cZT3K9gxt8b+BV4tQFHZsnunqpLosjQJmH2m3ZElao+gAZnFYgGR9bKwHzp
         eO+9VUxIbtoTqhf6VD/0tgcKdZbRnQlLHE8wz6KvRaAGwJUdZUQWCPfWieFnmCPkF+gz
         Xm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384376; x=1702989176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4iQ3WOkHEblQ3xu0B39kuBfSgqaQxZyrXhGlk5rPik=;
        b=DvJ1j9eQym9FLgYujEukWo/o7OHAXr/KAiFz5Bltrkn+9byx/L+rkmKMe+SPwOxYor
         jmZbcsrdfth6KR7ckoeDWvFUdLsrlh+Gc7uJ0ebeIEhtIBOrIqeqmR2UqS+PimXNIu8M
         1HURW48r9GkW+jMB/qcYQCtPESoPif+OcFmjRSg7hI/q9GKb2TAkZ5dPP2CQxtGwduzQ
         oT8w5zJ0UPqoubHCMwIvfX7/5k9tDDZoCxVHlLCJfELU1Q9shvM+oS0HkXwMbjG9+/Ic
         xorx2kdyaCe8ukV00VNwK5/VRnaHV+NpJXlzUPb/RkHtZhEl9HC/P02ZaShCLZeJfzen
         THSw==
X-Gm-Message-State: AOJu0Yx37/wirCRviJrY4pmzD7kT5b05K0oKXBG2FnivxFyq1HFeOoJK
	hfY50dd2bIlUi9D6aD5gXcQo242f/J3IWnhFRkEfyvKXlHyQqF5F
X-Google-Smtp-Source: AGHT+IFn301SXBawdjYt+pES8aneAtb0/wEInppLQePe1QNM3JJJlA9BRCJC1T5FkpIF2yn8Fy7ha1WrAdPqkOpdtg8=
X-Received: by 2002:a0d:cc8a:0:b0:5b3:1d71:6df7 with SMTP id
 o132-20020a0dcc8a000000b005b31d716df7mr4619087ywd.22.1702384376192; Tue, 12
 Dec 2023 04:32:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212105501.16347-1-brgl@bgdev.pl>
In-Reply-To: <20231212105501.16347-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 13:32:44 +0100
Message-ID: <CACRpkdaVLPbpKGt=Oa13GVgvz+1CEONbAGHwvDJb0L96cS7CZg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: allocate memory atomically with a spinlock held
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 11:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We will eventually switch to protecting the GPIO descriptors with a mutex
> but until then, we need to allocate memory for the label copy atomically
> while we're holding the global spinlock.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-gpio/62588146-eed6-42f7-ba26-160226=
b109fe@moroto.mountain/T/#u
> Fixes: f8d05e276b45 ("gpiolib: remove gpiochip_is_requested()")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Makes sense.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

