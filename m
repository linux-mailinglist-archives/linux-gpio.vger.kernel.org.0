Return-Path: <linux-gpio+bounces-68-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9787E9DFC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7F11C209C5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98A220B30;
	Mon, 13 Nov 2023 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCKOvUQ4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A620B18
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:59:14 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B29D5D
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 05:59:12 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7c011e113so51971237b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699883951; x=1700488751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkvb5jXjgdppD5M3BE/7qL+8HuZSIdn/P5Opxdga4vg=;
        b=TCKOvUQ4CSkCSxPbE6alrem+biq8PaJkJSBINQyZ4QQ9WWz/ffRg+EnpMvR3ykCJDa
         FKr6ZHxgbnXnPMnAAVNQXaLQHmDxZfZoqrSNYkVTspltrJc5W6tDashZ09oPhzx4yMYI
         M0vbd+DMOT/giyez0MocDXpuW8gh9St8FjBkwtT3gQgp/aZgeFeK9gSnKOyUGQvux3lu
         rAhmp3nW2MA6eCeDXJI55tFJwCySlKKwIWEc8sVmPldNAWpIHl5IXEGoBunYDQd56O7O
         S+7LEHs2Dzl1HErh3B83ZpGT9gTXO9SIDjfeA1e6+UBPe5mX2EdPPWwAmuyfPM7XQktF
         /lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883951; x=1700488751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jkvb5jXjgdppD5M3BE/7qL+8HuZSIdn/P5Opxdga4vg=;
        b=DjJ7Gz7yNBefB++n3i6bfyCAJjtoQRnDWMzqpecbAUJ5q00RyWe8L2FAz8RGULG+KX
         5e+YL0UcH+dYYKG0bcCc2VIiXU2xDMs0Luk6lcVLiKC8h2Zz8B8t3cz3HGoK1V7YypTI
         2eppMlOtY8UUMpCgsRTDwO+8CH2ZG04hRPZaX7pZ0NpdWMVz1SSg+70nkeusfDvGnk/i
         JmCdjy/dYFdUN15GWRRSXNH/6ThDVbn8I35SpnJxes58WL+na45ZNnv06nOazHbBinXp
         U+/oWx4sMc1L2jJOeW9+s6amu6j0EPFXhGjgH9InlgRpbKOHMqt0Z6iMOABtDvjZq8jT
         6W4Q==
X-Gm-Message-State: AOJu0YwhUHvDd1MQe/l+XjTxhHh26etUnrsCtBgg9sDiMmUU9EoKcsDB
	GxJobONuQYo4BOjTQi2tZQe8Zby4EtUAfZvoxOjsyg==
X-Google-Smtp-Source: AGHT+IFOcCkw5XM4JWZUE7/qoRjiVbjPcLcLFuTmK8ZrnLgJQhE8oa+pIkQakxeis9S8rmZPpg6AROJznV8FA2Cgah4=
X-Received: by 2002:a0d:e342:0:b0:5ad:289b:999 with SMTP id
 m63-20020a0de342000000b005ad289b0999mr6727763ywe.28.1699883951561; Mon, 13
 Nov 2023 05:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027093615.140656-1-krzysztof.kozlowski@linaro.org> <20231027093615.140656-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231027093615.140656-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 14:59:00 +0100
Message-ID: <CACRpkdbSCkq7a-3=FfC6=bxh2JB8UZK9K1Eumf0PBnpuArkHSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 11:37=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add driver for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm SM8650 SoC.
>
> Notable differences against SM8550 LPASS pin controller:
> 1. Additional address space for slew rate thus driver uses
>    LPI_FLAG_SLEW_RATE_SAME_REG and sets slew rate via different
>    register.
>
> 2. Two new pin mux functions: qca_swr_clk and qca_swr_data
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij

