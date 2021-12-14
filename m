Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38E3474520
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 15:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbhLNOcO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 09:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhLNOcN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 09:32:13 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5141C06173E
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 06:32:12 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j3so32745693wrp.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:to:references:from
         :in-reply-to:content-transfer-encoding;
        bh=7+WMKglDmIP3S+v0HJKQcf6A+FhRkrhXBF0Bw5YQma0=;
        b=h8SxtInvPJsSgBnLqt5ry+H5HQmKp1QD1aqIzjUIaeC4mIG/qlsW4u0552HRo4al3O
         aau9tKvlHuqrxNNNrpapBV0uVEtclx0bPJAIftaUpTiBm8M4I7kvISbh78dxwWV6HZTX
         8gdjbwhYAanhnY9JCtyS2X+/P+bPH07SSr/Q+SEFlKB4Xup6fw+tscUwPUT9/rcUYaLH
         rPMfyI0xcwkPYcp55EA8IsuAYGGZm3isezOrslTPUa4eo57sB1MKwG2jtXRvhujhJsLa
         5ke766eVWatWKaQBRJPPUlmoHS6Ty73wxV8Uf4QCku9/G6gjODsClC/Ru8c7qqV9jBvW
         2Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:from:in-reply-to:content-transfer-encoding;
        bh=7+WMKglDmIP3S+v0HJKQcf6A+FhRkrhXBF0Bw5YQma0=;
        b=DgK/FkxgTRJ+196317qVG4qgeQoUAGDUenfswqPGUVL/ujFtTM3vtZG5FDxtXVnil4
         83LftsAY9D34tR1rmwp90N+GXpGYvnisNd6cEZRoX8LHjU7jW7/+VtTj9aSgbQ3hjPc/
         lBFNw963wSrrKSaOTlmpKChntQvsbconYCqiwVi1QkBtRYIgRYUJhPgybnAijkgPdVGa
         MB4gfLjayOF+G/xhdZeRT6U7iF3Rd5jFn7TRF0HfP6suFvg9n9T6kQpY9sqvjEmAJBZM
         wtIveXUu0WfQlGseyP1NwwMToAlpq8Z6AfWoWo2TQeXi00uXbR9dreqwC7nX4mM3MvWF
         oATA==
X-Gm-Message-State: AOAM5318h3GVt75IRxqxMuQcQAfG/LFv5KJeyRGA+09pFSFx18CXpI6F
        +S1cW6AOUUVUeP1/GPvyZccKsQ==
X-Google-Smtp-Source: ABdhPJyz9Q9RA10iNcIrFEXvg9xnvJgs06VmVPvBzfMf/YiL9g7FLkyV3Y2Pa7tQzekDXC8A5vElEQ==
X-Received: by 2002:adf:e501:: with SMTP id j1mr6347286wrm.516.1639492331436;
        Tue, 14 Dec 2021 06:32:11 -0800 (PST)
Received: from ?IPV6:2a00:1098:3142:14:b0c9:e614:781a:327e? ([2a00:1098:3142:14:b0c9:e614:781a:327e])
        by smtp.gmail.com with ESMTPSA id l5sm2334165wms.16.2021.12.14.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 06:32:11 -0800 (PST)
Message-ID: <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
Date:   Tue, 14 Dec 2021 14:32:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com>
 <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
 <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
From:   Phil Elwell <phil@raspberrypi.com>
In-Reply-To: <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek,

On 14/12/2021 14:21, Marek Szyprowski wrote:
> Hi Phil,
> 
> On 06.12.2021 10:22, Phil Elwell wrote:
>> Since [1], added in 5.7, the absence of a gpio-ranges property has
>> prevented GPIOs from being restored to inputs when released.
>> Add those properties for BCM283x and BCM2711 devices.
>>
>> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>>       pin-ranges")
>>
>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> 
> This patch breaks today's linux-next (next-20211214) on RPi3 and RPi4.
> Either there is something missing or wrong here. Booting stops after
> following messages (on RPi4):
> 
> [    3.186786] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
> [    3.234513] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
> [    3.276703] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc]
> using ADMA
> [    3.287191] pinctrl-bcm2835 fe200000.gpio

This patch is part of a two-patch set, the cover note for which says:

     2. Since [1], a "gpio-ranges" property is required in order for pins
     to be returned to inputs when freed. Note that without patch 1, the
     device never gets out of EPROBE_DEFER.

It looks as though patch 2 has been merged without/before patch 1
("pinctrl: bcm2835: Change init order for gpio hogs").

Phil
