Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC974744AF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 15:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhLNOVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 09:21:42 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13243 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbhLNOVm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 09:21:42 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211214142140euoutp01fa759fa8ff8af378f47027fce26a5bc7~ApQPdfXB-1874218742euoutp01f
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 14:21:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211214142140euoutp01fa759fa8ff8af378f47027fce26a5bc7~ApQPdfXB-1874218742euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1639491700;
        bh=8Hf52CqS/nSnwXOFc/puEi7DxLCUbagkhetpz8rebpc=;
        h=Date:Subject:To:From:In-Reply-To:References:From;
        b=LHAE1ZHLWsbfdMgNUGUALgsk1b4EtSf2AhmIIwXc+7+CePQdZ1/76eDNKFb4/ez7i
         Oxfb0kT6ROqLDDlxbotVF/4T5UsRPDlM3WN3zLUpgmziL3xGcaQ+tiwVNHXRXU/GVY
         2Ri6/Y7WB4PiFXPuMY+OXip5szXA0uWCSOTD3CTM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211214142140eucas1p199687dc8c123ee53c9b6781d7d6d3187~ApQPSwJjP0150901509eucas1p11;
        Tue, 14 Dec 2021 14:21:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.10.10260.378A8B16; Tue, 14
        Dec 2021 14:21:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db~ApQO5fitv0147901479eucas1p14;
        Tue, 14 Dec 2021 14:21:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211214142139eusmtrp24856b18a0a2a55855f634e9218586db7~ApQO4v_3H0350603506eusmtrp2Q;
        Tue, 14 Dec 2021 14:21:39 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-22-61b8a873bc6d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F8.40.09404.378A8B16; Tue, 14
        Dec 2021 14:21:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211214142139eusmtip20f3994e8a218a643c09b595cad4f732d~ApQOR6F-K1143311433eusmtip2E;
        Tue, 14 Dec 2021 14:21:39 +0000 (GMT)
Message-ID: <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
Date:   Tue, 14 Dec 2021 15:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
Content-Language: en-US
To:     Phil Elwell <phil@raspberrypi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211206092237.4105895-3-phil@raspberrypi.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djP87rFK3YkGpw+bmWxtvcoi8X8I+dY
        LX69O8JuMeXPciaLzfP/MFpMvL2B3eLGQ22Ldbdes1m07gVK3v7N58DlMev+WTaPnbPusnts
        WtXJ5nHn2h42j81L6j16m9+xebQe/cXi8XmTXABHFJdNSmpOZllqkb5dAlfGvFXr2AsmC1Q8
        apvM3MD4k6eLkZNDQsBE4t6X7yxdjFwcQgIrGCXur3rNDuF8YZS4dP8XM4TzmVHi1uVVjDAt
        jftOQCWWM0qc+fWdFcL5yCjx4/YRFpAqXgE7iYvbe8FsFgFVia4J79kh4oISJ2c+AYuLCiRJ
        tHb8YQKxhQW8JGa8aWMGsZkFxCVuPZnPBDJUROA3k8TmuTvBGtgEDCW63naxgdicAjYShye9
        hmqQl2jeOhvsJAmBLxwS8+ZuYIa41UVi6cMlULawxKvjW9ghbBmJ/zshNkgINDNKPDy3lh3C
        6WGUuNw0A+pTa4k7534BreMAWqEpsX6XPkTYUeJr+0FmkLCEAJ/EjbeCEEfwSUzaNh0qzCvR
        0SYEUa0mMev4Ori1By9cgjrHQ+LHpfnMExgVZyGFyywk/89C8toshBsWMLKsYhRPLS3OTU8t
        Ns5LLdcrTswtLs1L10vOz93ECExfp/8d/7qDccWrj3qHGJk4GA8xSnAwK4nwvrTemijEm5JY
        WZValB9fVJqTWnyIUZqDRUmcNzlzQ6KQQHpiSWp2ampBahFMlomDU6qByS9sXvp+F3fdeuXv
        a5aXvruwS4LhmOe8i3NCxe/nVt1sU2lqZ3PMPPPWsGRutcbr5su9/kq3u9dXF31d6sHd6LRc
        Reha88oN95g4152I/Xg/1sfswSeuptwHU1WU5v5qNkovbb1960mm4bnDtgz8Rn6L3q7a4c7/
        1CA2U7b4idLjqQUsrbtE7U9ZcH3ZvuffovkT69QPVn05mvr3OFv4hPz0qpmFL+fHTd7dcPXB
        yvfKK5p3HrC5+tRva3ezxGX5zbOYD6dIN0348OmurpcP37VlHXXHLxi0PzF0e+mmoal0f77X
        x5Znp2q2f3idufxGpUGP7Pesdfd2/fCpEH36OjNFw3u1zoGJud8b3611jVNiKc5INNRiLipO
        BABAwxlJzgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7rFK3YkGly/rWyxtvcoi8X8I+dY
        LX69O8JuMeXPciaLzfP/MFpMvL2B3eLGQ22Ldbdes1m07gVK3v7N58DlMev+WTaPnbPusnts
        WtXJ5nHn2h42j81L6j16m9+xebQe/cXi8XmTXABHlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
        kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GvFXr2AsmC1Q8apvM3MD4k6eLkZNDQsBEonHf
        CeYuRi4OIYGljBIb1nYxQSRkJE5Oa2CFsIUl/lzrYgOxhQTeM0o0/kwDsXkF7CQubu9lAbFZ
        BFQluia8Z4eIC0qcnPkELC4qkCSxe91WsF5hAS+JGW/amEFsZgFxiVtP5jOBLBYR+MskMaP3
        PyvEglyJgwcugTWzCRhKdL2FWMwpYCNxeNJrqGYzia6tXYwQtrxE89bZzBMYBWch2T0LyY5Z
        SFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzAmtx37uWUH48pXH/UOMTJxMB5i
        lOBgVhLhfWm9NVGINyWxsiq1KD++qDQntfgQoykwACYyS4km5wOTQl5JvKGZgamhiZmlgaml
        mbGSOK9nQUeikEB6YklqdmpqQWoRTB8TB6dUA1PqWUeH3Z/Kzvxa4GTmmVy7+pjoohs7V5xY
        J3XGOPnind0nwt7ttxUxutxtVyp2K+Fwd5lmkGSOuNnf2IWKfzIcXwq1vNByu72+jL8oetvX
        k5I8EsnL19UXHdC71JJ7Z4FXlJ3FnwMMMmtWWmR9m+Poe9QicOG/96mPz/vP/ZRY8HcF74vb
        qncEJEWLfvNrv/68qTe0vC39skfvkQNbGc4wtW3ek7xh139X3vY+vfolwd4dH2UDy/ex6vWl
        lqf8Uvq57qXsKjdJ3Z27H+epXGj05dh9efJVdV1mialP+lxnFCi8bs0/33k2+m/a4qLfu2/2
        TNNJ0VwvNjt3x8vMuo0b+zjlJ03KEOTsb1J2CVZiKc5INNRiLipOBAAqJOeWUgMAAA==
X-CMS-MailID: 20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db
References: <20211206092237.4105895-1-phil@raspberrypi.com>
        <20211206092237.4105895-3-phil@raspberrypi.com>
        <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

On 06.12.2021 10:22, Phil Elwell wrote:
> Since [1], added in 5.7, the absence of a gpio-ranges property has
> prevented GPIOs from being restored to inputs when released.
> Add those properties for BCM283x and BCM2711 devices.
>
> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>      pin-ranges")
>
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>

This patch breaks today's linux-next (next-20211214) on RPi3 and RPi4. 
Either there is something missing or wrong here. Booting stops after 
following messages (on RPi4):

[    3.186786] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
[    3.234513] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
[    3.276703] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] 
using ADMA
[    3.287191] pinctrl-bcm2835 fe200000.gpio

> ---
>   arch/arm/boot/dts/bcm2711.dtsi | 2 ++
>   arch/arm/boot/dts/bcm283x.dtsi | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 9e01dbca4a011..dff18fc9a9065 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -582,6 +582,8 @@ &gpio {
>   		     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
>   		     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
>   
> +	gpio-ranges = <&gpio 0 0 58>;
> +
>   	gpclk0_gpio49: gpclk0_gpio49 {
>   		pin-gpclk {
>   			pins = "gpio49";
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index a3e06b6809476..c113661a6668f 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -126,6 +126,8 @@ gpio: gpio@7e200000 {
>   			interrupt-controller;
>   			#interrupt-cells = <2>;
>   
> +			gpio-ranges = <&gpio 0 0 54>;
> +
>   			/* Defines common pin muxing groups
>   			 *
>   			 * While each pin can have its mux selected

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

