Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFEF6018A6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiJQUIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiJQUIh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:08:37 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7E87969D
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:34 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id x13so7384966qkg.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e77Fy0wONiOmEYwvuUFIteBvYoxctOtKFkRjBhQzgW0=;
        b=M7GWEmiglSySnXgWN/O31vqZM9cDuke6UNV99REn5YZfrZmXivzD1MG2XJl5xCAQIc
         Oio4woy/8oKp0KlpSEdmPWmmgG0EbnOIxGqvg0GZYnypjuXBhqItdLUXT3ibmbdiVsY9
         qni2iLe340SzsNAetuNm4K+1NkgkONSsLqU0BAHgYW9hug2kZcey9NK2ID8TqenzSPOM
         SuD1WlJof8sPHE9l47rhv7dTNvdQ6XRZdrZEH28RtcgDn3jvKruPtGA5mKnaeBmou9aB
         TzehSaGPVHMAvo9iVSsuFSuXYHOk4LBXgvOQ0dqO83quwHSpeDff6kh8GnA4vCIpr4o2
         PdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e77Fy0wONiOmEYwvuUFIteBvYoxctOtKFkRjBhQzgW0=;
        b=cO7Qh866TDcBvc0cYcg9KGt6XB6zRmlWVfaaqJ/QEPdtxvBf/eNMh3s5r3UmqLBU8u
         UPLYymFDz0AD5xLwqZDmJqV1X9qtzfLIZZdyxx4dmDUJBjgZy5n1GnJz7AEx+Ok5ZiXR
         6FPH6rHypuXdSTfU08h8LCDKYBJPN4y6i0s1K3UOlK4vgGpUgIRpSerBvu0SE5ezq1Gd
         5/0wkpUqP4CThuRiEB65lJ9C96nxwlSEnxCygU2VE+1iu0JZ3Z36OWv+yNXDpb28RjOM
         6MYptOBKCZ/tMEmNlbtFEj4ekh4Eri3aRrUFRlN9m/8bNZ3ec0LBzmd7qPcuavu+nwpP
         ky/Q==
X-Gm-Message-State: ACrzQf0ZshERAZSLrj56tcBguNAFs+x3ONqC4mgXsdVBl+ws1AnAgMOJ
        UQpJRGNdPWLQOxJgFjW1kxiPuw==
X-Google-Smtp-Source: AMsMyM5R2wIPcrOcgORj8YHb8uw4AZbYDYGZVFJ3R4CFjuaqnBxKdhuDHLtCu/Q7iOPEPi3VvjP3Gw==
X-Received: by 2002:a05:620a:4549:b0:6ee:ce57:796c with SMTP id u9-20020a05620a454900b006eece57796cmr8891089qkp.373.1666037313953;
        Mon, 17 Oct 2022 13:08:33 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 07/34] dt-bindings: pinctrl: qcom,tlmm-common: add common check for function
Date:   Mon, 17 Oct 2022 16:07:48 -0400
Message-Id: <166603728601.4991.10355619245975834919.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-8-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Oct 2022 13:00:08 -0400, Krzysztof Kozlowski wrote:
> Certain pins, like SDcard related, do not have functions and such should
> not be required.  Add a check for this in common Qualcomm TLMM pin
> controller schema.
> 
> 

Applied, thanks!

[07/34] dt-bindings: pinctrl: qcom,tlmm-common: add common check for function
        https://git.kernel.org/krzk/linux-dt/c/1b88672e7fd9f83f3a6f507747dc95b8a4d40f4b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
