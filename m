Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4B476CFDB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 16:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbjHBORj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 10:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbjHBORi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 10:17:38 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A072718
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 07:17:33 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1bba7717d3bso5102062fac.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2023 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690985853; x=1691590653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNSIfmQB8u+B1yzplCc+aOjWXtgmH6smslbyj1Ap5Wc=;
        b=S76bqjjq0jQEclSgKJSg3fVLEkV/GGsRXEsn/h5xMEEZMOmVGYuC+QGzvfDHvf5mLI
         xlyxrI7Ryp7/eawH6ahsH8llhQaaIRYohmSyWxM3hZY/ULraV4KeA0wn/Wx6hWgtIA/3
         tkSEnBq79FBrNyoVdB8zpeOz8csd8DXAh+Ay9tBwbaw/DImRhxLfsk70LTXAqZsppc9N
         GGR/OQLtVg8kpE0QT8bDRwyjK8TK35F2w6Hr7qUnFIMLIBv2adea7xyLHkZf9eYyMtTr
         CWiwYygOeLOykriNJa/KFi6TFiFBYysIY2NlXABwgPhViZlqRsODMmtUsNd/qiot/f7r
         vSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690985853; x=1691590653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNSIfmQB8u+B1yzplCc+aOjWXtgmH6smslbyj1Ap5Wc=;
        b=b0PzjH0kFqq/Cr6ay0Mv1w1s1y9ZqRS2vKVwxLGrbApizMQYY6PEzSmbQkhg6RAZT3
         OAT3yU2OOO7kA6PxUCJ49/D7tpI8MiJDumG5WG3o7WHp2j5tdxqO/R0lPwBbY30jVcJT
         YHcwqFN1adm+aIzDG+F7dbgsvK0iubqB+alM1E2zxEcTVW/mxavQvZJaOZ8zdZXOuZus
         pZjrfqnehndNkfqa+UBVBbuc/wSMzuetAzP79BMInwwdd0DncNCi56fbwKm/Qt3cKNCt
         QTBDcKAfeBhUoxYpEfGBVfIemmQj4yBVvH0l12hmUvQFYOrZ2VpbEpYI8O7DezYKqXTr
         W4SA==
X-Gm-Message-State: ABy/qLbqatwFM0AAgzZwvnqgukq8xyHGaDdv81bIHi87DOXFUURZdLVc
        vimqeH5ByzUFjjxvecCxt7TxaP1T8Mx3jra155I=
X-Google-Smtp-Source: APBJJlE99+Y7TQYq6N7viau6GI+XxNloxJUTAODPaDE2NN99aOmOtonryzqMzjqSaDtQYi803ZsSqKpAS0YxbH0xgcs=
X-Received: by 2002:a05:6870:3510:b0:1bb:6ee1:114e with SMTP id
 k16-20020a056870351000b001bb6ee1114emr18360036oah.28.1690985852792; Wed, 02
 Aug 2023 07:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230802035349.177583-1-wangzhu9@huawei.com>
In-Reply-To: <20230802035349.177583-1-wangzhu9@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Aug 2023 17:16:56 +0300
Message-ID: <CAHp75VdjuL6rbR1wp=nKxKgGqreTFoQgeuP6=G5vJz0b7PvPbg@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: max732x: remove redundant CONFIG_OF and of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com
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

On Wed, Aug 2, 2023 at 6:54=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here. We remove both CONFIG_OF and of_match_ptr() here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

...

>  #include <linux/platform_data/max732x.h>
> -#include <linux/of.h>
>

It seems you may also drop the extra blank line here.

>
>  /*

I hope no resend is needed and Bart can amend this when applying.

--=20
With Best Regards,
Andy Shevchenko
