Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C496B25BC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 14:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjCINqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 08:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjCINqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 08:46:39 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511476A2E3
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 05:46:19 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-536c02c9dfbso35388977b3.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 05:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678369578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JD5vEqUQdR6Ma+5/iQENbYFHj47ztYgUkSgEtuZGbTQ=;
        b=CSjmlsdFvkEMb3qO2GY4q05nLwoEil2+pxnnYxNQ8S15MP4S2FtnSmoWSAqL5Z2+Js
         11FwLbr/MarxeyETm6SlGvbnAl0UY9RFaguTeo5BNqJ+wqdX3l3DTUGyS+EGvOo9WSn3
         Z5DXprndu7hyTPpBh/Je0d3s0FSH2biDOvcRvgmchXzVysv6DvUD6ea3OqrNOgzsHdSg
         /i9xLis6KuK3VgDTg6g6LQwIZoGNZZXf5CG4HLZQ22+HhFsm5wNIIdcPyfbvYr7NzOi6
         oIZIssJoV7rirvkaebajLnk86TtyqSgiVCWJ9lvxTLJ42BOBcpLAxZSy/S7MK5i9FoRX
         qqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678369578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JD5vEqUQdR6Ma+5/iQENbYFHj47ztYgUkSgEtuZGbTQ=;
        b=7Rt4QH+m9kOpBJXKrYDLRkAVf1iKa3QkDzEM8o3jvuqpC9nfZFIBXeDIu5xUsyw6X+
         uCUyRE9Ft+EM/jiKuAH/hS+9EfyYGLAwGVXdp0RUfGU4xittU4Ug8Vq1/WrahbIfDwpK
         Dviv2p+GvgREJkYlSbHwIL/FQS4kPNE7Ooqk97OlpAU9NS2embgy+KkhNBw3zre0lEGl
         1vnIPUS+wjTpAJjFq83O+ppU5DwirTamDoqNGRW+N8f4V+19dcZQ41PDYtPm4lEKePSg
         oGNCuZnkdAbO9lAklhvpeXyBveA9ZEmT+DOR2QBULrCzeIVPkMFZpwtoFVzmH8o+tgRf
         heZg==
X-Gm-Message-State: AO0yUKVESq+H/VhZ7h8zovKvdDa1GmYM95vzS9Xr2Y1cPXP0Om/L0xRU
        V5HHZ+Z4cgPkqIbxfu2HbpHljPjZioP9RCDxY9x4Tg==
X-Google-Smtp-Source: AK7set+JCc7HxCkMLRYcxEY+myhnvNx/9RrRTDpVpu0qw7toAyIyDUj/heancREImYO2SpoymDo7B4uVm1eRjhi6sUc=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr13503264ywk.9.1678369578358; Thu, 09
 Mar 2023 05:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20230302155255.857065-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdbe=sHG9KVaGrbEaFoVbMY-2=r2X4WkcbNhCfZ9KOw1sQ@mail.gmail.com> <08aa9325-ed36-250c-d4d6-de6af1e82de5@linaro.org>
In-Reply-To: <08aa9325-ed36-250c-d4d6-de6af1e82de5@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 14:46:06 +0100
Message-ID: <CACRpkdb0sxgy_0NUQg06i+1QwZM9Yqx2h1gD_hQcNrZ6BT9+YQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: lpass-lpi: correct
 description of second reg
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

On Tue, Mar 7, 2023 at 2:40 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 07/03/2023 14:32, Linus Walleij wrote:
> > On Thu, Mar 2, 2023 at 4:52 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >
> >> The description of second IO address is a bit confusing.  It is supposed
> >> to be the MCC range which contains the slew rate registers, not the slew
> >> rate register base.  The Linux driver then accesses slew rate register
> >> with hard-coded offset (0xa000).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > LGTM, is this something I should just apply or will you collect a larger
> > series of Qcom DT patches this time around as well?
>
> Please grab it. I think I cleaned up Qualcomm pinctrl bindings from
> technical debt, thus no more work for me!

OK patch applied!

Also: good job! The Qualcomm bindings look very nice now.

But what about these oldskool bindings?
$ ls Documentation/devicetree/bindings/pinctrl/qcom,*.txt
Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt

Yours,
Linus Walleij
