Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C749767E258
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 11:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjA0K5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 05:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjA0K5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 05:57:32 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C40A5EF
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 02:57:29 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id j5so4239347pjn.5
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 02:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0aTkPI+ubuKbzX2JNdC/dWfilw1TCJxuUE5W+uV+LEs=;
        b=NmJUlnhgEI4JeSVj0TYtQdVtMz6iwCd816KUbIUK6n58sX6rOUMJNIZ/B/VfNCPHWj
         PcxjhADWi3Ygbjwx3GY8ANbKNK3vk674UfY/vw6JIMF4luoDAzl7IR4Rplx2Z3Yg81AS
         yeXTUhKbqVvuQr4vECpR0xNTMr9/1NVs/umGPV7IsgwaEUbrwcE2wbB9fEKTvRB1DXaZ
         HMFhwB0sL3n6WJR7tdLP4DsCDbPgBt7wE8bHawjfl5Tb1oYzw6L9ks5FM4CqjKRgAFTu
         H0ZXjcwvAG6B9TL3HlcU65eMOd6QQxjTd1bci3cUeJhn1lyCUoqrnZMAeerOglBKaJ4F
         5XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aTkPI+ubuKbzX2JNdC/dWfilw1TCJxuUE5W+uV+LEs=;
        b=ZpkV01aUWNvCtFbSnARXwTbcmlUYxEkIA4AS6fcdJbPG57F5cktAeRqjbxn72J679m
         25GU8ivOlW89F9KgiaruGFbq48arJnn4DXOUjYRgMUOhWrXELHDWFPhb+h0vEFNFNQj6
         IVAjMI/hM0fSs/qw1QLjdXFDCzSO+PQcFfqaqKix6/k+P1JpjolbHKmV8t1w6gkaplEy
         fJkSo3dLcVkS+lh3cEJxbca1AvAfBMw5wY4MLqOEW7j1p1UbTqeC8Ma5B/MJ1CPT8cZO
         bY9RL9CQfktuy4cr62LFRmf9ZWWuxwp6D+CTfgF43QURph5uYduIskuDSZLm6wakUKI2
         kpKA==
X-Gm-Message-State: AFqh2koZBAU6fIjsfwLUF3sW3iaigg3RvNIkWIomEFaUOEgQbeAwc98a
        HX9U8HMCdghzso6JEVoQMkgeIxF4K7ChEIsvaETSlg==
X-Google-Smtp-Source: AMrXdXvnzz3ZpnHx/XmGCd35q5P+zooYE94/XE7raSNlvHYRmWHeCfHv0OlsELoyqCIE6l7P5JjHb2a3omXLwYpk91o=
X-Received: by 2002:a17:90a:5102:b0:229:f71e:fe3 with SMTP id
 t2-20020a17090a510200b00229f71e0fe3mr3758143pjh.47.1674817049307; Fri, 27 Jan
 2023 02:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124141541.8290-1-quic_devipriy@quicinc.com> <20230124141541.8290-7-quic_devipriy@quicinc.com>
In-Reply-To: <20230124141541.8290-7-quic_devipriy@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 27 Jan 2023 11:56:53 +0100
Message-ID: <CAPDyKFqjiXp28M4uaBqvdsdwy_gtpV_K-nAJgZQJyQir-7orCA@mail.gmail.com>
Subject: Re: [PATCH V1 6/8] dt-bindings: mmc: sdhci-msm: Document the IPQ9574 compatible
To:     devi priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, shawnguo@kernel.org, arnd@arndb.de,
        marcel.ziswiler@toradex.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org, tdas@codeaurora.org,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Jan 2023 at 15:17, devi priya <quic_devipriy@quicinc.com> wrote:
>
> Document the compatible for SDHCI on IPQ9574.
>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 6b89238f0565..5af61789a8c2 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
>        - items:
>            - enum:
> +              - qcom,ipq9574-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
> --
> 2.17.1
>
