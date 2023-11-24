Return-Path: <linux-gpio+bounces-467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841B7F703F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DFE8281D46
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BB7168DB;
	Fri, 24 Nov 2023 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uf9DKeHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED861701
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:42:46 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso1498961276.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700818966; x=1701423766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvRqnRUWRFewJ1yAX+bnqQAx4yyEA89YIIAsTWMu6tE=;
        b=Uf9DKeHrbHwb15NXA/eFVlsGugk4qGwOIZiFmZno8OUo9ctbW7nbIHFlQUa00JM//1
         81L3VXn0RnaFlwpwOT0o8AYJBIrBmmKqQ2517hfAgGHV7EDfey5sK0ePPsC8viLuvnwY
         HOKrhvgr0lNnU3+ma9VRxQPuW9bim8kVaxlKkMCi9KOcHOIO5TwBVokZyaw9pzLZGA1f
         u2gH5CxLGORvM6GqZDktR6BMyHYHxi8zKRs2G3kqVbARFJhmi+Rd4UcUXaALvgN7//al
         CiRz9vpfFZV+HsQ/PM185T2S9dWXMb/JtGOQX/YDQ1/sUezR270ulryW4mzdG2Qjoa+H
         +IRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818966; x=1701423766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvRqnRUWRFewJ1yAX+bnqQAx4yyEA89YIIAsTWMu6tE=;
        b=kgerKokItnfxjyLD7Z6V0rGJZLYU4YP0LPWpB5L4YAEAnhXCzEL0e0QhLNK2yDd2dq
         fkpCulx6HZbnAGfn7k7PgZa7fB2F8uM8pmAMHDPyjjwP043o2XN7tFzWnC1tRZP8iyet
         LpJLHxCcGgGqNU1jeIZ9Vt/SlUnmopvf8GoctU5yLSC0VTABOEAECyJ2gJ17HMLMJ0hF
         8MlNxRM0M7afphwYo/wHZWabgOC0P8kjBdMaKYsgR+hsEfbY/H0eADd7Poy48EtV3hbE
         ZsUFdlE/AKWFGWnkDprg+tza4eRreTfV4CO8wxKLvY8ZA3Q3vWBj3riPVwwwl/VFs/3P
         08Cw==
X-Gm-Message-State: AOJu0YzcZf1IRwfZLWzhWbKYKUS8F7Q/Z3P4zKcU2a9hygvOofJgyg2H
	maPLCmvrbVEdmQDM4My8fSM/bbdNFDkTjIK6OG11mQ==
X-Google-Smtp-Source: AGHT+IFyHi6ofsYMrVk1B+Dbc7BjO1/791M6O7w4Se/imKOkpVL2OEfLkYpCq4TxxkuqgvlJEoDku5P1gCq13JVPgIY=
X-Received: by 2002:a25:4286:0:b0:d9c:7b92:90b9 with SMTP id
 p128-20020a254286000000b00d9c7b9290b9mr1698446yba.14.1700818966072; Fri, 24
 Nov 2023 01:42:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115211209.1683449-1-william@wkennington.com>
In-Reply-To: <20231115211209.1683449-1-william@wkennington.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:42:35 +0100
Message-ID: <CACRpkda_WwKTBnZ4gWpWg0bQs10s-zv72b8gdY_HQ7+ryo_MFQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: npcm7xx: prevent glitch when setting the GPIO to
 output high
To: "William A. Kennington III" <william@wkennington.com>
Cc: tmaimon77@gmail.com, tali.perry1@gmail.com, avifishman70@gmail.com, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 10:12=E2=80=AFPM William A. Kennington III
<william@wkennington.com> wrote:

> From: Tomer Maimon <tmaimon77@gmail.com>
>
> Enable GPIO output after setting the output value to prevent a glitch
> when pinctrl driver sets gpio pin to output high and the pin is in
> the default state (high->low->high).
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Patch applied!

Yours,
Linus Walleij

