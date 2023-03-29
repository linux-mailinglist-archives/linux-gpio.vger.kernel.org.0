Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708C76CD88E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 13:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjC2LgX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 07:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjC2LgW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 07:36:22 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28BA40F2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 04:36:20 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id k2so14597867pll.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680089780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzbg6NXbBZRlpYJZrTQb40QaBf3n4ctJf1toDSajJyU=;
        b=ZVn94qBM2lpe2NxYRdS/m7Ykw4s6sPGrZ5u8C9YOhO7NP7nciGPmgDVc/xi14SPV4j
         IpS1nl28BhHhvsKWQR8nu6ZcnAOEzqzEtoMnRmjuJxkZUQzPVeDWXdAwZ9tIDj2MqFmJ
         4ox3xvmV0xkOoPX24gpePRFhfoVqlYhMqhuSUVDdegCCS5NwksHiL89JxcSoFJnGejQY
         AtJvpAkUP1CV1QdKuIttypleF7sNwOF9akv+2aiIW616H+zhhT/xrf4j5I4zciczKrn4
         sZ2UNWAul+7m50yGSBACDpGRDeSeNOIlurFabZ1ARP1uUFnf6Xj42xuB0Fx4heOzC6rE
         oRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680089780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzbg6NXbBZRlpYJZrTQb40QaBf3n4ctJf1toDSajJyU=;
        b=7A8KE1IRV/mSRxpno6z6faq8skCB0SkSyNZNBNxl8RUQS1MW8QKWHgEUgeAkpJBZCq
         DzGgl9OQoAyJcA+tNoI8QS/aC8+Ec0raoaEDxODPbN2x83iwRBWsAohwyLUIpkmfwk9W
         L7wPXf+MWKHVszcbgPWGOdOziGHPnwInF1RqdE0l0hLt1/BI6MC3m8dTmkMQu5TdkU7d
         1fGe7jvAcT4UsNppBFeP1007EEy4R9sEkEqDibJ6Hk/M/+YRcpAU4aEmDPZU4FTfymob
         wphpYYROHyz3cUh/MgxZdIGmKWzNL1BkcNuKO1OV7GVFPRwD1GLVGGEltU1hCYK+wTcx
         9RGA==
X-Gm-Message-State: AAQBX9f+UXGEQsvYuhhDfmPVoTE7gCZorOI5Mdzc13GSAJwVGOct8lCE
        +9fMky3AeR7iohfm3Spi97pRiVYmwEs=
X-Google-Smtp-Source: AKy350YWE+ftrbPnIlFmS+27i+F/KYS0GGZRIcVBdlp7S/F7KA+G6c4DuhAUrhsi+ZhEE+L6hAUGMw==
X-Received: by 2002:a17:902:c941:b0:19c:e405:4446 with SMTP id i1-20020a170902c94100b0019ce4054446mr19942074pla.30.1680089780280;
        Wed, 29 Mar 2023 04:36:20 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id ay9-20020a1709028b8900b0019682e27995sm22806305plb.223.2023.03.29.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 04:36:19 -0700 (PDT)
Date:   Wed, 29 Mar 2023 19:36:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: libgpiod API v2 release
Message-ID: <ZCQir3oDPBGLfQfs@sol>
References: <CA+zEjCsqpAffGqJPJrsLJLeyrJJDch_-Qctb1Zxi+j5JU9Wg9A@mail.gmail.com>
 <20220714031036.GA74086@sol>
 <158fba21-8d5a-ac56-ae02-2694ea9ae388@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158fba21-8d5a-ac56-ae02-2694ea9ae388@canonical.com>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 29, 2023 at 12:03:31PM +0100, Dimitri John Ledkov wrote:
> Hi,
> 
> On 14/07/2022 04:10, Kent Gibson wrote:
> > On Tue, Jul 12, 2022 at 09:48:45AM +0200, Alexandre Ghiti wrote:
> > > Hi,
> > > 
> > > Ubuntu kernels do not enable GPIO_CDEV_V1 as it is deprecated, but the
> > > libgpiod package that we ship is still based on the latest version
> > > 1.6.3 which does not implement the API v2. So I'd like to update
> > > libgpiod, do you have any recommendations about what branch/sha1 I
> > > should use? Do you plan to make a release that implements the API v2?
> > > 
> > 
> > Firstly, libgpiod is Bart's library so he is the authority, but this
> > is my understanding...
> > 
> > TLDR: You should keep GPIO_CDEV_V1 enabled.
> > 
> > v1 is deprecated from a development perspective, so all new feature
> > development will occur on v2, and new applications should target v2.
> > Existing apps targetting v1, be that directly or via libgpiod v1.6.3,
> > will require GPIO_CDEV_V1 until they migrate to v2.
> > The mainline kernel will continue to support v1 while userspace
> > transitions.
> > 
> > libgpiod v2 is in active development, and should reach its first release
> > shortly.
> > Note that it is NOT a plugin replacement for v1. It has a different API,
> > for similar reasons to why we had to switch in the kernel, so apps will
> > need to be actively migrated.
> > 
> > I wouldn't suggest making any effort to package libgpiod v2 until Bart
> > makes an official release.
> > 
> > Cheers,
> > Kent.
> > 
> 
> libgpiod v2 is out now at least upstream, even if it is not yet packaged in most distributions. But this brings newly identified loss of functionality that seems to be impossible to resolve so far.
> 

You are confusing uAPI v1 with the long deprecated sysfs API.
uAPI v2 is a functional superset of v1 - anything that can be done with
v1 can also be done with v2, and the ioctl approach is the same.

But replacing "v1 API" with "sysfs API" and the following makes more
sense...

> With the v1 API, it was possible to do fine-grained access and mediation control via LSM. Specifically privileged process would export pins, and then use LSM controls to allow rw access to individual pin path in sysfs to otherwise unpriviledged or confined applications. This is used a lot on Ubuntu Core with snapd and apparmor, to mediate confined applications (such that only one application at time has access to a particular pin, and to ensure they only have access to pins they need).
> 
> It doesn't seem to be possible to do such mediation with v2 api, as I don't see any LSM hooks inside the gpiochip ioctl implementation, and the character device is for the full chip, not individual pins. Similarly, mediating ioctl calls requires a lot of gpio ioctl specific knowledge (i.e. introspecting gpio_v2_line_values masks and what not).
> 
> Thus right now, I cannot migrate to v2 api, as I would loose confinement capabilities. And there is external pressure to stop using "DEPRECATED" config option in the kernel that "will be removed after 2020" as per comments and Linux documentation.
> 
> What is the LSM plan for v2 API, if any?
> 

Here we go again.  sysfs has been deprecated since 2015, and yet you are
only now looking to migrate away from it.
Please specify exactly how much notice you require not to feel "pressured".

> Ideally, it would be nice to have lsm hook to check/filter operations on allowed pin numbers.
> 
> Or for example, can we add ability to create filtered char device that self-limits itself to particular lines only, within a particular chip? As then the usual LSM could mitigate access to that, without specific gpio ioctl knowledge / introspection. (e.g. /dev/gpio/my-gpio-pins that only allows access to gpiochip0 lines 0..100)
> 

Use the GPIO aggregator[1] to create a chip confined to the pins of interest?
Then you can use LSM, or whatever, to control access to the chip?

Cheers,
Kent.

[1] https://www.kernel.org/doc/html/latest/admin-guide/gpio/gpio-aggregator.html

