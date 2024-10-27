Return-Path: <linux-gpio+bounces-12170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B019D9B1FFC
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 20:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709EA28160B
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 19:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F5A17D354;
	Sun, 27 Oct 2024 19:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wuQ0ELyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5D8460
	for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730058943; cv=none; b=FeR71jlK3DwaFR2ChafBBkW+VTSIJmgc1HLSRvxGmctn0T4NIZzaQPUlT+Hl0/zLkTVY86cq/seFHLUZ0N6M1Usgw07arpoCoZemVaWxWdOadi31WtI+vwz3fShHY74Bc5oBodDu7I9rsnKpf3vz86Q4tcOOorhnn4rwA/CBMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730058943; c=relaxed/simple;
	bh=YsdYH84ia/r50m5pkpbMCMIaheqADio7tevqfeKZsqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VRMpWo8m/7r5O0OfemtyFw2DjLDzR5vKysTHJRnAWB6JDrEjppNeuPfcR8jGVEiomdKQZcYThAn0+kUXVXDPGPFxoxXvPHKZe5sw5KPHKmDvE3FtKirVCtPxYi4goewk+DXlzA6uqWhSqO+FqKQL3cnaJm3vlL6ZKTyFLQHrQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wuQ0ELyP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314ff68358so4238365e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730058939; x=1730663739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27FjbLkvpsH6g9Edehxh385tMv9CQXY+0f2sWNF8DhE=;
        b=wuQ0ELyPh86ig/gxmva6XbuGKQPi8EnnLODvA0gkiDfUEldNIORhTl6rVMdUqU53OJ
         SSTIKLdR9NnZKtlFukmVdCk5PE73E9bCS5Rm1LxEnyGa8GxSr+j+ATwdl3d3h8ASHNB9
         0gIuApZvb4geLCGtEBMLuNehw7CxhY6rjG2XKnCpvyWY6sUt+byxylrXF51hmGI9Fg5+
         UxPozsfEgva6V5RzouOcheovBUwskyQyRzZuCTkBT2Y57/PYzUedC1GLi94r3ieasb8p
         lyDWl02KZvf2ThOJuUmLbYEjP+/oQpHp9I+0JrHmmzkFD3cJLBSnkRZpiTKwyPGv2icn
         OQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730058939; x=1730663739;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27FjbLkvpsH6g9Edehxh385tMv9CQXY+0f2sWNF8DhE=;
        b=eow/VqZESB8Ju0LHOwH5SrtnglRSypDgls2ihc/rvJyub9HtRbUu3DA7wF+L0oUMIG
         YUAyADypcs/K/k8sTdLHLG6qTEfLp5ZjBVHEWx93VnMTB/35/p62iz+afJ5tVmr/Hm36
         J/jC7o4aM6bbuzdVMOKrtO+VhesGqiYrRP4NPTZSnYT7L6HdP5x8eKplY/8MxY1ONBtV
         DqnwxOj3viBKhTy1ry7JL6CG2vzGfIeQXM480thaJPctPqHU7GBpxaplld8EMQzNlnhR
         KYr6pcWMAUJkDB0L0C46hDfdtt9imHrkp04LcqCnhDQTYSpFFwbbf88vMKrX9kqk2agO
         A6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW445OzI2+TeAOeTrC+oaabvBbE+sTxbu+Q2AgIhs3Kq4SwpvuTqTNl3CwZ2CnmqADs2vLcY/ycK3hH@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnW22vv/T1xwHCjtjXW4z6d8TbTENUVTgOTYreu3yBKz6fzV5
	Me88/e/3yJP7UGYR+243PPEvabYyfco65QJBgMZOwYYJ//T8fUh2kslRXj9OwJs=
X-Google-Smtp-Source: AGHT+IEYf9GlikS+9SRXkW34PJ/4J9ZywFzKp4RfuuNjQIqBExM3fQopO3FwUg5OJt8GXxV7i8FZgw==
X-Received: by 2002:a05:600c:1d1f:b0:42c:df54:18f6 with SMTP id 5b1f17b1804b1-4319aca7abdmr19494075e9.3.1730058938975;
        Sun, 27 Oct 2024 12:55:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431934be328sm85548215e9.0.2024.10.27.12.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:55:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-2-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-2-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 02/10] dt-bindings: hwinfo:
 samsung,exynos-chipid: Add Samsung exynos9810 compatible
Message-Id: <173005893509.10219.7382293678249920610.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:55:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:33 +0300, Markuss Broks wrote:
> Add the compatible for Samsung Exynos9810 chipid to schema.
> Exynos9810 is a flagship mobile SoC released in 2018 and used in
> various Samsung devices, including Samsung Galaxy S9 (SM-G960F),
> S9 Plus (SM-G965F), and Note 9 (SM-N960F).
> 
> 

Applied, thanks!

[02/10] dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
        https://git.kernel.org/krzk/linux/c/18910d6b16bb4e71ee5aea5986a6577f347d69ec

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


