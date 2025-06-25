Return-Path: <linux-gpio+bounces-22192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD77AE8658
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 16:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234773B9A3A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 14:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B47B268C42;
	Wed, 25 Jun 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWmkYCns"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217932676F4
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861304; cv=none; b=E4O2k2VTw5bGftgt6xlr+G9vvtiohcJQemb2q5WQzvEJQJcnLrgDFTHpdLHkQb1VWAWBVZl490gzucnteaIE+HfVm7z7a1mrS9Ok/PiNA+xMGL2JQImpJF07GJk8R80yl7W7evzf7fGU2F0mTqJ5XFawKQnJwzJn5HuKFdjC4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861304; c=relaxed/simple;
	bh=UeR7AlanEE//RWGS4QT9FCi8nRyNju65KKz3mOMQXys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jWPclH+Z++AwyJd0Kj0S+0Ey7O+V23B5lj6cfD10ctq9943LxlGp9mOB4qZP1lS9RFp734p6Wu2KkuBvJQ3K9gWXe8FFPiEd0L1RSq6e8RtHBr3xR8kMo60BzNXaMS0mOPrPs3wci/bwNSxwd7nZZare5GROloBq1PCVP4oEWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWmkYCns; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6071ac68636so1409829a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861301; x=1751466101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=QWmkYCnsB7OqkNL6ByXUVFwGo0cKXTQBOVn2rDS7MEm0CqHXJjvE51NAiJCcaLhAO5
         xdU0TPz3UAdFaGU5W+QD2XOSYgWSsFcCtoVRWwDaVORzrD31bt0Mwez4XJ4TeTsy7gws
         PfiT3XZVBY/vUyRT0RGQXbFy1Oug59roq7I1LSh0dXrKQIdv4ikhon9ixnT5z/WHbcXd
         hWlHEw5SjwqLTyTxGU/+oa+twAqa7vYn1pdHcbtefI4S42YufAOZsXjTMmxOSr9F9kto
         6wX/luMlINCjjwuyPAq3GLPhp+J/vM8d4C/LTH0jq5euVocIer6/BDgw8COrvJxInTxE
         dUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861301; x=1751466101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=JbZLzpvQcYNEZp5y9DVzXwxZs03IrrxLHI5PqNYeCFROYQqM/YgUUW/xIFiZHeM1Nk
         Gon72ArVs7nAXfOlR7YjSu+/W9fEjL+lL00Ja+0RbiD1ahjZPXPZhbmnCuqJK6w2+4oE
         +w9rSN0ADxxUvG2sd0+A+kH7ZZfiyeeXPsv/b9fjoSHYrp5zG40Ub+o1jllKdRaN3b2I
         7X+nD4rfdGmn2Sg9f9NH/PKx3YON1c2ZYg5pfSmVa+1MvuBH/BNdiqr2vX1ke3CjJpXV
         m0FAetFQZm96b/ohe+Fgz+OR8nchMr0AU2Nn0YW9kCD6XhnRsOzsJSetlfz8x24/hp+J
         llfg==
X-Forwarded-Encrypted: i=1; AJvYcCXLsdY76ys7pDwapPutEIcVQbGZFCGQVPh1SU1Q09ToiYXO5GK3MtecqBKSKi6V2/AeUm+UfNR2cz6c@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXFSrU009m142TpDXa6HQEj3cyDwNsvlC8H0JVcocNHeApitu
	Uuuee50ZH64tgvDJTo+vQ3nWnp1Vqe+PpNaLankkYXheqjyibrxD/AiSm7GMfqz3bu/8EtWPn/s
	zWl9Y
X-Gm-Gg: ASbGnctrkCIkyE7XUiEvoQ7Kahjlo8Wnk1bx03b2TKNNMLsBViWjTlRF9LCf1pPPRP2
	k5sMsNBsNyqAwUS/wkNrsEo46537zOllA+5iHZcHGXs8G+A1NWrFxaDlgh+txorP2JAoY1WmlJu
	gA31bAN04s5wE85TBoPmxTKU1hNvPvmwTFt2ybWZq0JVsECS3XOimMdfal5rwGnBuvU5IxlZg8v
	86mvgRgihe4qHix/y8CemIH8QZCFYEfF7xCtysHp4vK2MVoRnkd8oo6nCiPkxnsyMghGANnJVFz
	gCOd/kI4TmXj8NSH13M4u5iql79VC+br//paAJgM/BPgEe3HY3B7MDoFK4ByxHNrQztWc6rnjuu
	iGcB6z7rTOiJ+Xx8J
X-Google-Smtp-Source: AGHT+IFYm10YxIFhCnCipzjlfWjOLtuMr1BPt2912OnJxUKbMSfRM1bD7rOZCEZPooC75oZ3Fx2Jaw==
X-Received: by 2002:a05:6402:4003:b0:608:c773:8b3 with SMTP id 4fb4d7f45d1cf-60c4dde8f1cmr950949a12.7.1750861301433;
        Wed, 25 Jun 2025 07:21:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1ae8cbsm2584006a12.21.2025.06.25.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK
 registers
Message-Id: <175086130008.117696.12548441312202680982.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 19 Jun 2025 12:18:14 +0100, Peter Griffin wrote:
> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it has
> 3 EINT_WAKEUP_MASK registers
> 
> EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
> EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
> EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]
> 
> [...]

Applied, thanks!

[1/2] pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      https://git.kernel.org/pinctrl/samsung/c/c8edb80494407f65a253ea63ffbae3fb831f397a
[2/2] pinctrl: samsung: add support for gs101 wakeup mask programming
      https://git.kernel.org/pinctrl/samsung/c/2642f55d44ce563f227dd9c620eda0dec8d882be

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


