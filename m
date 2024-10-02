Return-Path: <linux-gpio+bounces-10673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CE98CE31
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 09:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C4A1F2314A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 07:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359C51953B9;
	Wed,  2 Oct 2024 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QT+Pst90"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F30194AFE
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855769; cv=none; b=Q4xscrBo6PZr6J0m/c7usbaHcvFAy6wkQ5uXRE/D2iQw2HFyzaE4Z0HhQ8S/F8SsdWnqPfmogweJJih8KmLVQI9YRXtL2lmvT3CB3IkS8Dg/fPO1iwF9i+m+hWkCaJf/IRkx7oRfufvAtwNSIIexQPK7wcA+tH0mY4OX/fhq7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855769; c=relaxed/simple;
	bh=BdFqoh25/ziCt0rrHIy/OnM8VCmvKp+9NmDTPKC26f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dy37fPV7yJsyEdL9tCIc/LCr9XIiwpVWcjTFNCNMmrFGdXi+XEsRkq7x9HU7cqnlxHvv/fZ//1lgpMfDDSIMlOiACEGUtGZXo5zZcoEgin2jiJ4MoonGrERlACH18MQwC6OPRsbfuq5rb5DN0+8tXMq3OSm2cgI+Wjz3dWqFQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QT+Pst90; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37cdc7bd941so231455f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855766; x=1728460566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAp4KqRCMKdoszZ3EhRlu0o7aNcIHhINgcixo0Grn+8=;
        b=QT+Pst90yhhIjf3kQxDnlM4qBANtjPjngRZHcZIfjF9t26H4Rud8jO90GvjZND0wlB
         1qhLPkyGtTj4FzblX9YIHZS1sFXq0vkYn/DqYihj+TXsnosu5o4x+Vjkf8fdytdMHk1i
         PaUfdBL5RDJIy20h0gVeBYaG/sN2Nn1NgBQszYhA+FyktL1m+rFe2JA66hbGr8OG7DKQ
         c+owYP+8yHYZhw70ZvOb088AItjszFELjDRDlTPVZq3nXsjn1Q4Nk6141Q9z99qWOPkg
         9fYsWx/PR8nnrGYu/2ORHGefyQpLDo5vPgl8CarHqrZmd4Gh6tN7y88JyIkDwjetCccB
         m0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855766; x=1728460566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAp4KqRCMKdoszZ3EhRlu0o7aNcIHhINgcixo0Grn+8=;
        b=aAgMuqNHCG57qG3vH17S35J173oVJS0wZNnp8LRiiJP77Rv/E7GFj0DdC7pbaqfwvZ
         9ycUiRG9lq2a1wkR1UE3vubLpw6gUOrSrxTev8WTxARTWerXXAutcok24zAIrH47Ircu
         OU8LkCHigrbJvozIwBnWAkFzDaY/IyxAoN4z/IySD/3s6RB2pBl6kPj+dnzk6zu3MVpI
         ogYIjXtKr3au3jgdzWIHmsXqYCEOGWx1C81d4xi21w7+KzjKa91v6+IbHMUZWISgAnUN
         pkAgeptwATbn4FJgw8dYcztGwkaA7tqx9D3uwspVyEAuodpAgCbzCBZ2ZD+1gC4siLC7
         1g9A==
X-Forwarded-Encrypted: i=1; AJvYcCVSTmjp85SIuh77XjKhuhT26dHIcbZlNOG9I0NgPCCeUqf9tbt3ux3uw113ZjOAbAhgmjDE7Mx7yATv@vger.kernel.org
X-Gm-Message-State: AOJu0YxEXiDC07hkCpXAr+9vhgUV1SJa3j0iUEJkWHf7db6U14Pj1lJ5
	oUMp73MTm9aodOB/qmUoLevxqSrCiYzVH0FGBOIKixpUCjyUxxs8amr6KRAJQeE=
X-Google-Smtp-Source: AGHT+IGd/5hoWfDs8hU174pJPwnTiwCYFT2Js+t9A7qwtxi3HUASZxU/C1Zj23crYIjz4fXoGX8MrA==
X-Received: by 2002:a05:6000:184b:b0:37c:d515:7674 with SMTP id ffacd0b85a97d-37cfb9d65c8mr629639f8f.6.1727855765627;
        Wed, 02 Oct 2024 00:56:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a01f52csm11176545e9.37.2024.10.02.00.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:56:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Wed,  2 Oct 2024 09:55:54 +0200
Message-ID: <172785575196.22593.2005129736205573813.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920154508.1618410-7-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com> <20240920154508.1618410-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Sep 2024 18:45:04 +0300, Ivaylo Ivanov wrote:
> Add a dedicated compatible for exynos8895.
> 
> 

Applied, thanks!

[06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
        https://git.kernel.org/pinctrl/samsung/c/e2d58d1e1c61c1e1d4af400cc0ebcebf98efb49f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

