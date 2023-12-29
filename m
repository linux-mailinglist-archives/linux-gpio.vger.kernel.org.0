Return-Path: <linux-gpio+bounces-1919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228B8200F5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 18:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF485B21764
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 17:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E8C12B8A;
	Fri, 29 Dec 2023 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alSTZBB+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD212B86
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso6004908276.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703872237; x=1704477037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P81u+eG0GfTd2LNxdHAAM/aJvrdRoSS+QBsfBsOk/dw=;
        b=alSTZBB+c02LGazZPDdRLy0fYbZu+q9ofZu1r+wriG3t+R7zDneZFE+dbGREhHFpDf
         BSLtJmoKxUvPi5yjqLhcuTS2bzeqvu2FE335eD/GFwd5TEzrv/RqiaHreE6d9517MfGA
         Bnm73eg0+V9alG4QaobBh6FU/gYTQpoIgICQVGmNOBOI5OoPzxjQeCTmHC8B0T8SIy7+
         hbRfEkLS4xAObgUbBIcdRBUVosDXMe0sh4aNzadqqsJV2YmzC1pmcNXDy4CCvB5mg5ei
         muf5dLO6ooJbOSkGX4uPPteNpbGF5apj3DblgsqdAaMJa+19LjX8G71YlJgJlZBFGaYs
         e3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703872237; x=1704477037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P81u+eG0GfTd2LNxdHAAM/aJvrdRoSS+QBsfBsOk/dw=;
        b=J1Rqud5PNtAkIWMpzXQ3w0CUQtDb79M+RmgsquTTiNg2slhQGZqLU6nQPvHbI6NWR+
         4aBCEY32L0BY+h/WMUEKJxkkKd831y3gJJMF22eIYafXUrkIDInw8chhlHZWumO4TEcE
         4cIhjVGEMEM+FivY0C10VRBOi4w0/tva+K4nUELA848NrWJGWgCdRK2on7bniSsCw8Y/
         2qg2HO5LV0jtHqjAx/CbpQTfHPbQJXEGMKCFBs1ZjaS9Um88yHCe/6j/71hDaV5boSVt
         ukv6DmKpPCPGoZWke8Z6bHWIp2bklQhrwoAY5dzzLo+/RkPJpYoEBbIkyZmhdW/w2hFg
         S4dA==
X-Gm-Message-State: AOJu0Yz+Qym/rO+JOCppJli5rdHdFutzfmVfTXUxO0ExXqxsK53Bn90y
	QVtsS3YZn7zaigrGNJarQsBpOai47QHzAtTufRg3xYu9KuMwRQ==
X-Google-Smtp-Source: AGHT+IHXYwNf72w1aST2XgJonUOt9cIq7p2XUzBAEueBGhV+/R8nnBgYMdGoOCpbhv0z9u+aocB9DHdxJShIoJlQiM8=
X-Received: by 2002:a5b:bc7:0:b0:dbc:b19c:8e64 with SMTP id
 c7-20020a5b0bc7000000b00dbcb19c8e64mr6790367ybr.94.1703872237690; Fri, 29 Dec
 2023 09:50:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229130758.84214-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20231229130758.84214-1-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Dec 2023 18:50:26 +0100
Message-ID: <CACRpkdaCPtY=gjAxuQAQUxczBVniWPFBq8ZSM+DfE8v0nxafvQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: dwapb: Use generic request, free and set_config
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 2:08=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:

> This way GPIO will be denied on pins already claimed by other devices
> and basic pin configuration (pull-up, pull-down etc.) can be done
> through the userspace GPIO API.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

This looks like a nice case of a pure pin control back-end for the
generic DW front-end GPIO.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

