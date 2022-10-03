Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E70B5F3831
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Oct 2022 23:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJCV7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Oct 2022 17:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiJCV7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 17:59:45 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87AA6346
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 14:59:42 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c93so7603816edf.11
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2022 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0SIK8tCoNjigsaJyP1+HHiu3azBVVEgFP3okI/eaJ3k=;
        b=aWOPuV1quDhUmeYp9NcOTH7AMvxC2qODqNDyjz7wMxDYMCZ8m3jMXjaViNnG/E+WqY
         TULHgotUauRa6d+e4v1aH9kJMYETVwyCGFGEx4U9VACk6jje/zq1847iU9kcmKtKzbGq
         nli0q5xy1E2o8v7QPag4z6rg81ZO7Yqi8CFcxpjUpYfXA8v+F9sNv34JjLm2Po56ZyKA
         gn4wVlpWES9dlxoPhcDPjuT4xWM+hgkQjgm3YNYEVrkRo6JSrlLChTp5tf44wYP6UN79
         4aDBawwPHMktSjuFgxt6PVJsfGS8i9+w0KdYP0wsi7PSbh7M8fe3jOfRkJCgyIpJe5ic
         la9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0SIK8tCoNjigsaJyP1+HHiu3azBVVEgFP3okI/eaJ3k=;
        b=5miHIsWhJbehoNvg9KOHazKPio8AMQpAGvlH9R+g10bx2GrYEqnQ3wL6rhEZ20UOyb
         vEfbUUj+9ldWfdF2LT08soS4mmZBUYPoLtKHN15rN427zqdkzoAcHTaQKstlEZ90l798
         +aemfciKIv3qXwWCqgYSFie3AR9KhMaTc9YQeIs/LsoRMf30hcXDdJjvl83KmdDGTNXx
         mRaudKZQDYMN9a2Zlax7TnJOEQQWwQ8LQn+pnFvM1VkYIZJTXUv7RN0/ZaHlLtMJo/Ym
         nSvytf53rBHrHodfxVttDOKUAbdxrS4/DAlbo50M6+VbYANZX4qsZuyOTdwyfVaK9e/0
         cLvw==
X-Gm-Message-State: ACrzQf1vBqLpEwbzSjNNxKIAoACTZjBBYPk9+k4XIkJolIjmnsPrKNWb
        7LX1zVfcmmFIFVONMGzwT8gnP3OTkemTkNWLZ55DRw==
X-Google-Smtp-Source: AMsMyM6Vc35m4Q9nf1n1sZmtNjTnfagyzbYCBX/RdutZnCYlhqEuUrhJQGsbcMFpw6JXvX0M8O/dpVSnSR86k1hd2BQ=
X-Received: by 2002:aa7:c050:0:b0:453:4427:a947 with SMTP id
 k16-20020aa7c050000000b004534427a947mr20528493edo.172.1664834381395; Mon, 03
 Oct 2022 14:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 23:59:29 +0200
Message-ID: <CACRpkdZ0KnXr+iQJb5z+Lqn9Mx5NLNzvT00Mn0hCvvcp2jMHYQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl/arm64: qcom: continued - fix Qualcomm LPASS
 pinctrl schema warnings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 22, 2022 at 9:56 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Set of fixes for LPASS (audio) pin controller bindings and DTS.

I certainly trust you with this stuff.

Once you feel confident with the long series, please send me
pull request(s) based on v6.1-rc1 with the binding stuff for these,
thanks!

Yours,
Linus Walleij
