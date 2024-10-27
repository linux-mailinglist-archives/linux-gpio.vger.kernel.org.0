Return-Path: <linux-gpio+bounces-12172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 546889B2005
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 21:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2161F210D3
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 20:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2254DB640;
	Sun, 27 Oct 2024 20:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCPwgDrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E417A924
	for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 19:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059201; cv=none; b=NE6wj09WxLWP96GBWu73Wzbpfr2nM8enGGOzzLBjEjz3tzMXKwTPzngIFTW/XnESB3OSe6x5CE1WlV4X1HE6URuGz/MUrKx9LJePDL4jg5v3hXWu3nVSVNMl/flSvmWs4SUXjb2emwrdMn+RMaq5STpQuNq86uNUccqkZue+vRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059201; c=relaxed/simple;
	bh=LYehHJ4s3dtf/pKCMIKLZGe01G+7wT/0gQA9iTil0Ok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fgxo+ayX48wCdM0KxSnk/NUyiVGbxYyXTVABXWN4i7yJTRYPBjAlp6R/9uMkcZ4jZ9J3F47DUycRzmHcpKKUIaolTrd0qOznvwXlH/LQLtvm7mltapFNINNaw5k6KlgrluEfGDOAzIjioSwvjzOYzmk6IPAWEvk06ROkLhyFPzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCPwgDrW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431506d4f3bso3883705e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 12:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059198; x=1730663998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z43MNvtr+jq6zZy/Ceg3w8kHzHBw2gUNp+Mcx1ypN08=;
        b=hCPwgDrWO2t60yxxu5DUywOs6M8hkDh+VoRZWxw9rLMzTh/HrAMT0/5VfchIGLfv1P
         i/oNshQPQk8NHI3iAXMCHh+MY7RbQrBZy5JQfS1zaXrmmAUCX6lGSZpY6TekpZohsYDi
         SDq46Df8i53zaYMvjO1PrGQ55iTDiO2Rp4Ga1fYW3jJAoYrYo3GUxcgfTyKObIQGSDMK
         U6+Nj0MjvsySNrOWpEOQFaAGiIYeYbEiQiPHPP+eCeTlr5ok1gi/KEMC6Rtn0jsF+GG2
         rySCRpkg3MgdxMGFkfzrHId4dtiK0yDwyMtIpe5HYSldIlHiGFJTQaXrRTmBzH0OzYQJ
         TtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059198; x=1730663998;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z43MNvtr+jq6zZy/Ceg3w8kHzHBw2gUNp+Mcx1ypN08=;
        b=m4MBzQzFFWoM/Lr+VMHJC19zsAFAz4ez+6EA6Km9jPt5+8ZJ6svi1Bf678jI6zu250
         oZxV6BVNNV+7UlX80u6Tv5CODVUE85d/VJgc6uq/HJFNKB3WJ4QTR0foB4zyYbjxErmH
         hD95VANRoh2mhN5ft95vdDv9UEVIQvCW9eXtoNgIaklywojsdbwZeL6JVLIEWQlwd9zU
         P0CS3XQz5smHjPnhT7djy5CwwGDnuhiBJdJWmI49Umhjg9didBTKjzR11mqxxGOpyXaa
         XlCL3jK1heKRKLfizOM9BMdUD9nVYnUMnS3ksWCo+dIOIZ2K/3yQA7NSIrpDxeKJZXqB
         +peA==
X-Forwarded-Encrypted: i=1; AJvYcCUt8JzotKuoozXDPtlWsV/SMFXCzcxFd8BLaCmdjbvF3nFtVMxPOtG3zX4QPQo2Z9gvc9Iwlx1db8B9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sDJmgT2Jt9ZkWEe4jlF+OoBfB2nwPadk5ljHkwGGdt7gH0JY
	YbT/zyU6uyO/2G3CBbiBM+e/JfBmBaxsyq0fNpd/0iseJnY1KKKSwAgmXv8WHCY=
X-Google-Smtp-Source: AGHT+IENeIZ6Q2creRcBv5NlAj4Kk+mWXSMXHI7UEuySjpU9jJIS4txaEKNvMA/dJM33aIeSmrHz6w==
X-Received: by 2002:a05:600c:468d:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-4319ad75782mr20378395e9.8.1730059196577;
        Sun, 27 Oct 2024 12:59:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:59:56 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-1-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-1-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 01/10] dt-bindings: arm: cpus: Add Samsung
 Mongoose M3
Message-Id: <173005919374.11546.17517915253250206692.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:59:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:32 +0300, Markuss Broks wrote:
> Add the compatible for Samsung Mongoose M3 CPU core to the schema.
> Mongoose M3 (codenamed Meerkat) is the big core in Exynos9810 SoC,
> designed by Samsung. It implements ARMv8.2-A ISA.
> 
> 

Applied, thanks!

[01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M3
        https://git.kernel.org/krzk/linux/c/608c8f408dac3d1fd96191494f1a32ba2b1e133d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


