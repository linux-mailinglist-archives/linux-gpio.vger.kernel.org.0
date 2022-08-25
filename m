Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABCA5A1086
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 14:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241790AbiHYMbp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 08:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241810AbiHYMba (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 08:31:30 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE895B2DB2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:31:25 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z8so5274379edb.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GpfgEoOH4Bk0o03BXzXfbjZSZHr+iWqvwXSXT6fbHDg=;
        b=aJDALMPobe0TjSh/jiJJfZku827C0K6keCQCIpXty6OvQ/1gDP0KEl3Zh1+tQCiUPN
         FZuZW5tsnab7jNTnlMJ4YZySqHgaNfqs5mwtbjlnIYr9M6+whBK7uftBtVEyvJnSBQ7z
         fuiyYX/H2NKWhlvR66MZOsHc3JZMgKzOBB3LkFy5M8Vo2t5aBv+i7++c3/g2BD2oq9o+
         vRPLQAMw89+BYM2XOvmulF/NB22gpgQeTopMu9SrsN31yNX0hZOccyckJT1Dzib+QcCC
         D2MzvJFyilBzpmtyGSDIDTWatSUSlyXjDtUXJA+JJVFR6ESHfTeqjTt9NDe1cD71Mgnn
         4pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GpfgEoOH4Bk0o03BXzXfbjZSZHr+iWqvwXSXT6fbHDg=;
        b=WxOH58KlyQD1F/qyagQiNUhE2gp51Cf/h2bZOseXDB/oI2D6ONVdFjhbgb2TQQ4nbM
         kAYKur+fYAskgMAzXKqZF9cY3qZAPqRl7yod1Dnl6SDADwjsEw2AjK7yi/ex/+hFoXTS
         A7JgKyuLL259BLZV5++7gy5l04kqtLJnTyQjw/f9uL7yuGhlhy7rp7HjEOM14N/1k8Ow
         2FSSmb01ys6HORbIKv3rBPJjILPE2h7IwgLCuswcfhsJ5BI1TECX2Ui17Fa4vtgxu3Nb
         TsIMa/dA2zZq80Sf4TpQh/RduF4D4r/uv7GGjCZoLVwc7AfI0hQ/65rCMzmYDp0PySLl
         F3Hg==
X-Gm-Message-State: ACgBeo0XrvDR4Xm4K+I9nrgvURm3d663BiZno5iGMLqs6ZDg3v5f6T5w
        cUtLjcn9Z+nFjxTvdScEgZuSzCUL7OW3lILTDZOiaQ==
X-Google-Smtp-Source: AA6agR5AzWiEJVw97Qs0InhBJT1xWHu/mHYs4QXnlx7YgLLGzvNmzJPWmXmaE8ZpDzHKOuoj/4+kW5Z5Q4A2grdcxVM=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr3051832edb.133.1661430684201; Thu, 25
 Aug 2022 05:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220817113833.9625-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20220817113833.9625-1-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 14:31:13 +0200
Message-ID: <CACRpkdaMyqtY+cQZSmcs6Hejoin7DKTVWbxTvfkSSM7ceo72NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: add support for SM8450 LPASS LPI pinctrl
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 17, 2022 at 1:38 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patchset adds pinctrl driver to support pin configuration for LPASS
> (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl on SM8450.
>
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
>
> Tested this on SM8450 MTP
>
> Thanks,
> Srini
>
> Changes since v2:
>         - removed unnecessary quotes in bindings
>         - remove lable in bindings
>         - fixed gpio pattern and remove an extra line

Patch applied, the patch looks innocent and bindings are reviewed.
If Bjorn has any further remarks I can always pull it out (or you can make
patches on top).

Yours,
Linus Walleij
