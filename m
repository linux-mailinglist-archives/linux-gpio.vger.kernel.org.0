Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53FAE4AD65A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245180AbiBHLYG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355434AbiBHJhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 04:37:04 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA997C03FEC0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 01:37:02 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id b13so36170013edn.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Feb 2022 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvnJjK0RDJicPSg7G8U97zBPT489yzRM1hbnPJc6o4c=;
        b=4Zp/2W6eFuUZHfmWZI7PrD3HbFCSnvK4stjXRh7lXp8/iFXJOiQkzeSzdy2DZb5hsd
         oTO5DJTGvx827oj8qp/o85iwlp0ulq/yRMWoRwby7tWwGwlPrdV/5d77fzxdHI6hXjVO
         qXchSa6Z5eUQGLEN9PVRMACIgNwS1qqpfg2CZilYUaoVUn55Sn7YD9rkBF4Yg/p0FIGq
         6cU0C1cOVqw10kxCFmJklxui3pXDABUteXnY2HQl/b4gA3SjB/W8S09YpHNgz2+VVPPB
         geZqwWKKMBCiOspjl0O1uWrtZYgM4G1rMfslHCj30eU8spQqil+Fpn9RYq/Llcms+8hM
         zryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvnJjK0RDJicPSg7G8U97zBPT489yzRM1hbnPJc6o4c=;
        b=xQsWBMfs3zPkHlZflV7gbw9ZciAvck/QA0y6CSYZ/iFRlX7hTLchwjG7ubrGeQc6jw
         AZza/rhIkfEDt2EkvWpfIC1OIRq5KHuFDbQASAr3WFYD57d+zGd9pc7uxCC3Kf29d6hS
         jqw3e4uQusHdKLpH6c77l/dYvciKI91glHgcgjaneJcdDCgWVXv42ybY/e8sQB5TK2D1
         G3se6Cp8jUNz5T/yVmULLsLqMJoN1er6EMkl/1UGcZvlQ1Q2wYJEIplZ/XdH9E1gPt3P
         ukCL/ke7GqRK8XNgtp8ooL33sXGDiU57vKzztHxDyW+3CQpcVfc/C8pfZ2fsQzuni1kN
         itLg==
X-Gm-Message-State: AOAM530GO+suFbYlYcrCi1lBeT/xtF8Pa73c1MVTlVLsCVWc/DoYzFWx
        X7RhkTwLvpL8TQxJC8VhDx8hFzg9ixFGMSWZ7oI4mA==
X-Google-Smtp-Source: ABdhPJxJknyMB+UBPJFW5JPQLhQR0+oe+zM3S/WKleJgV8L5XezH7YE99N7EnTFVKszVy3EQplEatN2iLsdywR8zMQA=
X-Received: by 2002:aa7:de91:: with SMTP id j17mr3640705edv.396.1644313021435;
 Tue, 08 Feb 2022 01:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20220201152758.40391-1-andriy.shevchenko@linux.intel.com> <YgEv/MIydfZlL1zQ@smile.fi.intel.com>
In-Reply-To: <YgEv/MIydfZlL1zQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Feb 2022 10:36:50 +0100
Message-ID: <CAMRc=MdrTuJiRhxPvhuos02eDc3eUS1fXNJr2xwCCG9C82tAVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpiolib: A fix and a few cleanups
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 7, 2022 at 3:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 01, 2022 at 05:27:54PM +0200, Andy Shevchenko wrote:
> > Patch 1 is a fix for wrong error code to user space.
> > Patches 2-4 are small cleanups.
>
> > Can be routed via my tree, or directly into GPIO, whatever maintainers
> > prefer.
>
> Bart, if the series is okay for you tell me which route to take?
>

Queued the first one for fixes and 2-4 for v5.18.

Bart
