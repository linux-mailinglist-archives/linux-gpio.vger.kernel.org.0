Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C347D6299AE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 14:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiKONI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 08:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiKONI6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 08:08:58 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6C211A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 05:08:52 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id c26so4903900uak.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94QXdC69iZv8lNQZuFyoludJBk+DvDEJu1OgD60oB8w=;
        b=1ApRXucfeUcaea+IGxJPyJyI/c+pccNcVMIcpxnIBvLEIyJmCQ2CFZR9E73oRBw6ey
         NpDSeYgVy6anRqNs5IPLLJTUornf8ENxE/X2ifRWI+i94J2dGFzRD60gwc22vMsJLzi3
         EMgCuJ+s6DgaPxk0qw+7IVxvj6JZvLeoFP7Pg0vQjWcOsP35zJ657aGW5dE/kqH9Sb+D
         exD0TRCpkg60FvITTXc8xJ/AtRh4e27schjCDW6q1O6yQdNfrY+NeYx+Z2RTI7ir7Idh
         F6teXXjK3Cfc8VrKe7O8E+1OJfjQzzir8ssbEDKXhVV2j4m+hWPBwbJPRWjR7UoTREPT
         p80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94QXdC69iZv8lNQZuFyoludJBk+DvDEJu1OgD60oB8w=;
        b=Rql889O+PUiwjlp4qlSByIU7LgMvbnS1uy7MAWMJicUkAKSzCFT4YbntoR/z9FIqIY
         boz+302GSTmICCYpWOoE0lPurI5QjDZx1sHGObmRe3gTgO36I71BloyosrwvP21breEy
         MCw8T43DR+9hfNyFSZJuJO1CZ9bCF9ECG4gio9F5aICpB0N5BJranzYixNvtrV9cpGSu
         L3klM2qffdCb0U6KlX0tV58WXEBKP4AG5jsFZqOW90j8l/wlph9rNI4BS/JiRVqbyQoU
         sSutJHFrI/SvD/xCePyHyDforbYXes4K2pI8qJJrOkMw4/AkyWM+0ex1Te8q2RWVYHMz
         XLOg==
X-Gm-Message-State: ANoB5pmew1hXX32SF9Hv/97sPNvdwdlZs4UwNWDsdDmsmjIo0hHYboWf
        rSvd0es7BPMv4JAg/h7q1A5ZPHQ9qlC+cGH3JkFY+zMmwTA=
X-Google-Smtp-Source: AA0mqf7fbosupX6wqBPVx7ZMSuSjP7tHZis95ZH6xGGC2FyR0lNTzEeqScFgiIsrJFUpfnm23IfsZz2KreW5KE1WxUY=
X-Received: by 2002:ab0:1044:0:b0:415:715c:1e70 with SMTP id
 g4-20020ab01044000000b00415715c1e70mr9412580uab.81.1668517731792; Tue, 15 Nov
 2022 05:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20221114040102.66031-1-warthog618@gmail.com> <20221114040102.66031-4-warthog618@gmail.com>
In-Reply-To: <20221114040102.66031-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Nov 2022 14:08:40 +0100
Message-ID: <CAMRc=MeSr9EA4dj1J3b-UoGqo7S-Es144pyTqG6-P1xpV2W14w@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 3/5] tools: tests for line name focussed rework
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Rework the tools tests and expand to cover new functionality.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/gpio-tools-test      |    3 -
>  tools/gpio-tools-test.bats | 2369 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 2284 insertions(+), 88 deletions(-)
>
> diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
> index 234f9bd..1a012dc 100755
> --- a/tools/gpio-tools-test
> +++ b/tools/gpio-tools-test
> @@ -37,9 +37,6 @@ check_prog() {
>  # Check all required non-coreutils tools
>  check_prog bats
>  check_prog modprobe
> -check_prog rmmod
> -check_prog udevadm
> -check_prog timeout

We do use timeout in the test-suite even after your changes so I'll
keep this line.

Bart
