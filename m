Return-Path: <linux-gpio+bounces-12171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4129B1FFF
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 20:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808C61C209DB
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 19:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F6E18130D;
	Sun, 27 Oct 2024 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/iVAjG3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD917DFF2
	for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730058946; cv=none; b=bILIrCfRV+pAsmY2nPPrhmi8KnYrV+yyCndrzbpUbLavKIfXRJe1q+BtzQK+5PWuFFl+bRd5V29MDpjoZqtx5HkJp7u8JjbucL5FCZMhvcek44jB76YPOz3CruWdvadyUeA+842uEPmNJistJvR4QBg9d2Sf86rml3jFfmYfrNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730058946; c=relaxed/simple;
	bh=RAJET1e8H5pimsyhNbCsOgJyKTN2EQhLq4TcKdUyenU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oiVD1lyAVTmMjx9Cqg11/GMQZBfLCKuOyV5Mop+XbgUIlLBLHJFh3X3lh52umfeeZy57L9HBMv9WL23WinVRngK8NKl48FxZwm+3k8VVi+fX9lB49iIhqB0yZB0n66KNTlVeqxBP6Wz44tzpOqsXgfc8S4Ee8Nr1lGJ2yD+Y2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/iVAjG3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315b957ae8so3867235e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730058943; x=1730663743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrID1a50St1Ycn5Lts9W6gCZe1RBkf5yJjuRsg44rCk=;
        b=d/iVAjG3NM6f3Kv7e5xYbuNjhf1u2r9XHq6xqKS/Ake4vgm/xW6y7w6BfhgPnNwiYY
         A2TSN9CzJxa21ZeATKKupDpWtHIA80CdtTkCmBw612SxTDVma/oTghJ3VFawwbuv4VP6
         afMuPRIsSMmg7DrIehJkYRIHzvm06m0ZNXMncDUbjuE0aArqxmxFOv6CdOJforoLPQC9
         wSnjTLjnyJcZ1HU6v0GDWUchu7d5uouGwNJUyYqx4MDBnbzgxtMeklH5j0MOAKSen4d1
         mA5A+gNgOpqPtZznPyBV1PdKHYkQ/9G9h0Mn1tvdZgHGwYzt5aUl3G9xx2FTxnsYTse1
         2eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730058943; x=1730663743;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrID1a50St1Ycn5Lts9W6gCZe1RBkf5yJjuRsg44rCk=;
        b=rmYPz3/3t3tQahN96meEQu6yL9PAgjbTr2QdhLJ8CYoYGQKRt7xsywpUcStJku/32i
         PIjLIVjTwyav/6mvU43MC7e5OzQjKJyxE5fLaLMF9MPklxxUYe8MTqEhJSGfEWsnfSAH
         t/mogy+76FC5WvuvFcMO+j5W7De71ypiIgQmLWyUs6hPesNiNftwwpwlx7o9lsZ0oTFW
         7nCL+aekQb1Irup6rL0Hdo9fBh+wRB+y4/GIUorBj4eAewB+xhti63M4vQUJyQrYIOAp
         ZwMTO5Vm9Unaiu2jKpLui+KQCFhsfkHkrYYVqjr5eYcX85AEs7sR8AuY88KLV+z0ue9Z
         y35Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+x7LZ6Uc6FTWaOZc84M0VeIaNp/RoFmamRKsF7oRqMm8b2cvmdX2OuYX8Av1tHDCLJUsKanxx5ST1@vger.kernel.org
X-Gm-Message-State: AOJu0YznzZBl8bJnHgnEr5yqK8FpDhlWG6Xf4XYjQG17oko77cD7VoPk
	ovWyYncAhHnGfGW6RgloPd0J2+6y4AmSycqI5m+unkffafdFvm9BWbq4565q3rY=
X-Google-Smtp-Source: AGHT+IHc71/Uo5nrRKd2jkrxoO6lYSPPb4FmrPnFvYMb/0szUHabwFoYr0d8c9FeBg/k25ggkV87cw==
X-Received: by 2002:a05:600c:511b:b0:431:558c:d9e9 with SMTP id 5b1f17b1804b1-4319ad24126mr20600575e9.5.1730058942688;
        Sun, 27 Oct 2024 12:55:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431934be328sm85548215e9.0.2024.10.27.12.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:55:41 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-7-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-7-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 07/10] soc: samsung: exynos-chipid: Add
 support for Exynos9810 SoC
Message-Id: <173005893911.10219.13567628318408023660.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:55:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:38 +0300, Markuss Broks wrote:
> Exynos 9810 has the product ID of "0xE9810000". Add this ID to
> the IDs together with the name of the SoC.
> 
> 

Applied, thanks!

[07/10] soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
        https://git.kernel.org/krzk/linux/c/fd0b3581666860610ac770d4b582df42e0065c58

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


