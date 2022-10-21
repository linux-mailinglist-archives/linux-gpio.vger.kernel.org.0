Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D39B6080BF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 23:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiJUV2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 17:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiJUV2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 17:28:18 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7586029E5AD
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 14:28:16 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id a13so10656130edj.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifa8OePoL8OFfz7fugnjWWKBehwaOwZQ8Bn+7xviucQ=;
        b=qcRR009HWUtK+ingPLHkgUWXSphSZfgNhjzoOOLWY1U5U0lKyGFLFZ7YLpIkqygSWw
         edzsFrykFmsjpWwMCOLNbUNzREkh26ols/7wWSSfaGaqSu02lK9z/z4JF52phV4uF1wG
         BfHAlOYXxmnhjVdz9pwInp89m3Cl3eIQ3zGqgkNExpE9zPeNGxLX7lTZWvcl8O5rZiZo
         dn7/Gim683xNaA2EbvamwjIc1A5gUxxrxjcjo2WBjoCk8Dg73jBdpNU611Dsbw4FInVW
         /2bmN0F6QulMDRTe2MgELktdBek+D6VpDhxU6yMl/2mQLIDyxkjw0SY9CjG2M1oKhgGr
         UvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifa8OePoL8OFfz7fugnjWWKBehwaOwZQ8Bn+7xviucQ=;
        b=UIw2nSYyckwjBir6N6WWeXwELLtvHsqkX0EtnesHs0Fna8zbjgBXr7lc+ROgL1kpwN
         4qAMxiRdI0WtG8Pw/bTliUJFVVbqmLLz+ZRiF43fscTCmo4h1Rnfc7DhoVPRA01w700I
         uqpCOsosCHJJQOgHNUmgAkddTRKJHThA2ohzyV6HDWfpohJ8/yQGex6wFvAeWMpigSd+
         NvMJVu9EXtqvmd8CwXke0B+bUcKfBbWaYgn+2OcGZKRHDPpNq/K8mODf8XFbaCXcVgDQ
         pzz7Qxwtd58Nobe/O+OycqBU/czYilBWcBP4Ms+oZDroZHKgp/bCmdCMCZQXYyezbWje
         7hjw==
X-Gm-Message-State: ACrzQf2yg9KG63CtUl5v9mlI5e16ghfSBBiaP2RsP1JE8BIMFj4hqsJ/
        uy/w8rcJ3IktfK5Ch/rNWwYQrLghl9tNuIG+J7iQZg==
X-Google-Smtp-Source: AMsMyM6gsEkY96s2gJlVgjECF9k23V6FjAkazwMYXDpnHhRPiukqw86REJe9dt98k8yuQBX/1Z2zncZqHyBuqS10FmU=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr17376351ejt.526.1666387695072; Fri, 21
 Oct 2022 14:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org> <20221005-mdm9615-pinctrl-yaml-v3-5-e5e045644971@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v3-5-e5e045644971@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 23:28:03 +0200
Message-ID: <CACRpkdYb_wxhewHSM6bonKB0syciyX0ufRLXDH2gt0vW3efQTA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm: dts: qcom-msm8660: align RPM regulators node
 name with bindings
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
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

On Fri, Oct 21, 2022 at 5:28 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> Node names should be generic and new DT schema expects RPM regulators
> node to be just "regulators".
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
