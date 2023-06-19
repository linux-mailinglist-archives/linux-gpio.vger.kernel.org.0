Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17A0734E9A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjFSIwB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbjFSIve (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:51:34 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB831707
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:50:20 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5700b37da3fso28905297b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164620; x=1689756620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zyWJrr4bOnwjfecsiBUExh+hZgUIH4ItLQDiGLGyn4=;
        b=YyPdqQASpuiyNJ2du2VDB51DjNpeoz0daaWpcy0vhAxz1FKl4Qq1Dtjrsv3f8XBKP+
         fbRbhu8XO/xkCYgSId1M8jc3EbFqfUInpu5fyBwfyXoQb6b4V8ysrzsRTCcudUkiyoZ2
         JqTxAqEBaNYkubqHXCsX7RLjz0S5YVVdf7hDtlceYfLEdi29GLI3Ut+rxLAdALVtj1Jm
         QgMr59dwdYax89Ef8RZu/80XJ5z7ZGkizzkhf82/tRxyVd7z7qZv893Iswvo+mBtTOvM
         94wLibhJu0echBUj44IIDNb4yqON9xpyXw5c9L7CXQnk+bfH160AEhPmpmj4KZKMdMzo
         X9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164620; x=1689756620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zyWJrr4bOnwjfecsiBUExh+hZgUIH4ItLQDiGLGyn4=;
        b=gwslvqgLF7Ycf7MGoJqCDVin61IeBpq0IjxNodFAqGJba0S6JVYqlYwdQeSInZzEvJ
         RbZ2NKe3K1aOlcnXkM3w9EPNh6+ZfJgUcAbbgayprbZEvnPg+/5c0wcZiqjCsU4D9OMz
         HPe+RvoTljpkmGV6ulC9pHBkl0wLNYFmkV/nTy3Sq5Ctu2Ba/fxCSEmmbgf6rE5jnmiz
         3av5ENBKHRhH7IRn85lyV664f2tdl2tRohN9ypcujc8Udwba8rIqAZolFRNO1OFMbCuX
         udUuy1knyOIfn6ox1oFtAix78YE0mQad2I5cJM8099StU/Fg5+ChXWkFx0aN4Ny38qx4
         BL/w==
X-Gm-Message-State: AC+VfDwudHT4yPXM1ICFG4hd0Myo89uTJ+6IhRZD5ns1mCd0JPZLdkL5
        pIBQ9vk1jp4n2YgfQYV75ayEkwATF3tDvaq+gNl+sg==
X-Google-Smtp-Source: ACHHUZ56eKFtdORrbAWDJoCJWrUSwNPczrlUQUk8NIlVDo6yY9fGLFxs8tJDYUR9AtP6ZBQ+zrXHqb1L+DXrudLj9dM=
X-Received: by 2002:a25:6982:0:b0:ba8:1c9e:c77f with SMTP id
 e124-20020a256982000000b00ba81c9ec77fmr364234ybc.22.1687164620200; Mon, 19
 Jun 2023 01:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230616185742.2250452-1-krzysztof.kozlowski@linaro.org> <20230616185742.2250452-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616185742.2250452-3-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 10:50:08 +0200
Message-ID: <CACRpkdYSnXDifczX-seegRdeW-6zwpxrz0cAeZaOPNcBpXYduw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: defconfig: enable Qualcomm SM8350 LPASS pinctrl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 16, 2023 at 8:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Enable the Qualcomm SM8350 LPASS TLMM pin controller driver for
> providing GPIOs/pins for audio block on SM8350 based boards (e.g.
> HDK8350).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
