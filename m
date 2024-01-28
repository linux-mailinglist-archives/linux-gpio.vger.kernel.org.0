Return-Path: <linux-gpio+bounces-2671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B183F282
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 01:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02F11F229A2
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885D310F4;
	Sun, 28 Jan 2024 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdtjoKed"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF1818
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 00:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706401438; cv=none; b=D4p9xIzUYCyjvjc6FFut1y/UeXhbvqgg15H6k0N4ZdDo/MDHyu95rbRSFFFixrO/sAOhHPXY26pyUS6cJ+Cybs9d05jCSzB62cnwrgUIlAOFtClPWer9IJgFo6PfoQos0xaTRiZecgemaXKJHL01S7QY88ihW8thA3cy/dPK5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706401438; c=relaxed/simple;
	bh=6cn79PSQbiyI9xUwGkC6M8lExc7caTDC3ieGKYceHIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUIEQsDV+QaYYH8ETsBh1H9Asur7w+WBD1fDotrf1LYf18uc5GCzYzZb5ndax7V+LucSYHpWKHVuJ5K5feHDRj88xyhPu0yw0XWvUyOskUUTKQlDu9wrOK51Ke5riIh/gBUynvI9q9QNdvBizx4gsLzIaVq2TcwoEuxqKg0WxU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdtjoKed; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ffcb478512so11213087b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 16:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706401434; x=1707006234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cn79PSQbiyI9xUwGkC6M8lExc7caTDC3ieGKYceHIo=;
        b=pdtjoKedXq/i0hoRXYEL7/m1j1vNYsia6iT0aTuIO15IbwV2TboSvIB4KhOZtQElUg
         MmKMTL0LpR06MQMB0CXjWeX2hUXPCT/ni1qXcbhwanUSLg/M5y6AgDo5+/X5yisrN2KI
         26dv3QjL4Kpfpe0W7rm3AVP8JpLltu5Z5BIejUzhfZuncK0fktZ0AGGpBUqyz1ZtuqAA
         jUBoizHq1QJqPh2Aidz54MJHTvEJwVZZhpVMXEHJoIEftKSaMgbufMNPnH6RIAW1fTDX
         RitWZCsMmGi7hV7qriifxfOamODgPEIfTcA8UwGilP6yFAdGw5YK4PF2/1nmW3PxWg0O
         NkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706401434; x=1707006234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cn79PSQbiyI9xUwGkC6M8lExc7caTDC3ieGKYceHIo=;
        b=f8syZydM9PKlDZeSQHwChMSVEq3+HYRRrtyVgfYeRlWLP+D5drdVjRb5rsgzdQXcZR
         F+uezbSnsT5o7Ec9q8nOiN5Y5Nu/TNmHo++VXxK9tUSE/NaS0wfAEZxZrX9/pDEnhAf9
         Z8qPAdqBlxmMHWQS6DdlJp9wih5yGl38b7Kzuw5h8mk9ie/KfZ2agB0ua9zhqmnJi0V5
         En4u+NtBLrwaujCTXDJG1RHFaV870GlSF+HeKmIbB2bxz+8uaKAYx/8Y814nMfLLwPdl
         S8SUpTZBYZkCcZ0Lqj7JUiwEnHyGPvdA3bEaE22gswYl6YK14O3CYIM+eXTxYF5+yPSu
         pmdw==
X-Gm-Message-State: AOJu0YwsTbCjruOQGw3poy2T4S2FlCTzAcpbPW6NWetYUsePgT2b24YV
	YqcHMtlkbgxEW4rYFpG+668oNg3+ytBWu9n7X9HQimYYsylHE1M/CyOW6FKr1DQicLCej71jGWk
	8I/ATqSzwzoKPOvVd4K4HusgwhiljA4xsQzYVaA==
X-Google-Smtp-Source: AGHT+IEiAcddPom2zSdcKLSz2KQ9LcFV0Se/lfGWYnEXGFBLo7dxZ9PmZdCWe9Qpx+Hy1YBmF6FetdQek17ztLkE6fg=
X-Received: by 2002:a81:6005:0:b0:603:cbb8:cb64 with SMTP id
 u5-20020a816005000000b00603cbb8cb64mr42786ywb.19.1706401434728; Sat, 27 Jan
 2024 16:23:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121-pinctrl-scmi-v3-0-8d94ba79dca8@nxp.com> <20240121-pinctrl-scmi-v3-3-8d94ba79dca8@nxp.com>
In-Reply-To: <20240121-pinctrl-scmi-v3-3-8d94ba79dca8@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:23:43 +0100
Message-ID: <CACRpkdYVYSNscfUDSMobHS+EXdxaT_YC9iOwyPmK-pAZJXr38g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 11:18=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>
> Add basic implementation of the SCMI v3.2 pincontrol protocol.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Co-developed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

