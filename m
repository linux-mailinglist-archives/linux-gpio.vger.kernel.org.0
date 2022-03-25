Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9CDE4E7583
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Mar 2022 15:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345512AbiCYO7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Mar 2022 10:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242549AbiCYO7W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 10:59:22 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A26552E42
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 07:57:48 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n7-20020a17090aab8700b001c6aa871860so8569758pjq.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KbUrGwwAFUrLfTmN8j8Lz48OluzfhA/awjZu0N2S7ig=;
        b=W7amjRccihJLJ0XXudKxIdARIUyp+v9i9s0JGOWPzVOy3v3IajA9FHugZSplApA4+T
         2BbaQlIXG2E7PvS/q4SoOqYHsPWVt6E802sctbxIUuFv7gM/0MsJvkj4BzpfyLl097CV
         Nj3ki6aWxQjcp6221GKZUMGiVoPdozd+1GxrHXwo4TUQq/VhjmUxc8h9xKLomtbOa6ut
         8uGv9qFPiYkE0zVFt8l23TelSA97+EPcNvkeY259xoZqTs/DbKCRGgJV52y1Q5U+eFSR
         8CzHmSNLHTgv6YR7oFo84VzuFxHbzv0T1vyOOFQGwOkdarrhKAZA1tIozDgesl6va8xM
         ydrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KbUrGwwAFUrLfTmN8j8Lz48OluzfhA/awjZu0N2S7ig=;
        b=WmtshEhvrimqyRyd15cdd/FWocPYtxtddlvTP2/jxUKAwRb+PQcqrcQgSJOJdxFlEm
         OTPXEUuBlhSbxCsJaTxxm5wgzpeLrpsgFK/EAH+qVYQ3zT0X/0cLUlRK/WGbEpnJjXug
         l10auynmPZwyXYATsp5YMOSw/0KseXJVGlF0yCqisseHkBxIshbCLgh4gwsHmj85VMvF
         4vnL6G+qsbtsKqvCMVBOuaZxGRVPhaHqeSaKhf24tkmYwj8yEPLO+S/nm3Jw3lUfl+Te
         oDFgBaMoxr5rqXfkozsegGdBNeGWHPF/izoZiNyB/mMigMKxd2emZFGPFZP8Fc3kqYaU
         m2vQ==
X-Gm-Message-State: AOAM531miAvLxBzC2qvwv5BgnWLzLhp2OqQfw1tZ9XYzxp4T8zUrJtV5
        5GNUd7pKWG+Infvjvlk1DM5FftUXZaSmyw==
X-Google-Smtp-Source: ABdhPJyIYI4LOybVqNLqXbV1gIL85b7sUwtboAn8HKnl/twooNUWZkZElZWy3k94Vqnc+AdCnSp5xg==
X-Received: by 2002:a17:903:32ce:b0:155:db89:e3ee with SMTP id i14-20020a17090332ce00b00155db89e3eemr2191225plr.164.1648220267670;
        Fri, 25 Mar 2022 07:57:47 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id q21-20020a63e215000000b00373efe2cbcbsm5675740pgh.80.2022.03.25.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 07:57:46 -0700 (PDT)
Date:   Fri, 25 Mar 2022 22:57:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod] bug: pull-up does not work
Message-ID: <20220325145742.GA46960@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 25, 2022 at 11:02:07AM +0100, Jiří Prchal wrote:
> Hi,
> since in debian is 1.6.2 and pull-up doesn't work so I cloned git, branch
> next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, same result.
> 

You mean it doesn't work for you on your platform.

The libgpiod-2.0 branch is a work in progress and should not be considered
the place to go to find solutions to problems with v1.6.
Not that I'm saying that the v2 branch doesn't work, I'm actually pretty
sure it does, but its purpose is to switch to the latest kernel uAPI, not
to provide fixes, should they be needed, for v1.6.

> ~# uname -r
> 5.17.0-rc7_cpm9g25
> 
> floating pins should go with pull-up/down
> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> 0 0 0 0 0 0 0 0
> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> 1 1 0 0 0 0 0 0
> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> 0 1 0 1 0 0 0 0
> 
> ~# gpioget -v
> gpioget (libgpiod) v2.0-devel
> 
> Whats wrong with it?

You forgot to mention which of those pins are floating.
Or what gpiochip3 is and whether it supports biasing.

So does your chip support pull-up/down?
The kernel can only enable it if the hardware and pinctrl driver supports it.
If the hardware doesn't support it then attempting to set the
pull-up/down is quietly ignored, which would be consistent with what you
are seeing.

Cheers,
Kent.

