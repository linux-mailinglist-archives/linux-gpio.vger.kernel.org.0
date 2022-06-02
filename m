Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98A953B439
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jun 2022 09:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbiFBHSw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jun 2022 03:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiFBHSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2022 03:18:50 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA4A30C
        for <linux-gpio@vger.kernel.org>; Thu,  2 Jun 2022 00:18:48 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h19so5141637edj.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2022 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WClvtRhF0aA9uIU/nH0OH+HSsteRtnCKitfsn2fxiio=;
        b=8FHmxNrJLtcKCstxTI1HE+tUADam1xqVKzaZ9zwMcWAxJuEqmxDxwNy1Y0/aVGTfAS
         Oco4B54dg2S/16hPlQL28SnRyTxLqpbF+MvfZS9jFjGN+qncDFRUZdzNYcDbK1KtdZXK
         UuZQEL3j/AWG89qsWTb9c3CNhML5h7KbBRTdv2JF6AqcJxF+F1Ytb5GZ2wjUDMaq+yHa
         EIdeIVsHEz6m3caEJsuRAa0FqZLZjwPuE+hgkSvLg8U1feMHQ20twA1wUk3gH5CpBPGs
         H/mMHAAuNdD2HWHNNRvZzJCh2bWfWeHed/JMX6f/Iy9ZiUnuh3kOA55rWcOUzIcLe5lU
         yFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WClvtRhF0aA9uIU/nH0OH+HSsteRtnCKitfsn2fxiio=;
        b=KLydlUHp4CqiAR/OWFfpTI+ZcREoxSsF15XDt0PelRYGYFJ0Qpfk2YadhXjeAvi15h
         wupTnGWu+UOZfQEezIwtymXnn392HmwOHxg3BDHDT3PyOZxc/Wdp+4jiPEVKs6iYMgB7
         WM+RPBoKGx+xZwo8vxX4ApLhgYiCtacLgG8EQWzQ28Nxte6ZBovnlzrX1e7Lgl56cLyw
         zr8nFWR7Js3JembzQ71ieD8TTvLkZDVOGlHXOE07+afZRwKTFXf+HMTO9JFmU7/s5ML4
         FqzqYWsP1K2iCtzq0/BSUQbam2WryQN9Ki0YGOVfrcpBbmzWEdQL1ll4Zvf9bSho6uw+
         ZwNQ==
X-Gm-Message-State: AOAM5325SZ5kKHPY7Gi8ojMc8s0PNp1dSvebrVo28ghAZKPIBef4IJYg
        BX5ZMdgwsvDtR6UMWnk78OyIBfv994yyOxJD/SMT2A==
X-Google-Smtp-Source: ABdhPJxfX8QbBb6++inrKoCa6jNKfka3ms7lH1R+eyiCKCflRGuP1IEo3mYZ7mK4xXh5ggUsGVFU4lNkhv1Yh+e5Ay8=
X-Received: by 2002:a05:6402:1449:b0:42d:d250:e504 with SMTP id
 d9-20020a056402144900b0042dd250e504mr3755698edx.213.1654154327380; Thu, 02
 Jun 2022 00:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Jun 2022 09:18:36 +0200
Message-ID: <CAMRc=McL66qj=4ZfK9-420YzuHASjUQPK+JYJBAnAvRfKfdhBw@mail.gmail.com>
Subject: Re: [PATCH] gpio: adp5588: Remove support for platform setup and
 teardown callbacks
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 23, 2022 at 10:40 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> If the teardown callback failed in the gpio driver, it fails to free the
> irq (if there is one). The device is removed anyhow. If later on the irq
> triggers, all sorts of unpleasant things might happen (e.g. accessing
> the struct adp5588_gpio which is already freed in the meantime or startin=
g
> i2c bus transfers for an unregistered device). Even before irq support wa=
s
> added to this driver, exiting early was wrong; back then it failed to
> unregister the gpiochip.
>
> Fortunately these callbacks aren't used any more since at least blackfin
> was removed in 2018. So just drop them.
>
> Note that they are not removed from struct adp5588_gpio_platform_data
> because the keyboard driver adp5588-keys.c also makes use of them.
> (I didn't check if the callbacks might have been called twice, maybe ther=
e
> is another reason hidden to better not call these functions.)
>
> This patch is a preparation for making i2c remove callbacks return void.
>
> Fixes: 80884094e344 ("gpio: adp5588-gpio: new driver for ADP5588 GPIO exp=
anders")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied, thanks!

Bart
