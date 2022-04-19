Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4F7507CB0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 00:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358270AbiDSWp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 18:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358266AbiDSWpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 18:45:55 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A64031918
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:43:11 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p65so33691903ybp.9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJd5mXIJ9TYTPyuGeI1ku7Y3Z10VS13yfL8uaU2HGaM=;
        b=OwMNnkGCGYn+C9nRdX3zO/DaPCz8Vitby0qHNqI1JkBGlUWR0wOZs++OfRfniZYxi/
         v+xVJye4OMPpghx+7G7XqhXTOy78eQw3+sDH+0SUukW2paB2JVybasIgJ2foA5iqOC3/
         zERXi14JOQilJorJWOAyXYURGM1mHYyfN1m0hmgGetRAsTr2n+Z/5/WWDrRjpfWzoBB9
         eXzT1ui0fproWq7cRXq4KNgHzdMWhQHHt7YwREPT/0LjnpZ9KF7OO1Txbh3rHrUI7785
         4v+MpsrZ53LFchz53sSzm9ygDR+Ytb3OeITrWlg3MREAwg6oPTc9EFD3NKCucFstpR9n
         LeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJd5mXIJ9TYTPyuGeI1ku7Y3Z10VS13yfL8uaU2HGaM=;
        b=RZAbxHlr6bsCWWaUlpX7L5SX23ZHc3NbHD6KqpV2BWK0YO2sUJdcm4o/lJNHXqbNMX
         64mSsLEGDp3ivUeVy5ewJ3kQiRSyuA7TCsHaJJLN5TVGyws4CjDt5RCIfecdgK0e5V/t
         L8AO9Ye6AYjgZJqfmH8r0FyXxk/lz2gVMpIFIPElLgyoNLW+gQAY6eAvMadJLurc1JNW
         MfEFHVtzImZT06L3t8pvfxpyQT3HIzWFssatoZiOkEo60l15uwqSTjXMRiuKYLIm5PD3
         cBfBIAG5OSdKW3BoUtg4Q5l8l8JNmfsgr8lab/fDVgPiFPptHUA/oRpiklXxW5bLAml7
         +dNQ==
X-Gm-Message-State: AOAM533CCj013K4NtZ4ql52dmyLh4hdrx93YbMNCyyLV0GJv3WzLYPbr
        jJ9S5XdiXo5q91bOx4F36ABUcD9x145LXHdEtq8EJQ==
X-Google-Smtp-Source: ABdhPJxDPhDmxJ06mRcLlUYOqNBrMrRupWTsKU2r0ffZss19RV5zGyLwSV/l3JhJxgb4lNiKuR9LWOg7Op3D7pxET4E=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12667515ybh.492.1650408190340; Tue, 19
 Apr 2022 15:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220330023720.18238-1-qianggui.song@amlogic.com>
In-Reply-To: <20220330023720.18238-1-qianggui.song@amlogic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:42:59 +0200
Message-ID: <CACRpkdZSVo=0Y1CTMccQe1a-GB6wqYTycnHOj8KtUdqL7f0Bxw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: meson: fix unused variable warning
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Mar 30, 2022 at 4:38 AM Qianggui Song <qianggui.song@amlogic.com> wrote:

> The kernel test robot reported a warning as below:
> >> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
>    static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
>
> Fix it by adding missing description about this pins
>
> Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>

Patch applied!

Yours,
Linus Walleij
