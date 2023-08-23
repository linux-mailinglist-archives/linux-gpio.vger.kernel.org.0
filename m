Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D18A78541E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Aug 2023 11:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235277AbjHWJbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Aug 2023 05:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbjHWJ3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2023 05:29:53 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4478044A6
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 02:02:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9338e4695so83079261fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692781367; x=1693386167;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJn+iG54+upG/BrA2pwerIc9Iqy0OFFbmq2lKLUTge0=;
        b=JbDrdPl/i9v/xWBiwwKbEMXfLsCZYFB2P0RhOmfjUNc6Sry/ltjkJC/aBv1Xr6ejNq
         to22ZfIqzCNZJcLVPWqG3HLrr67HbPfzfHOELTwLeHYmnw6CnF6K0tJOufG0NYZwVWl1
         zNgVqs2lSdGeXR+QF1hWSF3+KKJKItJUFaFtCDhGaF/5Zl7RCuA0uhWoiZYDGEdRDIUA
         mm0N7GchRablAObABKbtFpuTpOqzgXgkWjtH2lkMdiIHy4o8/35ehEr7Z5gjxQOGl/vG
         CJUr2b+jqkjpOT99r8nAx2UmbSwp3vTqaozJWNG/6WNC7ZeoWLsqwHW/HFMEAuUtItJX
         dz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692781367; x=1693386167;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gJn+iG54+upG/BrA2pwerIc9Iqy0OFFbmq2lKLUTge0=;
        b=FQvLHsMga5A6PAFWPkWg8yycVNBbFWK5G6Bp1RX9MZWWskCCmXqqW/0idZFz0kCTx+
         Rw+TKlaDX8+VtxXAB9+bifX8ac/cZcNbcJEirHKNfKE4ykjajkAakstdC1lT8dww/OC2
         gflFJdNDVGdXIFdAAAhin6tGDeHHcUGg/wkbKs8fl9lMyaJ6DikwPc0Egwiv0gkMUXNC
         O/iVlJvtSbNjIDO/0jINAOpPrgV5vvAH4IMVEWPe6vKaA+VVOquJQbtRB/2bvMtDcwvh
         r8djS58enUXvi1Hx0r+wqR2GUquoUg42QLiKQK5vRf7vYyzbS9cuJHrJIo1zljVnSnAk
         4fwQ==
X-Gm-Message-State: AOJu0YyTZs9GA0YQi6eKI9Gr6ohpI9l4WKx1T3j0tmPDGOeQrqDf1GGL
        lystVCYdjm+aJQ5ovDaBatW8jQ==
X-Google-Smtp-Source: AGHT+IEVrpCmN9V7+rVRVrUNs6LVKFbMoB1A/70skQiHS6k4fZyeZl89MWB5PcNxLAI4JIVAWrcTTQ==
X-Received: by 2002:a2e:9007:0:b0:2b9:e701:ac48 with SMTP id h7-20020a2e9007000000b002b9e701ac48mr10068777ljg.32.1692781366667;
        Wed, 23 Aug 2023 02:02:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:c457:5132:4849:b9d9? ([2a01:e0a:cad:2140:c457:5132:4849:b9d9])
        by smtp.gmail.com with ESMTPSA id s3-20020a1cf203000000b003fe17901fcdsm21460162wmc.32.2023.08.23.02.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 02:02:46 -0700 (PDT)
Message-ID: <c18d607e-e33e-43fd-9a67-c701f92cc004@linaro.org>
Date:   Wed, 23 Aug 2023 11:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: use capital "OR" for multiple licenses in SPDX
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/08/2023 10:55, Krzysztof Kozlowski wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Correct also the placement of SPDX identifier in pinctrl-meson-axg
> files:
> 
>    WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 3 +--
>   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
>   drivers/pinctrl/meson/pinctrl-meson-axg.c     | 3 +--
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 2 +-
>   drivers/pinctrl/pinctrl-mlxbf3.c              | 2 +-
>   5 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> index 80c43683c789..ae3f8d0da05f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   /*
>    * Second generation of pinmux driver for Amlogic Meson-AXG SoC.
>    *
> @@ -6,8 +7,6 @@
>    *
>    * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
>    * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> - *
> - * SPDX-License-Identifier: (GPL-2.0+ or MIT)
>    */
>   
>   /*
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
> index aa79d7ecee00..67147ebaef1b 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>   /*
>    * Copyright (c) 2017 Baylibre SAS.
>    * Author:  Jerome Brunet  <jbrunet@baylibre.com>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index d249a035c2b9..6667c9d0238f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -1,10 +1,9 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   /*
>    * Pin controller and GPIO driver for Amlogic Meson AXG SoC.
>    *
>    * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
>    * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> - *
> - * SPDX-License-Identifier: (GPL-2.0+ or MIT)
>    */
>   
>   #include <dt-bindings/gpio/meson-axg-gpio.h>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index 3cd86d6a0a60..2c17891ba6a9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   /*
>    * Pin controller and GPIO driver for Amlogic Meson G12A SoC.
>    *

For meson pinctrl drivers:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>

