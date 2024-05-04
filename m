Return-Path: <linux-gpio+bounces-6085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2004B8BBB1E
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 14:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50E991C2112A
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F3D20DCB;
	Sat,  4 May 2024 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UiCLLR1T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343155234
	for <linux-gpio@vger.kernel.org>; Sat,  4 May 2024 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714824951; cv=none; b=pHGne2ytfNhoaWvHQz3+ORJlpAZLRzdCp2ymZ0cWPu5u01XWNgA5Gsoj+v/4jj2e7VTOGuVRPWoHKt2Pa7fYYj3WrHhD6/QIwiLPLfAdVFAl2FU6JDIH76aJq893hy9YT74cHkrEo7qPY/TB9du1A4GNOYhfNW1soX4P7iSYiQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714824951; c=relaxed/simple;
	bh=PPpOQyMbS6Mzgm/54tzfCd7GGaJRpWvifByPCcJ0Roc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W6p0jsWem6eS4rOh7pfUPADkuwikTOqgmT/HzBlvs4gih6qKx1xVNlDCGjxkmdW2Jl+FA4MoNuqKqr4IrNKTXymiYRbUv5hCH78M1Ko8BDaMUWX8IteEAuVOLGh2cwNjatedB5q+Upvf4gzr0I55Rptb7qgXZtJ1yeP2TYDohJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UiCLLR1T; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59b178b75bso19649266b.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 May 2024 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714824948; x=1715429748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHgH5JlemKr00lARyvPKvrK2odUhHHD2XashLbtv/ww=;
        b=UiCLLR1T+hhfhbEFNzgTgl0vO0ZFwQzS9i+evLhLdsm0ivXL3XKyUSJ06RlswHEbWH
         beJNOnvTOhgLnCrFU5g3xWke5MWwSw8YH+aZYEJ8ICHXP99U23gGbAIYSsb0nr+MpqJd
         tjhPaCn6Y46nL474rYwlWvJadsVb4FT7rgNsbe0iqzYsYc4RMUJU0fXUaX/qVqnTXjjl
         18WcnnoY6FCIOQ/Mr3OyLude62d4WIZzvjx5NFo15g2usUU3Vx/ScNjED8D6aXPJKBxE
         SkIhD+ub9oN21DaLA//7QtABZhq2VaG9adJfYHi6awqbUNVvEus7inj5flwSn+aq5kDq
         BULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714824948; x=1715429748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHgH5JlemKr00lARyvPKvrK2odUhHHD2XashLbtv/ww=;
        b=dP1f3KDngoCkLBt/aG+aTEAgfySW1maGS2MXNkXaZ8+Jaq4SupeAhasfgBzCL2uHvO
         YAkVskKAA4n0DqjvQseJziGu/WUrSP7mg0pRAwixBuzpGP8uQC56dUzJKkigEakHpdpt
         JlFhwJB/IzjWyUiU/1u0mof0QCmaLzb5sUHC15PSMgCFUthLTwg+AkJkwwHVexlh2fAK
         PLBMAVrzBpG48+2JqGu+0mo0TK/cIj0gpP8Zpn4tdn9lo5CL5lrEsjxF+nkY9gm4ACqB
         vG8i0OW1owXzDR3+T62ZsDyaJul4NecNhnXRY0ggPA/KIKlUBYUDTjaq6SNw/OWUP8OG
         WGbw==
X-Forwarded-Encrypted: i=1; AJvYcCX6wysri1VvuJezQCtiXnafprg7hNKrrTM9CybmkySuOajY5rfmRtnY+conHKASdHoxuLu1EgtPf5d8lqMz3JLLKMk/dRThCO0hdQ==
X-Gm-Message-State: AOJu0YzEQTRy+ECkyHTubm7WXvXHWUCRd6bZUeyd7CZN9UQPLnVmjHXo
	J2X7z9Gc9uzQQxJYBmSINZ8nubgAfZxU1ZybdlG5jlCN9w/QKqsBRYbGBBZQkuQ=
X-Google-Smtp-Source: AGHT+IEbcI1Km5xoWoY2FdQxom4QjiT1xv6T6XAEW4MTvRymIgNcGhFAY3zqEBgmmbgizDbdNHRtKg==
X-Received: by 2002:a17:906:5617:b0:a59:a8f8:7e1 with SMTP id f23-20020a170906561700b00a59a8f807e1mr1072336ejq.58.1714824948556;
        Sat, 04 May 2024 05:15:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id uj4-20020a170907c98400b00a599f876c28sm1203407ejc.38.2024.05.04.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:15:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.10
Date: Sat,  4 May 2024 14:15:43 +0200
Message-ID: <20240504121545.8187-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.10

for you to fetch changes up to e5b3732a9654f26d21647d9e7b4fec846f6d4810:

  pinctrl: samsung: drop redundant drvdata assignment (2024-04-30 09:41:58 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.10

1. Add support for toggling bus clock (PCLK) for any pin controller
   register accesses.  This looks needed on newer Samsung chips, like
   Google GS101 and probably Exynos850.
2. Drop old, deprecated in v6.1 bindings header with register constants.
   The constants were moved to DTS headers.

----------------------------------------------------------------
André Draszik (2):
      dt-bindings: pinctrl: samsung: google,gs101-pinctrl needs a clock
      pinctrl: samsung: support a bus clock

Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: samsung: drop unused header with register constants
      pinctrl: samsung: drop redundant drvdata assignment

 .../bindings/pinctrl/samsung,pinctrl.yaml          |  21 ++++
 MAINTAINERS                                        |   1 -
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 112 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  95 ++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
 include/dt-bindings/pinctrl/samsung.h              |  95 -----------------
 6 files changed, 226 insertions(+), 100 deletions(-)
 delete mode 100644 include/dt-bindings/pinctrl/samsung.h

