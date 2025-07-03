Return-Path: <linux-gpio+bounces-22768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ABCAF82F2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 23:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153565A0943
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 21:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24FF2989B2;
	Thu,  3 Jul 2025 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWyqy1IB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDE23909C
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 21:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579760; cv=none; b=OqYp8UpiQSaczZLWeTSftxjKbMg9gbeBjlilsEyCInxoRP4ysK0IKbJv4zffeBg8jbCg+KgAU5rhaVXwGqQ5oWGXag0yiwiQepKP/CnCCwv4cQWNa8GEMNTwHgDQEMeqOXr1t53R7N1Ag0f4LwDmr6eEQuPIrbjk4w4rLZ2/wvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579760; c=relaxed/simple;
	bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgMNXe5uKa+aL7ZDh6k6z/LJ/1pBmaQjZjS6TDRl/aWHY584yHdwjz15wERyJgNXyJyCekq78KAGWycCmi1NxqcpzSlDSq7e2YibvlzV3MeDmb77xoiM0CZtORS3NtoRkm4T4Pbg5Y4BVe0OXU6leUIGLGh110gki1NkTIu4nE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWyqy1IB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32adebb15c5so2739481fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579757; x=1752184557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=bWyqy1IBCzRXd2OHO7XovA2Oxu+XZE2bCT5SzIaPA2UEjDiZal6gMhXBU5cVNLIyzK
         R96ovz7e5B41iyeJ6fwBMfRg3FKWGvor1RkZe5DLD3Ky0UfJe2ZZxdREYlSh9Mk6kSb+
         41Lx0zrFd9hZmiT5mxZ79rKQB4Tm7lixfmEGO375L2pKK5ZuTBxauQ7coFhrytSi2568
         UX58opaRHQPy+Zx0i18uVjXh0vThBXv+qcGbV6+kethHeRgUY4/QR2BuMqNFFkZr08cq
         WCSGAK7Gf3bYdS6VjhlzG9AP4hJt6eYYUJ4MisKBbNZ+OEU+/uN1thDuhF7Mty4O5XB1
         uavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579757; x=1752184557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=boPBNGkGYTH9XOB21kDJJ1LxDXGdg4CBPoXjU2MyujXXblGcDWl4uyy1tKDk6fdmLp
         8iCsNm9G+gtT8wPfyby9OTDf4DZE/5sHzRzdKfatOGUoS0gBYgwEHT0bzkqm+PUexZdx
         uUbKTc2tfX9s9/t7PzidyRaiRvf7DcH5P7GtMqEyfr2aUNukrP83vxJ0GALdfbSgXq28
         k5a0ecx6poRdmcejVmOYZhDaSXTOlmUzFODAHluw4XF93jzQ/u1cbrTUF1vlNvKOx6R1
         AJQS9+/PvascLjeYZu5hfIKlGJVhwxBmG7z5Vc0FiaTxhnLjVCiztP1CwK95UAxS+zAu
         GgRw==
X-Forwarded-Encrypted: i=1; AJvYcCWXk5y+BjQTKODXvSjkGR8CcB3xsm+cK+Gghbup+jwx4CBHbq75E0pPj1qRODQlEYVteCng6YzTTYtj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1PeLa/DzhzsPVP3YjlgS0sWoZrb+bM1Gm/aPeiv5os8Qg9GJ8
	XSB/YIvDeDvCbnC02bTHKsLpDa6oT75n/rxBspTH/Kl2RIympibPnqxf4wkbDynvR5rIw/3FufE
	pIs5uu0uOSurlDibPHnQE8lXGtLdvbK5mL08gSt3Vpw==
X-Gm-Gg: ASbGncuN9XXfowQEZM0UAawq6pj3ThawarsnyXETXpJ72jrDKSt5dNckZvPxl5hzIYn
	k94pQnNCzqaaVrJ5bvcU4v/L4qi9SYt9QKkxsIKh07h4CHXLokhXiOcQ2x1ncgGdAEbDCF5HLBC
	Iby8PvBV1agNSPhOiitwk33Lswy896CREyMG5ahHYnV70=
X-Google-Smtp-Source: AGHT+IHaNTjaTi4rRrNiknGoZhKdAy0nR6vSTWwutP5sj+WgtzM1iPq+I6faszK16by8wPiLXBJSSCeRTyl3tRP9WBs=
X-Received: by 2002:a2e:a9a0:0:b0:32a:8153:6934 with SMTP id
 38308e7fff4ca-32e5a4b393bmr565651fa.1.1751579756933; Thu, 03 Jul 2025
 14:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:46 +0200
X-Gm-Features: Ac12FXyJ5knyp1mOJyZQmth8ooUCQJdl18NRhMK4RYZjhZxWH_hhFCTHLqF6V_M
Message-ID: <CACRpkdZ7B7FZtU6a+n8qcvNhhuqhzeZ=jfs+xQPqAWLa5n2LAw@mail.gmail.com>
Subject: Re: [PATCH 12/12] gpio: tc3589x: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Shevchenko <andy@kernel.org>, 
	Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

