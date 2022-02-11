Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FED4B1A1B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 01:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346126AbiBKAJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 19:09:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346107AbiBKAJH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 19:09:07 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B64272E
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:09:07 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id j2so20423634ybu.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WATbzyWdcGRXO+H4n4TlwQvCVpXdxX99IfXSiHQaJb8=;
        b=b93jgUrYF0dCu5NDWSgMtP+vbQVBJLCf2aDT0Y+lRcokF2jyM/+FsfjtgOWYM7sVOQ
         L9y/4hQbn4XsDH7gPrMUlQX/y1OXsEVkupawI9IdgVDDMt7uxy8eMA/1x+Np64t6LGUk
         idOsCmm0IUWK6WwyHBejLs6AD0KrBg4N267nadMePCzx04nbSlQWVrCKG++oslg4sWFr
         8wgXwCikb9leFKQOhADIqtXmSdyYwAgLVJm8h0IuQ+XuraZLObxgzoasCt8k/SIgRjhI
         xtWdlnbvsPHSX3XQw4cfSgtsltsN7IFduqFmrGAzndg5R/FE/iqN2Pxgg5LvYdrdzwx/
         UfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WATbzyWdcGRXO+H4n4TlwQvCVpXdxX99IfXSiHQaJb8=;
        b=VOnhO1LSvL34f1lIqViS9ZUwqdYj1n7yZXom7fq8PGBwlIW7NdpkTO8yoTtIzvikLp
         ywc9m7tReMFyglGgsg2GoBhaA38J6eP1g+AwuK0V/InC9kRsUu3cDGVmfh86RyN1PcVd
         AGsKV66Z1v1OELOrtA0LAmbTjGyK129gzINCRjxXIF2Riq35OqhaaOUcEh988to/Hj1C
         f58C4SIei5mZUQCT/G2xMAK4nH9ANewf4d2AIo8pEDApjsm7DBveyQrAPIoN7JEXX2TH
         4KJPqUPMQNJvIIvbLOvB0mUyznNAzrx1sYrDC5chmnOV+kXPwZLlYfeHaVq+SmP1cyKp
         Ut8Q==
X-Gm-Message-State: AOAM532n3m0onxhX7EF7IThgxd/ctv359gqIX23kh8hHocGrlyg3m172
        sBzc67USSi1rkyu/ret55jUCiOpx8S+1GPuRQwrAPg==
X-Google-Smtp-Source: ABdhPJzA9Zv+yu6ytLAOkKNwkbWM153MDa+UA7mEboGjwCS3aoQIkbG/Y7olNbzcU4lHkbC3e0tUmgUpsn7HEFRbjfE=
X-Received: by 2002:a81:4402:: with SMTP id r2mr10071843ywa.126.1644538146951;
 Thu, 10 Feb 2022 16:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20220124171538.18088-1-rayyan@ansari.sh>
In-Reply-To: <20220124171538.18088-1-rayyan@ansari.sh>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:08:56 +0100
Message-ID: <CACRpkdZ+R6vcQTf2t+WRhd1+0owbOTyuyNWurzhukn_aABL1JQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-mpp: Document PM8226 compatible
To:     Rayyan Ansari <rayyan@ansari.sh>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 24, 2022 at 6:17 PM Rayyan Ansari <rayyan@ansari.sh> wrote:

> Document the Device Tree binding for PM8226 MPPs.
>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>

This patch and patch 2 applied to the pinctrl tree!

I suppose Bjorn will handle patch 3.

Yours,
Linus Walleij
