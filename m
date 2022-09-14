Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839E35B88AC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 14:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiINMzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 08:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiINMzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 08:55:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDE11ADA2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:55:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 29so22101961edv.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o9bsMPChreu51F+DpvXf/8dl+XA0syeIceqw0TCSPRE=;
        b=iVCIe/V6cngaoT3RK5U1+Szzb05njaWIlPKBzXipO+DpKseYlL8EBxX/sfllpNyiy2
         qW75G4OIsnrjGS3EtmE847+Wa/ZFk/TSm+OEk71U6bf+K2n1MeAnWV+X6D4o4YkNd1UT
         2VyPqm3RitaCWi1ZOBBWNUM4JlN84zYlP9PquZ0+b9OVi8dOOwHAxL+HtQ9XnnvJoFJ+
         rlt5g5bHUQTyiI6qDYyIW9KzHaxN3HC9Jy1X3O48RXbfMkjy4Hw1rJJpO21f8ghbD2Ez
         Pg4569RDUJ7qGLnc9rjbX1mXeq4sCy+p1qE10H5LXbU8bPYB5gEn+9CT1zkX6zikTKoV
         XWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o9bsMPChreu51F+DpvXf/8dl+XA0syeIceqw0TCSPRE=;
        b=dWjMXOmnxaDRAPbohz62Cv2N7m0kYdkC/GRy6VjKjcKww9sisJbgyqq+/bJZtUjeS/
         DQK7aM3dXSgBusr/n60cDN1WcRXN68vbZ7bmCoAIcuKPCHhwOzUgmValgl04YjmxbXHJ
         TcxmcVAaq/97X2AshZEM94XeXRwcl/SPnjHHDH0mVHQj1OwGaKo+dHWN0K87vC/XB08e
         DjcUNJcdMhOl5LIrX9rgMg6kcILhDqBL8o6ye+d3QaT0VQ+93KanaI/TuOOddaAjGk6J
         zzCV9AlbSFToH1Q3Cb8KgiXwMJswuaVdqE30dDGCFULqPj4veAvisG+EVuOVsfLB5vf4
         sd3Q==
X-Gm-Message-State: ACgBeo2W8Eg9OoIWzbO3oLUCF/yU/yfSDi6q/v2gHwp1IFKzpsltNkX5
        ThshlQQJuIAH4PdIZ5jKsaSKmngpKWgP5dvsTyCi7XGwgEM=
X-Google-Smtp-Source: AA6agR6kZD9JXsB4SrCbxYC3E8ILxvnVxqjQ3570ruXYKWkhtbdMpwIGhCypPfHA5kXBOpAXuDD6YMeLm/q1TYaqHI8=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr30553355edr.32.1663160116189; Wed, 14
 Sep 2022 05:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
In-Reply-To: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 14:55:04 +0200
Message-ID: <CACRpkdYgAv_XM6-b8mQMT0xB76JgwgxriEVwPj=9cHyLVJVUiQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: update bindings for MT7986 SoC
To:     Peter Chiu <chui-hao.chiu@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ryder Lee <ryder.Lee@mediatek.com>,
        Evelyn Tsai <evelyn.tsai@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
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

On Mon, Sep 12, 2022 at 11:25 AM Peter Chiu <chui-hao.chiu@mediatek.com> wrote:

> Add wifi pins in the description and set 'maxItems' for groups and pins.
>
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>

Patch applied.

Yours,
Linus Walleij
