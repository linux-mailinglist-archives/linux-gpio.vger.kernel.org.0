Return-Path: <linux-gpio+bounces-23397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE1B08B90
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 13:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6E91A677FB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 11:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6783B299AA3;
	Thu, 17 Jul 2025 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qhin5PUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A9219EB
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752750827; cv=none; b=MFdlv7yuOtaV+uErk1Un6gHaXcKaD9n0T4V3cFKWhbQkh5mzNC1zReLSHQYdJttjoZyaQiskTB7yhZ+mGkHcLIw1HYPZVEZMWPyuogcZHPaZ0BmFy+OWPt6O2VjbUo98d7K5GdefD9kpSnQoJBisev5rFVcl0W3GK7oQzUzgldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752750827; c=relaxed/simple;
	bh=8BEpr1buf3sugXNSK4wSx0vYzrS29Wqh55cQMzLzVC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYs1+QSD0c+8+J03vRtLEnvKcxzd0y7YDXmCiaDsatDawC6giTLSCz0JCrevhQSikWa9xLV63ALujlW78/VWGxe9h6/x8rg/+VkGqgfygk43lbWPBmGPUMcAMEsc2Gaskk1oWsAyuI3Pogy0no0TSbYFMvkDA8p9aXU6swJp8Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qhin5PUK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so124746466b.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752750824; x=1753355624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOehkU9WNuG64pnlROhzfrP3AIYNO0QBlG+TsOM5T5Q=;
        b=Qhin5PUKzVMtGVo4rh8f598elbDyqjwm+VnOTC31NXT8XD8WRdwn0AE5dTa8gkZQIe
         qw5A5qy3mLFvlQ2Ja1gHfREovdMC+XXFNziXzjHheTv+K42cBXUc7MVwqwfsj4U0nKKH
         A0gIiiYfPIscwwgMsggMm/n2mT74mfxyiwcx0JyKD1pitwEcWIY4xAJ+WE8/liBal+he
         oepi1BB5Km6RHvjFT3XKNF201FdBTZVkbfO3vswrM9qXiwkQkmHeMmsokhhitFkPcCCc
         3o/YLaeezxvH8+hukj7WpuqxkXKNWg0tHIyrO4eA6/DuaezbwNAnzXnpUb8rkDyjAdod
         aS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752750824; x=1753355624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOehkU9WNuG64pnlROhzfrP3AIYNO0QBlG+TsOM5T5Q=;
        b=XZbrLsSWJaNwssyfXLIz+xXmxgWOQJIJt2D1+pptvZ/gOlY19eyXw1r/PNInWzVgiD
         999Jha+Tx73hES8dJzCBKGciPxXe/QUucmcvvrQtenoSLH4WyE9Z/usmi1fnaRjb/0I1
         j4Ir/MofB32zv/j/AXRfhEm/nJ9L0Pnh6btPGqBN983sIgYivuXf54JTMuraOh0WcVV8
         fxbfs/7EYI+N9YB4ld65S9CjC9j4AJRF7uoVNpuLBSLCXNbRIyWLzlbUXezsQoTZoeMC
         9nSvEbqhidEi2iJS+k8+M1nHMiO+4zjQRloSgPvGp/wyPLlVSSkBydRpc3e6BpNN/mU9
         VxpA==
X-Forwarded-Encrypted: i=1; AJvYcCXJuYJR/Iw3gguyRzJhknmIoNTq4D9DWXWdVB1fBsTAXqEZrDQMGQKNqLT+KxX5ZAM+pKU6EmxSG5UN@vger.kernel.org
X-Gm-Message-State: AOJu0Yznz7MeKVEjDMcezj9q4zvNNiqU/6/O9CArtYisWPB0tdTThvsE
	CPX1Q4LJ04p9ZS1HqLbd+XIIltMVXn1dbgHXhGD5HOytjYx9S4ftZT8hr+2/EPOwfBmJZgNwDu2
	4vjN8
X-Gm-Gg: ASbGncu7FXQwl2B/8igaeBZOcuotDs8lCJZ0kn9qWH2PgNce7UyKa2rBOyLyzpu5nPf
	+prD/I7KVOJ3c5vDuwogVFZqWBMn4cp/xk5D/aoFgdLgiMxufeKUm0QV3ZMDA+zoXy2oWVevCYC
	cg+C8Z0bFTNbJAobcg6LmRQlhft+DR7TIIHoYqCviWaf19wdhIgANwq7aGeWwsAr9TG7zQdD42A
	s6h9/qReQm3nPOryjZV3csPZnz3j6yr/Wa1dtCij6USoGBDvbPWg7yiBAkVWXpo+ZviUKJTEIQ/
	m3moIBPVwPXN+hfkjOO0dxYZdWzujTBGIIDs504G/PfKHXfdB5sYGE8IgEeY2R+9tSq8etQ5Ay8
	Y/GYjJg8c+cv8RU0V64k=
X-Google-Smtp-Source: AGHT+IFndH4r5ylfIpMZuhJEN+t6RmbGJp26noeWsbrPyFdZ+6+r7xmc66l1gSyOJK7aFAE6hnyIZA==
X-Received: by 2002:a17:907:1c1e:b0:ae2:60ba:da91 with SMTP id a640c23a62f3a-ae9c99872f5mr670778366b.15.1752750823783;
        Thu, 17 Jul 2025 04:13:43 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294b6bsm1350689266b.130.2025.07.17.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:13:42 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:13:41 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add glymur pinctrl driver
Message-ID: <aHja5a5m4Yt/we/t@linaro.org>
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
 <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>

On 25-07-16 20:38:22, Pankaj Patil wrote:
> Add TLMM pinctrl driver to support pin configuration with pinctrl
> framework for Glymur SoC.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm      |   10 +
>  drivers/pinctrl/qcom/Makefile         |    1 +
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 1782 +++++++++++++++++++++++++
>  3 files changed, 1793 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c
> 

[...]

> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> new file mode 100644
> index 000000000000..dc1b822538fe
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> @@ -0,0 +1,1782 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

Drop this one.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>

And this one.

> +
> +#include "pinctrl-msm.h"
> +

[...]

> +	MSM_PIN_FUNCTION(usb2_tmu),
> +	MSM_PIN_FUNCTION(vsense_trigger_mirnat),
> +	MSM_PIN_FUNCTION(wcn_sw),
> +	MSM_PIN_FUNCTION(wcn_sw_ctrl),
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

This comment style would be good for drivers/net, but not here.

So add another comment line before "Every pin", like so:

/*
 * Every pin is ...


With the above addressed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

