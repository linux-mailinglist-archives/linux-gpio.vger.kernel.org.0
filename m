Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C75663C428
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 16:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbiK2Pu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 10:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235854AbiK2Pt6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 10:49:58 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA367639F
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 07:49:46 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id d185so14408996vsd.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDpDUsBQCErdri1vWlJ2ZrP2JWNQuvwvc89FSaVzkPc=;
        b=0yCAk7Ft4EldNxptX84+boQK25iHhiLupXyI+rBAZJb/kzrbzV5t1VhUrXU429cEpN
         SCAU80rM6UwwDD/Fn0MQ1Ft0H+RtJbvw4yVd+SgE1Cx/Jkwm4rkal/I9/0VsEeQdTamW
         dSVZHFF0drjN8H0s4cs31Z704KgCKleThHXU+2chJN7BbO4upi0fj011T0xzM3ALoCr6
         PoOQyRkH0EnyhGmDGQvP6/ufV61gOhwvjdrNazhFft/39fBTAuC8dSLVFWTRhUShAKUO
         0SWpzkOhxg6esE5EB+oNkme7u+CGGmGqeGv5eMoPICwWG7Z2IuM0wbkviTKW3ysnguXd
         ICyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDpDUsBQCErdri1vWlJ2ZrP2JWNQuvwvc89FSaVzkPc=;
        b=SJrvqFMXM32+pXQu7B4/C1x7oJ8PeGYnoPmAYqrJ33qDtD9/jpHLq1nCCThVXVg96Z
         wWg5XVpQV29DDnXYZn5XWSeEcHwddqM2KMo24TCf9d/BpzkZBz6rMSLtMiGmWG2oUInN
         TJzux2QaFus2PetrNdY0NLSFb0ZFedQZKHdoeBa8UVirEeCbPkgfZnc7tZUU4+nQWmsD
         KrtsCYC5ieveCNVEkCoA3CJ3KPLX1EEwMgP1IU0jrkXsDM7C7d6aVY2pmWqcK4jGIiC2
         Uuvo/0YdaKhCuaoykb/KMHzsgKygbAZxq2UEFuAjrYvosFY2MRnRpvqaomE79mEgwRGP
         bnmQ==
X-Gm-Message-State: ANoB5pmKPYAfesQ9J46Vu1q9BgDqHQ5/cAPQkXREWmZlc9H04R3ZwWH1
        hDZYAes9lvm4Yi0R8nyleFYKBO73KEdmyq5Au+tnmHBdFUU=
X-Google-Smtp-Source: AA0mqf4YkYBgESzTQcy049MeTIRXV8aYbR0uqGRUPZ83rfqGgyWn9E04NPz7GesBnQpuG2Cf7v/jzpa2e37XstLC6aI=
X-Received: by 2002:a67:eb11:0:b0:3b0:c9bc:7abe with SMTP id
 a17-20020a67eb11000000b003b0c9bc7abemr1027027vso.61.1669736985796; Tue, 29
 Nov 2022 07:49:45 -0800 (PST)
MIME-Version: 1.0
References: <20221125181158.67265-1-andriy.shevchenko@linux.intel.com>
 <20221125181158.67265-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf14Q7_gMXaK+hZ8PdV2U5GiL97QRc3SGKLPqmEuSyDxA@mail.gmail.com> <Y4YbkUX+bTM5ZEGg@smile.fi.intel.com>
In-Reply-To: <Y4YbkUX+bTM5ZEGg@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Nov 2022 16:49:34 +0100
Message-ID: <CAMRc=MfAJpcvCj+NZcg554XC07VYXAb2p9vb+fq6x_O4j+trjQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Introduce gpio_device_get() and gpio_device_put()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 3:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 29, 2022 at 02:54:10PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Nov 25, 2022 at 7:11 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Introduce gpio_device_get() and gpio_device_put() helpers
> > > and convert existing users.
>
> > This doesn't apply to my for-next branch, can you rebase and resend
> > (just this one, the other is applied).
>
> The problem is that you don't merge or cherry-pick fixes into your
> for-next branch and they are getting diverged.
>
> In PDx86 subsystem we decided to cherry-pick the fixes into for-next.
> Some other subsystems are doing back-merges (but I remember that Linus
> T. complained about back merges, although I dunno if it's still
> the case). Some subsystems merges their fixes into for-next, dunno
> if it's the best practice either.
>
> That said, this can be submitted after v6.2-rc1 is out.
>

I do merge tags if I need to. Normally you'd mention any requirements
for the series in the cover letter.

I have not sent any fixes so far in this release cycle BTW.

Bart
