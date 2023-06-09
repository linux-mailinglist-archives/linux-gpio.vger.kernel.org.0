Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D5272909E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237546AbjFIHM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbjFIHMz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:12:55 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BCB273A
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:12:54 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-ba8a0500f4aso1506486276.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686294773; x=1688886773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOdL2lGb6aFJoxngFJO8rDJBGs9cE+jZ/OWSPKTxy6o=;
        b=VhSEBKDtLGZjfu6YNqe3sJBofBsTJT18H4sAeU2Nsu3UB19JtAyTCLY039TFVH+kBo
         aUvFkNBqS3B4J//TvcyWMhVzu5NAYzBHielLIBWWMYXlUBfaAkxtNC/mInFTh3BpuASg
         ppo+nbLK2zS2pHbnU+zKRBQN3VnN1/jwkBkJSjv2TevmGXzgZ2g+3409AvRv54fukh6W
         tg56eYj7EKIgxwfIU3847dNJMw402/WI1hf7+3jJypfewDXuI7sqMHbQ88ZmpwbyRmg6
         xB+SRns47vcBInWz75lJ0yu3YjPt+V+EDcJh4QoRn7Xpa87+nYZEWa4Br50IL+3AORQm
         2byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686294773; x=1688886773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOdL2lGb6aFJoxngFJO8rDJBGs9cE+jZ/OWSPKTxy6o=;
        b=ChKcdY9W3XtlDhr6Fo01BWlZjyEIAOuMB9H0JekI0rAAq2REvTv9wfTzzgbWQ9pfZ9
         MIiV+cuhTdzCW/jFGNzJtkgwkNguYUBrSF1UkN5fvDW5zqRDO2tVds1bF2y0JNKhW3sA
         6lqXX550MS9+zimEiEdPeucbZHPSKp8fJ47aRGeWq9CIs3LbiowoxsMC+WnWouqvhw8Y
         TPVezNRdI1/v8MDUAl/4cDDrNWgo9uxsUYnx0RWJdtClK4iYXGDr1xhTXP28oKc/gBZT
         ymIWvzxnA33pTK/GlBmCo+74eQ31FK9/nSRW2O293FY4EPb3WxXSNOFEes3dm1DKyB39
         Xh2A==
X-Gm-Message-State: AC+VfDwKArw0lZHeB6vyf0TpyCyCCxyLVRkYxBTGa3dMoTno75rBoQhJ
        WuAnaHnRF25hNUy7z6qyNzSL5KhhQR92eFozGBOMXA==
X-Google-Smtp-Source: ACHHUZ7m4zsOdujVqse3Vxt8hKwM9oH1SnNzEYlcCrbGoWjGiW6zoEDdGhFWqndy/X0cSZFzO6wXY+aLEzLzsSS7WhM=
X-Received: by 2002:a25:f608:0:b0:ba8:6766:3607 with SMTP id
 t8-20020a25f608000000b00ba867663607mr413300ybd.48.1686294773397; Fri, 09 Jun
 2023 00:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:12:42 +0200
Message-ID: <CACRpkdZaj6FWLszvBid3C9LwVpiwhK=WsuJrcbMgppx80NbgjA@mail.gmail.com>
Subject: Re: [PATCH 1/8] pinctrl: qcom: qdf2xxx: drop ACPI_PTR
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
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

On Thu, Jun 1, 2023 at 5:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Driver can bind only via ACPI matching and acpi_device_id is there
> unconditionally, so drop useless ACPI_PTR() macro.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patches applied!

I had to manually update patch 7/8 to account for the IPQ5018 driver that
I just applied, but I think I figured it out, check the result!

Yours,
Linus Walleij
