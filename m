Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB717A341F
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Sep 2023 09:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjIQHq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Sep 2023 03:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbjIQHqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Sep 2023 03:46:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5448B18D
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 00:46:26 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991c786369cso465911666b.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694936785; x=1695541585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x48DqBTN3AQWtiandQopaqlFClBcuCunTmT5FYjWw7c=;
        b=v6jtl+FK5hFxikvLGjbZ1w6jeDKW0Yj3iUUgeJOIJGp1lyJ9n7bOY61KjYBZuMXh4z
         dBd69TrQeSfnvGOpX4DMeJyfMkxZ28RM4vxHkRZQMq3pbv+oVl8kGa5QX+tSKfjeteVW
         4dux/kVZKNK59t+dQDKsvGp7AKeHiXlP5QQxoQerFh/PWuZnYR+dd3opkZL18Yksq7lY
         nyMv1n5cI7Nei7M7/6dW/AWOTOqcNXjK+0kAIWaQZLFC5liRt62vvr7vz93kStUVjQWc
         ZmGhMtjUw5zBOzug8oknZJ1rsomJRMGEKyU0loL12tttpYffPJA77KFoypQGaBZ2dGC1
         +awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694936785; x=1695541585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x48DqBTN3AQWtiandQopaqlFClBcuCunTmT5FYjWw7c=;
        b=mDbJqhNh+aPrSZt35J/f1oG2qTBDrq52qIK/5K8wnlDdPvc79mOiM59j8kk3i4kvQ3
         n5vI4wygySIuQ1XN2nYVF0RWe+nP0WjOooCzVu3IP71M30p9ry0oKHa6y9nGDKubGTSy
         FQ6Hgyl+t5Z1S2KRTk+UNckeXbZDagB8LyeLIiif4R8vp8qJh0IlEDOrzSw6kqNQSufD
         Nnv2r+vwiuwOEAj0YJ6bQI0bM2IZriCb9r3vCXVqAq761e4wQUl0QplQjqX1rzUlGDTG
         20bjw/IdcyYTFzJgfoMUmV/wnjwm0Tc55sMrTOiUKDja4fNvBwipFo7QLZ14H1x+3k5l
         W0sg==
X-Gm-Message-State: AOJu0YwtxPIYwD8YItnnWKtd10ymzGPH6fwfi49NNN2db77bA+inre9r
        tEVcKL/mgLB/qW2cTyWF7vhX+4uOHJPhkc9Bm9P5FQ==
X-Google-Smtp-Source: AGHT+IEMmvm/T/dhMyFPD2yzU4xF7sgZOL4AXo/0tCt/ITKpvjmCL9NMFZ+P4kx1vyfX0NMPsFeTZw==
X-Received: by 2002:a17:906:8a5b:b0:9ad:ec25:825b with SMTP id gx27-20020a1709068a5b00b009adec25825bmr2669953ejc.58.1694936784759;
        Sun, 17 Sep 2023 00:46:24 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id xj7-20020a170906db0700b009adc77330ebsm3597089ejb.199.2023.09.17.00.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 00:46:24 -0700 (PDT)
Message-ID: <46d911d0-481d-4247-332c-9f2d27c7099a@linaro.org>
Date:   Sun, 17 Sep 2023 09:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/6] dt-bindings: gpio: vf610: update gpio-ranges
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230916-vf610-gpio-v2-0-40823da788d7@nxp.com>
 <20230916-vf610-gpio-v2-1-40823da788d7@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230916-vf610-gpio-v2-1-40823da788d7@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/09/2023 04:03, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX93 supports four gpio-ranges at max. To fix below issue:


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

