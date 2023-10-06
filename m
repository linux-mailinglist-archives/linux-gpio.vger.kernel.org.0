Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37D87BC231
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Oct 2023 00:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbjJFWWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 18:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbjJFWWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 18:22:14 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AD9BE
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 15:22:13 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a200028437so32851697b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696630932; x=1697235732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIcxz4GiadHjd+WIPenFnmmxtkCaCE5uWGwu/Joc3Qw=;
        b=OBqbycb1tYPYo3L+ymjrU120d13Jtzcdsuwjdp+qUN8fqNl4CifrFeH6ayynaZBYxD
         tjQbldw4yyZaEHqzA9+0NQnrc5tK2LEDQ9F4MtHIG65Qa7bnuTtQMWP0LMoGQqVeSOLA
         1o1DtII9hrRlMJTO1j0WMgYnpABCrarXLa2p2p2mKLaqhDM5j3QWs/Lt9n6MkTj9zCoF
         Izzzw7pkKTNQ767HUx6gznKPvgPYTTfyidKTA9zqyQzWDY7BJLmtjoOIRBwQP6u9eaPn
         z4aaluvlDlKnlKcRblOtbRSSORR63lnpuJmHEhJemK4N/VOzdaGCQ1Q4AzwJmlJ0J9Zo
         /qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696630932; x=1697235732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIcxz4GiadHjd+WIPenFnmmxtkCaCE5uWGwu/Joc3Qw=;
        b=YybhCkJOlo7Oo0cWiZih9DGtu7UCZX0Qh9bzkUNr6KylPKVxPTV0DYzDEUyrKTOPgP
         cjv+JYUOcB61ypAa8u9cxt0UCAPG1IWXQUSPXxqE8dGzGkfMXfnHXKhQn16K+HQXlhNa
         5xVlL7uRu9j4rIC9BsujvAhQaSSjqImjppvRWHsG6hndtK0vV9hrxtRHM5urPLOddXYa
         BNtsOA3cfLbxWo9PTiz0IZgJiKfSuiO8QLQXLJU4WKGUaxRt+XbN+dEZnuR8wMgyOzdu
         /DoYAOOYOl2wKjv47lUFD04CpmtXP2Ff5bIqgELwWNA8EOIAKADe4IsNoQ/DbnbNZyEs
         H7Kg==
X-Gm-Message-State: AOJu0Yzeqm/tDKpZ6TXcx6ZwiV4KmqGkPwRvv3xmNJr9YqSEPelvDs8Y
        FJHlg9WXDINvbKh3ESZh2T3FigzwboWbIsHM+t7C8yu89M7I5lhQWJE=
X-Google-Smtp-Source: AGHT+IEeq1rx2bpqDd2eKq7pB2baH7l1tTHrNVJqZSUg7KwvYLLOzc8m8XsF4ry5o1P/TbX82T7siMt41Kdwy6U+Ym4=
X-Received: by 2002:a0d:e607:0:b0:5a1:c610:1154 with SMTP id
 p7-20020a0de607000000b005a1c6101154mr9794442ywe.10.1696630932606; Fri, 06 Oct
 2023 15:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231006115147.18559-1-brgl@bgdev.pl> <ZSAKdOXpo+xOI3sJ@smile.fi.intel.com>
 <CAMRc=MeYiiWaaqRtSjRBfaWGFtZCPWCjYk+ZrX5TwicNq9MQeA@mail.gmail.com>
In-Reply-To: <CAMRc=MeYiiWaaqRtSjRBfaWGFtZCPWCjYk+ZrX5TwicNq9MQeA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 7 Oct 2023 00:22:01 +0200
Message-ID: <CACRpkdaqPm9471q7Sg-cxcLTTE63=NuKuSUFiFtPsaUoRiB3jA@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] gpiolib: reverse-assign the fwnode to struct gpio_chip
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dipen Patel <dipenp@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2023 at 9:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> I don't see any good reason for it not having the fwnode assigned.
> User calling gpio_device_find() will have to jump through hoops in
> order to match the device by fwnode

Yeah I would add

struct fwnode_handle *gpiochip_get_fwnode(struct gpio_chip *gc)
{
   return dev_fwnode(&gc->gpiodev->dev);
}

so it's easy for external users to get the fwnode if they really need it.
This and a few more changes and we can drop gc->fwnode altogether
can't we?

Yours,
Linus Walleij
