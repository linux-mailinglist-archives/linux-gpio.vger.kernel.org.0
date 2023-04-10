Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E2E6DCCEF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Apr 2023 23:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjDJV5l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Apr 2023 17:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjDJV5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Apr 2023 17:57:41 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E395919B7
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 14:57:39 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id u13so6220740ybu.5
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 14:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681163859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCGeM9b3t/JlZVlaGlzCyCy8tbO7zF3BEdkkpU0Fp2Y=;
        b=lP9NBenYJ+OpiUm+dN5AioyDP8TxMaM6vBGztQsuAPeBBXCohqu1vZyBytn+TQ08l3
         KL+czFQWcK3DkvDYLxmqLVwc/TQDxPmaXAvyGbAjOva3B7UO4DZMUPixFFRKTl9ADyLE
         rCEikZRhyNrP6EXXkGo5B9TsC6AE1cv8LdQzsAuuALJ1TOr4mNgKV/xBdLJKV2dt51Tf
         fFyjfVIT3Y+rpvsfm66O8To8xGXCl3/PVNaT1KPUrQJ3I3hzQv/3kpWksAPovDYfyfaB
         wwyiLruCq/JNEf6e7vz0t42OLGhl8ildFa9LS21jds8AGHg5mRzwgNVjkAaOyw64/lRZ
         kN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681163859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCGeM9b3t/JlZVlaGlzCyCy8tbO7zF3BEdkkpU0Fp2Y=;
        b=EvUFDxvkHMkd4T4bJyF08ZztEiRsU2lBSg4q95keA3FLrwrCZXJ9pMNlkiPJ6O84mY
         3cabCe7VB1w58/cYIvX6smG/vvpYo7Rl7Y5MlgGzDrBm0t9zBu49/bFO/Bws3cxaGlS0
         8N2c7rs9CaHIHYCVke47aI46rMx0EVcAeJ1gZg/zGoVfR9O+iLwuK2sU1mzO2jjBGcDO
         rhRU0JHujspVZpzCJJAmzYJxqRBHEpT1rwvNdRMHyJNE7DjIC3q2XioCZ5i8tbsbc8r+
         qLe9U7KDwx7fd0XOwqSwAQ4CJbhqglDNlcmQ+RlXkB9NMlh+Ac2sTeVn3YdoV1dWwQyZ
         Mvrg==
X-Gm-Message-State: AAQBX9cksrTPMaAaACI4TltBpUonbFaxsXjXiWHqgIL9IcgH6hssa5Bd
        5NgvN2CS/5kYVgs0SkPascPXvd01D8qtw5TpKRMCrw==
X-Google-Smtp-Source: AKy350YzVKSsgHsDuOVSIoLddP1feKF34fitMW3B8KiNbrs/JZe/tP+UBLJ57F6aoV+6t8ZWccL2XfgHOXVWpZDZ7OU=
X-Received: by 2002:a25:d141:0:b0:b75:8ac3:d5da with SMTP id
 i62-20020a25d141000000b00b758ac3d5damr3956546ybg.4.1681163859131; Mon, 10 Apr
 2023 14:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230407184546.161168-1-krzysztof.kozlowski@linaro.org> <574d3aa5-21f4-014a-8cc7-7549df59ff3c@linaro.org>
In-Reply-To: <574d3aa5-21f4-014a-8cc7-7549df59ff3c@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Apr 2023 23:57:27 +0200
Message-ID: <CACRpkdZ+MrEURcz8CQJvw0=q4aTGAaZ52cC=7ykak4N7GKnSxw@mail.gmail.com>
Subject: Re: [PATCH 01/40] dt-bindings: pinctrl: qcom,ipq5332-tlmm: simplify
 with unevaluatedProperties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 7, 2023 at 8:54=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 07/04/2023 20:45, Krzysztof Kozlowski wrote:
> > All Qualcomm SoC Top Level Mode Multiplexer pin controllers have simila=
r
> > capabilities regarding pin properties, thus we can just accept entire
> > set provided by qcom,tlmm-common.yaml schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
>
> Linus,
>
> If you prefer I can send all these to you in a pull after getting some ac=
ks.

That would be best, thanks!

Also the refactoring looks nice.

Yours,
Linus Walleij
