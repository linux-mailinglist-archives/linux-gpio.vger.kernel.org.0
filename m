Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0BC6018C3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiJQUJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbiJQUJM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:09:12 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66637AC1D
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:44 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id s3so8450682qtn.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ajc1ZcKSbsMi4SYmhXVS9hmvbdI76njIntcxKoO48Q=;
        b=toNArmnmTyIbV2B9kSivcuekpnbx+OmeGpSkrr8hOYKV25ysxsmly+8XHY0JxKs9Hq
         idpjJFo4ITl6/f5ndcW+kRj4BSlAYgCkLylvZomY1aTJqRn5lmzc3N+psGBk/I203H6A
         AkSZw20epabDSH820tEChFFGH9OH1q/f5MJzZqmezuTZWyCg/bKHX13W0FFDlUM4r9tD
         Bvq1j34eSEEzKfoKd7UgEpeRKn/ufJda7+Z06AqgF2cbU6S5S11oDaC+buAceHNuCQhs
         UG46S+CPyusk4vAOG5B873axf9+KzRws56F005wUSnZ/2hsPTZR52whupRhmhGFkapKl
         Jlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ajc1ZcKSbsMi4SYmhXVS9hmvbdI76njIntcxKoO48Q=;
        b=oxlrg0vs65duzxjC0J5Bv75y0ZvRkV+CX02CzKhi0ti+L8SM3sT/seFHxNlBARhPvv
         8gVCDdEu7sONpHoeSJqXbfKbf7ieuw5S7EGyp4jvgQLUkAIBJQ1GdBuF55MfGZ4TqAXT
         GPoz9yCK+bqjHvISS9w/CyS/JKkam+PcsCd0fiA/GsrAdA0+DPgg4XUwfgwAdthS9V2Y
         IeN8llQnmUGEZjNqJWFpfGavvOHda6HA02EQOpsYXQo9Mnw19ixGD0a04TV5RTQb9cD1
         jrvQtcVhi6GjrWuu0EHYIFtNKqXb+2VRqx0El+AWTAYgVU1X3ocRKCg0blR8GW8MZgGl
         Fmcg==
X-Gm-Message-State: ACrzQf16DEotn6oKU8FxoKdKVPoyhi000s8YkB/A/uDpp5fFQ+AJULWM
        dwVvMjkVn+0FB/afeVIaKCyrlw==
X-Google-Smtp-Source: AMsMyM653Z+gUmY8Hwg0d6uBzL2wFoY/o3dDcO8lsOSZGL7UQ8XnQnuQpYQcKXyd57cfuGEP7mqOgw==
X-Received: by 2002:ac8:43d7:0:b0:39c:df0d:266f with SMTP id w23-20020ac843d7000000b0039cdf0d266fmr10171446qtn.574.1666037323118;
        Mon, 17 Oct 2022 13:08:43 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:42 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v5 12/34] dt-bindings: pinctrl: qcom,ipq6018: use common TLMM schema
Date:   Mon, 17 Oct 2022 16:07:53 -0400
Message-Id: <166603728601.4991.15528471345095985299.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-13-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-13-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Oct 2022 13:00:13 -0400, Krzysztof Kozlowski wrote:
> Reference common Qualcomm TLMM pin controller schema, to bring common
> properties, other pinctrl schemas and additional checks, like function
> required only for GPIOs.
> 
> 

Applied, thanks!

[12/34] dt-bindings: pinctrl: qcom,ipq6018: use common TLMM schema
        https://git.kernel.org/krzk/linux-dt/c/0a1879f298b2d160173994ea34ea0ca096241f48

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
