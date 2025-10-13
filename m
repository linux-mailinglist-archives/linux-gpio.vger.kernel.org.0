Return-Path: <linux-gpio+bounces-26997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC02BD0FBC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 02:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB4794E12E9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 00:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627A419D071;
	Mon, 13 Oct 2025 00:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOjzvtUw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B969C10942
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760314961; cv=none; b=gng+uxU5JFt5x+RSWDUCw5CsxjvE3CWoml/5mcRU9uYcku6EmYn9MAdp5Gyv9nZ0GmzezUSDxyLeD+O2f9KXYcLdJAm9imctGZ2H0UNrdP6cWBk6p93zhaqr6dew/2B7+CL5+69z255pdtRGQtf4b8qnSIxdYuHnNDKKonX/RGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760314961; c=relaxed/simple;
	bh=+dTERHXHwlz9Q3on1s7pnMr9sQk3vgyQfbNftxESlcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=slpSS1BQkk/SgXTLuQCDzPFvxvI3TYdE1Uv41nbbLm9bIKIM6OIQBnjPKnoiSpBtXVfVhasEbiUCDfUQNEX1A5vUyOGotVJUxlN70w6rCqRSdaZbetoBZzC2ESPinvvTC0mQnpBVBQqbYM/8HqrLLONLTJmaJDFUvkC9YGQE3OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOjzvtUw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-26808b24a00so5451875ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 12 Oct 2025 17:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760314959; x=1760919759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=;
        b=rOjzvtUwp/yh9Kh5vxsDTCOVN1ux7BeMhZj/iu2ZIEnG2yKMWynzfeKQxi2boBYZfo
         iP2Pf1lS60xMi8jpDyGch6iZwU9MEF44nvhQfNGgfA0G/Dwp3ttyk3EDLU+acZ6exYtH
         4aVdXAeCAmtF0lxf9aByTpE9GktHtboLp9G+sm8Kv8bwhpBU28rX2W/DbnEtjugt6Quv
         63sMOKRUEWSP+fekAEhzeMk4TD8gUZ3qMPo8pNBfc+pZV62k9cmtEF0mbuy8Qm6CcZbP
         2oh/hvaInb/P+yP99xor92f38GTeiLu9588d/tvNTrl09qY19pbRy0eWaKfLk7JIIw9B
         I4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760314959; x=1760919759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=;
        b=DRbK9Q9CVLnbl0IW3q0rrNqf2J0MwZDBbn6K43azehgAb3UiG3N1RyC5wo1PTyVser
         V6VbAA53gVKC4uLJh3O319pgu5vGMShbkYUTor9aR0FXlHPBxLb/pOTMSXG2cPfLQ+Pv
         hn4T6X2NJjAXtfE9XDYHRlWUGKlnn/RRALiXsAmBCiejLPqQ/erMS9DA9UU9wkbNfwh8
         oJfg3BsNzK+VxStfOGi1gm2wRHdXXkHN/PEzIaoLygfBNvnrtp+GSgZy79ntTq4jp16g
         3XKCCm+g/B25wHeFJkC2wSEl0gBHZH74OpQxf5OWTGEhftQ+38ZsZn8/mwA5Gt/Z0lTf
         xlNA==
X-Forwarded-Encrypted: i=1; AJvYcCWk/LDr2dz465HAChJwJONd5b3Epd6KJ6+Aqf3p41fbYMizvpdUAiZX8bKDDtbG2Tp8AvIpXL4zUgeo@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiMio4oji2Dj1CnJege0mPSR6nhvkDoXJCqhmUlM0uzQ0KEuV
	8IPwnf9beOpxAn3/zlFQmaTzFH+nCnTRCPOnZO6MsA1HEtLjJrMFwvLET6CUfDEWGKQ=
X-Gm-Gg: ASbGnctAkCbRkqgDKCV7l7jdpDNdgjrt79A6na6yQXDOUzqCLRfj3rSzRb0atPmTSgn
	RvowMmXTL7zMEZC3Dk3JcrhCG4hJeZQftK+6I9gBtT37U1Qt7+LGdhA2adldfVs1gFlKFHSZYnO
	ax9Nl3DA5AYxJqcxe6wPnutrk5U8ONz0mz4ZdH1IIdrbtQrfq94nKWZijxFWHxomasokmRziF8Z
	BLRdrQRau1ZI3T9kVmIgqcvOQ5qN7KrXU+0T5ACcYSEI/pZLWDxdD9EdM4sa/qpAk3Vv09TSv3c
	tioEHjbKX48kHnvnYBD68a1/7O30EJJRSDlFOL+KtyoO8Y1pCPvrOrkNf2hMxWilAYNFkI/xde4
	rAhUnwLSv7nK4QFtT1DeZp53CUgtibHhm0H62M6VKeIn3EoB3Ib00VqRodNTSILfgd1HJ0iA=
X-Google-Smtp-Source: AGHT+IFK4ci2TGNbmqypL/3bygm/UTzER4LfBfP1yAru/4qRR98/cUW50Jp7i5jycMDRBEjIp5poiQ==
X-Received: by 2002:a17:902:c404:b0:277:c230:bfca with SMTP id d9443c01a7336-290273e17bfmr142190255ad.4.1760314959008;
        Sun, 12 Oct 2025 17:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05bcasm115840285ad.84.2025.10.12.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:22:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: samsung: add exynos8890 SoC pinctrl
Message-Id: <176031495194.9871.10054397457165667570.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:22:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 14 Sep 2025 14:44:54 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds pinctrl support for the exynos8890 SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos8890 compatible
      https://git.kernel.org/pinctrl/samsung/c/9be3b7bb7ddd4e8ed466f41c6f43de34424aeb8c
[2/3] dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/f416d35e6522f0c08d4e866e5d6930bfd504e645
[3/3] pinctrl: samsung: add exynos8890 SoC pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/5b6b7d39cee69373dc61ca22164d616e4faf60c6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


