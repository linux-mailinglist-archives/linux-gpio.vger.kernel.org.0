Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5531A68F1D3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 16:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjBHPSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 10:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbjBHPJ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 10:09:26 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD6D19F14
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 07:09:25 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id x8so14047192ybt.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jfUADXTr4/5qB/7AX2/OOU/7b3TSw99YAVZDZfGLs28=;
        b=s4D7gdSBqYfBjlFxV1qEk1gkpY7qyxe5rLV3gXrsNVkfjWWh+1Zv7fpxW7D39ydLY+
         NmAY4rqr1nJB+VliyPJI9Q4Z/mXcVI4TZHJB7VS+YYxQzB7vo0ayNDnZZSjKdHQHivWr
         3x3lkLOAu9+TgcdEoTOyoPrXtxd2n1VJmd6T3+cNIz1tgxYkR3uhIdaG370NWXu5gxF2
         152KqTOMq9OfY03/ftQBaEdJEQ7/IfHB9aynnLbOZKwPmWVT8nw8zMAfP58H8/FTQr7E
         E53HUbW4nd+WI19Wv/jaxI61fqMC6rZ95KQ1nw1Kd7DwN653uNjgpFsTkax9GUWR/T6S
         hgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfUADXTr4/5qB/7AX2/OOU/7b3TSw99YAVZDZfGLs28=;
        b=n+TuWWsyCcwtm2vNapydD+TmkkgQRtAclUgYE7AxkXd0YEUGlw8hi4CN+0PBPKfi54
         acanucbJcGPUCOfUpaZ/9QXQvyq7Vec5hkxTtln3CxIM18mvi2LpS6yjzLbS8vyCHr7M
         A0oIO2l9mz6910wE2fH/SaQ3AMbhYNXjTVCGwP1nA5j/TS3/7tI/rB/hWLBo/S0Fu4wx
         +j9Np1/d7QOY9quhOgBrZCtap35V6//EOJvQSqRFCv1+vbGbjL2zGvSAjw5q7ZT23ENi
         jFT1f/8GvTEq3qbWhJ6CUaxJLf1GK0ncjRqsNtS65M0vo4TFq1msiZoJToyEILULA5m1
         YSxQ==
X-Gm-Message-State: AO0yUKUVTGokNgABD9b2BRiAyOr2u4PMG39SPkl4Jf3Grwj8Q0m1/nvt
        uW0s7KdcFqN4cuWHnstQMXrjkuWRgm1fhFRmxmj+/Q==
X-Google-Smtp-Source: AK7set9exvYqx5M9TtAwxqO8BUajjZJuRrDAqirglQG0w39AVOFmleTT7JbJ/NXtuLdWEyZfILZkOUC5QppqmdUd5rI=
X-Received: by 2002:a5b:1c4:0:b0:8c9:2650:4ece with SMTP id
 f4-20020a5b01c4000000b008c926504ecemr88448ybp.210.1675868964876; Wed, 08 Feb
 2023 07:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20230207172759.448798-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207172759.448798-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Feb 2023 16:09:13 +0100
Message-ID: <CACRpkdarkcX4pk_0cCLJcdW9jgvJxsvoVAywFW4yo4rZqqkEwQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: dt-bindings: qcom: second round for v6.3
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 7, 2023 at 6:28 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> On top of previous pull request - second round of DT cleanups.

Pulled into the pinctrl tree for v6.3, excellent work as always, thanks!

Yours,
Linus Walleij
