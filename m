Return-Path: <linux-gpio+bounces-3930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE586C547
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E3A28AA04
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A105D743;
	Thu, 29 Feb 2024 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJ6+A7rz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860155788C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199121; cv=none; b=Y8H92M7ciRQBflal2Wm/x/auM3qS+K73ZdGESDwQE+hZnDwEYC3NVhoHdkRYeCnKsRuN0H7PciLKtx2KXaPJpriwZDyCA23JmxRO9m4/kSPrrJKkcUJ4lu9pONQA8MohT27QBvYVVVCWnvPW4gHb2Za177Ds4l5b7fUiLAIXlHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199121; c=relaxed/simple;
	bh=opo7mQZWVYpVDdRyNsHJ8IMcbJUuM71Avs91Rn6IfU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qa4aOVMfsyfZPzMsTjqOcGG3dWlaiW/Rratb+vL3Lz9gMPRvcB6E3CUa60U0ZSPLj0KCT3XxTbp57NESVSJWe7srZJOV/9DCOcxAp5GoZC/g+vU3saa736JQlL0rppypfVhIRYvORJjeOCPa6zaivkDcJXXyDFKxCWoQ/DkhWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZJ6+A7rz; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso671074276.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199117; x=1709803917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opo7mQZWVYpVDdRyNsHJ8IMcbJUuM71Avs91Rn6IfU8=;
        b=ZJ6+A7rzobmaN2J7fsUOYkME9qyeXF7N/DXobsyAzbvaGxu5/BRhUlWg2FP/jZd/OO
         PnDvFYW8vRLMaawZgCN80i6aiRs+Pg8H27HhR1v3D6lYJ7Ed1Gu+Dn3/ZHO7ohiQv/DM
         +B4o+uv5AtDOsqKozZnp/o+ua1HLgvsDkADAQ+2cUzccgzpgyW1GuDZ3JaCnEZQB9x/S
         kbZRnMxIxe4AtQ0SPzQ7tToYkAXAKu3Zh2BsfFIOTqOlwm0u/0szLDpb7yvZ14Rq1EBm
         5kMxLLtbun2MgmUljcHrB03TQ9JtQOH1JGclUCAILyhoDLS/Ht/vmdWtxVyWh5gl/7BE
         69hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199117; x=1709803917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opo7mQZWVYpVDdRyNsHJ8IMcbJUuM71Avs91Rn6IfU8=;
        b=oV7GVgz/UX4pg8yR6m4M8Cg9igGdAsa+NqJ2qPQbvguFLB9D01QszfVJ2FP6Gh10eI
         DAPmJJiJgBibRvOy3f73FugScaezRn0V6mtJHiaW6tK9sFMQfeMZVatHdSh9uhF0+H8e
         vc+N7/y5SjwoDVnOutOZLJAOTKQskABJsfuHe0wXyq94j1RSvsW+XS7+pp1FQuTduTKF
         1Ia+RArCpTGSbGwE/OTjfxvImwmJieTUfJy1eYaBvRThzDB7SENR645C4sAa8a+1XHv4
         mQHOrIiSSLODdMCa/9UomuVXSoXiYRLrkL22VKFxpLyAMF8o0wIX8lHyhtXSwwnq9cBZ
         Ia2A==
X-Forwarded-Encrypted: i=1; AJvYcCUYfaIxHU2UZX3nM8Bs0HyD/9KpNmvgEWuEo0lsjt8a/d9vKt5RPfyHwVHMh+o78jcBBl5+phHCzpzEoK6QejKZ2vmDDlKV61RixA==
X-Gm-Message-State: AOJu0YxETwr2W9dl1rTuC7r+eXG2qSrcnbKZyXlhQaVPnBgl4dN5fJgP
	2+dK0kWtMSdQTXf5QftQBaQjchV4om5SwqQ2b3gfsogRo4yFbFdhymscaflWrRjyytt42+Zp8lj
	jx70v1Ag5cU6Vd8qxU1TSaves/jUDi8m5xjV7IA==
X-Google-Smtp-Source: AGHT+IGNRvaOnTQfEEnOfUNmrrYTBcCW+lJEHgHZjPZ4w/d3EVPHcV3t0qD/I7wrRi4Jiume9znp9nxiaMzhZIyXCqg=
X-Received: by 2002:a25:e444:0:b0:dc6:57d0:ac9 with SMTP id
 b65-20020a25e444000000b00dc657d00ac9mr1830420ybh.6.1709199117653; Thu, 29 Feb
 2024 01:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-18-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-18-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:31:46 +0100
Message-ID: <CACRpkdaeVXAiVO3mukbtGMNRVAQcJKK7d8OQq1SnTfb8F16B5g@mail.gmail.com>
Subject: Re: [PATCH v2 18/30] gpio: nomadik: use devres version of clk_get*()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Replace call to clk_get() by call to devm_clk_get(). Allow automatic
> cleanup of the clock in case of probe error.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

