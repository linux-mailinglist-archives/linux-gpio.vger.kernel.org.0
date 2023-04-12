Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DCD6DF4FA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Apr 2023 14:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjDLMWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Apr 2023 08:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjDLMWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Apr 2023 08:22:05 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A5C30F5
        for <linux-gpio@vger.kernel.org>; Wed, 12 Apr 2023 05:22:04 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54c0c86a436so335144847b3.6
        for <linux-gpio@vger.kernel.org>; Wed, 12 Apr 2023 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681302123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRwIU1nvje0w0MPNeCJ53SnkupaFca63q36KxA4RSoo=;
        b=AZRCj/Aw/LiaTxBZwUURrDKlq+avl5jdMbzccd3YtlPN/Mv6wcsUubJwKxCFHZ2FeE
         R5PXL/FaXg8KlNrhYFoKhCZMSSl1ckSx8R+hNygCwEEtgRhJ2jszCneSWj/UhPcjmx5Z
         UNkhGi+mLk4WpyFZHo76agmFnnQBs5XVfdvXQ+PWtmrLPBfDt6CGMvZ8+2Az7xWYlJoC
         bobG8xH6OXEeY5ecWXRbOVNH4igoKkFQ90Q0cvF6Mms3Cj2lcGHdE/YL9zDeFp62MW+s
         Jr3eOckFetgp2wGEgCCvVldmkEGwzri1+EtsZNLQDhDAo2JNkIOfp68kG2sR74PxdZ9y
         819A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRwIU1nvje0w0MPNeCJ53SnkupaFca63q36KxA4RSoo=;
        b=xGjMFnTSSDp+td6GIQ0dIteFPp4SFi8HTRmTfLCodFqofNMMcXtFkRehb4FgPld+BA
         +dpP0CgN1A4UcLdH4XdeWerwO1k/g2LdFi0Zi0uhEutSRtsNE18p7kMsWdv85IdJbOVB
         VsCSaLaG7QTVNxnu45FRIhaVKFfL+Iak8ItvCeeZxNCvaer03NA5Wdy6VxRYqSWU27H3
         r+7EnW5Rs14Q3Bq4xbn2Y+H7+5zBUQbN18+uwmR2i6jqZZE8PTqIvjnX9uWkrzPe159n
         Y5lFBMHEMfqodfK71cpyzeNirbKFSfszTkMElNESge2TMZssVr/kFwLHYAI6gv7umTdF
         HfdQ==
X-Gm-Message-State: AAQBX9cV86Qo2unUxBQ0oRZOzGQapoHlEg5VYR2rWGHpnpyKb/jvgerT
        piodakLAzOfBxuPpcm2xdqKkdc/BI+QBK0n2GI2tLw==
X-Google-Smtp-Source: AKy350bO605bF7CmPj2jht5i/1RKefj2ZH1kk06s8caYQ2xMlwzktcBIiIVTXSBlPqu1bzWAe40DL6TQvkae11EoClo=
X-Received: by 2002:a05:690c:730:b0:54f:899f:890f with SMTP id
 bt16-20020a05690c073000b0054f899f890fmr1890721ywb.9.1681302123341; Wed, 12
 Apr 2023 05:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230412114828.64043-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412114828.64043-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Apr 2023 14:21:52 +0200
Message-ID: <CACRpkdY_ueo57PteZcOznhD7jN+hg+_Qk_9jruG8D5Z4goo=uQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: dt-bindings: qcom: unevaluatedProperties
 cleanup for v6.4
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 12, 2023 at 1:48=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/=
qcom-pinctrl-6.4
>
> for you to fetch changes up to 152674ab2e98bfd8677117314a77d223a2a1bedf:
>
>   dt-bindings: pinctrl: qcom,sm8550-tlmm: simplify with unevaluatedProper=
ties (2023-04-12 10:59:11 +0200)

Pulled into the pinctrl devel branch for v6.4!

Great work as always, thanks!
Linus Walleij
