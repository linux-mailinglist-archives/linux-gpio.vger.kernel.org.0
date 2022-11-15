Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC9462AF64
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 00:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiKOX0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 18:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbiKOXZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 18:25:59 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E516027909
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 15:25:58 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d192so2653388pfd.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 15:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykKZ/GlbR/DHvtrUjacpEbQJhuiu/p2vp0ItUpiMSsk=;
        b=C1ikSsEk7mcKhYHOdsFltIsVkotY1gSbroVeldS/j6a/lYePLoFYJDNDqlGfcYoBGK
         GPDMSzgfkZt7sz2TgxMkyALNMBl5cf/wPI8rhcuzoX78/ZqxOa30ELcicC9BRUHuRj5g
         fko67WaD5iHPVYkhrnfWAyniV8XLxNTIJTggYi0N4VrKNS8cKTAerfDX4S07Shuhd//s
         24GR1HV94KAirf9jSlHISEFkfCycSYPqI1N64/g1+gs6aKrHusg8VNFQvPZp5Wnb58q0
         oYDv2G0aNjoyjk/QEDhRYe/Ijr/T4cMVTdQlvMDO5vhrBGbMVxNrOOwnRISRg0giBAMF
         viFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykKZ/GlbR/DHvtrUjacpEbQJhuiu/p2vp0ItUpiMSsk=;
        b=dAzf3mZCeTwzX0V5A2yX1AUj0SHt7e7CRLBVLY1lzcRVuzOq4+UHTx+01IE5O5O591
         yF1D2UyCqiQ2BHN2PaAKvG0fqtJ56iEziiceUVybLjBzj24Jk7dNGJQ7xwbAdLFj9B0u
         Db5NABU/oMn+br3+NKgUPED8u1CeM08dkBg+8GfnnYZgw0hDABvvUlaTj7tkmhISXQTt
         Cisf9GLfhptHSmr2ToI11qOxJWlBRABnKmS9DKKkCwvpObAZAIiiAHSdMV5Q6jguPg1h
         1J7YBdvyi8fKZnIXWobeZeEK3Pnigi/ymc0gkDV0iGIYfUDJF9dbp68ptHtqkxSnWx6c
         W3ZA==
X-Gm-Message-State: ANoB5pmdk9gQBdJCuFPfbFdZEzr68vMMCCc3kMKcsDs/FMjcvHO3p1jC
        qOOqqJFkAoCG9hygoJ4acqI=
X-Google-Smtp-Source: AA0mqf4nvXDDW2UO8FEo2QsxzqPFjekd3X+QENh3fKzowtB2uxGYLfmFjUaJ+g5Kh+DZzVLi5MkzSQ==
X-Received: by 2002:a63:f91d:0:b0:46f:5bd0:492f with SMTP id h29-20020a63f91d000000b0046f5bd0492fmr17664122pgi.186.1668554758397;
        Tue, 15 Nov 2022 15:25:58 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id w3-20020a626203000000b0056bc31f4f9fsm9359786pfb.65.2022.11.15.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 15:25:57 -0800 (PST)
Date:   Wed, 16 Nov 2022 07:25:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 3/5] tools: tests for line name focussed
 rework
Message-ID: <Y3QgAfE1EOdCjUAW@sol>
References: <20221114040102.66031-1-warthog618@gmail.com>
 <20221114040102.66031-4-warthog618@gmail.com>
 <CAMRc=MeSr9EA4dj1J3b-UoGqo7S-Es144pyTqG6-P1xpV2W14w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeSr9EA4dj1J3b-UoGqo7S-Es144pyTqG6-P1xpV2W14w@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 02:08:40PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Rework the tools tests and expand to cover new functionality.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  tools/gpio-tools-test      |    3 -
> >  tools/gpio-tools-test.bats | 2369 ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 2284 insertions(+), 88 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
> > index 234f9bd..1a012dc 100755
> > --- a/tools/gpio-tools-test
> > +++ b/tools/gpio-tools-test
> > @@ -37,9 +37,6 @@ check_prog() {
> >  # Check all required non-coreutils tools
> >  check_prog bats
> >  check_prog modprobe
> > -check_prog rmmod
> > -check_prog udevadm
> > -check_prog timeout
> 
> We do use timeout in the test-suite even after your changes so I'll
> keep this line.
> 

So we do - for the scripts to call themselves - missed that.  Fair enough.

Cheers,
Kent.
