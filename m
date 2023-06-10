Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B3F72AE36
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 21:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjFJTAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Jun 2023 15:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjFJTAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Jun 2023 15:00:51 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B93B30F8
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jun 2023 12:00:50 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bc405d9682cso545109276.0
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jun 2023 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686423650; x=1689015650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8/E9wX+miAxIjX7VGiK9XYMKNABxMlE+uzNmSY8rLg=;
        b=UjnyItXQr6UJwHms6PzMXZa5EY2o0Ki8lWb1C8IkH3z3K45v5XHaKwBQdftREgZhdP
         /LaV0YmSVFfcsZzchJfNeT8442hVBbnX04wrveAmuOQZm6gAHemT7BRv3DnpO3K9wRvt
         hXLx0PKbHnqd3BMRsyMLxigpgiYk9oWZ9D+mzd+DlbfOarSat7gMyPwlb1YUavfQiBtu
         GHmDKroJ0pOZk4mh3ZPqpyIBNT52TFnVFw9LJNHr43jWHXWLjv6j5CXpQ4mHQgYQ57lm
         /5PAtJhYdgcrPsozoQUPiUOmrY9JZPvrmFXEDQ+/zCbpC8UQBm8jW1YmKwTv3UN7GSc2
         gqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686423650; x=1689015650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8/E9wX+miAxIjX7VGiK9XYMKNABxMlE+uzNmSY8rLg=;
        b=aOoAmBD4ahrhY5Gh30bOiAvTPu7AT41kOtiSi89QOdcelNwAMTgmZB87YraH74Bwb7
         6aijHfSPAhCdkFJaY8lBrbCUyJkTT3fhv7TZPu1gpWyO6sJ7ymOwIJ92skaQYda8L415
         rOA/CpZ8IN/1CeW5F2LB4+N/72GNk2vdvyUpkZKjAUd/bGPbEFivPZoZVOsIDjpMrrwM
         4z3ShYGd0Fb+Fi728KGLLz0w9hiradj/mksC9y6BH24IxyfIcII0T0Zz9oa/rTjFeZVq
         udk9qA/X0gHIw9r7fIi6/C72GJbv4odDAykKmOKLhHKR+DlJBMHc3p/RTh0x456oOh+L
         CS3A==
X-Gm-Message-State: AC+VfDzLEqoWopl/B7OHdo46MmdZSN8sFLtPgly0gJ617X+zN4lcSU0x
        4uB0wbVdBT4AIRkehpwTXTgVclY0JlIFoN0XX0xmtq32CyWGJ88/
X-Google-Smtp-Source: ACHHUZ4blQAMon2QjkEmaNH0vRhxjA+IH405hPV/oYq0UYG78kLVvnUO4a+2Aah6jH/yAkYOrjNtcLHlTCvlKvGr6Cc=
X-Received: by 2002:a81:6dcc:0:b0:561:dd6a:b84 with SMTP id
 i195-20020a816dcc000000b00561dd6a0b84mr4621483ywc.26.1686423649748; Sat, 10
 Jun 2023 12:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230610091258.4903-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230610091258.4903-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Jun 2023 21:00:37 +0200
Message-ID: <CACRpkdZz_PasrWJAMfA9pf_OzyCFmKrk3i9K_CctTPwHSVsCLg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: dt-bindings: qcom: for v6.5
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 10, 2023 at 11:13=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
(...)
> for you to fetch changes up to 647c16ac7b15fc8fe6ab679690ac2ffe7c53abd3:
>
>   dt-bindings: pinctrl: qcom,sm7150-tlmm: simplify with unevaluatedProper=
ties (2023-05-12 18:23:51 +0200)

Pulled in, thanks! Great work as usual.

Yours,
Linus Walleij
