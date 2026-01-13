Return-Path: <linux-gpio+bounces-30494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5156AD1998B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D423043118
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 14:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8C5296BD2;
	Tue, 13 Jan 2026 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yP8Wf6CE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B263278165
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315554; cv=none; b=a3iSyxdOr6GMlkLHt01k8VRAyh3fI49a9InL48r5d27Y4Rx2Gk4EcIO6NHXUfqlJuXVUZ5N98i/k8K4Su7fw6PEJWHRPKm7xW/Jyx8/PmR5Qi9vcXG62kxQd7ilLZ7IRZf7Qgje/yx7XQYKtvZfGCwYotQhfQqFwVZ4is67eqxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315554; c=relaxed/simple;
	bh=CvzzAWEiZsyYGF0f9MjP42ia90jPhaMvKGX6vgo2wFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNnO8r1VTIcIJj2DN9UIDJgyXmZgi7SejHQ+rusxliL9mfKCa9EuzB395Qd78SdFoqoEdvgNxmzW6Dow5SSQk9HftmfqsvGbCeAo4MTgWTgYZiZYz/V/kGEqS+l9YifMriKudubcD4bdmBfaDTWRGaMbOKW1UoORnvDmAlBHR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yP8Wf6CE; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3e80c483a13so4605809fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 06:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768315552; x=1768920352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=;
        b=yP8Wf6CED1l/0jzDDDj+gTyxR90lbjUOjvPGjaQYlrQZsdzruh7u13tsgvihOx+ZaB
         +FENn+0hzq7l4I7e/+hhztsdQr98PUSU7ssNZXxuC8kz8q2QjNaKMz8XfGHAj7WGgyr5
         N3w3DyX75QMoqeLODS0M8PMSRZQSdLWvR4qS4a0YiDSnTfr4BTXLJ2eirVncUk4p01j/
         odw2HFN6y11YmMQVGrGG95lw+jnRztigjj5sCQNpW/98e3aOK394b7kT9S1IgsrkJ8Df
         yVo/mkw5poSrqP4J2i095UYavRtuzyv6JfFM+z3aLsf+Up2pxZk7nP7OJbKJPied5wPq
         wqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315552; x=1768920352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=;
        b=tmsui267/vfmHK3CdybcQcaqab73ewxeCZHWa+hvzg1A6tdrY/sKAfcC+Z3xyy+H8n
         9buFyVEEu2VLkRT/8rsqYkzk89yihkV67Jq+2FL8y26vOaIr6efj46h8KWTL3c4VL4Oa
         iPNGVO3YULMH3oDVmZ3C1jDtLNRY6Stb7pJ3MVk0GehsY7B/QfQ8rCTVnActl4RG0QhN
         rXrMDhnIB3gKotdZq+KDTFj1RB9GtdOW22gTtiO0C+SgYZiw22l5g4mF4r6c5FZvCxcs
         gQMJP21FKFZYpFVTLhpj/XHNU7HFOkjSPd8L44Qh2Uz4sh0agLAD5Eu1oBdCU+ppdLo5
         pqvw==
X-Forwarded-Encrypted: i=1; AJvYcCVY83Dm4Dk3vxe2/d6fnhe7m6u4OsbZHAZs3+cpaLoW7YmGuTb7Kqf4SS9CKDczB5oVlDi/+xUeU2xo@vger.kernel.org
X-Gm-Message-State: AOJu0Yydp9gdVW5qdo93lfAQhVOuYZ54SZsB69SBA5Gb/FzM5g8j/zV1
	kyg3Z8P9ldMHdE0fl4C68/Q9gANnO7TRYIXJ6nQJs1GvuadaafZy9LRns9XKtFokI+RTtjhot14
	GTRs37gn95M7piGN5kW4GTedLv4WIiaiJbNQ2AnIRjQ==
X-Gm-Gg: AY/fxX647ctKeWaCmjphh7qx0kMX7D6f09Comfl3LXaU/ng/x9HlSP4VJShiyKdgtLu
	hCLHcnfzEYiyAzx9His6fQ7aiQiYAgy/CIfHRntGHS72rgDJR09DB6BwP+ybsDu1DCRmUDdfSyj
	qK2x6fAmySsac9GD7CzaHzQAD9/4nnTi+AMfFF2VoFo4RX5lsoI08ua29Ljz0xf1vvrqts6K8XO
	Oyo8W9l01YktYsgMY7hzBlouX4XaQk/uv7FEXOh+OvtA86gJQNILMOYDQAKqQbCop5W9Tq65luc
	U5Q/eHyqOhKveDEGcDQSA/6DgA==
X-Google-Smtp-Source: AGHT+IGMsKCWhXxncysaNn43dYmEYyDwcJaO6TjEgdKAgRTiQWieHjD3rHZkyoBEsAcvj9cD16CSqGEscd62IkICycg=
X-Received: by 2002:a05:6870:55c7:b0:34b:cc55:9e85 with SMTP id
 586e51a60fabf-3ffc0954865mr9095150fac.13.1768315552149; Tue, 13 Jan 2026
 06:45:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com> <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 13 Jan 2026 15:45:40 +0100
X-Gm-Features: AZwV_QiARd5ZYYBrSjJNdNCpX-7fBluIYLJTcntaG_DMT6Vl6m6kjiymZLCqUpY
Message-ID: <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
Subject: Re: [PATCH 05/11] drivers: bus: add the stm32 debug bus driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 9, 2026 at 11:57=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:
>
> Add the stm32 debug bus driver that is responsible of checking the
> debug subsystem accessibility before probing the related peripheral
> drivers.
>
> This driver is OP-TEE dependent and relies on the STM32 debug access
> PTA.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/bus/Kconfig         |  10 ++
>  drivers/bus/Makefile        |   1 +
>  drivers/bus/stm32_dbg_bus.c | 285 ++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 297 insertions(+)
>

[snip]

> +
> +static const struct tee_client_device_id optee_dbg_bus_id_table[] =3D {
> +       {UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
> +                  0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
> +       {}
> +};
> +
> +static struct tee_client_driver stm32_optee_dbg_bus_driver =3D {
> +       .id_table =3D optee_dbg_bus_id_table,
> +       .driver =3D {
> +               .name =3D "optee_dbg_bus",
> +               .bus =3D &tee_bus_type,
> +               .probe =3D stm32_dbg_bus_probe,
> +               .remove =3D stm32_dbg_bus_remove,
> +       },
> +};

Just a heads up. With
https://lore.kernel.org/op-tee/cover.1765791463.git.u.kleine-koenig@baylibr=
e.com/
we're switching to use bus methods instead of device_driver callbacks.
That plan is to merge that patch set in the next merge window.

Cheers,
Jens

> +
> +static int __init optee_dbg_bus_mod_init(void)
> +{
> +       int ret;
> +
> +       ret =3D driver_register(&stm32_optee_dbg_bus_driver.driver);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D platform_driver_register(&stm32_dbg_bus_driver);
> +       if (ret)
> +               driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> +
> +       return ret;
> +}
> +
> +static void __exit optee_dbg_bus_mod_exit(void)
> +{
> +       platform_driver_unregister(&stm32_dbg_bus_driver);
> +       driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> +}
> +
> +module_init(optee_dbg_bus_mod_init);
> +module_exit(optee_dbg_bus_mod_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
>
> --
> 2.43.0
>
>

