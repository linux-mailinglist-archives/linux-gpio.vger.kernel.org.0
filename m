Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A0C786B1A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 11:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbjHXJFq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 05:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240596AbjHXJFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 05:05:25 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394D11989
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:05:22 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso6316562276.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692867921; x=1693472721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3yLyKzJxJbCAxrzaKgW3EmGRiEIM/TWU+trGwx7bOg=;
        b=lbbYFJb+uo2I1syaxbEmT8TDsu0yQY+eW5fV/iDNeS1oaT2EmO3Em3rwt0vdYUI8OY
         mEKqprz1yAsJXc/OvuO+X5tJHdmfljrz/dMC0Lbh6sm4bCCfrp2v/h0TTpJyII61F74G
         p0c9gh+syrff4Q1/OpnYvn86OqzIFLbmdTEiIeNAGoxZFLDGlFhFjTsIm4RGBbrSvIu7
         Woxup3Mxj0ZLBpQZc3m6HJMxJAvYQ6TA0VU1KKKw5u7eTu47z7UpQ2oGrZrRjHZ/uHtZ
         hJnti+ixmn68hRVIoaFJZMJ24sWd1cJ7ZrWSnPpG5ih92gc7Nh+fnbTZe11T7wQuhHNF
         pDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692867921; x=1693472721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3yLyKzJxJbCAxrzaKgW3EmGRiEIM/TWU+trGwx7bOg=;
        b=gNRY7ZZq7u7DhHGID23XhsrfuA8NDUbxz+Ux0XbmIoXcDWuQMOm709NJbHBbiZ8CiJ
         hkSDKVPf8Y/G0oX5PPk9vpJ56lihUDEEgXRfPzWepCjp1hXJmEtRzAK8jKaJyIUVZiQb
         bSt66i05ZrjprjkOsuw8WySUdwcF37vZ95ObkvWjzq96twRC1zgXYCmFdhmx4nmO97Ku
         Li9FGNS2+dcSIXDwMcyffpWAykeFlwLf4H5URy1MoxlRHndZqCDjrQ9F8rik1LKCobFt
         G2kwF1rlUX45TEVODb3cgn6XH7/euRAJjQP4tH6vCjYCucR3sSs/EEpTKJ6IZELWA9Sr
         J7ww==
X-Gm-Message-State: AOJu0YzGc2KPAIPuwQ3KpEzlrPjRAYJMiYQ3lQQGm2cEKBGBJdnWaj4n
        GMCVuxOONtHRvwte3Bx0T0EYBDmTINSL+6FQ8I+6ZA==
X-Google-Smtp-Source: AGHT+IFCocK9SC5+v7BgZd0PBMDs36LGOApOgxF8XuuQevVVKiWJgzdJOcy1oigrFhHFZ0UhoRohnMtdYC6ARnXwIfY=
X-Received: by 2002:a25:a22a:0:b0:d77:94d6:aa4f with SMTP id
 b39-20020a25a22a000000b00d7794d6aa4fmr5906778ybi.32.1692867921410; Thu, 24
 Aug 2023 02:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230821153339.26305-1-brgl@bgdev.pl> <ZOP/n30hYR/8zN60@sol>
 <CAMRc=Mep_AZPht6cQFQ-Pz8UJC-q1r4F29SJ=+_WgJX1cz5wtw@mail.gmail.com>
 <CAMRc=MdoZJbiNUbdO6VOzS7NJTJtbmD1uoywa7+iWjeoy+RecQ@mail.gmail.com>
 <ZOcIdHVgK1ffzFMb@sol> <CAMRc=MfMu5kq8pM-Wcqz7uST5+etkuvYnTchyrP6NsHZJ32XRw@mail.gmail.com>
In-Reply-To: <CAMRc=MfMu5kq8pM-Wcqz7uST5+etkuvYnTchyrP6NsHZJ32XRw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Aug 2023 10:46:38 +0200
Message-ID: <CACRpkdbQy1XcS4ErHpzqx1qnh_ZH8y2te=exJ3zS8KQiG36Tgw@mail.gmail.com>
Subject: Re: [libgpiod v1.6.x][PATCH] tests: mockup: unbind mockup devices
 before unloading the module
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Thu, Aug 24, 2023 at 9:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> Kent:
> > If the plan is to change the kernel such that it will no longer unload
> > modules with bound devices then the patch totally makes sense.
>
> Linus has not commented on that yet

[Fear Of Missing Out intensifies]

Is this some mail thread I should look at but didn't?

Or do you refer to Torvalds?

> and there's a thing I need to
> check first (hopefully today) but I think it will make more sense.
> This patch on the other hand is not incorrect even if the behavior
> doesn't change. I will queue it.

This patch is doing the right thing from a module management point
of view for sure.

Yours,
Linus Walleij
