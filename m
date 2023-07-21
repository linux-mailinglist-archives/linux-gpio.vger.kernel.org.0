Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DD675D5BA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 22:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjGUU2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 16:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjGUU1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 16:27:50 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B19B3A84
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 13:27:20 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5636ab8240cso1288920eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689971237; x=1690576037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xPDzzCzi/QN7xILesfa0mVBVsGJvBpLORXGzKhvY7c=;
        b=4XmoJAYz55NB/L3U+DEUVJ9ui979+6Vz0rqBHHDkliqQXOMi6F+/ITB9aD9iN37wqO
         BgdGLtJssmT2r2CCaMdB6vTrlXmgl7CEI5eFL8Iy5qkECyULhvyVXE0OLtlJLWTWLWVe
         ujy4f/mAiGRut+DHYbvmdkcQlKKfluhe809jNINb8G6MffFgabAZ4L8IZbqwDIs/Dzml
         mrPigKZ7ueMy+J2wvjE1cevFAOpAnDkQ13SDfoATpvTQsVGhjDoy67xsuJDQ95pHpt0i
         9bZdbaLpFIDoRxE4Uk1HMABabIBI7CYqt4kN1YtFNOWaLkAec3SHAFyTZ54eD0gzUJSK
         atNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689971237; x=1690576037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xPDzzCzi/QN7xILesfa0mVBVsGJvBpLORXGzKhvY7c=;
        b=DcdzgI/EyYJZUd4IRIFomKfkm+zYR7CXmYdrvAdxONmZYjQQi7ufpQprqyOQmTuhDW
         B4f7KewB2s5MyVO49LloLerDBp5bN/f0wri8Md4Pzcwxh1rHRPtpUpaqz4Rya+SP16NP
         Ew+Ru20rc3SmTY+YjiZl7nP11Nk4xsMYw0VCowZ8hUc2ozOvy6dvY24VQW9Paz0vtaYb
         K4gxfChUB8o7o5v7UUZsH6VxDccRg8ulDjuOVewadRa86fkzrGoX3TtyUmoAXzLBXSdL
         6iSUGhvjCZa2MxsCoz7zkQUHdY5w4d4lsLKQlmpzXGWK/gkPj8qysgvb8pwTWeZufDx/
         gTvA==
X-Gm-Message-State: ABy/qLYAloeAarY8adhJSeqD86SQVceJQL+qOJ3+ArYMoNzojupzr/OG
        Y0PjCRFtlAuOppiaeZdDPz2J9Sh8+2sllQ6MdMrBFg==
X-Google-Smtp-Source: APBJJlFV1pSwvieqS1OgnGFs6EJa3OMX3Q/AZhNSCm23Jd0179q/7NNdnOaSTeQWwXZbKc15/fFyeSnhcfBgqT1xvfc=
X-Received: by 2002:a05:6870:ac2b:b0:1ba:c3a2:fb66 with SMTP id
 kw43-20020a056870ac2b00b001bac3a2fb66mr3041987oab.5.1689971236868; Fri, 21
 Jul 2023 13:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <1689934361-32642-1-git-send-email-quic_srichara@quicinc.com>
In-Reply-To: <1689934361-32642-1-git-send-email-quic_srichara@quicinc.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Jul 2023 13:27:05 -0700
Message-ID: <CAKwvOdmYC6WuapBkD+s6wYCBaUdiJxiLXwayoubTF0WCpdBoMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove the unused _groups variable build warning
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, quic_varada@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 21, 2023 at 3:13=E2=80=AFAM Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:
>
> When building with clang toolchain and arm64-randconfig-r015-20230712
> kernel test robot reports the below warning.
>
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused variable =
'_groups' [-Wunused-const-variable]
>    static const char * const _groups[] =3D {
>                              ^
>    1 warning generated.
>
>      static const char * const _groups[] =3D {
>              "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6=
", "gpio7",
>              "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "g=
pio14",
>              "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", =
"gpio21",
>              "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", =
"gpio28",
>              "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", =
"gpio35",
>              "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", =
"gpio42",
>              "gpio43", "gpio44", "gpio45", "gpio46",
>    };
>
> Fixing it by removing the variable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307120814.vWPY6URk-lkp@i=
ntel.com/
> Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qco=
m/pinctrl-ipq5018.c
> index ed58f75..e2951f8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> @@ -241,16 +241,6 @@ static const char * const atest_char_groups[] =3D {
>         "gpio0", "gpio1", "gpio2", "gpio3", "gpio37",
>  };
>
> -static const char * const _groups[] =3D {
> -       "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "g=
pio7",
> -       "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14=
",
> -       "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio=
21",
> -       "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio=
28",
> -       "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio=
35",
> -       "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio=
42",
> -       "gpio43", "gpio44", "gpio45", "gpio46",
> -};
> -
>  static const char * const wci_txd_groups[] =3D {
>         "gpio0", "gpio1", "gpio2", "gpio3",
>         "gpio42", "gpio43", "gpio44", "gpio45",
> --
> 2.7.4
>
>


--=20
Thanks,
~Nick Desaulniers
