Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583C170B687
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 09:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbjEVH26 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 03:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbjEVH2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 03:28:47 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8033BB5
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:28:37 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-561a33b6d63so75756667b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684740516; x=1687332516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVUES5gprWy9hWLjZRgO1AU9wP0G35/UkxWCBnTGLek=;
        b=jKwmnkFDmZ6Y6AIP96LeOggu3SlWQaTdSPBkIMCM/oQb9XmhryXnwL4Xx0af7JzOoI
         VbJfqpt+vpSjsYYUSZqN2iG0lZuc1cQ+aQrdvluUeS//0G6sMxcn+JvQk5vjPI23CcpY
         h/FPWU1OSETd5AsGHtJmfX2IVaa+7LZg+WRzZ/sZsbo1uS3gWsuIt1QTL+TxrVQNUAv7
         MaAi3vY/mns082UbDxvxx9/so10EiCJXOp9T8zN02fc1Nb+srbhcE4bCywpKKFqHLZ1c
         MVJIjDoNNAnknuVZikCQLjEgAspGSRakQMehOV2PGgcFqrStiuTffdxR5S0NssZxXOsk
         AJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684740516; x=1687332516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVUES5gprWy9hWLjZRgO1AU9wP0G35/UkxWCBnTGLek=;
        b=F/0BqbxbA4lN6N9H1jnuaT7ihzgGXMy5n8z7fK7xe+9tebb5Y42OVQbGIJAfc0u9TK
         Bck+Yw3HpBqqxoPPmgH7rmPwoacZjB+fVt4rkshR0ylIaGeiCQWaB4lCvR+Vv4D1wnfd
         U45U5m/Ojq1e1RWLzUEczqPJJIkP/kAWbH437tJFf8MqSOrba4z2gUKUtzfq9SoX9RyD
         C5+203bNd1DExE6o5DvC4lCCXOIWC9qI04NFI7VsDgGrqAckfBm03nxefcMyj8N6aedY
         vEP3l74FLS/n3vR9lg2uqZamixx99332Wm9ihVRk4cLjFcZPlMnVgw2n/G0xQjnYy4qK
         2hGA==
X-Gm-Message-State: AC+VfDwnskiKDngBJVOXJlP5gHKlWf0mhTpAu0Et6cUcyO5d4fpv+e6X
        JFJZrAtvtxr9FOculRXW+221dk4fkO/joN4LDfWJZA==
X-Google-Smtp-Source: ACHHUZ4ic+uWFu3mzwmmQMWZDypcG+im4NFdthUl64HKaCkIQ1tTp/vWNJKpqvYCkfkmFIVqeKmjN3dwsgcs6+7URIA=
X-Received: by 2002:a81:834d:0:b0:561:b595:100e with SMTP id
 t74-20020a81834d000000b00561b595100emr9579311ywf.37.1684740516696; Mon, 22
 May 2023 00:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230515092515.180920-1-brgl@bgdev.pl>
In-Reply-To: <20230515092515.180920-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 09:28:25 +0200
Message-ID: <CACRpkdb1qnngV0orA=+BXgg-jYQjs5Ch_tUN1dzD8PcddhHQ4A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sa8775p: add the wakeirq map
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 15, 2023 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The SA8775P TLMM driver is missing the GPIO-to-wakeup-pin mapping. This
> adds it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - fix the 30->200 mapping

Patch applied!

Yours,
Linus Walleij
