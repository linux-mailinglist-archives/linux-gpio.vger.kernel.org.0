Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAF36457BB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 11:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiLGK0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 05:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiLGKZx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 05:25:53 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021BD4A598
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 02:25:22 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so1036797pjj.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 02:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SsgrsVRGMc3TmLSBVbNv5t941dAvhsMfBD8d1V00ozA=;
        b=KD2vTnjV/yeZXmqbxpIkBmCyAkHvHHDs8S4/1K9yjD/pciLOuG/FuwE6uAM481vccW
         RZeHVHDny+22xPKkNaF7+jZl1jLKZ+q0C2gwLY7TU4SfAOzvLi90vkdrTfjTFYa9MGU/
         0XzfKCUm5PJqgFXTEQ/mNuTC7pTmSfhxuONQ8cGvBNsTfIoXh48o9Qqi6+cuNSKJlh1S
         bQ94+aEASi45IVynT4pIQfalo3iTxaF7ynaHbSi5aQ0WB0i55FFR7Qt2Ld1unTxBvATV
         VKCKjcS2nz5dcnbmr+AkNrzKP+O0REaMegycSpLwq9NbltBy4U09V7XttWkOd0hPLqWP
         v6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsgrsVRGMc3TmLSBVbNv5t941dAvhsMfBD8d1V00ozA=;
        b=XFc3QICp0zcHRJLP+SaisRGXGSGcqBcQN1uct+xBhCi8ic9UM8ksSq3ECEu0wx4ut/
         QQnyDUwteghJSEY40eJW3rO4lQZeEdg4elKihMAcaaoWPlqDHZYxIASpEwFpvKHVQkVB
         3vjPMGkz3g9/dXrd2PQMCdXnUhVIRXsFW/lFUxJzK59R9hHrhmsWOLLWzIs8Uli0Kxp4
         uw/QLJSPh9hgGum6pJOko2wIMkZbaP4boI6pC4exLPWMffR+3x2dxNYa7mVgqPqpSt8E
         iN+0L68Mq5tWVL6UBfWcRWcdWPu5PgWQbMR9MVGPIupNJTh050WwlpkI5YID7GxIXzc5
         CfHA==
X-Gm-Message-State: ANoB5pk+wRAuhXyZ+cfBsvj8uNSUnV7m4Pr7c8ltFrAal3/otPXCFLyj
        r4l8D9+Fz/mJt6FezHvRHRHW915KKk4=
X-Google-Smtp-Source: AA0mqf4vPrSqVm0XwfDnpuq7gqt0W4rtIWQrJKMnnBACVBOaEx0iw/475qrMNE6xT8DOZaOv//hl3Q==
X-Received: by 2002:a17:90b:4b42:b0:20a:e38c:8c5f with SMTP id mi2-20020a17090b4b4200b0020ae38c8c5fmr105197169pjb.217.1670408722480;
        Wed, 07 Dec 2022 02:25:22 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090a780f00b0020c899b11f1sm885006pjk.23.2022.12.07.02.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:25:22 -0800 (PST)
Date:   Wed, 7 Dec 2022 18:25:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] tools: gpioset: remove pointless whitespace
Message-ID: <Y5BqDnIG6avgckW2@sol>
References: <20221207093937.62048-1-warthog618@gmail.com>
 <CAMRc=Mf1JjryzGY6zYoUY+a_BSrU81TWfJS1EHrof4pEFvv6Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf1JjryzGY6zYoUY+a_BSrU81TWfJS1EHrof4pEFvv6Jw@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 07, 2022 at 11:16:19AM +0100, Bartosz Golaszewski wrote:
> On Wed, Dec 7, 2022 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Remove pointless whitespace in interact().
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  tools/gpioset.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/tools/gpioset.c b/tools/gpioset.c
> > index c49d229..68b3922 100644
> > --- a/tools/gpioset.c
> > +++ b/tools/gpioset.c
> > @@ -842,8 +842,7 @@ static void interact(struct gpiod_line_request **requests,
> >                 }
> >
> >                 printf("unknown command: '%s'\n", words[0]);
> > -               printf("Try the 'help' command\n")
> > -                       ;
> > +               printf("Try the 'help' command\n");
> >
> >  cmd_ok:
> >                 for (i = 0; isspace(line[i]); i++)
> > --
> > 2.38.1
> >
> 
> I've already fixed that automatically with my clang-format sweep of
> the tree, thanks!
> 

Haha, so you have. Nice.

Cheers,
Kent.
