Return-Path: <linux-gpio+bounces-13401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 761149E0532
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B44EEB31C8A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D121420409F;
	Mon,  2 Dec 2024 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPbXcQEp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CC82036EC
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148133; cv=none; b=l3b1s4a4upp5s+kn6moI9wo6PaK1YcaNEhsVoYy5Hjpr41zjAg2NoJ7Z8JVBBA6XqoSA5o2zjc1NPPlIy62eT8tqDDsr4Gg8UlamvF8Svzd46ghX2ncjEe8qHj8ECXYyLvTCYNdFDH5R7O+Se3mdWQ/M1EUt1K0UUwZ3nbuyVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148133; c=relaxed/simple;
	bh=jJxlcqRxB873knVtlY401xtr37Z90jDtvx8oMXlNiPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BMcfguVVaau6fldqWai6iWydUUI551GYw3LICm4oi4GayrEYL9TAL8ev2OVp4aZfAO0EphchcRSONg7M5me+BnL1GO4uyMH4xej4Uk8U6fPAeyEzduYCBnalcCLmQovpeyRDyP8jITwH8HDPbZV76P3L42F6M8l6NRee4pPT3OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPbXcQEp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d851e7c3so238861f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 06:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148130; x=1733752930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=;
        b=cPbXcQEpR+v+1F0ESx/yn6K016tyOZ90xmHzKs9eFufHLPd/Htwmp6RwU0C88/Gxgm
         SOjGNkibqUK+/0kg7uqcxYkq8iEUCgylj/kGHOf7+7x4W1H3xbQGUuFwMzbSYoZCmV3p
         V4cisD/L7bMH0glRxcu544Upj48fQeUjQK9V+PY+oT5sMgyIlSt25+HUOPaNpuxKr33L
         babHjzUafvf3OZPDDVmaqD4q0etRFuepSxM4MgzPDUvpJU3x58GfwiZNTq4d8DPAeaPl
         C1UVFquvJ8iul0YnjxNr0ghq3wNX+h7BBpnCD9yGQkvciChcKhrUaJr5fLKtlhNP1E2Q
         VF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148130; x=1733752930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=;
        b=JxeRmEPbaxSacb0y4mCN2aZ54wjEfqwcOLg+f4ump7kW8hGHen/l54mi940pTmxFK0
         KZyEEvmV//WDWdbIkhegJnPSySZLni+WxaBOvHtmTNEecwTxVhGsI0JGIFWdmOiiz880
         QoqT7mQjC7oJTWZ+u6HwqBIi8RtYxOoE2D3hsZ4bCKa+iTB80OzlWLfhd5Vme7BVwx3Z
         vxs2JzrCch6MWl8Fuu/Ry+7bhZ1xYs1ymG/pB8vB7bcW1p+Rqiec+0wDDnaTEeaAl3a9
         6z04iYhKpvpMNHq1ieL2SShtTKdAJAUX4F57ur9d/hhWZAP0HQi3jAEeWxU6tpsAyCnX
         ebPg==
X-Forwarded-Encrypted: i=1; AJvYcCWelhcMBTUAYUfB4H5wz0uelqOrmbxcVDHy6IPTbfaogdsNe2kPLm9eX4G9jEKTp/9YD2Z9esCLfZca@vger.kernel.org
X-Gm-Message-State: AOJu0YycLBftoYvQ3Q61EQnkVU0h2ReMdT9eChyl/n3H9E8+wEwZ/W40
	tmxci3fyMZmNpIys8cgeloLUN/UWbph0etXuaoEeG0cMTBLXt6HKt3xMw3tv7zY=
X-Gm-Gg: ASbGncscnqFpTEd8QWRyCdP5ptUJh1Y3G2ea3Vu7XMkLn/HsRYiFO4M8eeG9+lbqAlt
	5uQmYb9QHFUwSnetLpkucHiTEAowYcG7y7ttPyPIAO9xTdqBoyUkXG/+1+5z5PqB86qaMZq2O1d
	ijPJ+jsK5Aqf/g1X4CrXBkMz1S4bFaLtA1I5gCN+kkSGavAio1EW6WpEL3yk6GdkbTmViHR4aWu
	J9h7jLE2H1RWpBiMDkgQ4N0fXaxwuC+rbECMXPTs43nhgnCYjEeEwcFKisbDA+i
X-Google-Smtp-Source: AGHT+IFbpzvvcbBvcWNOUYta+EWWguWeH07ZXYUdJCdTYkzN3I9OEgPah3/QG+sVL8wvnjrRt4H4Kw==
X-Received: by 2002:a5d:6487:0:b0:385:e9ba:acea with SMTP id ffacd0b85a97d-385e9baadf7mr2382448f8f.10.1733148128320;
        Mon, 02 Dec 2024 06:02:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4232260f8f.69.2024.12.02.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:02:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
Message-Id: <173314812685.47615.16378245073169097611.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 17 Nov 2024 13:03:32 +0100, Christophe JAILLET wrote:
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
> 
> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
> is not called.
> 
> Add a new label and a goto for fix it.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()
      https://git.kernel.org/pinctrl/samsung/c/f686a2b52e9d78cf401f1b7f446bf0c3a81ebcc0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


