Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B339715DC1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 13:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjE3LrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 07:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjE3LrC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 07:47:02 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178D411F
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:46:37 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-565d354b59fso39542127b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685447181; x=1688039181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUJILdtJMJoGIdgauKb6V4jUFqAoPR4Aj10k+ul/UDE=;
        b=IMWC0wjY59bzCGS7zJk3bSQYlIXqw+JeQ3y1IWQWhQiLXF2vaTJtZJmQh9zf2CmT/M
         DDhnX+WopwHeb5JG+ZbwPMualrcvR2RzAUySfQTek1xnsdICL2hD2phnyJoLU7Rna3Km
         wgUeYMrWbpk4R2vbpDNVFt7XlDg/efUR0iOCtWY39X/czK03aOmLF53ZFAhaEo2Tc0Jk
         LLVsjfeFPEMcncWvdCQtotATPrGD9ibH6jagYVr+s0krbxSnc73BP58bZ4BQT8kTt7Yg
         NzeEgvwW7ZLNQnkOZjFujIU7cSH2hbIdOi7Iio4f8z2jxiX1C5i1iL4Gr++KacL5xPuQ
         bqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685447181; x=1688039181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUJILdtJMJoGIdgauKb6V4jUFqAoPR4Aj10k+ul/UDE=;
        b=KShQRW7qxKQO3h0+Nu4PY1IDgC15Z+IGGQn8CpHrHlJZ/cxrMXb7OctNYpesMuF4Tk
         uvpfCzx4eIn/RDxT5brnk55j+Fs3rH8s8d7YCMPvu1sPTVIY5nJIdq4Y9JUYVeW9Lcuo
         ihBOX+6IA/8syxgMIRMshIAuKLG2tF3kVrqy2gOJcIebjUsw5kQvhC5/WyuwNzpeqwYY
         eWsPeO8lA+aQ3M1fNH4FNNXhjhfKfV4Aed+7D0cgpYgzmKZzf7EPJfcMkj0rqQVN/AQQ
         D3VbOrLwHBO4fY9aAfbbAir3WQSx8Z4WX7jdJhqDuWtWTtQokheE+p3rklpQHgz0oATi
         USQA==
X-Gm-Message-State: AC+VfDxRAzexhEsP0ceHvmVqFL8jnJTPfRO9Q1iYXoBogdYOZbNBBxpS
        9uMv2850gWx4JkYBZy3MsbbLTi5g1k2YEdo9u7n5xg==
X-Google-Smtp-Source: ACHHUZ6qeK1VUlzVVoYriVl36VUfxvr4XRHsg/sZx0twYHip1poh59C0DDAZeBtvwHO44f/HwXpTzoDZGovs/QbkI0Y=
X-Received: by 2002:a81:5b55:0:b0:561:a422:f3cd with SMTP id
 p82-20020a815b55000000b00561a422f3cdmr1795570ywb.30.1685447181672; Tue, 30
 May 2023 04:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230527114057.36091-1-andriy.shevchenko@linux.intel.com> <20230527114057.36091-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230527114057.36091-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 13:46:10 +0200
Message-ID: <CACRpkdbnKngR7x2pvvvvbhj-4z+EyCiwchrrEbbwO=MSOn-HsQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Unify allocation and initialization of
 GPIO valid mask
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 27, 2023 at 1:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Now that the of_gpiochip_add() doesn't use valid mask, we may
> unify GPIO valid mask allocation and initialization. With this
> it makes a symmetry to the similar which we done for IRQ chip.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
