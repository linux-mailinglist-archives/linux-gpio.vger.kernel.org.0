Return-Path: <linux-gpio+bounces-2410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B588362B2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 12:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141401C236A4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 11:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC6C3B189;
	Mon, 22 Jan 2024 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSjPafiN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C23A8F7
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705924643; cv=none; b=m0yfqHhB9JsNCGpU2l0uHCBytp9lJPfQOp5bcuXGjkgAfTrm7CGv7/0rbpH/5zMmVuHzmWWvicvKbxYlPVAbCBEAIc/kTzhNDCQ088kEYYk9aWdV1hw9xbSjqyW37BU25dtw88BTlX7/mXFxeCdUyFQ6ojeA9XIT+JXzxG+vSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705924643; c=relaxed/simple;
	bh=tsbrmP1+O18HOPGSjrHTKuZbGshwEn40LJCinS7VhYI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TUoEmXZo8v6y6J5fqTqoTyh0uPeKet38UVqFIaEBtRH0PaTmuIzTEBPZGlA2SCQX7cU1Hf6HCqS/Vae33j1EZ7pXAMHOAhzNvPKwCztlDjfGFI9p5+shjyMFNLsROqijQqn42Cjx8MdQcSwaHMNujYYsdbIlaBK59maZ/gyke1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSjPafiN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so369299466b.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 03:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705924639; x=1706529439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmH8rXJqUXY/i/aOBMn68OVWCaEf5ZmAXSQpd6FELw8=;
        b=PSjPafiN7jWLdXnrlyds98QXnpIZ8K8oxpSmDpYnS4tq31yKX72M61QplFMsk6TyS9
         idUK2Y5mqAMqDU+//BfIQQxdodKa0bm4EfHFqhVPMzEYtQ2pajST4qHf5xESeJ4OfRWn
         eGmn2uMwj60r53z/vys+H3uraB7+V6m6JQZM+cVD1b60/UF7Ef8tY92JV3yFY4o0+SIY
         rDjMg4NBCBtkD0jpymrxfmRDulrgYlEtZ/6qYbNNkBGH1YTtyXHNaoe9Ub1L1DOTfeES
         B9ORElYxZ8LPvx5hRfSatoEOYA7c2iLnig39kYwUBKz3B2KYvv8hQTjDe6utSsyjbLl3
         eGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924639; x=1706529439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmH8rXJqUXY/i/aOBMn68OVWCaEf5ZmAXSQpd6FELw8=;
        b=HYp/BpekXruf69WU1AHExIzXPW0GQ8n8hC/LnQTDfI0+Edcbi7G6TsxPz1j+xJ8mln
         767Wv+/a3iqWErMgJ5VZp5BNo7Tmfv90fZU/abyBIR5ffA+L3zqcrGnBUVxdQjVUnbAY
         HGQ1QGtKCn6gjfH4+HF6GElWbN/4zmBiLhFRIji/igaNqV4OQE0i0dry5OY3StC/f8qI
         ZJIqPutLNwDqgBYOUeGcz8ShZxeChXa1K+1Q3fZhJ3klkMbQB3/ycghLeqZeseSYcH6F
         h+BiNpVUtgExoT5izxAORjJYxjAnJvqKs2krjxl5GZanOpxDHWudQ6Wqk8tnMH+xUYAH
         h4lQ==
X-Gm-Message-State: AOJu0YzTH8NTSS52ggXhji1AWjdUh9dq0g9rrGYQ1DqXStCT/rcmeZen
	uLJOdjeR56YulTJr+XhWrLGxzxLPptabmFp4KEcdRPMa5qfyel8BifFxxha0IA0=
X-Google-Smtp-Source: AGHT+IHKZPYkFC9314WpcTSOIuVlAzqptNC+bZeUMyszvkcPbzvVLtDAdNhgyFoHYu3/qtjtR7hIyw==
X-Received: by 2002:a17:906:c448:b0:a2a:a4c4:5229 with SMTP id ck8-20020a170906c44800b00a2aa4c45229mr1231745ejb.90.1705924639386;
        Mon, 22 Jan 2024 03:57:19 -0800 (PST)
Received: from [10.167.154.1] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id k3-20020a170906a38300b00a298d735a1bsm13481349ejz.149.2024.01.22.03.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:57:19 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Remove QDF2xxx pinctrl drivers
Date: Mon, 22 Jan 2024 12:57:11 +0100
Message-Id: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABdYrmUC/x2NUQqDMBAFryL73YBJW2x7lSKSbNa6ENY00VIQ7
 +7i5zyYNxtUKkwVXs0GhX5ceRYFe2kAJy8fMhyVwbXu1lrnzDJnRvON44CJvKx5yCy4lGSeD7I
 dxnDt7gHUD76SCcULTvoga0o65kIj/8/gu9/3A1a2VICAAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705924637; l=720;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tsbrmP1+O18HOPGSjrHTKuZbGshwEn40LJCinS7VhYI=;
 b=k4G0Vxq2PK79h8IRxX6rBTWSZfrg962X7w9xIpHP0Cp3uP/+FXkolaSwdiPnr/h9nVCcfTeMc
 MSIUtuT9/MXCFFCBNqOyzFMHYR5NP5Eo61FxohYZInShnvKl/2VV2+N
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The SoC line was never productized, remove the maintenance burden.

Compile-tested only.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      pinctrl: qcom: Remove QDF2xxx support
      arm64: defconfig: Remove QDF24XX pinctrl

 arch/arm64/configs/defconfig           |   1 -
 drivers/pinctrl/qcom/Kconfig.msm       |   7 --
 drivers/pinctrl/qcom/Makefile          |   1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 164 ---------------------------------
 4 files changed, 173 deletions(-)
---
base-commit: 319fbd8fc6d339e0a1c7b067eed870c518a13a02
change-id: 20240122-topic-qdf_cleanup_pinctrl-98e17cdb375b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


