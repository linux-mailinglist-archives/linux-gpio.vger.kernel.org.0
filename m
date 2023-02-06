Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBD168BB14
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Feb 2023 12:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjBFLQ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Feb 2023 06:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjBFLQ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2023 06:16:26 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FCC7297
        for <linux-gpio@vger.kernel.org>; Mon,  6 Feb 2023 03:16:25 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5258f66721bso101938507b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2023 03:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZC91XAGFSD4Jgm836rEJDed9llUVd+tekKed+BLYHY=;
        b=c4rCwoptOb4RPx2NbQSer5RaOsGX6z0nWO+g2UAqEHMgfW2ZCOypnrXNLoiunbqkNQ
         FwQMlncAJSTckq0h6ev2bvIJEs8M7MTAK+Qxhe6lNvkU9ynFy9eBMT6AEohrB7J42zW1
         eMETaw332+79HfYZY5j1hrTCueaMONRcvCWpQSkFFy2KveljdIuptm3QGYgRleRWxDYe
         9T7U/1uTJLQzfA6zStQnVoY6eVhTR56gjaYnlYFDfkzdySKhwXoQNKiRoFq9Yw/ojkzg
         dm0lbd5hg0e6ofjgqn3bqrwEBqvvtEvoWz5hl0q4sQwLAk14Us5jMqtzJROQaxKSgFEI
         gSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZC91XAGFSD4Jgm836rEJDed9llUVd+tekKed+BLYHY=;
        b=2pl7v46oyjVbkuNTUDC3xk3AIHzBExZKqRWG+E7fwTTWaqucSvE4H+HXTsfuVP1hcx
         mGOPdMl1tqcC08TbLHUeeHDFJY6XqmyqErhPk7dewvAktsKdz95cXN3vlfNRXOH9zeee
         SwiQ8r6TZblTe+V4cWnKWHtwFSwP9VbIX3NfuqioN00a2EAgB9Z0TndJjUql0+smVGON
         zFg6fOaYojpGZNg/APtCfmLYFKa473XOxDFmrQGvJpydv6CPuH+LTEPoY3LtX6neEpNk
         EHzVm13pzkkWIwYRFyqVVs5+OsG6By+O2rZbrHC84qu/r8ZcSErCxKTVIrSRMs8O7Usb
         7A5A==
X-Gm-Message-State: AO0yUKVzLsuC7UZIoGcCBmTapXOSiOn5dKLQHjXae1d3SoZb0jUvZen3
        9ShH0piZcbPnmZvTB4aSpb9bWJ9FNNyBCjw715TgQw==
X-Google-Smtp-Source: AK7set9Oqj9VvQkiilHzqiJ4Luq0FpfpoEheonprr87C40jeFpsD15F4cL3eOi/ZZcW4sDhGb3Zw2WFlYht7iH9JHdk=
X-Received: by 2002:a0d:e846:0:b0:52a:8896:6dc7 with SMTP id
 r67-20020a0de846000000b0052a88966dc7mr46642ywe.130.1675682184947; Mon, 06 Feb
 2023 03:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20230203174645.597053-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203174645.597053-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Feb 2023 12:16:13 +0100
Message-ID: <CACRpkdaKYdDoTqVPogzZc6t1+Ho4-ruj6mWFeZwWcCkM9BKndg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8550-lpass-lpi-pinctrl:
 add SM8550 LPASS
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 3, 2023 at 6:46 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add bidings for pin controller in Low Power Audio SubSystem (LPASS).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij
