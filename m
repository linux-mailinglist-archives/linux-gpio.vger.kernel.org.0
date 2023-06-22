Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25399739802
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jun 2023 09:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjFVHRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jun 2023 03:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjFVHRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2023 03:17:17 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFED8E69
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 00:17:15 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-440a495d73dso1376784137.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687418234; x=1690010234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ3K4hmXwa+uJTD4G2lbXprl2LV5HnxlsmdhRcDrjCs=;
        b=MUqv9j0I1PvYO8Bk6u2ZzKLnhDb/VJPI4NmNIM35ujO16bv2Q4yUdaWGb5/SFcS2K8
         DmSGUoaOt/JTwQYQofbtsqL/GR04Nb66mesJ8WSXjrsExy7burR/6xNds6BVJxkcCEaJ
         LDAEO8VRe86g2jpWFa+FhE9afC7S51Puy/qT3MBqreSZ0mCnEUMadKf/OjbFjlLx4gsm
         W4UJOKnBGnRBcyZjL2mZb71PAWZJj/z9Ju6zkSaD50xbAPtwGnWoUiF1o2JcIaBcwCiD
         s/Tl6K9qRmDJGPQydmGcsksm51NydxDTodahrr0lOGVfDsKbxALbUDxuQL+yBjdRXYLu
         dIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687418234; x=1690010234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQ3K4hmXwa+uJTD4G2lbXprl2LV5HnxlsmdhRcDrjCs=;
        b=kTXb56/Eh3RUYDO5CHOVQlxmdiaskomb+aWaTCafZXWqYrpLVySOZypaMWncYKv1wH
         mdPUwe1h9KldOUPLTSOM38iQT+hX372Ucn/3BazQAZaZMky8iGhr529FcjzuiQMMv6Jm
         3rUvyI/754Nu5DfHXUNNXQCFylTmP8F0IOM9vRXvStDXP3HyLqw8gCHlOcEnNkSGyKHH
         adQSchVFsPUPFFryqK4SD1J6qVTap9gM0rJsEGaKDs6UvQaFHhSvtDYZgsnR4xYvr2Lx
         QwMFa/PCnaD8YR9TVDLTmqH/PhlTPQ2Klg4NLg3fxXC5KVlj8Ol1S7xxah+nntQ6HoX5
         E0kw==
X-Gm-Message-State: AC+VfDyZxPNVvEWKKwuuxu2XI4sMHmMSYL/NgRQAUZg7ctTIsc3m6gpL
        bp1VTV+vcc2B773zBOOm1ztlPSx95yYsfFWq2AalFQ==
X-Google-Smtp-Source: ACHHUZ6rqx3MaS04wjG10lMjy22RqrIHo9pZwjckOCOTXacrkItcOXq9rVelO0kSl3xu5dlGqlJOROElTq0/6wbtTs0=
X-Received: by 2002:a67:f70f:0:b0:43c:f613:b45d with SMTP id
 m15-20020a67f70f000000b0043cf613b45dmr5454653vso.12.1687418234516; Thu, 22
 Jun 2023 00:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230621084835.114473-1-brgl@bgdev.pl> <20230621084835.114473-3-brgl@bgdev.pl>
 <ZJLEhrhn8KCH4IxW@sol>
In-Reply-To: <ZJLEhrhn8KCH4IxW@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Jun 2023 09:17:03 +0200
Message-ID: <CAMRc=MeQy606J1dOnjU_K_J2ck+j3keffT5yNck+EORgvCqX7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tools: tests: port tests to shunit2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Wed, Jun 21, 2023 at 11:36=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Wed, Jun 21, 2023 at 10:48:35AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > +
> >  # Save the PID of coprocess - otherwise we won't be able to wait for i=
t
> >  # once it exits as the COPROC_PID will be cleared.
> >  DUT_PID=3D""
> >
> > -# mappings from local name to system chip name, path, dev name
>
> Minor nit - I would keep the line above - only removing the -g comment.
>

I restored the line and applied the patches.

Bart

> > -# -g required for the associative arrays, cos BATS...
> > -declare -g -A GPIOSIM_CHIP_NAME
> > -declare -g -A GPIOSIM_CHIP_PATH
>
> Either way, for the series,
>
> Reviewed-by: Kent Gibson <warthog618@gmail.com>
>
> Cheers,
> Kent.
