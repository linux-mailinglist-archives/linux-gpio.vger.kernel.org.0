Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F126AE0A0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjCGNc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjCGNcx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:32:53 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2C24C6C4
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:32:48 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-53852143afcso245018587b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678195967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S8N7CXt0+e1DYpuX8yQaXPa+HdLNCPSxo/7U3GGVJrk=;
        b=vVNrvf2UFDHRL7WlPOvAazRohfHDm+dbsSkNBh3oQIWBB+HTIveJVsned4nMPI+OAC
         reMrM6lWe3ZFp5IsD2LYKpr/8jDmiaXeMB57k3CWzggoZW18garX7e5aYIw7zhzz8wfN
         JoBosjpeQxEQeDYAeB4BLqQHd6Ne+YaMX6WPzGkcFkbkv7/JaTB/Z46396lKCezj+b+q
         ldYd06YlqlLY0Uuo6aSMJFmnSSXPqzLdYZiChSTaRPubOG3hYdbfuqi4RLE79VB2cNks
         0rdcKhmMzYSY04am9yWob9f09MHwAUts6gN40dsu4rBkVAix59hF0K2qglbu8Km4ew+g
         Nduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8N7CXt0+e1DYpuX8yQaXPa+HdLNCPSxo/7U3GGVJrk=;
        b=YfTca1Ot1bG9lZmN1dxtH5KcXQcNXrVOjwLDwzVt6TO+qnCjHhfxZwfBse9VN0Vyn6
         CGwGRjPNXYlTPR9ignHXvKBh5m3gYroGog+x82Cc+XYlC8DUNr+TGqW7NRsRRzYGgoSZ
         zOcV+04JKygj/Vwf9Q8IdM2zdIaYtPRda9KW9lNE/pxiCko8Guo4zHEdnvyZVQJf+gKB
         yrAUJlQ3WTZIgpNbC4Jz7wU8ZgAwqP9DycZREASMf6zKD5yqEztgLQOvR+LLpgqTCPFu
         N791YK2YB/Gwc18IJCyyLLoLZGtDD4jkL9UhEK0Ql1K3OysGoMjHyISOR+eMIdI6446W
         UZfA==
X-Gm-Message-State: AO0yUKX8keddSlBVWKyd3v6hO5J1mPa5DX1NML5+TLOJSGz/5/Z9D+u6
        NDMrQjsYu6mjAW/j/2snqZybestvEGqM5F00chhtdg==
X-Google-Smtp-Source: AK7set+Iw/lJPIwfuQJt1ZCWJz+iqWXUo18uQ5BNdTKu/mg0l1aZiWAdS1u53vOLA6ZWZsZ3RDEbVq6qSLGbxk3Nb40=
X-Received: by 2002:a81:431e:0:b0:533:8080:16ee with SMTP id
 q30-20020a81431e000000b00533808016eemr9313543ywa.10.1678195967500; Tue, 07
 Mar 2023 05:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20230302155255.857065-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302155255.857065-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:32:36 +0100
Message-ID: <CACRpkdbe=sHG9KVaGrbEaFoVbMY-2=r2X4WkcbNhCfZ9KOw1sQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: lpass-lpi: correct
 description of second reg
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 4:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The description of second IO address is a bit confusing.  It is supposed
> to be the MCC range which contains the slew rate registers, not the slew
> rate register base.  The Linux driver then accesses slew rate register
> with hard-coded offset (0xa000).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

LGTM, is this something I should just apply or will you collect a larger
series of Qcom DT patches this time around as well?

Yours,
Linus Walleij
