Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9015F75E4A2
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jul 2023 21:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGWTyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jul 2023 15:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjGWTyK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jul 2023 15:54:10 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA861A2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:54:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d124309864dso13772276.3
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690142049; x=1690746849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZi7468TmEqGbvwfshCak5drGfAiGWilfpY0t8frKx8=;
        b=YbU8ghtzDZunCrfBBFNOElDn8UxWFPR/dSjzoE/nGX8HFJEN4N2M2z+xEGZP6q3sqK
         5mXqS9oYYlS4tsZ08AOWdDvk7XMHa5Fve2qSOkNaRxXEjg0DivUNoRa0ioqerp2d1Mzr
         0NLPJ9Hm9gNwIERIE/vuo27z5l+K4QtPaWubFswrTFz2G+b6bW40ad/VYVZV8P4lNuKd
         GnLbfJRxbNHMVm9tYmrW4ptIuYr7PHP7I+0+BIGq/G5t1v2lduFl01e48f9lPsw/xJ4P
         NmVkaCXun+SWBlDbJsirKQDOczuXsimNAW3f9fah1IIZp33JjV/9EPnE5wchQY2fLXcO
         pRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690142049; x=1690746849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZi7468TmEqGbvwfshCak5drGfAiGWilfpY0t8frKx8=;
        b=IQ4J8mtNW8427YTEGiivbUCaqKMcf+Npg2J6kD3ClQHQjL9Q2G1UgKqLlLttrWkwjj
         RFuyjvLQ6y6ciLcdsC+pVPLpdEPqaV1pw0ah0HrmWafRhjMcJK0QTA4R4Dnz/vedzGHs
         2GFcQGGYrmAKw9O8qYQd6ETvyTILBmEK7fE/1sWEIgVYNXcax0HrAiaDpWgi+Fg0daci
         4SeSqxyfTpPJ2rbMg4WggT1fWy/OWV9lGtqLtBFpr+c2rakLIiU6l74S8raH5f3A7Jqs
         fRahmOwUDCyoPGTZXAoHjq6ylnuACY5JF16J588IUdd9+N+tHaY/xeA8o/YJwBJUqgYL
         kiHg==
X-Gm-Message-State: ABy/qLb3Fec2jIyDjfQiXD3b1GN6HUjzcUmxdRKnJZ7aUQC/k7NEtk65
        WYmZUjI+gThzG34C1bZqnLvL11resEusbRKSW4NDhnQj0mB/rbIc
X-Google-Smtp-Source: APBJJlHCrNKcdl6M0XijMLnAWdpY3ZIUf/mGSsTJSobtPuKk8YHnjonlzIno5tYiyor1jK3+RJp0FdjJibfBa2CtPSU=
X-Received: by 2002:a25:f50c:0:b0:ced:271:9508 with SMTP id
 a12-20020a25f50c000000b00ced02719508mr5279310ybe.52.1690142049012; Sun, 23
 Jul 2023 12:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230719110344.19983-1-quic_shazhuss@quicinc.com>
In-Reply-To: <20230719110344.19983-1-quic_shazhuss@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 23 Jul 2023 21:53:57 +0200
Message-ID: <CACRpkdY1S9fJxp039LwwWRP_8ASJQ8RyELKdN0xLcpCSeN92HQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sa8775p-tlmm: add gpio
 function constant
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, bartosz.golaszewski@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2023 at 1:05=E2=80=AFPM Shazad Hussain
<quic_shazhuss@quicinc.com> wrote:

> Alternative function 'gpio' is not listed in the constants for pin
> configuration, so adding this constant to the list.
>
> Fixes: 9a2aaee23c79 ("dt-bindings: pinctrl: describe sa8775p-tlmm")
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>

Patch applied for fixes.

Yours,
Linus Walleij
