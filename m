Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C61F79791C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 19:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbjIGRCb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 13:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236600AbjIGRCZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 13:02:25 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BCB1FD4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 10:02:01 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c1f7f7151fso9139705ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106008; x=1694710808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=Ztfhws9E75EwdMPwoxuYkhad1012/S3nK8kDDDGDaAHsHpXfCxm1hRUa3NN+moiPPe
         6wOmrpg4x65t9okGCAQbMdGnN6wIca9uSV4FB1RG2BeXTuOmUBrwtPS1+pN5H6KK1Izc
         Rizc85QS98TGcJZzykAp5wgD1yPylHOL7Ga51Dfcp2joB4yHyBkjfy1IB+Smwyrz8bCQ
         0goRE2Ir6dis0BBRIdeObMesYn7xiiYaBKHsHb06ugCMZ2syFE2/YNa11N2YxmN5bZYt
         6IBI9ZbXQ3RuD6VNpBDKFgFfGYyPnDwMZfD58JvDMtO3nc4r3076z175Bu6vVzDketba
         fAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694106008; x=1694710808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=lZ2eSKHmjpftajAB32Gpg0VNeGvqSlZ8zBzB63ji5WRNV2xQnklAayMl9xC6VCrhmC
         SolTBQndmyhAof5iInQXcACxbv0j2kp96OG796s48PH7WVLAGVhUl93SeTOcT+nvKbH4
         yFsCBgF8KVwS+vdWrZ/8U+SKFO12/9jT1y3DYzp+eKpyool8+IcwWZCGzroCmv/Fnf7J
         czrx+nbOJul7rE+lAFFfZgLDwlLy8FfHn4JjdWkegQwXVqcQkLzX2LcG2eQdsyZi+F87
         0SouOgGwvN9zaTZhUHif+dkIrQ5uZLkv9Zt4KZW/h5bbOz4VkTGaw2+Or1B0gwz21Pki
         EI5Q==
X-Gm-Message-State: AOJu0YzJZ9qbQvPrWXLrBTB9sySpRcS6Bt6nY7791n7zSyyYJ9Ia8hee
        2iUyhBzn7BCcLGsU7sGOcTe8AuPQK8VMn1/dixK4ThUxlMdOI5bE
X-Google-Smtp-Source: AGHT+IF33BsQs6PXZBD6Yyx6MLxtC5D3dCLaevE9AUQBN2cYvO/VBix1ip+znuJz46jocHvadEET9qd1DQq8TKxIbhc=
X-Received: by 2002:a25:fc16:0:b0:d78:be:6f02 with SMTP id v22-20020a25fc16000000b00d7800be6f02mr17528083ybd.11.1694071503985;
 Thu, 07 Sep 2023 00:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-14-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-14-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:24:52 +0200
Message-ID: <CACRpkdZE9hMWNeY=J0LrGTO1=83L46z69V6b7BX=Q-vaM3kBAA@mail.gmail.com>
Subject: Re: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Using any of the GPIO interfaces using the global numberspace is
> deprecated. Make it clear in the comment.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split this off and send separately to Dipen.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
