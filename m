Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1DF5509374
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 01:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383122AbiDTXT3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 19:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345452AbiDTXT2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 19:19:28 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17A418B2B
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 16:16:40 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2eba37104a2so35273937b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 16:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFmFBsA1cs9S4lVVk9cY/Uysi3KqCoTo4QcygHCYv10=;
        b=CRk2JX7k4QtKNh5gdBexj/P58gfFbGrMpwUxFQEsg9r9e0s1mtcwdfXNg2FNMwa30q
         g8xeeZHEIWLzTMPh9xUXsWteUHiYaB1mr3jVsDBrwH2IOARUENMfleGPNj07OesxqbHa
         joQT/914UvMql0s5B63DBiJXhjznt23YxxTexEKWsfLF83s51FuxOlH5tcT0Z8J92AIp
         gWogEtssZlOQ4GsXC4ULYEe+Tona7hf0TBBx1xjnFX96yK+cere1oMC8pu1+SBlVMmV3
         3Y7yTBK6p+D/xkffWG+gXsK0PlLEureJvr4SBJxLl48PZfH1vVL7FAqsuuGD6tMHm3vi
         PRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFmFBsA1cs9S4lVVk9cY/Uysi3KqCoTo4QcygHCYv10=;
        b=svTxANj3ClmieBfrwbTn6oKWe68R6IKvUb0z6cJWJbqIcdfgN/EH6pruMcxn++yeg2
         RcV8PszeGZGylT4yQ4NDCDRM4h8c86IISR8oUwqZ1ZmuTVxPnRpjgp2G4514XWUTXzkt
         8g59ufWEcoJYLB315prikOpgLp7Ao39+3QXwIpIQ36Bmr17U/8hZMbQ5rZyvMbVSUut+
         Bxuu3m7c9UhjrqeHn2N2GNQbIJpjfHUuDRKpGP9jE09qt8knnklynwCKl7ClX8OcPU75
         dihRwVtoeH6ttiYTKE1i+vyItdWRhA9SjDl9REMbVhpam4v14C1mRYwl99DTf5nHc3Wr
         +yzA==
X-Gm-Message-State: AOAM533J3Kxhp6RTqyGmtmIOhVvHYftmJp+Dmk+DMdWB+wQtu89vFErK
        gskiFJlxKlK5e+H8T+hbEoYDSqmytqL7n82Mdvldw+TL2hA=
X-Google-Smtp-Source: ABdhPJxJ7PaIeQo2UGPmAGzPpwrGzL9jce3UtLGr7yVoRBoeZcosvs9fVW74JLGfXPCXLZGMYCE3Xx0xdNmymoUc3+w=
X-Received: by 2002:a0d:e813:0:b0:2ec:1e83:e5f0 with SMTP id
 r19-20020a0de813000000b002ec1e83e5f0mr24272748ywe.151.1650496600144; Wed, 20
 Apr 2022 16:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220330133952.1949-1-jbx6244@gmail.com>
In-Reply-To: <20220330133952.1949-1-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 01:16:29 +0200
Message-ID: <CACRpkdY73vWUTVjQ2T7qgaHkaj36pLTAyk_KWBzB31EUSvBTyQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: add rockchip,rk3036-pinctrl
 compatible string
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 30, 2022 at 3:39 PM Johan Jonker <jbx6244@gmail.com> wrote:

> Add the compatible string "rockchip,rk3036-pinctrl" in already
> in use in rk3036.dtsi to rockchip,pinctrl.yaml.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Patch applied!
Yours,
Linus Walleij
