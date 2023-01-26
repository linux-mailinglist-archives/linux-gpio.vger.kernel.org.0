Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA3F67CC86
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 14:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjAZNpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 08:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjAZNpU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 08:45:20 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13D12E803
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 05:45:14 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5063029246dso23176527b3.6
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ez2MrtSZb4tJ2jAwb3xppJ5lPZWy2uAXURxNWDwb/a8=;
        b=jy9JYMK6gGCl2o5vqFUdI6tHbmkfYsjBO8GG+hWJRcIBUD7E0/MhEgMyCGRFLTbD03
         ndLgGBYeHr/kcUJ3I19+pyzfLN9bLCEHT7egMaC+cTwEljplfce9DKPBDPlYMZ7IFVhR
         jDkVfEmXHvaFjY/55rk+y2nhrLPV3u4Q9p2K/kw81MoA8hpzcEuvAuKiDWyobGSNWhuF
         gp8/QXyuUrefZCmozuVO0LxlNyg3qOAuS7h/IVJFk1tu4VEKpxC/DEjl0M0pK0mTOMwq
         cKYF7lmbQmQns/bRIIh7r1SnGhUkeyEPttzyH4k+FHTHqY09UAZKeEpdab/5tVIfhY4G
         Zatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez2MrtSZb4tJ2jAwb3xppJ5lPZWy2uAXURxNWDwb/a8=;
        b=DwV9Kg2yTBUerf2IScSOIMoRZ7Q2t2FwYEAMDz3gf8RBL6zGQT0GFbNNMEmeEg+msG
         7pI0N21qmU1hMP1BeyLWNloTusufF05pLpjAopZXwkDTyrLWXwjozm2tfOmFZB5cXgxk
         CI4sVIYnAf4qcP8vxcN6DBS6civ8bJbbN+dNQ8qghYzfdGjZPom18t+qGfHo2C9jBfYr
         5nwEhEghnHjMB30xGwOrZ7CVFxt/oOA+TaeTsEUWOy6BPwdw4UXJ+mIqeTNE+FBjCg5O
         Gl/BSB7SgB7tP0q+SZa+S32Uslk2qCTWgc5FT1DcO81QJMUonsau6JhIMeaLV7atqVCa
         Nz3w==
X-Gm-Message-State: AO0yUKUdgFSF3fJxazeW8KvmR1oMrITcHhGTrWwR43cR1cMD/qYrqBko
        YpgW2T9VKoQtCSGinCXSYZ63g5I/oZzbuMozSiiKNA==
X-Google-Smtp-Source: AK7set/7+Fp1NjZoyI+mM8UZOZRBtXPThin2BMCIsY6GmayDtC8+bkdTlyqKNL262/1QMt+vCKGslTx4Vz4eu9Y1JF4=
X-Received: by 2002:a0d:e701:0:b0:506:66f5:fd24 with SMTP id
 q1-20020a0de701000000b0050666f5fd24mr955721ywe.130.1674740714000; Thu, 26 Jan
 2023 05:45:14 -0800 (PST)
MIME-Version: 1.0
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com> <137b56f0-8e86-f705-4ba7-d5dfe3c0b477@gmail.com>
In-Reply-To: <137b56f0-8e86-f705-4ba7-d5dfe3c0b477@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 14:45:03 +0100
Message-ID: <CACRpkdYYB4-qhgbN3D8-Yjs9QVcj1oCZZHTVJXsyXgC=p-e=NA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: pinctrl: rockchip,pinctrl: mark gpio
 sub nodes of pinctrl as deprecated
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 21, 2023 at 12:08 PM Johan Jonker <jbx6244@gmail.com> wrote:

> Mark gpio sub nodes of pinctrl as deprecated.
> Gpio nodes are now placed in the root of the device tree.
> The relation to pinctrl is now described with the
> "gpio-ranges" property.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Do you want me to simply merge this patch to the pinctrl tree?

Yours,
Linus Walleij
