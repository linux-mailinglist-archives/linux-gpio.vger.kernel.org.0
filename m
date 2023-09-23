Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7624C7AC4D1
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 21:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjIWT0R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 15:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjIWT0Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 15:26:16 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96393197
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 12:26:09 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59c0d002081so48584697b3.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695497169; x=1696101969; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZizts65y01ok+ES2EUhAYAn9GXHIb4VmooXZajucCU=;
        b=uNeVk+4wrEtA25qCf/0cc+V/J0m5Bv+FMDG8kGqEEoFlimXmspGlZ471bmLaWTR6Td
         svLBkwjoQ5RijQ121IJl/hmiuNKyS+WT/T2Gwm2T/sOGLUGvnXRo3v/tlVCdffyi+8zs
         QB+TT+5b2sh6nB+K0vELCI7ByecLH9qX4fncnhD3sxMhUxl2+l1WN9A95ggUhWwsLGKu
         biMyYisQOb3tnAnGiB+x2aW3r+EqpPceYseOmI29PjY1CaPZ3O8/+HKoqB8vx17UM/uy
         lUTNlH5O3A8vua5hzsHsd0MNdDlyUan+qr+hUm6Ar+JALhPs1eztA5WOu7f8XfcLK8mD
         NqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695497169; x=1696101969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZizts65y01ok+ES2EUhAYAn9GXHIb4VmooXZajucCU=;
        b=LEHPqNp/R9VsMpMNcoK6Wq/Kdz02FXQQ9nKzjM/TgpExTjEOANLCOKRdYUf500fv74
         zwHMjBkUHcLSdnmv9y/AOquRgg3TinqtVYrGn4QRqqf6R4ioAck9UOug4UkRkNNYxiWI
         3iiByepdpDHK+HVyYU6sAp4Zc+5pCdtOKj70cx6jo5N0G1YESeWwZHJBpZuCUzHD0heM
         4RZ7r7vWk751tk+67FQS0tA+6EoyylkMBU2S9OKDMn6aMrArnHfvvIS10OcCFyV5CJTf
         Fj5QNZIiLElpPaiRc9Kg8hf6hYFBODWv9HA8rVw86JoSOG6m3ZsBy/jRLJbjc1mkNX+n
         zTWQ==
X-Gm-Message-State: AOJu0YyouAWqHQCEjj5UC/SKOxVvH1LXhqMGu3/SIqw2ZPxjTlcGPlh7
        TKVLnHHZVH0qeqRyJNMGbHwUX0rP+7OvnkFhPCeAsA==
X-Google-Smtp-Source: AGHT+IH8xd9FGQCscz8xMLf0DoFylip6IAWZhY41aoUSaGynGex3s2gK+VocIMx3e8QuWNuPxfssl9IzVZ3Wrlq/3w8=
X-Received: by 2002:a81:6089:0:b0:59b:4f5e:12d8 with SMTP id
 u131-20020a816089000000b0059b4f5e12d8mr2866968ywb.47.1695497168744; Sat, 23
 Sep 2023 12:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz> <20230922-msm8226-i2c6-v2-3-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-3-3fb55c47a084@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:25:57 +0300
Message-ID: <CAA8EJprhhUN6Txbiyvb1Jk8mEnX1bxhf-WWcDU2J2WH0uVF9kQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8226: Add blsp1_i2c6 and blsp1_uart2
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Sept 2023 at 19:56, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add more busses found on msm8226 SoC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
