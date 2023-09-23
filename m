Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5668B7AC4C9
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 21:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjIWTZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 15:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIWTZd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 15:25:33 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80858194
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 12:25:26 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59c0281d72dso48445577b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695497125; x=1696101925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bxesPwbKK+IbMVfBmjWGgUeL1XEUWzxsSpby7O2MdPw=;
        b=DlfYuI5aGglWeu/+eBC0xwDAVUpKuie/z9nXzJ/nnqYKlx14qw0kjlf06AKAdQp/Ny
         rxkioxZ4J6Jmka5r/+889fxTKMai5aI21JP0MZfv1Vm+221dMOM6tylkpuP6tdyosFhh
         OM4CSpVx4V9PqDMw/bBUP+ZgTmlXdqN7kVQUw5e0diqhppLoaU1S/F0AVJBdbjKX8CfY
         1v4AhEu7imk722Zoz2aXGQqLR4pUMfhq6RJf1+A6U43/zzJQnBdetwhE53VYURh7ntx5
         ufq8Cle/r+s45ozuR+uQASts9gSZn3/zKyb6fecutdorudCcT6VsCU/h+00qFBjQh6/z
         LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695497125; x=1696101925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxesPwbKK+IbMVfBmjWGgUeL1XEUWzxsSpby7O2MdPw=;
        b=mTHOxMCc5/B+vbdt2CUjsWGnQif0TydifCUjfwS9jWRIL0+y12vbAq42A1tZjvlVDj
         T8YfJkfyBtF6fJyXmlHklzR5qPfFBmm4BhHHSQ6IcmYYK/wk9l4b0RU5IPjK9hZJtSKp
         h7RYwKep3ZBgGnzT3ifW02hs9W3kst8+JuFRBJHg0iBCAdJXMj/iOwlM9y5Mp2qcXt88
         nS4rhgTX54XvbarjNTlpJaicjZxPlKEeSlYmL+iwhtsDoJEesFWXEBr0km8+S/6jfFpm
         82JRJoAZn5yRAb7yYPM4vfXraJX0rld+y1Ks54tS/cO2mGlHtk4W8Xdgi7gYjwiqh5Lm
         Igyg==
X-Gm-Message-State: AOJu0YwKW/RgkVkRXrj3fRSVGx+KXuWPtKFv67SVdAC6YZatp5SwWsL6
        g3f0Ti74eK5L2CdjKrNLDuVaCmivaYWdK9b0TZT9Ig==
X-Google-Smtp-Source: AGHT+IG3UL8gjMqkSV9UZreXyPAOKYXw7SQBs9BVE5PjxhebQt4h+VQhMShs+JNFq9ZQ13DzznAVw/do8m3GfWdF7oA=
X-Received: by 2002:a81:6907:0:b0:59b:be67:84cb with SMTP id
 e7-20020a816907000000b0059bbe6784cbmr2608480ywc.26.1695497125756; Sat, 23 Sep
 2023 12:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz> <20230922-msm8226-i2c6-v2-2-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-2-3fb55c47a084@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:25:14 +0300
Message-ID: <CAA8EJppafz38Wp7CUQGyxLoacO0kXexgyJyA27M38gS104Z_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: qcom: msm8226: Add blsp_i2c6 function
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
> On GPIO22 and GPIO23 there is another I2C bus. Add the function for it.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm8226.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
