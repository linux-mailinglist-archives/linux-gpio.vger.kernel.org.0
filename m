Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815374D99A8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 11:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346143AbiCOKxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 06:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242131AbiCOKxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 06:53:46 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9532CCB7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 03:52:34 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w25so1616edi.11
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMbdhTCxEPIdbmqgjfzq59Qkrn4bIKlCwaPc28DWfbU=;
        b=gE7YPmo6WwKAW0U3ZywPuUuhPBwRCgWHUfHnnTLbEuXHMgp43InFNzCi792qaUrWOi
         gNfTK5pxXDO1sc+DLNzJPadb8cpyxvpU8UdgQlXbJjGuiYM2YfD20dKwDbrR/gaToPBY
         JF5wkloWGTPNhUHZB7XayYQdFuYFMAUx2y7sFj7ic/s1pNY8truS8Kz/Utpt5aW2ppRD
         DYkEefvIIEuesENq2HtyCE9gihI/onqrmrbXVCw1qo0CXBgc5RNSM+e09zHteczr+KdY
         LWQ1RUk88w/2tNl69vbBiC80jcQtE+c+pYDc4TqMQB2VOuVoMVqJ3NsSHzgzdkuJq+KA
         5DqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMbdhTCxEPIdbmqgjfzq59Qkrn4bIKlCwaPc28DWfbU=;
        b=g/135PPsdNKWV3mjc8MZUIMkogxJmMeocL0Onuo7A9kSs7IrlxG2OjXLSk1t0DF0IE
         X6dxzyh+a8HjixexIvycyhFhqWX+lBjET84m7GYKEaLCoTgiH9oVl7F6ySLTeJGVNZBn
         DyAXJ8ZJ7qDTreVdKFs0s/KF0V85mPPq7AEjhrPNdWklUYnS4f2fmjMiTMb1QtPTEX3S
         q9sp/dxruWcwMjM56fBt+R7J66dlwHQ8x5viJae/ltZonbB+vC5qcR97fci1Tw16LxMT
         sVyZ22votUAzoP+5tn7ISkyM5fwhFhBe4iQOm0Gp8q97Abdbz54UFzkMj6mcWa80ktHj
         bmkA==
X-Gm-Message-State: AOAM532ymamGaf3/yOu/pkTdzdvKJEC0/tuOoK6Dk6HkAzU3kGKoSgxD
        qNqgT3mimBEWlyqHAv6/YYyuuvLjx1bgsMky9Zi+adzbIbpRtJrX
X-Google-Smtp-Source: ABdhPJymG6Qkft9rSyzDGigY/5+XYsbTgdsyVSLYnc8lpjQFOQbplNJpv53cf0zp4cJdVsaUAYFtEKszIOw97XJgDE8=
X-Received: by 2002:aa7:c982:0:b0:416:1dd3:7704 with SMTP id
 c2-20020aa7c982000000b004161dd37704mr24517595edt.69.1647341552692; Tue, 15
 Mar 2022 03:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com> <20220311073926.78636-3-warthog618@gmail.com>
In-Reply-To: <20220311073926.78636-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 11:52:21 +0100
Message-ID: <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 2/6] API: rename gpiod_request_config_get_num_offsets
 to gpiod_request_config_get_num_lines to match line_request pattern
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Both gpiod_request_config and gpiod_line_request contain a number of
> lines, but the former has a get_num_offsets accessor, while the latter
> has get_num_lines.  Make them consistent by switching request_config to
> get_num_lines.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

IMO this doesn't make much sense because we still have
gpiod_request_config_set_offsets(). So now you have set_offsets but
get_lines. At the time of preparing the request_config we're still
talking about offsets of lines to request, while once the request has
been made, we're talking about requested lines.

I would leave it as it is personally.

Bart
