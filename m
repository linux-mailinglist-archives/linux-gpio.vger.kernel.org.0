Return-Path: <linux-gpio+bounces-6123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 716F48BC7E2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 08:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92283B20FDD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 06:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436AD5338C;
	Mon,  6 May 2024 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9s30+Z6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574744EB2B
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978509; cv=none; b=CAOu+t5zvn67Y3K6GmiaabOvU9y618Wws5reSKKHMgGobJuI0ssnzE/myqcN6/XpJq2h1XuQ+WiO+aTW7Hr2fMpYOGACU9ho44B3I4/5BMLxwkhMUj/0QZq4HdEp2TcSReqSEmRIQpAm42Oum96k+KKKALJVqyuMZuOBYYCHndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978509; c=relaxed/simple;
	bh=l2y+LRZZRPAmWxytx7SZQIyRUFOB3jcxkwesINbHaM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPcbv2utcxkE8Esm3uOaph3tQrqkyC8QBB+kOAvT+L/fqOChQESy6mMB0tDmtrMPVrR3neLnpgjqDeVyz4z6nnc388t9ZGtxaAmKJ6fTheCswF7onhxAsyuhG5Zv2tPkCsoZcGPAo0ruvPA80r/9XTiMaRirdbqsHCtm0DJYKRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9s30+Z6; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61bed5ce32fso17277237b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2024 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714978505; x=1715583305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbYNptaabn99AYRMgWVtL1EYOCWc6xS6cHF9C3AUluY=;
        b=V9s30+Z6jUDjq4lBQiTvC/+c+CDeShbfcGtAZBoIyLcHO3g7emXRJul0M2QsVDJBZX
         JqTMX1xAih9qABEHfLVDf8m/xeJ6YY51E1yMDUh7bxo5awjyGpieVBy4W8CbuOOnMaMh
         h9yAuFmsOBhPUdrwf7RLQ6MV0rUaWqcd6isKZZAtItfQpz1bjlSY2mfqdz1U9o0+qRBu
         n97M0i6IyOqfCUYQJRnmkigh/UgtUaQ+4v0ilSNZA/+tvc0uEXxrJUExMSkj+hrPbgyz
         id5OZRYfjq7wVyAo870zjem2QsC413IgQBoIHq7uO7Xy0sl3T+bUkEcf5GsyKsPluTcK
         yTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978505; x=1715583305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbYNptaabn99AYRMgWVtL1EYOCWc6xS6cHF9C3AUluY=;
        b=IHBz/ycGG6B9I1PgeuSnMugnxOUipmBdSaoRjFrNQpoE5zVOavJ5t89rQgSNz6VJHN
         tf2ZQwCWUw8bSkksPtwFz8YB+jpnx/YUrlXOazsoJyeQLYWfQ/O+V0gNuzhEIgyFWD0Y
         zyyGfZwmX6VBZun15JohUWf7ljKwlxgZGK57QUOC7fgVd0IkuZl3juPMj+U4JQsc7i1Y
         K+oY8IqnLewL9zeu91mfC0/ZYp7si2hYqrWfVahZkgzsNYkbJvFaHtHECW6limzO7qxb
         hsA6r4/GCiWDjbUgadHW0MDkt5cQ8o1PlPDHeZNvBh4xDr6KA6C58gmyEzobUQYT5SX6
         /mhw==
X-Forwarded-Encrypted: i=1; AJvYcCWnunKixxKYrGqUSnzzG1I44s06lZJn4TwjQR3seN6XqX5ZNpS36klyfCKPCmzQn3WhXz3PL4q9qStGyL94uaThFnFue5BXm2uEYg==
X-Gm-Message-State: AOJu0YxSQUkpKOlHds0vX4dMPk4FCa2eWBOhuBM7ubyKA+MjqaSqqJs1
	asIWE3ynvwh0rf5mhGVlxNfIFp+ZXQ2pMpRoo2kQyPwyotOpbCsnBrtqeGQiMYY1mpHawk6Ddsj
	0t63bCtga3t/IxAehIkESSOFJj7MYNWHy3r8r3A==
X-Google-Smtp-Source: AGHT+IHywfJ+66LhNCh75inc/HnuMoDX/hzFAveO2yRusNJfFs0ge2yXXLIQLiKRlWUxHMxk3t94HnQKCcJtBwvRyFY=
X-Received: by 2002:a25:ade5:0:b0:dcd:2f89:6aac with SMTP id
 d37-20020a25ade5000000b00dcd2f896aacmr9899101ybe.10.1714978505435; Sun, 05
 May 2024 23:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504121545.8187-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240504121545.8187-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:54:54 +0200
Message-ID: <CACRpkdbKUrX0Vugr98d48Ee8HsgCLMTg7j9WcfBNbrNZJxynYQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.10
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 2:15=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.10
>
> for you to fetch changes up to e5b3732a9654f26d21647d9e7b4fec846f6d4810:
>
>   pinctrl: samsung: drop redundant drvdata assignment (2024-04-30 09:41:5=
8 +0200)

Thanks for taking so good care of the Samsung drivers!
Excellent work as usual.

Pulled into my "devel" branch for v6.10.

Yours,
Linus Walleij

