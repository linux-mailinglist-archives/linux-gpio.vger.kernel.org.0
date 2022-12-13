Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A85D64BD0A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 20:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbiLMTRc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 14:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236753AbiLMTRS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 14:17:18 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E67E120A8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 11:17:17 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id ay42so2567086uab.6
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 11:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOy4uF5mwrb4slUczsFCBnv0U6Uuy59EM0w8h3JKl7w=;
        b=PWVcbnT1Fo2545SxX5cvzCRRWewws1UobRpt0HqiVvdhMiM3J1KCdE9/BJW9e+ixmy
         b1Wv2yHdcWUzJgrIy79FFFXPUn25QOBI1oskpDCnKK3nPVJmg9IjW54H61PuAjTwGE4c
         c93GHV4eNo846j86A1kRMi6YpO5UIUv4pwzDr0eYbW1u6wJ5+Lf+v7j/A/v3h69UNDJN
         d0frHeKtg5pn03JJT+RQgTTGrvIiOpiaVQHuGjxppAJXU1vSHwPKggtHC5LuqGwCa1Ia
         9QtqKZE+pbI8aYJyS+QIjBJ2JW87POvM7XI9N/KQX5Rf8PXjroulFPdlFc3d02usQR6i
         ltkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOy4uF5mwrb4slUczsFCBnv0U6Uuy59EM0w8h3JKl7w=;
        b=C7WuBDgWOYcWm8anfTpCLt8bplTPg1MYAn0MuYbfnSXflFaBKKUIAtJtvAPoUlT0JR
         py4vqyyCnCTHmZbAX9BRkO1vBToA1XkjBklYyBk7j69pDdJGAUofo93B8tkJfbzuXhDb
         uKHbW7aBByHnXJt5vRj3HB5xp5L64sFuNBLraH4mxUMiWQNaq3GPgW87ThRIXpq5fPxW
         CWCzpsL9KuHhEQXo1H7dIl2ggh5KfJEubMaGV4+ZhE2yCyU5sQhKAXd5bllyD36qeRn4
         gqQDPbArNhWfhnFM0EZUzo0FEKJuewTA3sHsWEI7yFAaucNbE8uC8NeGAJISaAsBkpVp
         qc/A==
X-Gm-Message-State: ANoB5pmvhhV7pGPukzjok8C+fXL5QZsFxu3yhAsJPE0DDseFeuNfZDZv
        C0KgZTYE+WDzFyTcAuRda1XhqM2gK7xuScbV4QE=
X-Google-Smtp-Source: AA0mqf5zHOuLS4E7TjXhlSP5BSABzy47t1rvE32DNvbrbVuicDgeuO16tfmK5HfJNUfznaGUS8V1MoQar7LLRBJjdv8=
X-Received: by 2002:a05:6130:a8:b0:419:aad1:6d31 with SMTP id
 x40-20020a05613000a800b00419aad16d31mr14886157uaf.99.1670959036369; Tue, 13
 Dec 2022 11:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20221212220457.3777685-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221212220457.3777685-1-u.kleine-koenig@pengutronix.de>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Tue, 13 Dec 2022 20:17:05 +0100
Message-ID: <CABgxDoL9PqviUPZ0177ay=WK1A9eQK=AtZxuwF82C_FtLB-DDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: Drop empty platform remove function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Daniel Palmer <daniel@thingy.jp>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Le lun. 12 d=C3=A9c. 2022 =C3=A0 23:05, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> a =C3=A9crit :
>
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Good catch,

Reviewed-by: Romain Perier <romain.perier@gmail.com>


Regards,
