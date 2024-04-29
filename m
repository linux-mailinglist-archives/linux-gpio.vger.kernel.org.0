Return-Path: <linux-gpio+bounces-5929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210758B600A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 19:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10EE282859
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1F01272CB;
	Mon, 29 Apr 2024 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkRvuc5b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085386658
	for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2024 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411740; cv=none; b=lffJiC1hzLojQFyHe50vneaSzwcZb8jRaaShLC1cPTg4BNrPFTmu4J5jLxFeofTxcObcaIfoEG9H/QGEjJIbqMpfYHy+9yRkMi4H7pcx4PoOUwzLqqdx/AzR/h00WOwOCRnzvMjIDDu6ZjEfsyXgxtB3W9D5kvW672QHY8B+FsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411740; c=relaxed/simple;
	bh=PxWdf9Kkj0n6VHhFtbztMb/tWZE85qZYX2SkOsfKcdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWHdw7taxBKJWIOLf8w2kQtvvq3YNmBVfx/gGzG63NVv+DaIFeanLJtZ1tzmxJLyd93lRNbaj/2rbLKNCoYBDmI97AoKJjPQWkObEQIUdpuxyGqj4LNx1CjaQZ6MfnGJyO0WKzGRNIKAo2XKr0YMSaZ0mOeCihZXYBBWaDGvs1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkRvuc5b; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso4316759a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2024 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411736; x=1715016536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfvUr/npMdZ/GS2t3ldGkKTtvFh58aymblnh7l1bHtk=;
        b=LkRvuc5b4mfRBsVCtYHEsW3AUOr4XzTrBwrQM4GJAPaetanel39BIpomj4KajuonWE
         YNDDNuwQ1bb0NS3vr3/g7y5kO+26ZkXUpBMw1xOq9+C9uTOjraBA/4YKudZIS7Ddy5Dd
         40iahqwfribZlNqm7nrhvN5QIaTpGwlfPRzSCu5+uO1wNVYhIyXOqWjCCGyMW6TzS7tP
         pF8n+k4w8kJIs7nMAjIXb3L3+MZXRkA9YXqgEWxAqaAVuGPSZJ/kyRC9yAukUuRW9hJ4
         gwSI29RgWWVrSIneuLuFuDizwaulTdn5zXQiY6bVCkFpsDWWH1048utt43BOp76vzds5
         S+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411736; x=1715016536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfvUr/npMdZ/GS2t3ldGkKTtvFh58aymblnh7l1bHtk=;
        b=Zj8ZZPG9PVDkA425cXzHU78vjkWXtjJlLhhGR4V69cj2dMeuJQRLzfJIPNFWQ400iw
         NnaoEIjEfUftX9kPpdXltEepkJe7Rqt44zIIYTtxiZ3TD0eWCkhxP5XhWMnzPUPjjepv
         k2Rzl+cdRp+aoE1AZg8B5gqwyWhUGGT6weVrMf+qGgNiSPZXe5bOGGEw6Ss/AZSJJVJ1
         sYhpKNmCh8cdva7oFfGhrwKVaDH8f71OWFyCObz8tbp1lctGKDFuyb6mYYVh9MNC5u5K
         EREn9sxIIV+Oe5M1v7zEtiiIFgx0z+HmNIgXh9X3MEvagtw+XXzd6ex+CSqobawVI3gA
         NZSA==
X-Forwarded-Encrypted: i=1; AJvYcCVBpm4ywOYhbF1CNcRpuyua6v92ifCzyCLmu6gLc91jxQxBP205kZktxHoqA1lXScFtTl3TfwDT90AZQme/3OJtSoxhbQ/A6uVXRQ==
X-Gm-Message-State: AOJu0YxSVfvuB5SZedRaY27EY+R6wArLhW6tMCQW8gWu3wAdu4ZWLAwX
	ObYAgllp2xYw24Ikzj1yRNUgJJJx+gPDLVoDcDmDP7kQGuR4fmYbeHH2ai5X9bo=
X-Google-Smtp-Source: AGHT+IHXKKToeyb3BoIe7riCQypv2ZercpV0O3E7vrpAKyMXse2leBAsPr7FdPKCLzbfNcuNrVeftw==
X-Received: by 2002:a17:906:3bcf:b0:a55:5ed2:44d5 with SMTP id v15-20020a1709063bcf00b00a555ed244d5mr7457851ejf.68.1714411735610;
        Mon, 29 Apr 2024 10:28:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id u8-20020a170906654800b00a58f15b070dsm2556560ejn.43.2024.04.29.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:28:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] clock support for Samsung Exynos pin controller (Google Tensor gs101)
Date: Mon, 29 Apr 2024 19:28:50 +0200
Message-ID: <171441172281.306662.17546797534297489946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 14:25:13 +0100, André Draszik wrote:
> This series enables clock support on the Samsung Exynos pin controller
> driver.
> 
> This is required on Socs like Google Tensor gs101, which implement
> fine-grained clock control / gating, and as such a running bus clock is
> required for register access to work.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: samsung: google,gs101-pinctrl needs a clock
      https://git.kernel.org/pinctrl/samsung/c/dff9f3fb6ba4f74eb805bc172cc16ff2c91648bf
[2/2] pinctrl: samsung: support a bus clock
      https://git.kernel.org/pinctrl/samsung/c/f9c74474797351c60e009ebc59a798fcfd93ee57

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

