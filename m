Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E252558A8C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 23:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiFWVOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 17:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiFWVO2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 17:14:28 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E096451597
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:14:26 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z19so700814edb.11
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O5Fo7fk6NC/xPqLSEKk2JM8GEee5EzvqseJZ08G903I=;
        b=ZifwWghxhV2z7LJpFH2yfg69EKK8lAOZ5brQWHSJxMV1Bc+eiZcGIf0lkqccoe4V0j
         J2JAy89d9Gdp0g781v8Af5o7qGOcDPqn1w7vqVIYtCY4l4rHV+sYdHr+U8I0s02vDgPp
         WYM4hPgGQRKOTe21vTLA6O8jZXRqjMOa/W+ox275XbE+YD985XhXwThD0bpPment5eL9
         CH/nGUgr35dDIvKulVxZMv8bkQdmXR9UZFgOjGjsy5jXXzTID4sS5p2dJsEYUqipfvxM
         hYGP3JoNYwVlJ3QdxAxaIuMeN1Y+RfGnioShVDKBcRD7AWKWiv6/GA4p6l5lEAq+h+8p
         vE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O5Fo7fk6NC/xPqLSEKk2JM8GEee5EzvqseJZ08G903I=;
        b=nAtluF0Mo4owf+NvDen7CZ/G7HxLHhZGRGuV7/f1qvb1wjdf/A8S6JmEHWMfQY276L
         EE6nMY3vKsm4mexB0ZL6NJlRAW5KcDDzSQrHZUXBRWqZN2Q8MCKMaY4fhgofEzR8950m
         6hzZ+LSd3/aChJv4fouDjgqQFDisqpmsJfJlqRRF7+T0lWUs1JNPLFNVH/OMQ5SaMRdU
         CvCOhzqGGnYxzH5DCZfqtY+5GKdGNc8CeTrMbPuf5ed/u2PwPcSMaUBxVRbe9SIFULHY
         VVS2B2EzgJvybM09bNzVndERqW+hIFtoqlg1caTInff0+0LizBIsqQqyxa2dlQC0LRZ4
         hTXg==
X-Gm-Message-State: AJIora/T5jH1GZbyl88OhjwU9j+w7yLKQ67X2YsqDVwE+VR5h/V+JOQ3
        NPX+f2ZTjCfHbDE0LxMCytM3EULnGLvp9Ae7X7UYF/v32PMJkA==
X-Google-Smtp-Source: AGRyM1vhzHFlRlHMAK2DGy9HoTc9eyjBGJvy8TmINJvOPBj2CCIV0VvmJEC1LgP6R8ybAPZNAkkkvqrLi9lcdfc5mVU=
X-Received: by 2002:a05:6402:2402:b0:435:3418:61b5 with SMTP id
 t2-20020a056402240200b00435341861b5mr13095841eda.82.1656018864807; Thu, 23
 Jun 2022 14:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220614194802.269738-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220614194802.269738-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 23:14:14 +0200
Message-ID: <CAMRc=Mfs=XSWCuZH223QEJ-GCqLCs6g51T20GHFK5R7yae_Pkw@mail.gmail.com>
Subject: Re: [PATCH] gpio: ucb1400: Remove platform setup and teardown support
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
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

On Tue, Jun 14, 2022 at 9:48 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> There is no user of these callbacks. The motivation for this change is
> to stop returning an error code from the remove callback.
>
> This is a preparation for making platform remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied this for now until we figure out if we want to remove the
entire driver or not.

Bart
