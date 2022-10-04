Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BE55F3D0D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiJDHKP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiJDHKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:10:13 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D2C16594
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:10:12 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id m3so17574564eda.12
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jAEhfX51bk79HNZmAskhx8y8O249VqSQLorGUrCt9VI=;
        b=A1auwzx0uLK8UKHFdIApRlLeNu3gD+H4KIUo7baJve+uy+94IrQBWpymUVmcMcs52z
         doE1PqANnuZNcCQ4dHVf6WQOMFD5n/MlN8FPTXq/km0h+FSiwnBGYelG0iwAe3rjC9wB
         63OP6WbW63KTMSHzzWzVNbVAMpo6LXZFNlMvff0torOxIOJvOrhZ0YQJmH90vzqOmdgO
         ycV8i2AP9amN/nr5RjWwabltRy9yn91i93oqrk9aIL6Ncxwrhxef+ewXKQbb5lUItFTk
         cPWPrnQoVO0R4sugC8SKvKdxO4USMCmwvS2IpXxU9Cf2fC5iHCrwvRXVSo9ZIVi3NN/O
         AXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jAEhfX51bk79HNZmAskhx8y8O249VqSQLorGUrCt9VI=;
        b=Ic5iV1UR2Oe8FWCn0NRMQEw5nVolMiEafBFNvo2qx+x3UvIa2BHM1HViiBmZi+y/La
         a1t352bCV8WciS1ttCnEN2Czytk9Tt8YfUBp1Y+1xsnIdVwaKBzfXgSEyXKktRbmq7Jv
         8bDo9G4LP877TEP4+zs+uSfHCSnIEH/Eu+q9UcHItzRSdWrDKYAq0nFVpfw9wrgjtBYR
         Fln1vJfznUfm0Umyc+sanIgzZTGbpvInHeESNooAXgqeyHgtSw3aagt2k5riadcJ1k8u
         lMcpF+GBZg9WLYZ6hIv4ruGZ/rzPZYlQ2HDUjosFjApeTsIWR06nv0G+aa/YUEBPY+Nu
         xXTg==
X-Gm-Message-State: ACrzQf2W+Mjaw1Wh2n8FFk4wj+5+3rojIrQidyNmD1K7tsDP+AJxOPiD
        0CRmEYXQwjcUWF0PI2zO7LafWOjIem/wMoAyxENq2ZSz/zY=
X-Google-Smtp-Source: AMsMyM6hss1UiKoLSMTg9gp6lkoG0Lz+pagUMg5EYZh5zarPq1XB0z9E+IGEdLm6G/ePxgVs85xrcvhlyXib21DwNuw=
X-Received: by 2002:aa7:cd4f:0:b0:458:6077:c3ac with SMTP id
 v15-20020aa7cd4f000000b004586077c3acmr18719031edw.32.1664867411023; Tue, 04
 Oct 2022 00:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220917024634.1021861-1-yangyingliang@huawei.com>
In-Reply-To: <20220917024634.1021861-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:09:59 +0200
Message-ID: <CACRpkdZdv2ATT8yTGKomXAUq5Pnkcex3Az4prVQVv87BTPs=CQ@mail.gmail.com>
Subject: Re: [PATCH -next v2 1/2] pinctrl: ocelot: add missing
 destroy_workqueue() in error path in ocelot_pinctrl_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 17, 2022 at 4:39 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

> Add the missing destroy_workqueue() before return from ocelot_pinctrl_probe()
> in error path.
>
> Fixes: c297561bc98a ("pinctrl: ocelot: Fix interrupt controller")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2:
>   move alloc_ordered_workqueue() after ocelot_pinctrl_register().

Horatiu does this v2 look like you want it? Reviewed-by?

Yours,
Linus Walleij
