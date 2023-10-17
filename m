Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D697CC33A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjJQMdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbjJQMdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:33:18 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DF295
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:33:17 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7b5fafed01aso2033054241.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697545996; x=1698150796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zOK25AhejJsCNGYHq5emnXVPEw8aJuYMYEOx/eSslY=;
        b=X6ZEI6VKLdgy4hArHuidZnwO95llrqocYliUr98W8TEQgc5asJtQU/Rl8hhXNmY41Z
         UMaUtWRKW6n6GJt1TreHcWHTKVVoJuhfcKkEmj8rgeVkJceDA8SlOjzky44uncQAPDPt
         7IWpIGAODf+cvNy4Hau5rbJExKUNmPkBl9mG5IU/qMkf9ju50TDsAoci/7twxkDKWUVc
         KQTn+KYpeLA/QdLRtjkxdxLYTY0iNG+zOAvYAbyl/Mz2Gf0jqNdIhCw/s+ywvt1zSrfy
         EVYTl+8Na+IuZCQTrkKFUKtcrMKmWcU4UlIjYbq6s0ss6yudnkwr7vxZMWOHCLRJuulU
         1tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697545996; x=1698150796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zOK25AhejJsCNGYHq5emnXVPEw8aJuYMYEOx/eSslY=;
        b=D/uOrCQyfpFaf0Ilc0bcp4TpS7tMF/D7sOO8Sh+bDeR0G03sEy3N7GnidUX+ytKJa4
         UeuU//uw5FWDgef7LorZ/ohHvaPQaiAAOyxHs8as8/StV0sP4NjyaP00aoIzM9eTKE3n
         BgFRgwLffrj/RmWSYO3NGOprlqHhbsAj8WApNbPErJpls5UBQIz14blNoAlcVGVg2bCM
         Kpd4dNnmXsuw9m4mTNyHorOFegMzlE2qQB3AxpHrfDOA7uvz5qVSCKLi2VwijvnPAH9b
         qpXz0VVUJGFxi1cDZtw1TTzJFHChCpXEfGS/FqdOcxZfXYlhY7x9uFIps/To3kbvEOrh
         FSyA==
X-Gm-Message-State: AOJu0YyebmE06UGigJC3+9d3+BdD8djEk69fhkjbXWzz957XqHbaIM+T
        BNaQp2W0ZxQPHKoZ/iwPxkDdzgYhNNvOo8vOiyTLHg==
X-Google-Smtp-Source: AGHT+IHKa+vZOJw8H/LStebORG+Pgptjzt7WNiFEvBeVqbXr67kxtc+SjG30gXChUZuW6l9vM5obq62BORTYPHo3M/g=
X-Received: by 2002:a05:6102:2a57:b0:457:bff9:f51e with SMTP id
 gt23-20020a0561022a5700b00457bff9f51emr2478802vsb.27.1697545995341; Tue, 17
 Oct 2023 05:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231017120431.68847-1-brgl@bgdev.pl> <20231017120431.68847-54-brgl@bgdev.pl>
 <ZS59+F8trJIjZ1hl@smile.fi.intel.com>
In-Reply-To: <ZS59+F8trJIjZ1hl@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 14:33:04 +0200
Message-ID: <CAMRc=Mdj5FvTcpbJ=6UvsGRjcz_dL+cqEwUNsyAcQXBXNiyq4Q@mail.gmail.com>
Subject: Re: [PATCH v3 53/73] pinctrl: intel: lynxpoint: drop the wrappers
 around pinctrl_gpio_direction_input()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 2:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 17, 2023 at 02:04:11PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > pinctrl_gpio_direction_input() now has the same signature as the
> > wrappers around it so we can drop them.
>
> W/o "intel:" part in the Subj
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Unless something new comes up, I'll fix this in tree in order to not
spam the list anymore with these patch bombs.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
