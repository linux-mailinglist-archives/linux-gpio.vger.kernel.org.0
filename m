Return-Path: <linux-gpio+bounces-466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 440157F702A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E7C281D30
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 09:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65395156E4;
	Fri, 24 Nov 2023 09:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHDYlcQa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661EBEA
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:41:23 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5cc5988f85eso16988587b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700818882; x=1701423682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRu68hLahwSm/CKHHJmilMs8h1j/3FBhjl9GLsq2RiM=;
        b=BHDYlcQaKohRHjcQ632NaFTjtuSNG9FiRKsydR4cJcX5G9OR8uZH5cVWTSc8lnUs7p
         oB53dLAUxMGbJrlBmA7beauO4drsaaCbEsM/wxBULOOe32+uJX2xiNliY51FcCX+pAOP
         KEEJzvA56+iZLif43+gyZLpadomZx0ymREbpFG8P9/WcBWSVB0pLWuiOK78imfV+kAIw
         B81ClHfjT8fs74kIZSiDAP97BXk8tZ3nM2MdaaNSHmBEnnA05aiqcznnWOA4b+u4AlvZ
         fv7VTNZYdmRjB2pAb7Hl4WD/hgIDS8OViJI84OhTR+j5KFcWR/ztRUld9qlGQmPUzrnx
         MfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818882; x=1701423682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRu68hLahwSm/CKHHJmilMs8h1j/3FBhjl9GLsq2RiM=;
        b=hroL0p/tyV4ksqV0B3f9AX0qTYGuWvq+A/06zrfi5inzja/SR3cnhCU9sOiAbz/5qT
         56L+zES1DyNixYTVVl7bDyAxwIJIJfSIVV1Uiv+ZcCXi5fdrVTd90GmFYeZipIlwAyO1
         qlwY+uZaqA3MNqmq1Wzj2PSwuhZ30Bf3jPoAXSx8wdbSYnVTMKQ2xlScc3D1EBo0+61E
         ABfpDTOvKWA/n/2mWm4xb19khBxafJLIzIOCoG7Up1AZj/pL8Ayx97v1rVdwsCmj+P0n
         zDHpoB5CpmVq6j7uIizOyA44XVqj8CNMK5TVr6dZEusAyWmb5JnJKNqaeK5sWsIaXjgM
         7/nQ==
X-Gm-Message-State: AOJu0Yyai9Ommln5n6xQXIZmukBGsi9Q6Hwv4Au1q1jObPmoIV29bvkp
	JZiM5PllkVgRC4bVt9tMrVVrgi4xxvX4nadLtYO5eA==
X-Google-Smtp-Source: AGHT+IGlF+raSFjKvRmiW4zZYIcSoOVcE2p5f7PD+DEntXiQwO15zcN62FbfmUIaAOYbJUmONEXN1P/CnC715Ug6TcA=
X-Received: by 2002:a25:346:0:b0:db4:6725:a0d0 with SMTP id
 67-20020a250346000000b00db46725a0d0mr958244ybd.49.1700818882595; Fri, 24 Nov
 2023 01:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5ce023a8-db0c-13a9-be42-09e3348ca44d@omp.ru>
In-Reply-To: <5ce023a8-db0c-13a9-be42-09e3348ca44d@omp.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:41:11 +0100
Message-ID: <CACRpkdbKJ4KRn3mjjuruGH1w8E+ghT-NJ07Nh8Ayx+dTCw88oQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: return errors from stm32_gpio_direction_output()
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 9:34=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru>=
 wrote:

> In the STMicroelectronics STM32 driver, stm32_gpio_direction_output()
> ignores the result of pinctrl_gpio_direction_output() for no good reason.
> Let's propagate errors from pinctrl_gpio_direction_output() upstream...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Patch applied!

Yours,
Linus Walleij

