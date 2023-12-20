Return-Path: <linux-gpio+bounces-1741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172681A27F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 16:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199871F25507
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 15:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058363FB0B;
	Wed, 20 Dec 2023 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W03/Qc6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA947F61
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5e54d40cca2so28342947b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703086092; x=1703690892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7gRsnGK/98vqBcsCXhR92alkXxNhTCIZpp/DaIxwxU=;
        b=W03/Qc6DiZ9M5AEqYCbf56BpRCY1qPSlkNH2IkrU2lC6zhIxQ3rHitPnk351jdBwp5
         zIz+FgtEM6Zt4HBwgGL2nT5dKWTdBS4ggVZp1RliG3Nplnb3s4LOc3+9jOST4cpiLDQB
         qSWQR1LmkSOvrJ973LuL22xik2cD9IroSPT199BhFBdotNP7ZfGdhRBprAK3herbLy62
         ZJe+utp/qyB3ReQkSOT5gV6D0uHd8cJLMfgCNY7TdcwQXvrTos62VnAl6eXYMPTJ0cju
         HW7w8pCkC8Hmp6m3rsV5MVqlyA/wuR8wUD6Q0OEnBd1s6VZ9H/a0f7G/McNQA0Ub+weg
         LMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703086092; x=1703690892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7gRsnGK/98vqBcsCXhR92alkXxNhTCIZpp/DaIxwxU=;
        b=Gvnoru+JheJ/vYAC/4/55lfiRfqClIICtI5q5FyxxvslyyqpcjbQb7ckk5OZkutigo
         wpmUEoE5oqIJ5wdoIzxpfM+uh0YeXHqQDwluYHzgQkpB/knD5yKYWSoyVDs+SAmTeuB1
         aEJYuoNRlV9ClBiCdn9EpkivLOfvh7CKoNHVBoWC6rV7ZxLDMIBEoQHRL4KpvnH5Keh3
         wtj6JY7rzWEzvqKRp43FXAvOMqhqXFrhmbbVgQH660d8WHiGJ5CaZ6fLRglE1Ty0sTdG
         gWB10rHj5/TCsoHv7nj9KghaYjcf1FAWqxI4IcTfH062ZVGW+NdMrnEmfizDOOzcoLu2
         sjWg==
X-Gm-Message-State: AOJu0YwsUt7tgK89mXzGkmYsblGxZ4aYHpZkXU9a26d6vjlLZ6WG198E
	2gv/rLEvF2Hw4eRDZOC718myrK28RLJAKUnjIyPixQ==
X-Google-Smtp-Source: AGHT+IHvLkJ6Yg8dTs7bidAxdL9xHex4/uIhS8hfLIfdr0GXHNzu4uRJv+qfme+slkFJoK416zFCj/8x8mLra8uNxak=
X-Received: by 2002:a25:ae1f:0:b0:dbc:d6ad:616c with SMTP id
 a31-20020a25ae1f000000b00dbcd6ad616cmr5779335ybj.24.1703086092356; Wed, 20
 Dec 2023 07:28:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219201102.41639-1-brgl@bgdev.pl> <ZYL0MWAQ-frYLnZq@smile.fi.intel.com>
In-Reply-To: <ZYL0MWAQ-frYLnZq@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 16:28:00 +0100
Message-ID: <CACRpkdZB-5DN5NYJNGheDJnNWRt8x4LwgOQpL4NDyX2JSn+_9g@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: remove extra_checks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 3:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Dec 19, 2023 at 09:11:02PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > extra_checks is only used in a few places. It also depends on
>
> > a non-standard DEBUG define one needs to add to the source file.
>
> Huh?!
>
> What then CONFIG_DEBUG_GPIO is about?

Yeah that is some helper DBrownell added because like me he could
never figure out how to pass -DDEBUG to a single file on the command
line and besides gpiolib is several files. I added the same to pinctrl
to get core debug messages.

I guess Bartosz means extra_checks is =3D=3D a non-standard DEBUG
define.

Yours,
Linus Walleij

