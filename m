Return-Path: <linux-gpio+bounces-1008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3134804B7F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 08:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF393B20CE3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 07:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F372F854;
	Tue,  5 Dec 2023 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="An6VN3FL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FDE11F
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 23:52:26 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so26904266b.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 23:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701762745; x=1702367545; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HE/x2HX9YSFYGtjbEwzCNCIFrX4hXFWClA1p9cANaOA=;
        b=An6VN3FL8YTngmvQIVKPM66F6MZ0eQLnLIfwi/xsxWsKpZ0Umowx3CtBCd5PB3sFOq
         R5wY6vFHJxi6IyWlSt2i4gvAjHxYERxOid4sKqaV3qerONi20rldtIgVjNF3SzrsmAyj
         sAzBOJvcx7QghwDi9S5VQd6pTPciUPs9e5+vi3VnQRBDwCvRQeAY5bBP3tab1IBXzxSL
         993YBlUErRRYBjBSLBVIi5RyO6Bz3tMVMV/AO6Y9rMIpQdQbew5AwVc/0XeNHK5LB7Cz
         BnUeZ7nedzQfJyLFZwkCoutFzQ1lo9jEK8IUmrdtSHXWtFW3XHMKyhJEMFGf7WIFzYrE
         +ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762745; x=1702367545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HE/x2HX9YSFYGtjbEwzCNCIFrX4hXFWClA1p9cANaOA=;
        b=MVkepSShYi6yLhgd3QsdRLemGtaLV/v+WABYfZ4gAICQJuTaIthoFqssbvuQZ0+w17
         pGW+jkg1+6uYV9kdqvw6+WYJI55YZKoDBHxEDQUnPRJJDj5koFe3ILdU9EHuR3IxrZLE
         owIPOx6FDr2C2MNKNjX6QKCEzs8JvaNnOS0XoeruB2bZi4Qo4gTCDJViQ+tBT9LgBFvE
         VadTdOELURJaFi49X/QXVui3EQGmnXjM0ipSWQ2sXKzVAW8lLzCejBBTDsSmVHExs/7V
         PjeUkDD2BM4oqXdDwxdOdr3b75qFmffsbRuVp4nfRY1J7iAeP1pCqQmVGG03JBLP/ZgQ
         wSMw==
X-Gm-Message-State: AOJu0Yx9FafEVPZrdaNkbyvPCIHpdli+w3mqbuy4WFyXqUTReThA4QDJ
	YCmWCeOfn7qXkLTFduJID4airg==
X-Google-Smtp-Source: AGHT+IHbV8OwzZcl7l/X03ZGEbDkrVRvPZ9VTnKnRZqff4x1iAUtK7Aml/g+lGmSKaItydhkWAvUeg==
X-Received: by 2002:a17:906:4a98:b0:a1c:9738:2235 with SMTP id x24-20020a1709064a9800b00a1c97382235mr148783eju.118.1701762745098;
        Mon, 04 Dec 2023 23:52:25 -0800 (PST)
Received: from [10.1.1.118] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id lt12-20020a170906fa8c00b00a0290da4a50sm6213248ejb.186.2023.12.04.23.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 23:52:24 -0800 (PST)
Message-ID: <5e9c0b1c5885775a7bc32ef59cb09a2a93d4cbe1.camel@linaro.org>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Tue, 05 Dec 2023 07:52:22 +0000
In-Reply-To: <20231201160925.3136868-13-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	 <20231201160925.3136868-13-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>=20
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>=20
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0drivers/clk/samsung/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
1 +
> =C2=A0drivers/clk/samsung/clk-gs101.c | 2495 ++++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 2496 insertions(+)
> =C2=A0create mode 100644 drivers/clk/samsung/clk-gs101.c
>=20
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index ebbeacabe88f..3056944a5a54 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7.=
o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> =C2=A0obj-$(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> =C2=A0obj-$(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-aud=
ss.o
> =C2=A0obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+=3D clk-fsd.o
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> new file mode 100644
> index 000000000000..6bd233a7ab63
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -0,0 +1,2495 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Common Clock Framework support for GS101.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/google,gs101.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define TOP_NR_CLK	(CLK_GOUT_TPU_UART + 1)
> +#define APM_NR_CLK	(CLK_APM_PLL_DIV16_APM + 1)
> +#define MISC_NR_CLK	(CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK + 1)
> +
> +/* ---- CMU_TOP --------------------------------------------------------=
----- */
> +
> [...]
> +
> +/* ---- CMU_APM --------------------------------------------------------=
----- */
> [..]
> +
> +/* ---- CMU_MISC -------------------------------------------------------=
------ */

nit - the CMU_MISC comment here is an outlier.

> [..]
> +
> +/* ---- platform_driver ------------------------------------------------=
----- */
> +
> [...]

Cheers,
Andre'


