Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172F763839C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 06:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiKYFsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Nov 2022 00:48:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiKYFsf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2022 00:48:35 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E4822285
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 21:48:34 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so6766229pjk.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX41jzwNkqktxN2bkh5NR+atutcooNQOYE8y1WlTrjc=;
        b=ljoyHPhTNgHdPFb5rpZrCUjE2v7NF2X4pGTUlqvo8eSGaRYrCfKQvoDOCFanHwVLBK
         yntv8dHKjoNRFPBWd4ZrNJP2j3vRSq9SJW3YmEqDxx1yp8ZwbSia3MXBtnAHDetuom5c
         h7J1G/9txkjIuyW4OMqskP9nMYcK7oWRYnFrPWeWVSBaQETGREqM7U+GdwIy5xTONVMt
         J2Q63VufYaNZX2iHrQCs80pn5culEMAlnhk+NrU0KPjl52odmI6lF36e1jFKtihJuDwt
         MorNyRIIUcyLOy5ec0Yjb0rl2wjKmOgU+AItTgKXrfXw1G2JH2AsIp8Niftxm9lB+C3g
         etxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX41jzwNkqktxN2bkh5NR+atutcooNQOYE8y1WlTrjc=;
        b=VLLD+KwsFtkcehz6bLcPzlhYIvq9KstUovx1DHLGRw2thkP+E9lg9IeqhTSACjL1Qv
         IPxE6ppKjqzLDc90jfMLavDHIm/06RQTRHNewMzuX7H2P6nhxwf0X/v3xyVskP/etTbm
         Z4RjeElXY0fSQUie4zbSHW8JFroRfSasPwTIRsGoDo5nEa7NAFd7ptgrUe+0JidHbYD4
         qrBrhZhybU885xQMiWwCPJ5QWOmLOat/NP9392XuOOU1Vyy6fq1/xNe6fqpXLRpOJbRv
         BRLHeH4auP0aoen3NWx5PDhzRh4G4yzd17qgek5wP6W5+bPxdRXFeD7wln9+acuqk0Pz
         Ej5Q==
X-Gm-Message-State: ANoB5plEJTl1Inj9eevJ6Fsd35DnJX5q5smpgyF2XK79bk5yqy7Iijtl
        mzWAJGl4Ie3bok6bxDO7xo5LNk114TUAww==
X-Google-Smtp-Source: AA0mqf7wpzAZWUiZjhvTevyUDSufic5P4BcV1iHWE4kkxlfM38nHpRAqhu3dqHrZiVwUll6U+qMtjA==
X-Received: by 2002:a17:903:4051:b0:170:f343:ba14 with SMTP id n17-20020a170903405100b00170f343ba14mr16851892pla.70.1669355314373;
        Thu, 24 Nov 2022 21:48:34 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c14600b00187197c499asm2347826plj.164.2022.11.24.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 21:48:33 -0800 (PST)
Date:   Fri, 25 Nov 2022 11:18:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
Message-ID: <20221125054831.dpvbaf7vvdcsghck@vireshk-i7>
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
 <Y39yackN2u7q2Fxs@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y39yackN2u7q2Fxs@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24-11-22, 21:32, Kent Gibson wrote:
> I don't see this as a problem for generics.  Whether the enum is signed
> or unsigned doesn't need to affect the Error variant, much less the whole
> Error type.  The Error doesn't need to respresent the type of the source
> of the error, it needs to represent the type required to convey
> information to the user.
> Just accepting that the InvalidEnumValue variant expects i32, and casting
> from u32 if necessary, seems appropriate to me.

Right.

> Unless there are some
> extreme values you are concerned about - but then you always switch it
> up to  i64 ;-).

I was just looking to avoid explicit casts, but as you mentioned, it is probably
the right thing to do.

> What is the problem that generics solve - that a subsequent bindgen or
> gpiod.h change might change signage on you?  If so then cast them all
> - even if the cast isn't necessary at present.

That's what I have done here, to avoid future breakage.

Thanks.

-- 
viresh
