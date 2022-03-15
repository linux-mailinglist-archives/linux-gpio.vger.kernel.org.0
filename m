Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79CFE4D91E4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 02:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344078AbiCOBDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 21:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244796AbiCOBDT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:03:19 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBEC4474C
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:02:09 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2e580bb920aso15539997b3.10
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dj3kdvWmxS8AGnsPW4TBoORJlW+RrMOKgnC3qGzFUZM=;
        b=sRgDbfvHoiIHNMr3YpZkrnu/DUbiHWgV6Vc4RdDx1Yw4bg69fghgGyRiadSz/vKbHO
         4nmj1Xl333paYR4zkRWj0cJUDzXuJ0ig3wHO2FCbn/LArgcWpN9NvrQOxb4I6l/A4ULc
         SNxxvCxGQPqv6b9fpeKB/6bq+4+xBF1uyB6aygrew1pC0ka5rqKt2b6OoEQynkWjun3y
         lbeIZd7uhNIBi4mGuQdWdplKo7zOAFEP13DPtRKVTPOaznsncBWbTbcwS37DZnrI2OZ7
         oRL12f8u7mvmIIjfdNGe8kLmZrloyxKIxpPcS3Vd51QGPyj4Q5Tiu9KFBFg09cPAWwxo
         dgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dj3kdvWmxS8AGnsPW4TBoORJlW+RrMOKgnC3qGzFUZM=;
        b=YBFaD1UtiMFdstgUIBjiof6zwfzqy38ncLdCMHxQ8EXiLNN/BP7/DKOtnpB95VdSph
         nADSGKSSBEIahsIuvaKTYAWt33H7FNlREVtUikVIEXyZ3mmD71Xdau0HVEZWokwFTVvH
         RXWOz9iWpgoaXead83xhb3Oet1RWlJ5+tG8NGXRn3KhsKFKE5K6fMtRTs/KsemvY5ScT
         MAjlcDahkavdXd7pq/AdCNusxUI+yj3IFgLV0QGvXLqHY640V15QW3yR2j0l7bh89EQd
         LJEe+Mt4hwrqkcfG2iTSr4F5xm10u7jkJBQuC0vEsfpZEdhj55R3VRI2g5GXdbp/JNZi
         FcpA==
X-Gm-Message-State: AOAM530oVo20wehH4ewEY18ilq2y8yqNYBC5KSMeKYv0vwgBePJEch5+
        0zPJagSc6g2OxRn4///jcNxYlCd8RkCH3086FGwXsQ==
X-Google-Smtp-Source: ABdhPJysj4/E0AFd73Ea7gSo5GljRt/2BcdAeNJkno4apCGTlekm7vZ52R3o5xvgnj4UYCKxWqx5ZX3HsiTOLwVrgUs=
X-Received: by 2002:a81:1182:0:b0:2dc:4e58:da41 with SMTP id
 124-20020a811182000000b002dc4e58da41mr21946789ywr.268.1647306128379; Mon, 14
 Mar 2022 18:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220223174215.17838-1-a-m1@ti.com>
In-Reply-To: <20220223174215.17838-1-a-m1@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:01:57 +0100
Message-ID: <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
To:     Aparna M <a-m1@ti.com>
Cc:     a-govindraju@ti.com, robh+dt@kernel.org, praneeth@ti.com,
        grygorii.strashko@ti.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
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

On Wed, Feb 23, 2022 at 6:42 PM Aparna M <a-m1@ti.com> wrote:

> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> bindings in .txt format.
>
> Signed-off-by: Aparna M <a-m1@ti.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
