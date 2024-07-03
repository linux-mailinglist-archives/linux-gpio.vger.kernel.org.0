Return-Path: <linux-gpio+bounces-7996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1BD925D1D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 13:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05B21C2167F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 11:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BE217B421;
	Wed,  3 Jul 2024 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqSgrbUG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0F173323
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005330; cv=none; b=gyinsmEy/OXY7JLfifzWwgsS6zPRZbCVULeVitV9l0eroqxEflsYXpxHgEZ/HpuyaR0voEDNX7ceJViO1khCabZzyQs22AFFR1p+aa31YlaMcyIzzFp6GKU6B8pWgErin8I27IzPp5oQHtS5Lhf2dqOMN22uSfJVka9kzfue1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005330; c=relaxed/simple;
	bh=i4GqndXFZM81jlZR8iscmB7axnoq9nzeXi/e1qzd7d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtYmZbFbj3x/V7zp7LzBKrNEvZSHRaS00w6BvqoWxOcxQVY5YyrmhAED9aTuc1aR6bFygtMrgmRfNzwb7jBBx521THAnE8Hzr+eCxh/VauB1IgmyRhVyP6sin6yH0ZX2tFQTHOsiIEfBrb4hezrcoYyUA6r76oMgtQtBBGlm3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqSgrbUG; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so23511751fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720005327; x=1720610127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4GqndXFZM81jlZR8iscmB7axnoq9nzeXi/e1qzd7d4=;
        b=pqSgrbUGfYJuHRyj68GyK0IwZxnSspaJeXa6zvP9PGSrs9t3WFDLWvyXNfDc6oAVsv
         ZH9TX0eJeEJJ3QspTd84wHATGh73A3ZCR6hj0xlGBWZtBPrcEvzYXdnM0fSPu5j2lK11
         zqHkYgXUJ8PY3Hn616/Vbz+dRZ/e4FuHMhxm6THp82cemd/zP+v2B/XPUyT42EqTNDN8
         BkOwzOSuevn5Bg8r8eh+uR5E2Q+IizIA5z262bZVfrtaGCZt4O/N9x4cwjqvI5sBsCJ/
         TZSh05FDLYmvjFoelCYyevaOC5kjfjbgGz5osF5P9Lgbaw9oaJLjcfNyBf6eC7vgDh5d
         y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720005327; x=1720610127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4GqndXFZM81jlZR8iscmB7axnoq9nzeXi/e1qzd7d4=;
        b=AGc2/fbP06yS9W+DV09Iw+jTETwj/QBfkWAa+XjbP5liuFNdliyeOzrnITCZ9Yz3EK
         N9ZhwOnPXFP4P3P/T/vWEX7Gjx4z1mNInE1l5kipH9vSJUADM0J7GuLUnMt+ZM8BKYWU
         vtlQR2woxupZIFjfh5vDFalopyflQmYAPU6S4rGoEKiqri7RrHhchg6tAcfFF9eF5/gq
         C5UeNA6saBJw7kUoFYKVXAT8oteEg5C8Z9rOauPibtFMd18MKuOZzuFdRy/DGRwxF6B8
         4LDhc4fJIHaXe0fdv0n7sxpU/c/CyLUwuaO11Be3Onny8/KrVQvivFgzsmQ9v47hEAZ/
         Fj6g==
X-Forwarded-Encrypted: i=1; AJvYcCW7Qz6WbEGxOJ++RpWxyTdX0kcOTTM938Pj2MZOhiwicedwHomedpZtwt7azyOIuNLvXcS1ZRXgpnxCCzy1/TzGzT+oKGprOTH4jg==
X-Gm-Message-State: AOJu0YyZr0Xbc+XL18bqSMaex5dpB5ceeeHr4K1gDsYOPs6ByGpbZI3P
	tYJzYhbMB4uVQ07XLJfuTJlWxUoMyRxRNnQlD0geRrgPwwO5fOx1+FZC100zTmzA5E+Sf1/ck9j
	4ElHHA9WLvrk+cLlCNOoUdDrEz0PBySZtZcJ0Yw==
X-Google-Smtp-Source: AGHT+IEmAeBABD5FWougATTrgMC1g4+yTZr5u0+Oz4+OF5M2a3tUCptIbjatJpqzRJBEFZ1XyR3LRao330sV0pe450s=
X-Received: by 2002:a05:651c:b14:b0:2ec:5488:cc9e with SMTP id
 38308e7fff4ca-2ee5e3bbd14mr89990521fa.26.1720005327519; Wed, 03 Jul 2024
 04:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626084525.787298-1-patrick.rudolph@9elements.com> <20240626084525.787298-2-patrick.rudolph@9elements.com>
In-Reply-To: <20240626084525.787298-2-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 13:15:16 +0200
Message-ID: <CACRpkdaKSkZvTvxcQk5TTWLb_MeSMODVcstWpD9ek1y5--o=-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cy8c95x0: Update cache modification
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: naresh.solanki@9elements.com, andy.shevchenko@gmail.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:45=E2=80=AFAM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> In the previous review cycle the regmap cache update code was
> questioned since it seems and odd way of using regmap_update_bits().
> Thus update the regmap cache modification code to better explain
> what it does and why it's done. This is no functional change, but
> it's improving code maintainability.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Patch applied.

Yours,
Linus Walleij

