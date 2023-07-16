Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2631754DB4
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jul 2023 09:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjGPHmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jul 2023 03:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGPHmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jul 2023 03:42:54 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD8B1A1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 00:42:52 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-579ef51428eso36118867b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689493372; x=1692085372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGyQgy1tt1PDmgJTMhtwwTX/XIugZRQbuHruVB84HcQ=;
        b=CGsnTkxbqszhuNrcGYQ9Op7fDz9S4b26u1cpKXOssfX25p6PhYy+r+iQ0cJQ94EV1p
         EnG2cepNfG7Mp+4strlI9XDsXNUArR/xFaA2ECSCdb9Qv1oANkIhsZkNdWNEhfInxaaG
         T7btLQ0Lud9dgTvP530VuSj+ZIiska6fXAzzVuUdGqAViyqrtTH7Lwp/YMtNuEbAksRY
         ufVjlfvYw9idpRdjAQ11o3PSGbgmJD0Tmh+bxJk1GH6cK5ifURCPI0eCVQS7Mnl5WKKW
         rCumTa9Fvbm4Kqg7edj5apnu9o3P8f4YIdt3tvQ36S4hOlwi0Q7rFwiVeIe9ztYrWRcR
         RQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689493372; x=1692085372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGyQgy1tt1PDmgJTMhtwwTX/XIugZRQbuHruVB84HcQ=;
        b=aHqjA0jXJfLGA0CskFTCRifLTN+zubyj2v+B4xtayHIq327K56avG3unj6R6YeyN6V
         SSGDMKruPAZpaZADOdg8PKdcqQ0IPyY9TF4JtHQCHObKTX1Wzve9O59Zga56OBZAiBab
         3Lxes4uPOAKQanWwEjbki/PkLgpq8aUSNbcwv6ljuFrUSb8ZCI9zm3QOSvKcqXQeK7Lu
         HlFAo3yIkHf3GqvvTg4uWphBnNRcescnAaCoFYqtFu1nhDSE5dcFnavEuprV0tbt84Un
         QQLHKyJ9BiC5wyWlxjA0zuKvygdkSBI7HM4fvUe1vFe6TgvTnuKtmziHFpYtfyUc/GYu
         LcSA==
X-Gm-Message-State: ABy/qLZdeKiBV8sxgpU3+psS6xMXcWIs3AEBeA0ZYKWqREE78jbQERIU
        yEcDMGvUFyE9fbwUZmX0hk2AVXb4KqlLAQN03vdS+Q==
X-Google-Smtp-Source: APBJJlEW5B0juVcELZQK6Tyys64psq8irbw1fqknZA/Oy+I+46N+O2H/Yf67kYDl0aLsROsGMQQDCtqCMiPrIKnsWqw=
X-Received: by 2002:a0d:ca91:0:b0:56f:ff55:2b7d with SMTP id
 m139-20020a0dca91000000b0056fff552b7dmr11520910ywd.17.1689493371826; Sun, 16
 Jul 2023 00:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230306211237.14876-1-asmaa@nvidia.com>
In-Reply-To: <20230306211237.14876-1-asmaa@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jul 2023 09:42:40 +0200
Message-ID: <CACRpkdZoVo-6BMYcuike2eC85ZGpP93_4WQVLTfjRAa1ho5xhg@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mmio: handle "ngpios" properly in bgpio_init()
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023 at 10:12=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:

> bgpio_init() uses "sz" argument to populate ngpio, which is not
> accurate. Instead, read the "ngpios" property from the DT and if it
> doesn't exist, use the "sz" argument. With this change, drivers no
> longer need to overwrite the ngpio variable after calling bgpio_init().
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
