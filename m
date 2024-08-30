Return-Path: <linux-gpio+bounces-9479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF7966C80
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEC061C216E6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF64C1C1AD4;
	Fri, 30 Aug 2024 22:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfnKxrKB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2461C174F
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057159; cv=none; b=cXTI7NFAAkwQn63PHR0gtOWwJeqtgrxOc4nCc3drYpfhnzBdvETV2N4YGqatqpXSjnk1gvml3AoWlODTbsJsmc/jyPNjoUvW/mFgqlgnJ5/UIT+VCYdQBheu2KDqOPZFCVgBZTnBRJ12uCZ7BYLz4FhV8KcS/bLjAWy9D1AYNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057159; c=relaxed/simple;
	bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhxDuU6eTTkY5UdOkzHP2GL5CKK9FJrKWNTmpePl5iPNecgEWBtGmg0jrBRNkP3KzSWYbvUKoJ7NZOOPm4rHMKfCtu6S3E4/VsPZ+lrKb5HKx94QENSTD8JUfPhL4ORtquVp60jhiA2szOKYaeUBzPcjewFiq1/uxYeDGd6euHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfnKxrKB; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a7f1597bbso801393276.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057157; x=1725661957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=rfnKxrKBpB4EIwpnGRFvzfFPFtF5qw8wflecgdm8PrJT1nGkeKPW7oUlm0ZYwuRv6x
         EOKC6ckH9SnxvLbdpfbZCz5LFr66UStvj+SOxHjDoCiCermKPZuhjuriuYPHewXfJnrc
         47fbbq4H91b97+tkaAfMqjMku2MtYf3cjq19FOJJbIMLGgVrN9o+DJfp+HsaHmR8w1lW
         ydt22Z1HbkdnKbfIKpu00UWcG0H8E2a+GHrVIvQKkVpuU7Kdh1PZ89324BGrGLiZRTYQ
         3N8H8trseMi8T+Y+NqSx0ZOkJHKfmjVKjr0S9QlHGR7yocCjP4xriPBLL6A86fQiLB18
         MWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057157; x=1725661957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=QmEuVpHmCdHLr5xtQmhm+0IivYlwwTmrmyr9mqS5Bwjr0JLVTFyOI0iI+d+z5RLmrl
         FXhcqlhiaRPopj/Q4Ps663OXg0h0qDnWjXQ9WIC8QRMdEMh44T6Kb9XpFxi9kb9F7rUd
         TpVrvt2wNrBuFWAXz8aFtRkLLk9Y6WGcgk91PshsGpALimklA4pGasFkIeqEY52tKGax
         9XK7zsi2S4u57SCjq32cI6VGgUvRMkXOK7mTkSYiQ8hv+sHd0k++yZCXGwv1MUu9e6zh
         9NNeH0cvuDcee33rj93nvMMAJPdGJULatgR0n3oU+003zlWEHprGfqtd+O1dTw0d13uT
         v4JA==
X-Forwarded-Encrypted: i=1; AJvYcCXM2PJY7/0DVkL+/Hl7V7UtXK0B5TncGUrNJaVW43oHKmlaO1GLHcuXcSPfx9mjIoT2MtWys5gUd3Ug@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7rjYT3jxiqw9QRgBgS9YGAzyBlzI2YFUqxCatDDlAMNhBMBZ
	B/wpAFmBeEzNFEWqdR8JR0G18peswfqjl7y324uB8Pbz4xtf+BZO42TXC7PkuxFAK4ltcnAF2zu
	9FANhTDuKqOFLRH1qvuh5SPZUJZSmQjeXTHg9Qw==
X-Google-Smtp-Source: AGHT+IGY8O84DiR2Aaig1136Hn1BZ4NVKNmKGEF29tIOvuMMt+pTTKh5RAqmh/aYiy5yQpsPuZ+gYm0rdnzyEcUt/SA=
X-Received: by 2002:a25:8391:0:b0:e16:7070:97e6 with SMTP id
 3f1490d57ef6-e1a5c648a4fmr6700554276.9.1725057156927; Fri, 30 Aug 2024
 15:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:32:25 +0200
Message-ID: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
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

> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose it's best of Bartosz applies this to the GPIO tree with
the rest of the series?

Yours,
Linus Walleij

