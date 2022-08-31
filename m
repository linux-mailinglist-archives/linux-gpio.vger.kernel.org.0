Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7F55A7D41
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbiHaM1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiHaM1f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:27:35 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA784D1E04;
        Wed, 31 Aug 2022 05:27:34 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id w4so10659377qvs.4;
        Wed, 31 Aug 2022 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=s7PugilGhA+80G8j8GxS5vgTy/WhDF37Lwu1kbQKx3s=;
        b=V5VsN40pf7JH4Qkujz20Q5hI+d8vul8NxiNXCBB5JUdZSH1hw6XgeZvbLlwtGZiLao
         G0+GmiU0/GGhLT0PzaKx39jAJBCh+bgtEFildW2hAESrSUMnE4OyHRDG4JKXURUuyZMC
         kSt646YJGrmbspyXjwKel0ZZSFuUbMKv9VcnkaPV206egv9sjV7VkQdOIwY/HEu3hpYR
         o6uqgbw7WfLO4J51XqhewK6b989DrX63gefD4REhKiVazd13yI+um2bxqpgaUnFbxSc6
         ymROyAMBe564VSHfTj1tT8/Xi0CfBrKm3+0OhcNWY0Sy1w05bYMjN8gZng/N7DRCrNod
         UNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s7PugilGhA+80G8j8GxS5vgTy/WhDF37Lwu1kbQKx3s=;
        b=PZ75CYjq97gOSAe3VgAFIYyV5rZZdBUYB6vF3NoO2SypxBYbdGcs21PNf74jR17CF1
         aAuRKK8aRRa3jr7KV/5cDrQLsh/hEZgm51tc9eoQdoPM5rQAKA1xwXs0R9XmHUI1ry2j
         Srq6TrRltPCuVIL8kGO4wwvwqX4dxAAFnCHLwnonjIyKBDpcQr54QdIxJqWgukSmsws7
         5Da7eByufSQMLPT9GFhNDFWCaWDdjplu9K+Vtv8c0Y4uo4lfAr7ve0k7dg9DgjzEIbZo
         3HW8QYoAPsYrlbJfUZ4RcsatfUp2kHg5b4DeEA9S0iYK6RwPsY5js85mWpIZUy24sVRO
         0SzQ==
X-Gm-Message-State: ACgBeo2v0C1OxN6voQGn5+lGYq+zmR9ka+9XzlMY0IbAjH0lyRRkULQE
        If2rBzzHRsjs9XdeWdWJ6aaTWbbZroUPXA7srh0U0ohE8UQ=
X-Google-Smtp-Source: AA6agR4/nUtVIRwuJKLo33Wk6w+R5iUg7FEoKXii3a8XxfiMkiZBz6N6AqJ9qskKK0r2HrdHdSaFupX4KtR4G9XayPg=
X-Received: by 2002:a05:6214:c26:b0:499:19f1:1a73 with SMTP id
 a6-20020a0562140c2600b0049919f11a73mr3811422qvd.48.1661948853948; Wed, 31 Aug
 2022 05:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220721080423.156151-1-nuno.sa@analog.com> <20220721080423.156151-2-nuno.sa@analog.com>
 <CACRpkdas=ENpdkQbc-1LOG_zRroo4dAFgMfmVzd4=ZK_6jRuRA@mail.gmail.com>
In-Reply-To: <CACRpkdas=ENpdkQbc-1LOG_zRroo4dAFgMfmVzd4=ZK_6jRuRA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Aug 2022 15:26:58 +0300
Message-ID: <CAHp75VfB9oMvuzpTYXJi=KPkGopJvs4iETchdfzKea9RoWvTqQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 3:24 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Thu, Jul 21, 2022 at 10:03 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

...

> Is there any input-related content in the driver after this or
> should the whole driver just be moved over to drivers/gpio
> and replace the old GPIO driver that you delete in patch
> 2?

Looking at the Kconfig description I would say this might be a
candidate for splitting and MFD.

--=20
With Best Regards,
Andy Shevchenko
