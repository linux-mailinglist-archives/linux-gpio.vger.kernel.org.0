Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B48555E995
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347325AbiF1ODQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347321AbiF1ODQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:03:16 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A9A1EC7A
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:03:14 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-318889e6a2cso117971077b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zqNkJzAQzs28Q1o/gRe5m9k79AWr8i1R4AXoynI12dE=;
        b=zW0BdLuu1tTq2VORVGBdVTiywbBewnHgpJhbRmO8VpZTvNeExcgN1FT1Sb/S/WoleG
         q0z9dUxVq8mhgA4j0H6Xb9ZFZ+/VBDsXiZ2AM8iMKgmicRMxcnpjDH5lFF5t1xih8+BR
         lacNPOyDve1VtaYdevKG0nW8M4QuDkSWoxPbi7c8iVxPnrBO0ZheZl8fRcB+eq0NdgJF
         rdlJNXxlO9MzzNIjUyvcMdDYr3owpyUkJ6GDqtiChiL7Z5V26A5h8COMgsB9DZUep9R4
         s4gfT484bJTiJK3LFVWle5KC4cjUphgruHI/QjrNdz8sUK5WohU6loUtU4roNW0d1rN1
         CfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zqNkJzAQzs28Q1o/gRe5m9k79AWr8i1R4AXoynI12dE=;
        b=mQ6iJ2tFkQU13JrGtgkZ2iZYYP42ucp1O3pmOddQ6GvhM7QxOTZeOek9lBPJO5ACEh
         +JGoF5MIsxsvoBWamB8upCITfPa0ek/JCMMcAmQZgZEvo7zAXLUdfA0vjAj99VITYI/x
         LQgx9H6MMOZqJ5ka+79ElYbvlJoOgrrMz3K5iBB02/RYeBiEtjRQt7kbiQuJ9vpp8AUg
         wtP1e3RdiUgmnCTHqhnBtBl8vepPP7vZkUW26pWLRdmjLo55/swmBiIluWn+w4ZDyOX6
         SoBm1tMe3QIOhMFVK/nsrKBKUr+AvKy9TNi3hYnDZF1k1WPpsZqznamb1dxfihhm5Hiq
         7aoQ==
X-Gm-Message-State: AJIora+z14osHA83yVdjuk/vhgSOaFTmF4L+BnqOPtEQYc/fCvmzROsx
        O/1Mu3P9h5eGJf1AoCNvalGM9Pov0N5VEGr1o91EHw==
X-Google-Smtp-Source: AGRyM1vhf8tPs2JkZTz3EqRMlUacvdlAeS8akfQNMQTliotfy3ldW9d/I30sQQu06nl1Ii5zhiXjWFa2yC9loZqcsN4=
X-Received: by 2002:a0d:eace:0:b0:317:87ac:b3a8 with SMTP id
 t197-20020a0deace000000b0031787acb3a8mr22165745ywe.126.1656424993629; Tue, 28
 Jun 2022 07:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220621034224.38995-1-samuel@sholland.org> <20220621034224.38995-3-samuel@sholland.org>
In-Reply-To: <20220621034224.38995-3-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 16:03:02 +0200
Message-ID: <CACRpkdaxodnaJsKfFMvYHWtPwZyACiec4iX3ZXSBL5Ptfa6mRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mfd: axp20x: Add AXP221/AXP223/AXP809 GPIO cells
To:     Samuel Holland <samuel@sholland.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2022 at 5:42 AM Samuel Holland <samuel@sholland.org> wrote:

> These PMICs all contain a compatible GPIO controller.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

If I can get Lee's ACK on this patch I suppose I can apply patches
1-3 to the pin control tree?

Yours,
Linus Walleij
