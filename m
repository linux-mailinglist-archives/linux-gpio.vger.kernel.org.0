Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F74797933
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 19:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239894AbjIGRFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 13:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239915AbjIGRFs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 13:05:48 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A214135
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 10:05:14 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c09673b006so8936805ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106261; x=1694711061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=yRlj5COWnDefMqz4RwG2zsnUC2DCYwavy3CKeZPU6lgKaIB6/NGBO921FKu2f/GTKa
         fxQRx837JNMtY7waKzL1vRWlDUlD/zrQJD0jhCTL0p316rU/v4w7Z+wG3WNIwZwgoBMD
         YqtvBzlCaHEBCoFxMvqROZ3ct9S9AppDBCRsALuG/lymM9DwX10043pEC4K0TjKLbXZo
         1i0Dh3ErZLVeX4GsfKGrN66sfHooswwILhLYl+oUsDpbk49GgroW9dSTQqSh/WdzdOKk
         bxxFNpLe4Bwy/j8wg3/lXgpX7ZfufSI/I3wYT0Yq+TyStRIksRZV6LDwuyuK8t6Tw8QV
         pQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106261; x=1694711061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=Np1bVr09VrCMW1+LM9ody0YUvhcuJVxpgRafcdVEZvN8YVSJAAaE3nUhX6HtjClmy/
         hZTx+aECE088vgU6a3s8PZ3eEiJ4HOybaoA16A4IHa1Mb26dOF0CGI5q2Zlrs5bWOE+C
         SBj1RRtXQdXvMBfAAyN6huAQX3mZOp3wWHA0ri8fSQsPGzp5dGM8Rez+TDh6O10dwUJP
         bSIqJLOqqkYhBifqD1rjo28G7nyEQGlIPrCmk3fp19OBck55mrFz80FPz1bd5rHtrb0+
         MVcVPNK5CWyYsFui94kRx4Llzs9hEmqnQQMtiD+ngsEt8hAgkQ69NjkDxpUKXB1Vdscy
         kSNQ==
X-Gm-Message-State: AOJu0YyfCGiCbXgiOiblsgwDQgq6HcOydWvWsc7ebXi2ZQba0XhZiyvL
        r9VK0TVUsXveMuTwO4PBInIVHiv3LeWKNu6nRPHfkAJtVOiR3d00FJ4=
X-Google-Smtp-Source: AGHT+IGMY/aPJYeBu1Pp0IzmGxqtgA0g7tRf3VGot5Pdq6hh1Y77T4EpHI+nXikBBcDxY/Os4mlIAHH2bnKyBxN7wMo=
X-Received: by 2002:a25:258f:0:b0:d7a:edf3:f0a9 with SMTP id
 l137-20020a25258f000000b00d7aedf3f0a9mr17868648ybl.50.1694070333187; Thu, 07
 Sep 2023 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-3-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:05:22 +0200
Message-ID: <CACRpkdZEphqvwpid7QzXuYX79q2==58eKT7wg9Cmr8m1FLOuRA@mail.gmail.com>
Subject: Re: [PATCH 02/21] gpiolib: provide gpio_device_find()
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is wrong and its kernel doc is misleading as the
> function doesn't return a reference to the gpio_chip but just a raw
> pointer. The chip itself is not guaranteed to stay alive, in fact it can
> be deleted at any point. Also: other than GPIO drivers themselves,
> nobody else has any business accessing gpio_chip structs.
>
> Provide a new gpio_device_find() function that returns a real reference
> to the opaque gpio_device structure that is guaranteed to stay alive for
> as long as there are active users of it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
