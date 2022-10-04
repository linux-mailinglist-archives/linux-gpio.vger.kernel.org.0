Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DCD5F3D5F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiJDHiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiJDHiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:38:12 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606114D247
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:38:11 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-357208765adso86836737b3.12
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OSMuFVsbci918WMEsC7sFXDY5UEKrP97lF7jwpn3ZKY=;
        b=YUpCQLVh/ZbPEIM6MRSoBRL5dBKPIbED6Jc5x3rLs3i0ZeY74CIthfaKS89OvtzUbJ
         evJX0WkzNNEHZKx3NZthh7TCtRjKGZfSCXYj572FYJmnWLCNNPeQeE7e7OMHfDMBQgMH
         iFueADEecwzMszu4qHBUBbfJwnohw3RLekyz+y05PGT8cwVRuNJ9RE/n6ESVgncDkj34
         DQO7u+mzUTZEUzIypv9gUmKkzpMj+idrKkuLP9Z9/oo7YL2mVu2y1liXo7JWBPzSYBmb
         gV9oF+WusRD8KAjKLq5izmywBwapiXXrtq5jWYdQlfQRWuaGUB7LLR2d9yAN1L9IEckJ
         AeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OSMuFVsbci918WMEsC7sFXDY5UEKrP97lF7jwpn3ZKY=;
        b=L5RYOkimaHSAAfxHDTYuzFKI/qgLLkNMoKgX4TWyjSKubTfqXIEcYgFnSbIKrWJfY3
         D837HibZ65qLDEk0PHgXbYzi8ZiM7ifg2wpP1WYOblIjCMnK9J6auPWnG30/33DA21yc
         TCCFKPmeURQe5dtuf4D1WZGKeqkjjYxprt90YFnDu/W+o+YXYWiHQqb4qwFFLkNNnfS9
         Gyq+X/z4FSDPL442o01Avm68vEUFAxMpIiqveMo46zJW4zNH1Y58KKns9rwhlRFp5sIx
         kFca2MCthQemh42k5C5E6e74nXhJwk3NphrDlDibCmsEQXJgr1CBkwGjYbxCp+w4NCl9
         7wsg==
X-Gm-Message-State: ACrzQf1VPW93+z/ukTfk3hjZyoLenBkT55ZAMI9uLXX+IasDVgSO4V0F
        mezIqLhycw+2uGkE/O8G1WA6Fcaj1aOddA9kYtQLlsCBUYo=
X-Google-Smtp-Source: AMsMyM5j+XEoX2xOKukGTbIUyxbRXejrMOAtr1bbMRrNN55E8u5O5TLP8bVa8lmMZpIgATy9l002URxzu/ufb7quNyI=
X-Received: by 2002:a0d:f685:0:b0:343:bd3d:80b2 with SMTP id
 g127-20020a0df685000000b00343bd3d80b2mr23377204ywf.485.1664869090657; Tue, 04
 Oct 2022 00:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220925112103.148836-1-krzysztof.kozlowski@linaro.org>
 <08E290AD-C842-4BF2-9C57-2CE59A4C5D88@linaro.org> <441153f6-26ee-cbb2-fe42-101de91952c5@linaro.org>
In-Reply-To: <441153f6-26ee-cbb2-fe42-101de91952c5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Oct 2022 10:37:59 +0300
Message-ID: <CAA8EJpouyuCn5Kz-3RgRJPd+K1sWwtidz1L_mXY_U2AFQq8oOg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: restrict drivers per ARM/ARM64
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 25 Sept 2022 at 14:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/09/2022 13:43, Dmitry Baryshkov wrote:
> >
> >
> > On 25 September 2022 14:21:03 GMT+03:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >> There is no point to allow selecting pin-controller drivers for Qualcomm
> >> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
> >> kernel configuration more difficult as many do not remember the Qualcomm
> >> SoCs.  There won't be a single image for ARMv7 and ARMv8/9 SoCs, so no
> >> features/options are lost.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > I haven't checked which restrictions apply to msm8916 at this moment, but it might be worth adding 'depends on ARM || ARM64 || COMPILE_TEST'
>
> This is limited by ARCH_QCOM (top-level if in the file), so I am not
> sure what would be benefits.

I thought that it might be added to represent the fact that this is
not an omission, but a special case which can be used by both 32-bit
and 64-bit archs.

-- 
With best wishes
Dmitry
