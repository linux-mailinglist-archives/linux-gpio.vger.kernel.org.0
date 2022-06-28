Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3316455E3DE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345996AbiF1Mzf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 08:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345599AbiF1Mzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 08:55:33 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C342F3AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:55:31 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id i7so21995567ybe.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmWEZn/MDT8BVlOf2j/0dbSY8mXMBqqiVxeYK+9B6lQ=;
        b=JhUf9b2e4wqWDqQ8nebU+X8F21tnUWwiBkQ3caAT8ggv5nqGzZBBSIs1fyVqGmgTSz
         P0bx2uU/Um+sT7/JMfPoyd+TMY/C0h/HDqX3iWSan4x+3gVgOFqQqxl7uMlO4YALgj1P
         axnMd8R2aq8xen9gsHvKZXoB+QewakVfuJ8MoMEhQLsS7rq+b6tDv+KHy0ssO7jdghqo
         YO21b4nExNXO9RgjmR71guAnd6SFsChnxgBNFeKm96PNLhb4OobEGJJroUD1rrau/T8h
         1IW/3R1VEMOEupRLy+W8KoRPDUYOoNLb+cC2bED7huckB8a5gxeW6VgpiKBa8TJCGma3
         hCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmWEZn/MDT8BVlOf2j/0dbSY8mXMBqqiVxeYK+9B6lQ=;
        b=EaKcbJ4bHsarlm52zAQBde6nBBqHHTFIm/o7QURFDlP4GVLw9zUJeGRjWn7WIyE8rD
         o3HxjssI9l7Z57NAfyb8/UPCH64zZqVe5/glmF+k3D5xRax/E4UTsUDl4JTYNsKXy+OP
         qAL9I13SRGXjJb51jdEYaE4vuXNXRB1SgdQHLjoMbdY//pJj8yWDDhALIYGWqbKM8Iey
         3JPI6s/8wI9vFH7/g7WapOeROfiKownjUqwu4hwl4QBeS3bqvk2HYN0AMQCfZbWZiFFn
         It5H24h6YCMzXomlAGnSTvMx9cvVbnLnAgEZTiOWIQOIQmIJZbdk8IUO5IV5BNOzk2bB
         qM6A==
X-Gm-Message-State: AJIora9sUKJ3ZXmHRslO+W7nu4Les3RzwdDt2HlDy6NZFRPtM6zqiTfi
        kekIliIrgfVptZLnE/+1iUz8tcpxetHJCh6cTXvsFA==
X-Google-Smtp-Source: AGRyM1tsaB9tgNaMSUle5S5+neod2eZjuTku0yKoAV6tHrXr5lM2cYOKc71QeSQjdMvN2lSTcPjYvD5JGxKdrp2cnJY=
X-Received: by 2002:a25:cac5:0:b0:66d:2c32:8593 with SMTP id
 a188-20020a25cac5000000b0066d2c328593mr2819682ybg.626.1656420931032; Tue, 28
 Jun 2022 05:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
In-Reply-To: <20220621161126.15883-1-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:55:19 +0200
Message-ID: <CACRpkdZs=kwFciZaNGWR3t=Q4Vy08qg6UNH6obcyubC=6jkYuw@mail.gmail.com>
Subject: Re: [PATCH V2 0/8] Add minimal boot support for IPQ5018
To:     Sricharan R <quic_srichara@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2022 at 6:11 PM Sricharan R <quic_srichara@quicinc.com> wrote:

> The IPQ5018 is Qualcomm's 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq5018-mp03.1-c2 board.

Pretty cool!

>   dt-bindings: pinctrl: qcom: Add ipq5018 pinctrl bindings
>   pinctrl: qcom: Add IPQ5018 pinctrl driver

I'm happy to merge the two pinctrl patches separately to the pinctrl
tree if I can get a review from Bjorn or Krzysztof.

Yours,
Linus Walleij
