Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7BA7BFDA5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbjJJNhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbjJJNhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:37:11 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD379CA
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:37:09 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7c08b7744so7754197b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945029; x=1697549829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNh+XmhVPTerk5uwE/utGWXHWHOIi1rlcpsDVDrPWHY=;
        b=zcy4aMXKDJqdHc8NcXKrkjoCY1Tz4Jkf2xI9SebwL6ZZK+kADaDdNJJMuNZhhkpZiU
         lKy60RZzKs8vUMrxTKU0ufL3G9jvs6YA35V5X/n+60adzkn7Oh0yg1lFIrqyerPCMnxE
         Fvj201TiaQP917+2cfJ1BurgonHjDBERmbnLBfdDFjBAoheq05liG7u+64Zw3KG7XtcV
         pMOn2OYuuo6rGP4NdRHOnF2rYxqa8Yxr0bCxu+ZuuuBjNReDhzmvcJYefjQnu8ZYpiGr
         5mRUgj1yVQR0UoZvzq/P/MGoZ3deOA86iLyLgj30MYfOXUs87UV6CJFWWQa5pj9oZZzs
         k0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945029; x=1697549829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNh+XmhVPTerk5uwE/utGWXHWHOIi1rlcpsDVDrPWHY=;
        b=SIS7OXQQMPTWJ1pF7JB7ZddyloOfxAnJAPdRZix+xIvi/4Q0vafuuOkqTszLBcKmrg
         pHlcQge2maJYBuCe876QyZh1WBTi2WLRNtmqSzrkF1GeGi+2AjgvGu4U4rrkM5mWmYbc
         Ig0qF0fYJlGuTdj5T0mqbqsJxwyj989bq9/r4COvcD85vWz8uqy3Ye4ghPgoCbaaokz/
         H2bB4VqcgW9aXXH2qdVB5oNz9XY1lMERwUj1S1bWCX7FpiQ5hUxhIgskEsdui17TBUaD
         Gg5AUB+B/G4C+aNZ5ZeQaGav6thTLqb/QDnAgcwabGcG4o0DBj6Of4wPyxN4Jx8ZGoMW
         dSNw==
X-Gm-Message-State: AOJu0Yx8a/YosUzflsAXH3h53wEBnM4tRCfpKqhrtL5DEset1WzV3f+I
        7lbPeFLIa8mDxc6OVQmyInB9duW+LisvOUAmpWIiTd4S7OVynbAJcIY=
X-Google-Smtp-Source: AGHT+IFIPInZ08SjPi9WObcyDEFgmRDtu6pDF3QbFY/fMYHfEtkL57uwfKfxeTZ2+Q3U4Tj2OsnZ7L36/M62b5swTfY=
X-Received: by 2002:a0d:d40f:0:b0:59b:fe46:82de with SMTP id
 w15-20020a0dd40f000000b0059bfe4682demr18601273ywd.18.1696945028868; Tue, 10
 Oct 2023 06:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-4-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:36:57 +0200
Message-ID: <CACRpkdaGC-XAh4cS2G0thXVLfOfbf582-B8k8rRkBzW2JeB9gQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] pinctrl: ti: ti-iodelay: Drop if block with always
 false condition
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Yangtao Li <frank.li@vivo.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:


> ti_iodelay_remove() is only called after ti_iodelay_probe() completed
> successfully. In this case platform_set_drvdata() was called with a
> non-NULL argument and so platform_get_drvdata() won't return NULL.
>
> Simplify by removing the if block with the always false condition.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
