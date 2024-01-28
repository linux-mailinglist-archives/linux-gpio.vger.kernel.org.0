Return-Path: <linux-gpio+bounces-2667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E283F264
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 01:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4D981F2312E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A56B23D0;
	Sun, 28 Jan 2024 00:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvFaXOq7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C615A4
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706400402; cv=none; b=H8MoLiw0xvP7731qJ7w+Qphq+ys1RL1Q0AlFGoFkpDFwdxPmC+l89mrBWTua9MNR9tmooC18U5S1jBxyIJxKxJxX6bO1enndPSI2qIQjrHG09T6hP5Pbv/e369uBTkWdLjokJWVV1NcIcgg7CmP1eFdRZjRQ3UHVS9srYBI8y9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706400402; c=relaxed/simple;
	bh=ammylFPq3l7kcWoDBrB+c62nBJSB6kVIemC4JBj/rF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qpa6DP4vXeASGXBRbQVfwIAbuxVWBSMy2gtsi6FhxV4jESOC0dQ43/P7S+fNpfvi5H3iBXfUOvLVJw5FQHHhtE3DxJj6SfOH8EsEPLG4cQIwyESJ4ZalJvX9cCRwGTrIo/Zw7goJL+lLZkrhJF4/gjIl0k5JkjgAhKv+mUaKx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kvFaXOq7; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ffa694d8e5so25075427b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 16:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706400399; x=1707005199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeb/WqSCatx9ZWHQi1P+avr9vJYUzW5yoj2SSuS3mkY=;
        b=kvFaXOq7HMBZRffSBFNLbYYe5nwUYjVb9HiotZbkddnYM+nYpiCk5VaZwwQyhPl9RO
         KZs64ES+xP98weC6AiIdVtdRcDVoaHHfXXFwfuo0tH2ZyDrCWW3TfgjPyFMViWME50/1
         p6yU7y4uDLReFv7pOgBxLHiK8yBUS3tAolDKbe8LrtFPYI1hN2ZgGE2WJF/MO0NMrzKL
         wYlyvs/6NLTKiPIiUNnXWxFvRdNlSoZprFjCleW8+XGm43MWi+J+uGq1FMJu7/XjlgOa
         3vNv8NDkqCK/OLOm7qCXr8b4fM+PzVTLenrk34BjZLnzu/6rpnCvV7nzkIltwkmv3vJA
         p1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706400399; x=1707005199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeb/WqSCatx9ZWHQi1P+avr9vJYUzW5yoj2SSuS3mkY=;
        b=L12NVTvGU8MSyOsLGm5ocEZo+UZQuCQJ7Tm0VNRlLV4bPg5Lc4ALwiONNUPXgQku7z
         ZMWM5jcKNWtS11N0mDlUFRyIrlhvJqcd3Xhsur81dy11wYFUde+MWfirclDsspcUa7H/
         P0udUGIzujPX3RNXQ+z6U0aiMVfZv7/rUk+cxIY0rScYCqqGsyzVx0ReTbdcpyUXzWfa
         Q3qvn/YC0x7cu7yXybW2Vo6Sq+Z2hJa0XGzuhEjfBY59iDkG95r+0zkbjeMHXJEqsrw5
         gSop0eEuTQGvwycCDTLu+fZVOe1GplZth7GU94Ek2sUEFyMjIuj3NncDucyn7COUWEJg
         B/Ug==
X-Gm-Message-State: AOJu0YyKdNoutZmxFHEkRwAM4EvA6gCU4VDBCGcwgc3Bgvx2uzDT+KVY
	A/PG0nJvd7j/+SUptMbQxiuOt9Xl9oMEtBHhwZMtXfZwl24aiMI32M2f0s5CkZE79h4Pw0OrSvl
	Q2GmzvNvGh4ukLAiz6MZOjZspTRieKw9NwBWGKg==
X-Google-Smtp-Source: AGHT+IH8ey5M/U7KKK8/OFPC1e1ZRlA7GCbuqfy0BCvDeBIsu+/tzOOfOJ6Bk0ZVkw2d8ogJvaR+3xSia+nEk0U1xXE=
X-Received: by 2002:a0d:dd0c:0:b0:5ff:87b2:e43d with SMTP id
 g12-20020a0ddd0c000000b005ff87b2e43dmr1973626ywe.36.1706400398954; Sat, 27
 Jan 2024 16:06:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104-pinctrl-scmi-v2-0-a9bd86ab5a84@nxp.com> <20240104-pinctrl-scmi-v2-4-a9bd86ab5a84@nxp.com>
In-Reply-To: <20240104-pinctrl-scmi-v2-4-a9bd86ab5a84@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:06:28 +0100
Message-ID: <CACRpkdbOVu4A0JdwvBaxvgvoT5u3VbjTyQi0mgqknCixR2vzYw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: Implementation of the generic
 scmi-pinctrl driver
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

Hi Peng,

thanks for your patch!

On Thu, Jan 4, 2024 at 11:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> scmi-pinctrl driver implements pinctrl driver interface and using
> SCMI protocol to redirect messages from pinctrl subsystem SDK to
> SCMI platform firmware, which does the changes in HW.
>
> Co-developed-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
(...)
> +#ifdef CONFIG_OF
> +       .dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
> +       .dt_free_map =3D pinconf_generic_dt_free_map,
> +#endif

This looks like with !OF the driver becomes pretty unusable doesn't it?

Should we just depend on OF in Kconfig or are there already plans for
ACPI or similar?

Yours,
Linus Walleij

