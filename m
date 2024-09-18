Return-Path: <linux-gpio+bounces-10243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648AE97BBF0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 14:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE027B251B9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 12:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D169189901;
	Wed, 18 Sep 2024 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDhXNkrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FBD18594F;
	Wed, 18 Sep 2024 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726661381; cv=none; b=FTeJkI/s0ofowFlISJNRcNlPusLU3TdyzQjyNp3JDWuApieQLluU/MS9VHnXN3CC4qOkhRt12BnTlknbNbKs/zCwjdZS6ln7tVSqfhWPQAEFFNr6wFbksp8pS2pnb69PDbPmgRuLBhMSuz650bgwCZkPKCBYHWiVJxEiA6FwYHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726661381; c=relaxed/simple;
	bh=yCio83aeLk7ovoU9iIHVbFuPw7v4fXcfPFULTd8OxS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F3NzdeWsFIG6RXWJ2dI2/wOZc40xX1fyqVpMfHIGE85Ybm4FNlfA9yAp2Gbz2vO0BDsw3sILEtkIaaBDBpnCEzPPp5bJoe7d3mSvWmqLEM+iYrzsNodGk0T4/N6TVJjl4ZihrK75GzjFf6RVxwte6VlfUULFtnvBfwRbLo80Vyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDhXNkrW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a81bd549eso809653966b.3;
        Wed, 18 Sep 2024 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726661378; x=1727266178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y66DJFYVL5PY5giFrc3PWU2VMH2144tJiJMcHBEkmd0=;
        b=gDhXNkrW6e0JRj7jmg3j/90TueIEo3PFuSrrdgV594hA2h/lJLfBsP2yXwfmXP5P3g
         qhfNeWJ2L2ft0jnYmk1KQX+MpYFq4Hy+w66OTiMowXBK8eIgTX8+3J1X76Gwv8u5bJc5
         P3uU50eNGVGsbKrat4ARxdp4M9J1axmtErTWUhI8b5nD6AxNsgL1Qi9pZUqNFBbdldna
         5vEp+IFQQahb9j/NZd56Xq2xfBhfCrtsxehPlsU3iiUw/7ELmTQXFY5+TjXF0B0Jt+UX
         kdp/aAjBqxD/8/3JAgsbSZRQH2V58kmAnUGY9Qm0586LUPR0+UAdlL/+XqyGCnb2qSgp
         bGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726661378; x=1727266178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y66DJFYVL5PY5giFrc3PWU2VMH2144tJiJMcHBEkmd0=;
        b=LhKp6FDxDqegO0WYNvrsTeeHnZTGKCvlKClqVbmg1ZXatFLLMBofc+BvWcosuxtWDe
         T0JLwv/NP9F733gfN2DogJcS7YNX56uiptyA+SkMaQtqBpGC04zqrIIY/5gy5bnDRaCo
         p38EHo60UO8TP++E3yzy7/KW7HfjIL9LPdKIp3LEfPTqf5FZH8fNCiFVZeyx6rRDwBRU
         FLWFWvNi1ivhsm/kBYqwUjdMnkjH+m7JvkcnLb0RJpQjdmRrkLSAa6cqTGT4kBddBS76
         TZopkUUNe+RlUoezum9kRQICohIzlssslcJRQ7DGOMfk6JHnP4+fWnTBq8v/Fa4VglzQ
         xSEA==
X-Forwarded-Encrypted: i=1; AJvYcCUSswWHfi1/t8kttae2UyaQL3iSlLL0uhqKiL6nNK+9iSdZaavouW6UkY5cZluNd2HLy1aAht2gE8nB@vger.kernel.org, AJvYcCVhmc/S9JEEZ5NvA2uP3sDTqznF/085GmGhYV20F0IX5KMA7vzOlb1DI3j8WKcHlYcY+3I9n2YsAIfrEQ==@vger.kernel.org, AJvYcCXj03XSOx27X8szR0V4lp51vgsKCai90J8bPfhnfgl2Bc4kODK9ulwto+HHBEBNYowgB69MadfhhOJHN07e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4IvZdKl4o9OtE+9uFp24271t1T6ocjlhxiL74pylcziiQSo7a
	bUxNFBVDOaaE5abiOxfPdN+H2ftly8bucpqw95m3nr+GJMgE9gBS
X-Google-Smtp-Source: AGHT+IE6D3nSuq8h7O9jMr5OVxk957IkkHMEKQMoyo41X0kNj+Wakcr+5SIVRrsz4nV69XJ/NNxHJA==
X-Received: by 2002:a17:906:cadc:b0:a8a:7501:de21 with SMTP id a640c23a62f3a-a90294ab552mr2151917166b.12.1726661377252;
        Wed, 18 Sep 2024 05:09:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b384fsm584440366b.142.2024.09.18.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:09:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] pinctrl: renesas: rzg2l: Add support to configure open-drain and schmitt-trigger properties
Date: Wed, 18 Sep 2024 13:09:06 +0100
Message-Id: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add support for configuring open-drain and
schmitt-trigger properties for pins on Renesas RZ/V2H(P) SoC.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
    'input-schmitt-{enable,disable}' and 'drive-open-drain' properties
  pinctrl: renesas: rzg2l: Add support for configuring open-drain
    outputs
  pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  3 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 36 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.34.1


