Return-Path: <linux-gpio+bounces-9476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65200966C70
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 977CA1C21699
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF811C2313;
	Fri, 30 Aug 2024 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EB10kt/Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC3136337
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057076; cv=none; b=ewCZ2iOnCw2hJ/xPVLb6AJjRUXN9HBShx+v5dIHvs6Z2xFAzO1mC3R9jXpYRI9Ez3SSY18RThetUHfPoMKInJb0zAG1hzN9LhuMi45iWFGFlxCuSWqv6xZ6RI2c+VkBlwk4UtPW+dMEc0rxnFHrz+n28U0ydY3tmSzjTvZQnw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057076; c=relaxed/simple;
	bh=pwFroKASBqejNUfm5CVZeNPQqT8/UnHI/5J0Bw9Puuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8npesv3uuyag+5AUuYlS2jgGYFkMFs01qYk3yCkBM9/JsV7K6N2b1UasGV9HBtLwzDTBoUmJVjuCxSiFxQ/rUDIuX4PyHxMF70wTeZnF53MHqvn+sZeysZJ9t6eOe3QPbgeXwTCHxTnutKllisx52tZYbEwsonnA43VPkgBoxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EB10kt/Q; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1a90780f6dso84352276.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057074; x=1725661874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUblgEFG+0OPCJUw0oaveizC+h3CWD0I+O0FLcExw4c=;
        b=EB10kt/Qexca1eBLewo5vZ8htZE2zuoivSRpH+Xaetwf+PMbysj/dcNkXHUgFiNhpJ
         bYoCCyNIC44F0pww1Oq334u3wgcJaWUKzpLNSwp3mBopsS79I9My+u4fFFF+zz+VyIOM
         iI3+CYej/1yrxyIWtb6ToSBIFTYCT6A/+EeM24Nh6fnfMA+U/g8AUuSnVp96D+PT+ApP
         9RF0IGTrXcpj3NdAG6x+wjyfh8+GZAQetS7IYhl66nkJpjq6tQIwVt787bf3eRzvx2b3
         jMSXa8EbNkh1ckt8W39hMlIa96cVDy+TBCVIvijwAPKC+1vM0TyygS9fz5IziJWMIx7T
         F2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057074; x=1725661874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUblgEFG+0OPCJUw0oaveizC+h3CWD0I+O0FLcExw4c=;
        b=kzPKbqk2gehTgyL/ijpPIdTjyDsEnHV4iTDbkYh2ey2ylwrGpSwM8nG8pKIf/nOQTq
         8IPA/HBYDnGMpmet/pUmSUlokUnpvz02LdGGrbtGopMp6n8mgehP0/mnjrYKXtFOJfXu
         W9uTWRll3H3AiOTfzNIAFR/spIuXXjrBWnsdmc9RbZSENALt+02JEYfacLRaDvl/LccY
         A/OaHafFyOwYrcYqLcBZjoGI0seCqoA9k+efk2xSsuo0VsEjN9vcVR0iw8tUZXEaG5iy
         gYsMup5KCdSH/PmxsEDs2hFZLgW0j4UIGdIEQEtlOovAKQonffSQ2mqQVUaxFh5FZz1c
         7cYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8RtprnfpKDW1IuZZLVR/gLMzqaezbJuRiRF221mSFl9o9TIdfJIIVIQtRmVctbirUy70ca2ChFB9V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Oq8QBlSw24qONyL3HsUmo2ujE6KD/0Qz2v85hq/OVx49GHjf
	NUy9t98E10SjltFuL9jczy8S+xCJCa5Gp5YLr3oJKSpZq5Qs/CHRC4gJDRNOcc9P/u21jgTtONr
	QbE0w0UJQunUirCouSCtpoEe14Ut5SZy+dMjGPg==
X-Google-Smtp-Source: AGHT+IGyK2LRKMFmPldiXpQts0hWvnKTRelfsOu/wi3UPmzSoWa0k2vOUkkkzaMv12N7NZDZi0YIQcRKHgMku4EEaXs=
X-Received: by 2002:a05:690c:d89:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6d40eb66aadmr39432397b3.3.1725057073718; Fri, 30 Aug 2024
 15:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:01 +0200
Message-ID: <CACRpkdaaxCgMuC4YzEm8NjKqnL_9MwqawYigBkp25GntWc40vw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The core schema in dtschema already strictly defines contents of nodes
> with "gpio-hog" property (with additionalProperties: false), thus the
> only thing device schema should do is: define "type: object" and
> required "gpio-hog".  Make the code a bit simpler by removing redundant
> parts.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

