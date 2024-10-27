Return-Path: <linux-gpio+bounces-12175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8F9B2010
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 21:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74F6CB20D34
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 20:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3287DA79;
	Sun, 27 Oct 2024 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Afu21NHv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B6186E3F
	for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059209; cv=none; b=VLGn6dtVTc2OftmS/udXQwquhMYJ+ga6j1q5aOQFQJ/BXGuTJ30LigLbBwULhhmzPEtKjUjdEYwLzlkd4R/n1bV6bdMm0GdPEYThLZTk4tiGdA9QaVSZeEhP0EnJhJOWcEaIy4ubhv2N0queOVXHbmpbzM816/E9IsV6F+qTg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059209; c=relaxed/simple;
	bh=7r4lUdgWtrljUsn0D4B4TgWrqztK0jELsrteGPPSmP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hkbtsePqfURabHn+kxTD/vC6krvZDwI4PTTov+1Bdub8jQaj9GbElJbYJi3UvXm7ZxLKqturNQHHTDOuGu5YO7jYnw6sNvyTgatSrV0fwDh/aMAo3zwmHD6bw5HDRWKa0xg/EhOSxE23PT/j0mCOfgW+nUUigom2JlqMFK3zdIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Afu21NHv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314c006fa4so2928095e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059206; x=1730664006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=;
        b=Afu21NHvIPG3Q8Rx7HPgNm64f7RzAwATDdSHa2HNn5XrxTlw6/LH1B8QjnLvIh8THC
         AMBzXx1dtv0GoAkZjfgUjEYPRjM/S/msExmOqwVENHgNop29GgcSz3b8B6URjL0n9JMx
         1pE7eU50+NAlxU2sZUS4caiI2oaZ/h2w4sTS3Dzt9GIX2NiUZlM6ZMCSed/LUFqavktY
         2cdv4RHJFCi9HT138wDBanHSwbG24cpz+2ipT5PWWvV/JrF2YcHou5YmN8mChEuVLuFL
         fUDy/b++y6xEcq1eP/A8UEPsjoKBunf1aJeS+c7G8/6XZh7PyI1HU/+YuHQfpKi6z5E1
         +M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059206; x=1730664006;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=;
        b=b0nj5Or7WQAvxmJAmmAiuYxYQuzzN2KajxiGnrE7KI9hlCfBrVQzp2QxuWZQCk10v6
         mST217oZdF294/P7Kek/DV2+mZb6JcJYCc6XinoIKmabXyQI+sL5hJlbFUC4vWfNe65t
         OA+dkR+gFOQUsC4WUEU1Umik6NFpoc39w8iAYwndPv7alT7Eqlf0JjmLf3B03oBsphFH
         XzliWftYiRZ35vW5xnVa58XdJraDApWtiSaKLJDP8C5H96eRJ09TMSjlC+qZCJJKInzC
         AyVmyoLl1mLEWOXMgd1bRGO4NhzFGdHuRnC/fIP1mF0kJY5t83mbdQUezrDcYtJtHk6y
         jNOA==
X-Forwarded-Encrypted: i=1; AJvYcCVkjA1nnfWQD2f0QY8N02+/hDI5KWiCEDcsOaiXUX2sxRwd5aZRqadfJyzzKNN2J5AdskSfW+DXJxjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqTVeQK8Mfgn6bRUSXOgpHDdAYZ2oHIA+gtezzx068n9KVuJa
	7uKLUmXeb+94Txyf1w+i/hahrMqoMdLQkBTmp2UqDB2oGQZAZDANeMKMPt70lM4=
X-Google-Smtp-Source: AGHT+IEPzymzHIjiOc4zVdkC5xXbX8anEIX0QF8UPHvqXkly7pCIAWv4SBr/ppPEUQlnckjyhxDKQg==
X-Received: by 2002:a05:600c:4455:b0:431:40ca:ce51 with SMTP id 5b1f17b1804b1-4319ad280e9mr20127915e9.5.1730059205991;
        Sun, 27 Oct 2024 13:00:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:04 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-9-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-9-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 09/10] arm64: dts: exynos: Add Exynos9810
 SoC support
Message-Id: <173005920218.11546.3963593817214010231.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:40 +0300, Markuss Broks wrote:
> Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
> such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
> Note 9 (crownlte) and perhaps others.
> 
> Add minimal support for this SoC, including basic stuff like:
> - PSCI for bringing up secondary cores
> - ARMv8 generic timer
> - GPIO and pinctrl.
> 
> [...]

Applied, thanks!

[09/10] arm64: dts: exynos: Add Exynos9810 SoC support
        https://git.kernel.org/krzk/linux/c/6c1fe47df5a79f1efc2d5c73e506c8d34692527a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


