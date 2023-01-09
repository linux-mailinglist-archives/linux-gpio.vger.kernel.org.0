Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09FF8662EEC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 19:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbjAIS0F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 13:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237514AbjAISZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 13:25:42 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B456D518
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 10:23:13 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id z5so8054278wrt.6
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 10:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A00xyofDnmYBC+YdwEJ6rLbaZfkGLo4zgr19f7CaBy0=;
        b=Nn560XwbDWnu6G77ftDb5073LFO23GkitBB9lcflnyEaIUw6AmwQ40dLP+Fesu/+gU
         So2x/k+DlrgBQp4MOuwLTGgW/jrh+w9xRoQjI4FzwiyOi9zwkhZ3v4UPjxF1El9qTIFN
         A4/3U0/cgq7jTetYBLGPkwd5YVIvwNW3J8eGHihIRBcyc8KuUgjd00lPBHuqlWNtlFOi
         SsH78muTDUrTIQDzAbjGLJFRENx+pdugFomt97C4CVvjR3HQzpC1B+6fgaN0d6FlNg+D
         C3cmDbAE79TDfnAUsRisA+a5RXmGm1foH294ilbiRRQ3NiWM+NrufrI0U4L5pWL3RSAF
         4PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A00xyofDnmYBC+YdwEJ6rLbaZfkGLo4zgr19f7CaBy0=;
        b=eyMbtu/WzgT5XvufGji3REBWbrgtak3xZ37kcipQ1WdZM/nHNrayGxxejbHwY++PxJ
         LxT7bKszCiLGTAioIQ6Ntt6gvp3dx7koWgFYaAnYrwcgZONULdgACSBwUg3d1MgKmLFS
         VAzKaalaKFKCvvSDaFoxX8qjANywpdtplpBWARB8lau5ievGjTQX2+5QrHRXABSx0SlB
         t4kEqD5eEVm9bx9HVzv9ALaqOL73zDilT5r6O88alRelDmswDoUm11TG/75+CHoAVerA
         +AJSqqyTVynqqU8CpaVt6zth0podiSZQbj9NHqs+4fT9FlTlTzK2w9lgMLtgbTY8lSUE
         rSIw==
X-Gm-Message-State: AFqh2kqeVdW9tNOoDqd1DIT47crOhu+HxHNH5SscRMM4jLd9Mx4dJOLi
        6quGqTNIufsbhXnZY/gxItIFIA==
X-Google-Smtp-Source: AMrXdXuMGYUrHoq4kIUWUWO5tf56nNLAhc62b2axVIsjwOUdF/rm8nQM5YAguQaJeokfqPilyj+DXQ==
X-Received: by 2002:adf:e383:0:b0:242:3cb6:36b8 with SMTP id e3-20020adfe383000000b002423cb636b8mr42328232wrm.44.1673288592385;
        Mon, 09 Jan 2023 10:23:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u5-20020adfdb85000000b002ba2646fd30sm10713382wri.36.2023.01.09.10.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:23:11 -0800 (PST)
Message-ID: <aa146dc5-b4de-0e77-345a-8592b097f444@linaro.org>
Date:   Mon, 9 Jan 2023 19:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 13/18] dt-bindings: power: qcom,rpmpd: document sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-14-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109174511.1740856-14-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/01/2023 18:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a compatible for sa8775p platforms and relevant defines to the include
> file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

