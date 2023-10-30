Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A644B7DB6CC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Oct 2023 10:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbjJ3Jzs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Oct 2023 05:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbjJ3JzR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Oct 2023 05:55:17 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1619E1BFF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Oct 2023 02:54:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4094301d505so5704965e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Oct 2023 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659654; x=1699264454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdtNJMjFoo8Mjg5DC2b6f5mJDPpgVLFxOKz6Ogv8dDI=;
        b=d0Jl2giLu9YKbxBeTCjhHAQ4zJfgnoj2ltWxkl6mcAfGfRp9OWIq9tUY03mTN8jFLv
         D7IP3OZJ92874lE0TfE41o6BkXnmszp7sCgNj+wrNvMrU0hTZHqYY7TT/Cl0kh7c4GSR
         P4HCUKkupI+P+NGCGIqXu6k8z2C2j/ZYbBtJd/s7UCaGuV8+XAolPDsOGibdMk56bA7h
         pd0YP5BfuHq436ZM6DafImvsfa6L7Q3cUdF/0Z0398CeAmNYDryOpyEVDxlDiagAJ+m0
         d2Hehfg2OZkO7i83nKEdAeOei+VYKxCHoEVDZCw1GYrVXtFIruFbB/KNrV5iPgmHiKqH
         DEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659654; x=1699264454;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BdtNJMjFoo8Mjg5DC2b6f5mJDPpgVLFxOKz6Ogv8dDI=;
        b=WsXrfO1iSBcyANKGWfmoeNmwGIFrMhOLyZKoAdQSGBUZmp5tSaHrxfipJuFmUM4KaD
         2JEK1zZgNvjalOjQLIuPpJcVSq4eeEI3/4gRhg3f9yborEYg26SacbxKmzM1KkIhTJH5
         LB2b5NYsJNpi/yM13rOM2oqDOYNNGJVQPsBZA+CpOrsEgByQflv6bMO5JwIOeFqDCNvh
         hM9/ekAEMQEv/u4A7tR1q2JQuUmhJ+jim9ReqjNIMUjsX8Cx+YvPYg+qBv54vtm+KuPA
         FLHUnbB8+KpRrYrhex4RJe0DZMYsOdZCAFAlTHL7tc/6BCNTRjaHS5WFBL5nwDrCRar/
         1jtg==
X-Gm-Message-State: AOJu0YyzxgZfHcL9nVBn1f49iNne0fFpMUmHWnLc5/G4TVkULgCDLh5K
        D2TyhQ2hfUJg5EvTrDR3hXMlSQ==
X-Google-Smtp-Source: AGHT+IEBIJhTqNu++Oy8IVv8VSH6XW0aEhix3wf4DZZeIsdbnH0sOhyz6NtHvPoqfq1LRqlmTml5nA==
X-Received: by 2002:a05:600c:a49:b0:408:3ab3:a05e with SMTP id c9-20020a05600c0a4900b004083ab3a05emr8142943wmq.38.1698659654510;
        Mon, 30 Oct 2023 02:54:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a05f:dffd:3e08:6b03? ([2a01:e0a:982:cbb0:a05f:dffd:3e08:6b03])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c314a00b003fe1fe56202sm8785199wmo.33.2023.10.30.02.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 02:54:14 -0700 (PDT)
Message-ID: <be8ea7a7-3353-4068-a113-1fde3ab8d0c9@linaro.org>
Date:   Mon, 30 Oct 2023 10:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: Introduce Pinctrl/GPIO for SM8650
Content-Language: en-US, fr
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231030-topic-sm8650-upstream-tlmm-v2-0-9d4d4386452d@linaro.org>
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
In-Reply-To: <20231030-topic-sm8650-upstream-tlmm-v2-0-9d4d4386452d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30/10/2023 10:50, Neil Armstrong wrote:
> The SM8650 Top Level Mode Multiplexer supports 211 GPIOs,
> and the usual UFS Reset, SDC Clk/Cmd/Data special pins.
> 
> An handful of pins can have their IRQ generated by the PDC
> module, and for this support for the new wakeup_present &
> wakeup_enable_bit is required to allow the "wakeup" event
> to be passed to PDC and generate an interrupt or a wakeup
> system event.
> 
> As SM8550, it also supports the i2c_pull_bit bit to enable the
> on-SoC load resistor for I2C busses.
> 
> Dependencies: None
> 
> For convenience, a regularly refreshed linux-next based git tree containing
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Collect reviewed-bys
> - Fixed unevaluatedProperties handling, and dropped the true properties
> - Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-tlmm-v1-0-4e3d84a3a46b@linaro.org
> 
> ---
> Neil Armstrong (4):
>        dt-bindings: pinctrl: document the SM8650 Top Level Mode Multiplexer
>        pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits
>        pinctrl: qcom: Introduce the SM8650 Top Level Mode Multiplexer driver
>        fixup! pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits

Please ignore this patchset, I forgot to squash patch 4....

Neil

> 
>   .../bindings/pinctrl/qcom,sm8650-tlmm.yaml         |  147 ++
>   drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
>   drivers/pinctrl/qcom/Makefile                      |    1 +
>   drivers/pinctrl/qcom/pinctrl-msm.c                 |   42 +
>   drivers/pinctrl/qcom/pinctrl-msm.h                 |    5 +
>   drivers/pinctrl/qcom/pinctrl-sm8650.c              | 1762 ++++++++++++++++++++
>   6 files changed, 1965 insertions(+)
> ---
> base-commit: ed75ce58b3a55d2cd95b68a06fdb010e1e18d825
> change-id: 20231016-topic-sm8650-upstream-tlmm-4ece354ef319
> 
> Best regards,

