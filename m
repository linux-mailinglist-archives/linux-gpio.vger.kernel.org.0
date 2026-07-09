Return-Path: <linux-gpio+bounces-39745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qH8wJ3WuT2q6mgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 16:21:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24608732275
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 16:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=kRTrbNJI;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39745-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39745-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C28B3127EB3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE7A42983C;
	Thu,  9 Jul 2026 13:50:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39C33031C
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 13:50:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605033; cv=pass; b=GLYizbl8FJ9SJjKH9zWdEAUooF7LSSnH6MvxfqzbgCpg4CScDV19QNWI83UtcUHxpn9frC6VGaxdJV1uew+qznQQT4BOIvloyyRg61X4p8TrOD/gJgCsZ53rF+C1e1c4Fb7L6OFUWdjEoCGwjLbyskkNpABVETFaVZM79I5Q514=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605033; c=relaxed/simple;
	bh=pBnynmSe6YeAnfi4mz+JTFrE6HUG+VoYcbOJVuN49sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwrsHWvqJzDijUGLENdOYmwW7BQSqeh6Z1gmmfZunLDU7Wl913CowUYMtdgiNox5A+WmqxZ8Mez6qA24xZic9PlwdiAgAQaK++nzdW7Mr1EQ2YZl2DmvtDBzhFDZWCMq14QdqWMd6kNWFT72ROz5ffPQpSw5xQtg735zH7dQ7w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kRTrbNJI; arc=pass smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so1415982a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 06:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605029; cv=none;
        d=google.com; s=arc-20260327;
        b=nkfngITStdpCvwbEFSsJCKtPhLHOPVjzqfR5GUecw2SaZlunwTwZUG2vm3lFXzC8k2
         t3XcKc8aXQON45/oc8mVLwdKp5zc8UMC952nTpQZeFEVBoENJWNLFaoklERj3PfPh+2R
         uW2mpRjG1HV7TRI1xyY8aWnXIe8q4QxwLLkCx9d/YWkd7vdBqDKbGO61Pc/JfSn7ZIEA
         UjGCBvenzh86mL0tVV9umk8B0oxUK7H56DvZRLVzJb6a707idlwDovA4CybcUCg+VlCs
         zgCLex1VVMIABJbvedpng8wr3VtBE+qdrP7qjThy1Uco5/pOrYV0vUpjy3lXN+IJnLnr
         zn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AA1CYCk5PFxe5U42xkTyCwNBj1jXbDP2npGaxDV9Xg4=;
        fh=Y5OOzBJ5VIoWW0Ieu3zkvvp0IAJZ6lAKVtajWW/WfKU=;
        b=V95loXX3XD1ymT1dzDVxnAUxgMWD2i7hn4xrGEDH/LVa9iIsJivpWuxtn3vmXesZ98
         UWxII4u+48ZYj7nRxf1wxgCNGAd0j8ayDIVmbzSx6/a/pb90liJ+40iSHoOsSvPiK4tT
         duOjHS7s4B0dYdLRQFaAy8hwNraaY2MpikkPXOz0HzpvpL0GOvTsTWP8XA++RXpzYjI4
         lULa+wGj6J6w97KQOmIFAY3gcq300/ax52tJCV88QSIPuF1sseVdzR3IxndcEHREEKti
         0ayuXcumscgTv9o8aaFkUJlAlhVi+Eitq/e0uvzZB26/XEMzY+kpTTcGZU1g93b2Gtx1
         Dlyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783605029; x=1784209829; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA1CYCk5PFxe5U42xkTyCwNBj1jXbDP2npGaxDV9Xg4=;
        b=kRTrbNJIOi+G/Hv9GeD0JAb1Wvsev+SURizGXnhacqMX1COBVPNTlcAccc3cw/nlqG
         Q6m+QvCR5haM5NjHO9v+u2sUkQW5yJ5RhB524Q7ebXgfibKWRyZVV2vJdsD5oLq/xP3H
         ZVwSD1/hkuM4jsVuJzERztSoj7ao5Dc2FTSJodOpv+KghPEZKepxGeY/G5kAeH8S6zUP
         z9t3zSTkYFhsc71JDMlP17tyR7qB2DsxHyCTfhK4IB3wU16HAUog30sIxgYDG0fjhvEq
         8gCpAFcmMpm7vGuFA3kkiitGf8VahF9Qac1pyEK2Y+MMclwR/ERHcBSj8ATZJTMR445H
         UaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605029; x=1784209829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AA1CYCk5PFxe5U42xkTyCwNBj1jXbDP2npGaxDV9Xg4=;
        b=PfSodFl5mJHFwAyMUpkEicS/945mW5gzVdiueKDKdORUboD/DtlQFBg6/qEgGrSHD+
         jXKK1DgiO7aJx9t+T3F8R4smltULpImxeljO5j7i8X8P51K0KXFZMIYwMGh1y/+EXnAV
         m9hTvT1fiXmOA5Z0Vvg8bbd3LQaS47OTEid9MJ9iLTCXGEVcxHE50SiKjfbV3UKCS8c4
         Kl2+YVyuLXyy+6Ujk+PmDzxsmgcPHaRinl0TBJ5GZJwc8s3yf4W0Cxs3UiSE0FsuIfYR
         fsvChx65mwkxXxemhGg4zOXlRpcolCAmRmTtn65ovbyMkvUNF+Nww6FhCq0sa15MIakA
         e+cQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTfCdGvWtxD6RZdJ4HkNRqogy8/YxNXeHvOdyBToZ9gmIrNpxBOmz9DsPFAM20k0Dbb3yGowvsxkWS@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8HwubC3Z+xYGENGzJ+GH0wyJY+OM9vxZNLuTnLOZmlH48M03
	hTDvo2JZMAgfXTtsL08ZQquoCTVA7/cbNZXcfl8sitEfXzgMdJkSUssAZYunCaWcys9F0xBsdUm
	6Q4bMkRoEq8BX+li2gluJWOxCGuPptYoqOm0YZaVAkg==
X-Gm-Gg: AfdE7ckkvTNPc6tvKkp0NwffJeav8IntkFCLH6DmpmvQbnnZeXFPG+40d/FQ1dxpujk
	VLblB0JY44/xVRgZtkNlUoVKKR0EXgzJ4CDXcExnmnTZ89M98b+kMrL2M8lr9HJCNtTxb/wkzTt
	r1PF0IQUcGHfUYNBrEcv4akN2/JVKYvRtKlL3CBJe1LKTKIS4g8hlDYIoFdBBFcRy6FzCaimtF/
	GAywXNBkjRfLa8822x2Pg/cVd/mrSRVU9v2SVGBKxK+qbdF5lq6Nc4U68mBOdz4rl6xwPX3YXqc
	qJMd1EViye9d22OHZDkQUpxCf0kp1js=
X-Received: by 2002:a17:907:a394:b0:c15:e04e:aed5 with SMTP id
 a640c23a62f3a-c15e04eb0cbmr188878166b.11.1783605028530; Thu, 09 Jul 2026
 06:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-6-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-6-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:50:16 +0100
X-Gm-Features: AUfX_mydcS3ZZPG7IyURzwC82pSKF9Vz16AwgIkpWnWkqzVf1cwYcEYFuTy2QqA
Message-ID: <CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39745-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:url,samsung.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24608732275

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add initial devicetree support for Samsung smdk board using
> Exynos8855 SoC.
> This SoC has Octa-core CPU with tri cluster architecture, a custom GPU
> and a NPU supporting up to 14.7 TOPS apart from other supporting peripheral
> and IPs.
>
> Commercially this SoC is also known as Exynos1580 [1]
>
> [1] https://semiconductor.samsung.com/processor/mobile-processor/exynos-1580/
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 574 ++++++++++++++++++
>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 204 +++++++
>  4 files changed, 811 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 76cc23acb9b2..8c48ce2e02e5 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>         exynos7870-on7xelte.dtb         \
>         exynos7885-jackpotlte.dtb       \
>         exynos850-e850-96.dtb           \
> +       exynos8855-smdk.dtb             \
>         exynos8895-dreamlte.dtb         \
>         exynos9810-starlte.dtb          \
>         exynos990-c1s.dtb               \
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> new file mode 100644
> index 000000000000..b65f1698cd74
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> @@ -0,0 +1,574 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's S5E8855 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2023 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * Samsung's S5E8855 SoC pin-mux and pin-config options are listed as device
> + * tree nodes are listed in this file.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +       gpa0: gpa0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa1: gpa1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpq0: gpq0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       gpq1: gpq1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       gpc0: gpc0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc1: gpc1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc2: gpc2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc3: gpc3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc4: gpc4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc5: gpc5-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc6: gpc6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc7: gpc7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc8: gpc8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc9: gpc9-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc10: gpc10-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc11: gpc11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc12: gpc12-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc13: gpc13-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc14: gpc14-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpj0: gpj0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpj1: gpj1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpj2: gpj2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +&pinctrl_cmgp {
> +       gpm0: gpm0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm1: gpm1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm2: gpm2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm3: gpm3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm4: gpm4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm5: gpm5-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm6: gpm6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm7: gpm7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm8: gpm8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm9: gpm9-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm10: gpm10-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm11: gpm11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm12: gpm12-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm13: gpm13-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm14: gpm14-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm15: gpm15-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm16: gpm16-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm17: gpm17-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm18: gpm18-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm19: gpm19-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm20: gpm20-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm21: gpm21-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +&pinctrl_hsi_ufs {
> +       gpf3: gpf3-gpio-bank{
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&pinctrl_peric {
> +       gpp0: gpp0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpp1: gpp1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpp2: gpp2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg0: gpg0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg1: gpg1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpb0: gpb0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpb1: gpb1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&pinctrl_pericmmc {
> +       gpf2: gpf2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&pinctrl_usi {
> +       gpp3: gpp3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpp4: gpp4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg2: gpg2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg3: gpg3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> new file mode 100644
> index 000000000000..792d52affc61
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SMDK board device tree source
> + *
> + * Copyright (C) 2023 Samsung Electronics Co., Ltd.
> + *
> + * Device tree source file for Samsung SMDK board which is based on
> + * Exynos8855 SoC.
> + */
> +
> +/dts-v1/;
> +
> +#include "exynos8855.dtsi"
> +
> +/ {
> +       model = "Samsung Exynos8855 SMDK board";
> +       compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
> +
> +       chosen {
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x80000000>;
> +       };
> +
> +};
> +
> +&oscclk {
> +       clock-frequency = <76800000>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> new file mode 100644
> index 000000000000..9d82fceb5130
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SoC device tree source
> + *
> + * Copyright (C) 2023 Samsung Electronics Co., Ltd.
> + *
> + * Samsung Exynos8855 SoC device nodes are listed in this file.
> + * Exynos8855 based board files can include this file and provide
> + * values for board specific bindings.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "samsung,exynos8855";
> +       #address-cells = <2>;
> +       #size-cells = <1>;
> +
> +       interrupt-parent = <&gic>;
> +
> +       aliases {
> +               pinctrl0 = &pinctrl_alive;
> +               pinctrl1 = &pinctrl_cmgp;
> +               pinctrl2 = &pinctrl_hsi_ufs;
> +               pinctrl3 = &pinctrl_peric;
> +               pinctrl4 = &pinctrl_pericmmc;
> +               pinctrl5 = &pinctrl_usi;
> +       };
> +
> +       oscclk: clock-oscclk {
> +               compatible = "fixed-clock";
> +               clock-output-names = "oscclk";
> +               #clock-cells = <0>;
> +       };

Small nit, but I believe oscclk node should be ordered
alpha-numerically by the node name. See
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Peter

> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu = <&cpu3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu = <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu5>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu6>;
> +                               };
> +                       };
> +
> +                       cluster2 {
> +                               core0 {
> +                                       cpu = <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x100>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x200>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x300>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x400>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x500>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x600>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x700>;
> +                       enable-method = "psci";
> +               };
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0";
> +               method = "smc";
> +       };
> +
> +       soc: soc@0 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +               gic: interrupt-controller@10200000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       interrupt-controller;
> +                       reg = <0x10200000 0x10000>,
> +                             <0x10240000 0x140000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_alive: pinctrl@11850000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x11850000 0x1000>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible = "samsung,exynos8855-wakeup-eint",
> +                                            "samsung,exynos7-wakeup-eint";
> +                       };
> +               };
> +
> +               pinctrl_cmgp: pinctrl@12030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x12030000 0x1000>;
> +                       interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_usi: pinctrl@15030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15030000 0x1000>;
> +                       interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_peric: pinctrl@15440000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15440000 0x1000>;
> +                       interrupts = <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_pericmmc: pinctrl@154f0000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x154f0000 0x1000>;
> +                       interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_hsi_ufs: pinctrl@17040000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x17040000 0x1000>;
> +                       interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               /* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +               interrupts =
> +                    <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                    <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                    <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                    <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> +
> +#include "exynos8855-pinctrl.dtsi"
> --
> 2.34.1
>

