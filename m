Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE6D5632C9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiGALoB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbiGALoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:44:00 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A4883F01
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:43:57 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id l6so2126098plg.11
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmrEyb/vcMOj8X/KVOCoTT3JrzJ8cr3oXaXnqMa7EvU=;
        b=S89l3CUcLcdKXBEN+EKKHjmz/FkMzzseffgZZTzDF8Xl91jtlaAL4Ad4I+gBf30ayg
         EUtevnhQzkbPdxEt4ETCmwJmifU0twVhS3b7uFa12HydsqitPkASnNq2sX0bwaSswgOJ
         ZEnEeOQsPEpivrgGGGdhVxqwlT1c7hU5cHUI59w5EZ/VBER7+WwWLNiqamDuse0vKZm5
         SabibwmqeSKRrzu7a3Br6RDWiP9bl6YrxOt3OLa3mlU86KgPjxF3gj24uYPWh6v2FN9M
         OGCizWkOvav13XL1PT/buIoY1wyElg3TVnOPDMNTbydcGe9Q1Rc/N5FE6W+4TmyS9ws3
         Hf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmrEyb/vcMOj8X/KVOCoTT3JrzJ8cr3oXaXnqMa7EvU=;
        b=L30URNocnapij5Wl3Gbdt9iD+OUk0ONGl0NrnJotDsUP1vqEyZECYLnu74mgODBqXB
         rmKQ7+g38ouL7UWndmydrc2o0jIEYrfvpc/oS4XnxX83q0gCWVe9jrX/elkbZU+RN0Lx
         bvwXFNEyM3SgJRwigYOc3yMF5Hhv0r+wnBUaACDcewpIi9hQZGyCYYS62iE7kFoWt+O8
         t4rWcEHV8LeIBIZuyxHcWQXqTuGazDFa6QtGc9NmVCALsizH+YJufKsD6QwJuGbWU4HL
         K8OnL8GhBhjVikZlB+MAr34xN3fuIinf+3w3FD8aDQxkJKO4G+x1XSM/pVWr45bsCnWE
         +xqw==
X-Gm-Message-State: AJIora8GUjca2JT20WGj+dTx/6FI0gHl6RCD6GEce+bVt+KprxeSl8VO
        cwNtbbjCgJLTK3iWEDef3+E=
X-Google-Smtp-Source: AGRyM1vgxyF019zBH8d0TOay652o3CiHBuC39X9vzGct458z+s7nU+K3M1xxGaSGTIGPD3NGPaN+NA==
X-Received: by 2002:a17:90b:3b82:b0:1ec:ac0d:5d3b with SMTP id pc2-20020a17090b3b8200b001ecac0d5d3bmr18274898pjb.158.1656675836769;
        Fri, 01 Jul 2022 04:43:56 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902eacc00b0016370e1af6bsm15378517pld.128.2022.07.01.04.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:43:56 -0700 (PDT)
Date:   Fri, 1 Jul 2022 19:43:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH] misc: make gpiod_is_gpiochip_device() not
 set errno
Message-ID: <20220701114351.GA41317@sol>
References: <20220701110056.58502-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701110056.58502-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 01:00:56PM +0200, Bartosz Golaszewski wrote:
> This function should just report whether the file indicated by path is
> a GPIO chip or not. Let's rework it to not set errno. Failure to open a
> chip should still report errro numbers like before.
> 

This is will break my tool patch, for sure.
My gpiodetect uses the errno behaviour to give a clue as to why a chip
might not be available to a user, and that work was already done in
gpiod_is_gpiochip_device().
There might be other places the errno was propagated as well, but
whatever, I'll sort something out.

Cheers,
Kent.
