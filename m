Return-Path: <linux-gpio+bounces-20105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EEAB5E9D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 23:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64DB37AC6A0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 21:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45B0198A11;
	Tue, 13 May 2025 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vy3vUjta"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850951E5B6A
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173162; cv=none; b=lXy/o7J2ojUrMzSbCiHNCSUL6lMVfTCPlK9oH8/o0tM0WYiuVAOANwwcU9Gn2o2Opyp1tvxucl/LFE5BKyaruFlIXwSNVvfYbWlHLEfEGczBUXShAJcDaJhi1KlweDntdFgWAPrf04jVa1OvtGLuRQuzmXj3mRHGz/TiOrrQmZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173162; c=relaxed/simple;
	bh=LK3lAuBjsNAIlEIkMYgMLyfpdUyaTRXeTgNgmUeBqIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cy6RNB8HxAUyj77c2DcT02pvoKJrcG88dPQqgBWWG0usoKjCwI92a7aw1EBsVigFBN/pxJ2AvDazYXtP4XkYsVvKHtBtqR9ufx1EH4FwexlKJmqzzT5e+8wbJCsrKHMhHoK5FqQs3BEVqCZs/td284oQ583a5gljI0YSU0LZrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vy3vUjta; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-326d823304fso29419481fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173158; x=1747777958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=Vy3vUjtaBSYbHKvxHCWL6vZplv5HYHnlnxdyvpO4ey+/LoUsOjexPq8hNhjyK60PDo
         M2FKlDTNvgTEfO+2qik/yuA7Ay6GwM6JmpLKA6IKDNmifvVcJcEbUbhpbqmWicpepjrx
         Q6zgweWYx4UDco0uksumT12Nmf3mFtgVY3UOjVIdRjeJMDShKNSovyygEtEGirmo8B4N
         OXWHpUsi9JR0dWpzEOCm7MnowRKbajRlWfmInvcNCaQsn4wyhBpj0lFd/t6lkXcGpDIZ
         /830+f0rmljgkA585HkvsyoZokqdWVmQwQIs5fQhfxxdeSH/tem4A8J2db7I4mYk6keJ
         KIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173158; x=1747777958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=c6NXsPHyl5okX0siE9nOaad5rJbIGCygfMOcifnF1j6sQNKb+UUQIUv/7nc2Ewxk4h
         bD5TmSUZ0/jA7HkPkUF1qDRLYdSaB/bJpIZd7osk7vglproT45rhI064YJw7hYm7zAuu
         lLGDx0WF1C9RPJnO9rNOq6oj5NptlQ9UEhepvAul+GyWqg9mRXrqsIGBp0OOFlk6yywS
         XEijs7Ifk/FlMNZKzm1r5QYtkJtqguP1RdLK4wxRvjcmyuf4/XNkhhiQfhjAkEMQsdH4
         fWS+bz3Vzpm9bIyMvF3ZgxoeFUtewsvdIBizhFOHTErnL9EtLNSchbXqh2pXOULoj+Jn
         0kpw==
X-Forwarded-Encrypted: i=1; AJvYcCUPsIvTaDqPdJuWrVmdg8ZJUhCpCCeDpy07j17wMad2D7BUR2YG1/y5IRiCX0fVFWQA+xFtOaZtb+DG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLkhVADAuno778sGeDm86DcoN7a4w4iqysU4Qru2FjbQ4d0xdR
	XCO4J9Ub+kIJZvhWUMBIebvpujWTpE8fzKh9W9AvE4qeWTj9jB441qNt6qF4x8JyzDCJBcj4QfZ
	HTYEnh7NgzCpFYiK5Wr+Q1HutN/FWy695rfVpoQ==
X-Gm-Gg: ASbGncv/6TYoH7wBcKH9VDCPe6De4mIzgskwJT4BfekJVxkNTboxjQXE89TpgkDlYdW
	vydqcnC8h0Hltb9GhFwGo/zAlXp3+m1D2JTvcYt8kZPwM0/lBBdYFrvXiEvQtQGhW1oAkv7DqoZ
	GwC/5hbdMThdJa69MXOhDFkw8hFxHYSxdr
X-Google-Smtp-Source: AGHT+IHdxGQUgnLEP34p77bnggpFFcybep3eX0SRsxItjT7bGVq1s7hLEPXvIi67p9M416/+sOFwds+OUhyOtC4jV3I=
X-Received: by 2002:a2e:a545:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-327ed0d64b0mr3515771fa.9.1747173158581; Tue, 13 May 2025
 14:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 23:52:27 +0200
X-Gm-Features: AX0GCFuybBjzXgbZgpkhrGy02_JvRvbutbRLwY2ZvnnqoSf9SNzjLph5-OzDFPA
Message-ID: <CACRpkdYwTcHh5LZ7j94LbGYv7BnTCtrJO33j17YbP6s_s3TeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:01=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

