Return-Path: <linux-gpio+bounces-24564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DABB2C4EA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 15:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11AAB2445FC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B2E33A012;
	Tue, 19 Aug 2025 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9c7vdHR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA514275AF7
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608791; cv=none; b=Yr1QUHAXPNoTKUYZgHHQDeLJeLFwyfpngF931pjwTJ6lzHx6Zo+9LOvrePkLxWlsHxVolExiXkGNOJVDnUJV7/z8g4DaM4vn2ZQWTR/FyyfXlMFbI0x8UvHMLK6fVTsei1z//eecsZjRFCbXnVFRKW5yXZ/GhRTYzQtyJO+mEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608791; c=relaxed/simple;
	bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKKTXlFB/IL4ZuCX/cQ3PrVo6e42dyKyxUH09wsznPutY6kI28ivcq9JDPOEoit/wzJm99pXjohYeAs129NJOgSPFjCRbXvmEKvHXYoAAwreLFzPhhT8pJXgL0TEJGlYuZo10YmuwbJZlbzJmJkQOylM30jOIpHNPyjHBxuIiHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9c7vdHR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-335360f9b6aso2935011fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608788; x=1756213588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
        b=C9c7vdHRJdrmCN1oIisZOEtPaE0LtanKquQQzBx1OkBSJiP55HDZkVIRdmvLRYILo+
         ciby8bKy8JJHy4f9AxrEnsN/uFNQiQV7RckzSwTi4pYOsx5QZOt7lKOVvnU03U0KhS+g
         plwhnYNa0+bqwZPIAuxgmzs7P/ekcT92k+YjwqAIaDXgkdhZkG8unuSlVqzuT2vhZ7xR
         ootN7YTHnxrOIytRJcocE9/SyoIP1qqxbXoVbXawP7oorqk6XWvfEDUDKuX4t6Wp457X
         WKUFk3oYWUPtbTsg3pNqKoUkTOXJGE4zCGTAT/Y9jx3SCZd+dvlxyWsjKXpbTJx4SWAq
         1BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608788; x=1756213588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
        b=NAIUlFLzwrU2qUEnL24A4an77pU6hb8lWmi9zNsxi51E0kDenYsv4GHe//zncfn+BJ
         FbtJaUjBtwFTBexCT+2Y8zx1PCzXahTYdFE1mcHc4E+7qjiVNdKZwSMcVKOiD0mvS7om
         B8vv44gcMJvTb32J8bGpX3+scJcWXRA3jaYfVNVoT7KHPdIz9JyEpTkCeJRl33mXX+yA
         4Z1lThWF/vBjcgV+vzBBI0iyO9Wtg10BVAp9D2BbrCoW36hU7Xb+hTNSjxycq2avkjO7
         Yjkg5k26KBGKf4xZkJYDoNyWvDjwH0ipstW+3o2mCnwUzwUyiva31psrKGSL+lk5ka3g
         LKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/JtP6BR8K67ErbNzJir/ggjG3KPIqWzqrPH9J/9kwyqioo3U3sQt0D6FWdiYnJjtJRNcxD3D/RiTP@vger.kernel.org
X-Gm-Message-State: AOJu0YwfWFc1eVcepdeIVCZznhAFPchxX/wXE35VpymgfgQXjoGgQseN
	k0u870CqQuVBECs4adHpABG6TdDIWYmI4ahjvhv6UYgYdmWezuwU4uK7LRx9OvSsfRCAntmNUli
	9ablWIx/WYiKVClzAfztZnk0ux1z4uZ6E12GuwmfQxw==
X-Gm-Gg: ASbGnctudmFgmcdnTcMbx4guEcn0xYhvhbvUDw98Qqhxn9RJFf8WnomMQs5TDf4Ikza
	EKhvPxji8diQqztI+FCHvwVmHZpl3bMEEa/U7qxCZWtRbPaC8al8fiZyVoZG/Lv9PGGZAouwELB
	VDNgAev+xS7wJuMiln8UP+W9b2beXvnTK18KUUm6UhydrhCsQmt3J3so/PIP/wOndN0T0CT/WpF
	hwOYl1jhgsI
X-Google-Smtp-Source: AGHT+IHuZ1v8yqv5nFpHB3upOq5k48bLEGZvcHQzbQtjR6KTrGahQ6hImQ+OMjokOiyokuX8aJCwdENgo4zYpJr/r7I=
X-Received: by 2002:a05:651c:2208:b0:32b:9792:1029 with SMTP id
 38308e7fff4ca-335317cd294mr8926241fa.14.1755608787940; Tue, 19 Aug 2025
 06:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:06:16 +0200
X-Gm-Features: Ac12FXywhv2FGXVaL5z9CRtgqv32XD-L-_xhhK3a7EL-XoMsHmHhIPyxRqHeipY
Message-ID: <CACRpkdbdTHg8Bn5L2Jc33=qTohD7aVAHuv1P0H2x7jxciojzLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Constify static 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 4:24=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

