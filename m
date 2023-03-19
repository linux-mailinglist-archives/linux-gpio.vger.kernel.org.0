Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4616C0529
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 22:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjCSVDS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 17:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjCSVDQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 17:03:16 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057E71EBDE
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:02:52 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id e71so10892866ybc.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbV6Bh/cNsY2Io1y10SkZjIuZK4TmLVqW2b5h9GtPaE=;
        b=VXyRZOPszvrTh2/++fTwBNasGeYcc1YN2g1XQGu+wGihL5XAh1HWL6miXKYetReFlt
         e+mgaizYtW5gS157vS8n93LRFEj2Ah3ZbZoohAjU3TNPEaCLDcYiFuN05UhBOzXV30mJ
         XRHuBT4ATsajKjivNpLh5PNHcBKcChZ2qjDjwijKtZpHIKVSMiQFjwD7zqt8phrj6qgu
         gcv6ijOUMWWHFH+Mh93Ozd0dBP2TLL25g2uZuPkfck9I5o9Cdwg5JbKZ2SJx0zzV9QUY
         qjnebF/7bIKXS3COEBYQSb2JOaexBEQb1wVDPDNNUoZ1Y5vtm5wVUKNai6hCRWcruo1I
         uxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbV6Bh/cNsY2Io1y10SkZjIuZK4TmLVqW2b5h9GtPaE=;
        b=cVj5YEHMKo3f/TTtjHM8WMLeNGjlgKCC2ZZZ6uEHo8/A+3CS6uLNf5JuafBFyLbBQJ
         2WG7b65pwDswTTgJWGOjbYlbp7Jsc3Y6aFzbYzPnDBFgyuwUySlEl1rQHHvJtbI3eA3S
         MCfkBNbli1ctlMjQoLNRS3UkyRY/FLjrGgV7d7WE31bbN0PhAzp31nyLR0dE7WfvqoBD
         qr14HCx8u7V225friyRZkJd+pYfhCgCAx+44aZbOvV6Zjm36ZL7IdlR+KRhsuki8CW4n
         SVj6wBv2EwnwC2wZ8HBkZV5t0h68Ezhb+kkQY1NKpu2pe++28gFUeM+PHY4ZQJZ5S3Tp
         Njtg==
X-Gm-Message-State: AO0yUKURMxdNBD8eGhzVJvI2Ni22XpVjHjN1LQ4uInss3ZAr3rzMtNmh
        91KISToJFthR/g0DiCg/N+lQxVG6DdkZU6/yuHcDQA==
X-Google-Smtp-Source: AK7set9mxeFO57SGruCJH6C1TZj973V2SQLNunHNOaC44Y5XLUJPP+RqdyW12BliuWYUYiE6coMhTxlkWHzd16pXggk=
X-Received: by 2002:a05:6902:110e:b0:b26:47f3:6cb with SMTP id
 o14-20020a056902110e00b00b2647f306cbmr3231733ybu.4.1679259762548; Sun, 19 Mar
 2023 14:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230316072940.29137-1-quic_devipriy@quicinc.com> <20230316072940.29137-5-quic_devipriy@quicinc.com>
In-Reply-To: <20230316072940.29137-5-quic_devipriy@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:02:31 +0100
Message-ID: <CACRpkdZYOQ6JvQvg5gcUb1x+FOeTn-H5rOnK=8EgDBmZh9DYig@mail.gmail.com>
Subject: Re: [PATCH V9 4/6] pinctrl: qcom: Add IPQ9574 pinctrl driver
To:     Devi Priya <quic_devipriy@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, shawnguo@kernel.org, arnd@arndb.de,
        marcel.ziswiler@toradex.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 16, 2023 at 8:31=E2=80=AFAM Devi Priya <quic_devipriy@quicinc.c=
om> wrote:

> Add pinctrl definitions for the TLMM of IPQ9574
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V9:
>         - Added COMPILE_TEST for non-OF configurations in config PINCTRL_=
IPQ9574
>         - Unwrapped the lines for PINGROUP 34 & 62 in ipq9574_groups
>         - Removed the comma from terminator line in ipq9574_pinctrl_of_ma=
tch[] array
>         - Moved the MODULE_DEVICE_TABLE entry just below the array
>           ipq9574_pinctrl_of_match[]

Looks good to me but I would like Bjorns ACK on this patch before I merge i=
t
if possible.

Yours,
Linus Walleij
