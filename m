Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415AD7B7A5D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 10:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241715AbjJDImp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 04:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241712AbjJDImp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 04:42:45 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885A5A6
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 01:42:42 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a4e29928c3so18429097b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696408962; x=1697013762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULFiP3t9GCPetbc+PSp93r0o0dlnHCkh2C+y7ClD9xQ=;
        b=XaAKm3OF6Uq787w2tfJaYlTiwx5XeyG5AS04z3PxQ0FA/HBI/++tfLQOxBzgFe4I69
         AaEMAxixVD5oGKN2I4SyjRb3N2fkZCNfb3nE2U59LB6S/0XCis57gHX7vs6m+N9rglQT
         pCX8ayeoC4H7JXrWOlcdoJrtED94L7QauOqlC44gL0n5XdWq1AX6GSO+TIcz5GPjPNY8
         fALafpVfyalP49RRnt4pXkcstxx1lml00jVSaDJGr8aqynSN4CwZnIKx8dhgH5dtOAuD
         uFHSNkzuclPsWjurVueYrmzEENlDuacjtn0ApVJCLq8rYbGV3nIAjQJKqTuJAxDOvTGE
         0VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696408962; x=1697013762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULFiP3t9GCPetbc+PSp93r0o0dlnHCkh2C+y7ClD9xQ=;
        b=RdXEIonoDxmAfeyOLEj9DUh+UeYEhskfxzmUBpKa2MfWAPk1TWKfZxNGwgceaZHGrk
         H1HdJgi25JV648vzW+eR4wded8ZEKt2gG4fFhSS0olF/eBegvyT0YhOm0Xd6xpww+sj0
         oQfuyLpKm8qg5D1YAQChXaV+eQ3H7+YQ/fuR3qjSlhYp3B82RhH+F11LF+2MKklfaCh3
         5f4Ppk+0HzzNyMPmfgg8OkoTUxWvA9BcspjHpj9QUQ1WDthyezwCPAkO3QiSl5o35E3H
         S8gwPhDfy/fGkOJiH5uFWMt8X237abuuQNwtCj29qExAIgZunVH4E/j1HJ8NxIjIJ3Rg
         fzOQ==
X-Gm-Message-State: AOJu0YyOg9GdWip1Tsedgt34aDfNIj6TpHms867sSgLS+hkkZBmF0cBq
        8qypcnbGNXP5Yf4eH442C62pie/xUzMpdae6Dg7zsA==
X-Google-Smtp-Source: AGHT+IE6ZbwY8J4Ih5WNxWy2Ppcz6et6k7N6GPeiIFRn+wvdi6e69h/TmO1imu98VtFQc+fT5c8F/JmUb8bt7BkgsT4=
X-Received: by 2002:a0d:d748:0:b0:5a3:dc2b:6f44 with SMTP id
 z69-20020a0dd748000000b005a3dc2b6f44mr1917620ywd.18.1696408961772; Wed, 04
 Oct 2023 01:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <CACRpkdY03QUkHcmyfTTfvVFbmNujW3qg5GcNJ-=8zj_zvGqDeg@mail.gmail.com>
 <CAMRc=Md7QKYqRaytw2xG8hqTmEDmZGxFfDyGZqoE96h-CvmJcw@mail.gmail.com>
In-Reply-To: <CAMRc=Md7QKYqRaytw2xG8hqTmEDmZGxFfDyGZqoE96h-CvmJcw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Oct 2023 10:42:30 +0200
Message-ID: <CACRpkdZkQ8tJz=94rKGB4DcEC0z8HJHieZn5FD+-efRU-897Pw@mail.gmail.com>
Subject: Re: [PATCH 00/36] pinctrl: don't use GPIOLIB global numberspace in helpers
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> What is your view on Andy's and Kent's issues with the _new() name
> suffix?

We have done similar operations in the past, and it is similar to what
Uwe is doing for the moment with the .remove() callbacks.

Usually the strategy is employed when the work needs to be spread
out over a few merge windows so it is a bit of a marker that "this is
in transition".

There is the  horror story of this staying around forever and becoming
idiomatic: struct napi_struct (include/linux/netdevice.h) where
"napi" means "new API" - yeah that could have been handled better...

If there is more moaning about it I will simply squash all the patches
into one and call it a day - the end result will be the same and no
sign of any *_new suffix anywhere. It was still worth it for reviewing
the driver changes on a per-driver basis so then it becomes one of
those Schopenhauer ladders that you can toss away after climbing
it.

Yours,
Linus Walleij
