Return-Path: <linux-gpio+bounces-14134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E49FA634
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 15:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AF787A2030
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A151718FDBC;
	Sun, 22 Dec 2024 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnhvYlfF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CF18C930
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878841; cv=none; b=kCq6YtCvyYghtmtHk3QLBGgt+fdVmr9D6HfdrmLRQhXtgaidmBo3Gf2cuWQqI+1aw6ypbmqIB0DwA97CL6B3uDkHZuMO9O+MmcqvtV3IezFkOClKflTLNWZtq3n2Y+zbi7eZC90ai4zi5+2yASIy0DxN4tfAJE/3xDGxX8Eysic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878841; c=relaxed/simple;
	bh=woSSopwRnElbelpPMs1jT3Qe4qW97goolW3OP2OkN1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SxAZS7LMOIOW9WTcDjIZSgvInyjGf7YFvlL6cb07xnbiHlRLEYDSvxjSF90XvC7JVZswR2ucZYGpnt0I2UTgCGKwwDz5lwPeAvW2ib1WSRRiurBKge307B7xC/hFbE2pEtMXwEuM5lsLsQFo0IKkZvaxGc1LQyKC5u0opl/Xj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnhvYlfF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67bc91f87so57126766b.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734878837; x=1735483637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=;
        b=PnhvYlfFiTA+RnarSz5cOJz8WRMZW/b9KVEVHo3AHnQPtqbx9ylAyEIzoqsOisuRd9
         KVQ6tLFKDILkO8kB5sdi1pqdFaKHUcywjKUrEMpHTtlTIGzUTgCIpYW6a46aS8vuOWxP
         afl/dlftH3ZR2jbd6PkpWgt9s8QunIXTm4v7Y2YiKvQKFOiXuCjLygqKbHl+PJxMpLkN
         ofFre2FP1MtF5cU+rkGUTUhUyRoCCPWz66AWjQa4HqsFHbdcwtYiTp6bPFPjRPJZeHZw
         YIj465Bgkm3DypboLU0zQMUdP9x3JB8g+RA43utkFYPVqQpMgcmrKt7yoCoCylPQy37f
         8sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734878837; x=1735483637;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=;
        b=klOYsftG30HfTrM9KixRwwKvP1yfNvtt+N2tcelRE0YxL3f6T4/6LPo5EMMzQRpzZN
         qICQDU+FVoQZSkoIWz3zCq079csPS7hnl06q82trhmtQA7arOUkoff7yJEmXgT0G47+2
         dRYRAPk0RASTbSCmA64fOzQdupVpUkwJOVoG2ygIefz1D/eKjc+0pLx+e6lcl3dsJsAz
         P4XHWqT9/S75HJNDg6Ov9cHt3YB3+TtCBE2e9r4QR7Gc7BezWijwBltNQx07DE5tEjx8
         A8XxOH9juKwX8ipgtqXWutSSTniwmvSIjjf0rW9m19ce9LtY1G4PAhTqXzjG22LAKF5a
         BWXg==
X-Forwarded-Encrypted: i=1; AJvYcCW40O1cukp0uBogr0FXMjYCEb0xUDhHLjy0vS3DlQQF3Z41PcNokkwGfzqPNYVxXVxv7QY98kIZP1cn@vger.kernel.org
X-Gm-Message-State: AOJu0YxXU4z+SeNFgnsqyyRodjZVIBKgGNkSggRSsKnSosWUL6BbCiCn
	/UaJfY8ctS+YuuwLnHY3TP+3d/6TBJ47JnDmunQ9bBQ4vWXgIo18PHvbYUHS8OU=
X-Gm-Gg: ASbGnctFNRPYG+J5rB1uYBPoCRTj40fawdE/m7OPzMm+F6qrdAcQaCEZfegiUTUm4hr
	M3oo3aGWMVnZEvMWhQ1rinEhqM6AcgudMMZx7D1Zagc+FQVxf+x8Xg1g4jswHdYYIH0W47/ontL
	mJGyk3olsGjMXsSILXi2m/xH77x5EkLjgRMTu6leeMI1+NDmBp6Mu6mWo+K555HbfoDjH+m/YAT
	Mq6aL8pDjWN/RDxWIIRec15NZrwdZ5ZfWmV9+Z7MC3mynKGl7bep0UnyMrBIbf7/qaKZkoCN6E7
	v+rEJ+BE5OpOQ5g0N3cN8v9moiB1bDI=
X-Google-Smtp-Source: AGHT+IHtQGYsCivCQdxdxbhIMcr1C6rTSuDeTm2poJaxHYzRC9Hx9uYNv/i6n4uQrNAoTdj6lsN2iQ==
X-Received: by 2002:a05:6402:3596:b0:5d0:8e70:cf86 with SMTP id 4fb4d7f45d1cf-5d81de05c1emr3525793a12.7.1734878837303;
        Sun, 22 Dec 2024 06:47:17 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae3b3dsm396496866b.82.2024.12.22.06.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:47:16 -0800 (PST)
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
In-Reply-To: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
References: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
Subject: Re: [PATCH RESEND v4 0/2] Add support for Exynos9810 SoC and
 Samsung Galaxy S9 (SM-G960F)
Message-Id: <173487883501.18913.4157239259617984127.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:47:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 14 Dec 2024 16:56:45 +0200, Markuss Broks wrote:
> This series adds initial SoC support for the Samsung Exynos 9810
> SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
> codenamed starlte.
> 
> The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
> and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
> should be fairly simple to add support for other devices based on this SoC,
> considering they're quite similar.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: Add Exynos9810 SoC support
      https://git.kernel.org/krzk/linux/c/698be6fe8f89b5edf533a85fba7258339c8b72d6
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)
      https://git.kernel.org/krzk/linux/c/63da297f0303c39025172cccafca7b55b169ec3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


