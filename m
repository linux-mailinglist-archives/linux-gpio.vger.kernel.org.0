Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6AA5B862C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 12:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiINKVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 06:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiINKVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 06:21:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE2D7A538
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 03:21:29 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x94so4210215ede.11
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SPAF5hoaiFVAkY/WsLhdQk3BcWFtQ7a/5C8YkM1BjIw=;
        b=QWnGv+shjcwg4W70DZrhq+r4hVhfMPl6BnIOdonFBtlS/Pk1/OelW0UBgPOV3vlACf
         ioJ+jgAfsxpsVBPqopB+yMNroVNPF7GTbWgxkewFthBo2I7okCZhVrrnnptlb0vMlQU7
         o0rXqEvaF2jA1EMvLx8W9CVarvtzmMv9kIvDuz30bNKYOHBH6rZcw4u26zQM4JXBTYZD
         M4QH1IXNukGP4IWWrhPMZuSm9qA6CiKzWDh5ZCFnAd4akMnnrQyyzr8Rn+c8tCfY+L4s
         Mx1bj1mcVOxBVG5HN2eJJyAUC/20eJ9KJuhR7YOk8Lp+pYh6PrpEW8DQ6rTH4jBp3LJ9
         eCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SPAF5hoaiFVAkY/WsLhdQk3BcWFtQ7a/5C8YkM1BjIw=;
        b=1jXs6C2oHtv/MRG0TPX93j9MhBjlforvgn2qC/njhba/1pRz/EBZSJg52RxQ/seRvn
         hqovGL4okRWFbRbui0hZPtfuN0p5ZLZssNpOf66CY3VNodipD/T8h37cFUQiDlF+to3A
         NkWQqvuvoCxzgiD/soargBuJhWGppO1g+z/oBSe6m655Gdufq3nOVD7NDKE+6k0hd6hB
         wm1cxQApFcPIFsWLb2Apm56GrtT+R8gWIBxGLAX7HaRksR5nxy053m3gpuofP7ftYQuk
         IBujggJkdS2IUWxX7EDzCmvuMERmGwQJ0GrFtKRhSCmlduhwrQqBv/MT13ru1BcoX0Hn
         ITfw==
X-Gm-Message-State: ACgBeo1JWN2KmN+kaGgElHb63H6EjbxoxnjRdKCrIchkKRxe9zW4xSK3
        xzg3i5Mu3GVwGvd0Sa5P663J9UznfPpOZ8cpsRDmQA==
X-Google-Smtp-Source: AA6agR7wytS0FmUM8JeHLoMN29M+7pRVF7ZaiQjrJfdDoekZisRpa00u54sk9yuZ48m3e8UIOTsJ3+TLANFnZ7HydrI=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr29891214edb.133.1663150886861; Wed, 14
 Sep 2022 03:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 12:21:14 +0200
Message-ID: <CACRpkdZxhbjTCagG8s8veNLfMuwXt2RhPpZPL4gPuABV=jDj5g@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] pinctrl/arm64: qcom: fix some of Qualcomm
 pinctrl schema warnings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2022 at 8:17 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> That's a set for some of arm64 pinctrl bindings fixing most common warnings.  I
> have a plan to continue this for remaining arm64 (sm8250 needs updates) and for
> arm.

I applied patches 1-33 to the pinctrl tree after I saw Bjorn was happy
and has applied the DTS changes.

Yours,
Linus Walleij
