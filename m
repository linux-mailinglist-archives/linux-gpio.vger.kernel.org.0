Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6750E6889B9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 23:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbjBBW2l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 17:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233320AbjBBW2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 17:28:37 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220DE66FBE
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 14:28:36 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4ff1fa82bbbso45708117b3.10
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 14:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xYHYyCk0Uk2jKz+BSxgBQ9AdeZqvnor3lzbcWcmYzSE=;
        b=nWAVD9UCkiGgNNR6RDSDBB64X6TZzBF+Rs5zhnPVI8JQKfTW64CiVrzCpzvpKr9sUW
         nKhHwXL60EAuMxto3sMXYPBFgmaQCoYxHn3XySbd/DuTSs0BKjTH8mlS2WrSOt/S5g+H
         fjlJRexHmOjVTnwDtef/w0xdADZVcdT5R16kk6ptrKH4dpRzHS7Oq1tPgbpBpLjZUfxP
         kj3VGUPmIGr5u9tQs/w0AnsLv/6oSXLNw3JDU3AvozwGaLCL8/nN6TI4gBUPIFgJ7bo9
         UCVoVV6PdFmx+VVzneMukpGT1sSEDuNGdAsKpLrHtw1TrfyMaRm3UcMqzvtUfb15jNmO
         D0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYHYyCk0Uk2jKz+BSxgBQ9AdeZqvnor3lzbcWcmYzSE=;
        b=Pf2fs3kLSoS4ecS9a/UYT4ObJnGg74QL6Bft6657SwwQUa1+n5nCHozMdglL/ItpRv
         mo2NatVwSY9tAImLafrqAXuicRI0qBG1+HaQWlvmwruIJ0MldJoXw6YODHHIFTl6DOwE
         FigebqLSHqg1owzenL/7cP5rqkiHrrIhPL0ogVhtmYNdonvKymt15ayGNV4XHufUBBwt
         stTf0w4CwFJPyoDAXzh8dBSjcpQdQlin2jK2h6WBFYOnoT7jd6t2zA3dELKFKfs+kJl4
         f0pV6NYCZJDQJMVA7W5bnZ5y4JeYdjjjVx7MEh/sDoVOv4HGfysvFJp6W+7HmTfUQ8VQ
         9OFQ==
X-Gm-Message-State: AO0yUKUDGafPQWacZ6spgiJ9vCbXLxRrmZjvDx0bU5iVc78cNtLlK2ZW
        JC00QecSdwxXzy3n7u0orHc6wnYbWyA5TmVj40boqQ==
X-Google-Smtp-Source: AK7set9tiyqBptIgECT4gz7vMnDVbMgEyqORV3g7fqx360QWQA8YTMy9wa+AnpGZQjChyeYW/LLFlq9e2OcdIBVM9MI=
X-Received: by 2002:a81:d46:0:b0:4ff:e4bc:b56f with SMTP id
 67-20020a810d46000000b004ffe4bcb56fmr894826ywn.488.1675376915341; Thu, 02 Feb
 2023 14:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Feb 2023 23:28:24 +0100
Message-ID: <CACRpkdb_OHXfAGMYwFv3gzRWyDJw6=eNuJedteMxiEvPtQxvWw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] pinctrl/ARM/arm64: qcom: correct TLMM
 gpio-ranges and GPIO pin names
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 2, 2023 at 11:45 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Changes since v1:
> 1. Match the driver's ngpios (so usually include the ufs-reset where
>    applicable). Several patches were dropped, other rewritten.
> 2. Add tags

Needless to say I'm a big fan of the series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Will you send me a pull request for the pinctrl things as soon as
you feel confident it is finished, and I'll queue it up for v6.3?

Yours,
Linus Walleij
