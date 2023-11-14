Return-Path: <linux-gpio+bounces-105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866F7EB127
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D0C1B209E0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849C0405CC;
	Tue, 14 Nov 2023 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIsAT5CN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2514AB5
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:46:27 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3031CD4A
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:46:22 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a877e0f0d8so54030207b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699969582; x=1700574382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nliPXMHTnBYGTGReWura9iw7kNKuYsUsSdl3m7Yb7x4=;
        b=iIsAT5CNFPuwdLLx17Byh3PFtj4b7/Sjzv5SHr1RhDOIjyWatTuRNu9C+iXkcDsqxm
         t53w9upp7Acy8n7VaHcrl1DPZ3HYrr6mOtuJwPaBEfOWryF9hLI5JJiQ17RKksOy3KXs
         ls21ouFECwwiXJqbjU3tX3vcr8xCuZmhNjh/TueNBUrMj4nZAyIMrU50BhYNJX4ZDN9K
         Q2ud3Ux25mx4Xg2ZMBjLh1x1KV1qdxNrcWK+H/xIxbqSyrZlshGhLSWUY3drBOiMjSg7
         1VmlmIDzbJVD4nVC4WzHCTLHIqeWJRzIeicPyfjzAUNvzVs20Ntqj1qiI9xNrhBJAMs6
         3EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969582; x=1700574382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nliPXMHTnBYGTGReWura9iw7kNKuYsUsSdl3m7Yb7x4=;
        b=pZPwK2eJnUBBItK9h94fCWxK3jGy+0x+ZmccD6PC5lYN9MShLktHd8PS8jKkTNbUeC
         T2jqcz7QsOcyMhFXsBLvRUxmyRXO+e2dLwuSUus8SetZBfOjy/g47PRz73/guLg1FYz0
         9DOcdRpZO/4J8amTH0tDNt4CLuCI6v2Tn2dczpvU5HJJc+FIy+Joan4q/dI1jS//hB2l
         mJM/92gBsj6yj0q/cgic2vrDwLPV8IuM/COI9VvA0SO5F84JXa85Zj4o5e5u+aUiRnaE
         Tq98nMMiqT+H35IEnb3kTmbEzPNMzjrLq9XFsq/6iRqyYNxuzwdSKXA0Dx1IW10C52Vj
         zBzg==
X-Gm-Message-State: AOJu0YyxElKCDGSSVRITAD4aMMNoOe0DVpa1+fInApaL9PQoqKu/bNcI
	2065fo5bPh9BX7rzGVQI9RWxR9vbCdrfdvmgAp9gVQ==
X-Google-Smtp-Source: AGHT+IHljeec9sFxlNUsrr+jfk+JbFvnr/ZZvguGt3cDWAtXFcsxBJ/HQEG8up18lILbAZk3cTqoqDwr9zZLzkya8eE=
X-Received: by 2002:a05:690c:3382:b0:5a7:f263:6873 with SMTP id
 fl2-20020a05690c338200b005a7f2636873mr1819095ywb.20.1699969582191; Tue, 14
 Nov 2023 05:46:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231108104124.2818275-1-eblanc@baylibre.com>
In-Reply-To: <20231108104124.2818275-1-eblanc@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:46:10 +0100
Message-ID: <CACRpkdZqOiPFCkM2JAPnVam0Q5ciWs0p0_kHd4K=ML1qwKm1Bw@mail.gmail.com>
Subject: Re: [PATCH v10] pinctrl: tps6594: Add driver for TPS6594 pinctrl and GPIOs
To: Esteban Blanc <eblanc@baylibre.com>
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, jpanis@baylibre.com, jneanne@baylibre.com, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 11:41=E2=80=AFAM Esteban Blanc <eblanc@baylibre.com>=
 wrote:

> TI TPS6594 PMIC has 11 GPIOs which can be used
> for different functions.
>
> This patch adds a pinctrl and GPIO drivers in
> order to use those functions.
>
> Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied!

Yours,
Linus Walleij

