Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3E46CA82A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 16:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjC0OsY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 10:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjC0OsX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 10:48:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12E946B7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 07:48:16 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y4so37352669edo.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679928495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QtBoV1Qbqf0NVUjgonp9cxji9bOrzoKkw0TXF7vOR00=;
        b=Y30e3uLjVaoVosKrhCdDdLnKxPDFbVktsgQyuSC7MJRgrOWwslJMSA3gU634Spyfk2
         7s4RIzp8Hm41k/go2r/iKLyCgD/kxc3b7PAZbuXkfkJDWa0VgywmAB8jF1dT/nN6R0cR
         d8gbPikugY0sUq+asgySo1/vcIe6cNXl9DqWGvII91zp7dVpybH8D985Ub8TgVy/WB00
         qVPQE0598oRHJhtuaSkaSdC3+yORL0plbMjAtBB2V6kBA+FMMYhkkx9f+qmyZGH2H2x3
         XEcDFH1gu38tOmzmXkfQ3G174n52IeU7ppKhbFmCYGGBi1hpVIBoo0oKZQi6O8FTD/+w
         9Bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679928495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtBoV1Qbqf0NVUjgonp9cxji9bOrzoKkw0TXF7vOR00=;
        b=ofqrTkCDuA2d4SbfPLZgm6QWf+UCn/mcBJLHQ1iQ+B4gewpkfkGNstWdRpRisBAZ0L
         RcaMAHusfNLSxDKlwZMac0zk5AbaOwgVea2aUNdGEKaEvPGiyg/CdRi+Uhsca7GydT/5
         DB9bDKxyr13YyllK2+y3f3T7/ePebl7LkybHXhDMc/jYKYvuVE5zzTFp/sYvHnO6hKCR
         tx0NudjRkBpGTJZ5HY/5aJrZGcgGXJsp0L1Me7zwUdeKPgQKXNbA/XX2Jo60qyH2YaEX
         tdRKNleCZxUWGuEOOqx8aQ27MsdH6ot8JtcLLhYdeFmLviGrN/LIg8lmXMM1Vs7vqB1u
         HHqQ==
X-Gm-Message-State: AAQBX9e61lzyZmKW7UAc/W4DsihKyYK6+a+pm3BskfX/zdlUIiFwJaOG
        zgCnzT1K5W6nPO1dt7vpaTlWTw==
X-Google-Smtp-Source: AKy350ZGUI0eo8hapBoBqxXr9oeLf/bRpUiQXhyloqq2glBxoP0OJuYRHW5wLJdwF21v6QyJRUngrw==
X-Received: by 2002:a17:906:15c1:b0:931:fee9:e961 with SMTP id l1-20020a17090615c100b00931fee9e961mr12844509ejd.62.1679928495242;
        Mon, 27 Mar 2023 07:48:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id v2-20020a1709064e8200b008d9ddd2da88sm14143824eju.6.2023.03.27.07.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:48:14 -0700 (PDT)
Message-ID: <0f76a261-6ca3-fa59-0642-522d0876e6ab@linaro.org>
Date:   Mon, 27 Mar 2023 16:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 03/18] dt-bindings: interrupt-controller: qcom-pdc: add
 compatible for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
References: <20230327125316.210812-1-brgl@bgdev.pl>
 <20230327125316.210812-4-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327125316.210812-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/03/2023 14:53, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a compatible for the Power Domain Controller on SA8775p platforms.
> Increase the number of PDC pin mappings.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

