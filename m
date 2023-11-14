Return-Path: <linux-gpio+bounces-103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 796567EB109
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FF821C20506
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA2F405C3;
	Tue, 14 Nov 2023 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGfl/YPk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57C405C0
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:43:18 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA811A1
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:43:17 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5c08c47c055so43557117b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699969396; x=1700574196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9I1+HuMjUOXRka8oYccWC1sMj8od0MqtKuun6lk2Gk=;
        b=uGfl/YPkEfMjZMYLIB1JYHwyMWDbX+7Moj6UkcY5WctHf4vK6jBsJlRC/P8B0wXK6P
         +n3GEnKShGHX4sHXuSvEVnV1oZtQ/QMNJHdci++o34sFJZfvzhP4NP75CKYpDpaDp8DT
         KrJMynCOsZQ/WsJMeXK4WLzO8UW04s+l9q9hXvDBtJr648Ts9Hy3AZEq+zJT7EjzbKmL
         P6brX/D8EoNnJyDnyxN5gcr4RuHNO/x/Xt0OwgF3xWGj7kLmw5y0xqsJtXViBxfn4V04
         Zyntpo77Vppx/zgE/l9JAdueaugid0jSnRJnHx/VT3wYlPkAz8d2sWQ009xpvsRFVU1o
         +Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969396; x=1700574196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9I1+HuMjUOXRka8oYccWC1sMj8od0MqtKuun6lk2Gk=;
        b=HWiGuS81xbVA3sgxrmJvJ16rnsuZkJKOCLswqUhFS/S6L5w1EXo6iyuZ/ZdAjDNVhE
         tK/m6IlrTld/4/Hge0gsHQrc05dwYlfgJlzGDkZYgK7fcH4OQD+u69UXZe4V7wJvjSFI
         3fLZT90ZLx8HGqnjQhYkYxUjTBeuwUMjkJHDzGoTtSGpI9h5l277q5dJTeZQw7pHvGtO
         DnVJc/6wv8KX3NnONE+tMobgN+P4kt/HT3yUEOQ6feNMor0TRest5X2WEeyEi0ilf+6H
         i1fLg3oR+71+KP6t12sDE5IWXCWKErogde3a2nV3Ap2q1m1MgrC3imV/M79aHj7u9xvi
         UQBQ==
X-Gm-Message-State: AOJu0YwG9talmbstKebvmRSQ5Qba4ZVO9RKf32tg2j993KaGkRQclCro
	9dyNEORQ9J5pMBT+4N91RSD5Rb2ktMlA2/BoJwcjew==
X-Google-Smtp-Source: AGHT+IETVNVRx+UHRWTMbFT8MvR2FR1FnRXu1s74l+weM1l/KrAH5OgSnaA8wp+8GfGDd6aNNN115dmrpYwW1pLZt5o=
X-Received: by 2002:a81:8357:0:b0:5ad:cd52:d6f0 with SMTP id
 t84-20020a818357000000b005adcd52d6f0mr10580139ywf.45.1699969396564; Tue, 14
 Nov 2023 05:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107110520.4449-1-antonio.borneo@foss.st.com>
In-Reply-To: <20231107110520.4449-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:43:05 +0100
Message-ID: <CACRpkdZziT+3E30-u_PV8Q=eR=8r8N-s7QomCbmdLi2BtD4WXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix array read out of bound
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 12:06=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The existing code does not verify if the "tentative" index exceeds
> the size of the array, causing out of bound read.
> Issue identified with kasan.
>
> Check the index before using it.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using p=
in names")

Patch applied for fixes.

And now I feel better about that I spent so much time porting Kasan to ARM3=
2.

Yours,
Linus Walleij

