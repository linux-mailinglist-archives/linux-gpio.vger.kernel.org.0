Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E60765E82
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 23:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbjG0V4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 17:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbjG0Vz5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 17:55:57 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E533595
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 14:55:35 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2681223aaacso927938a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690494932; x=1691099732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KuRwDXHlppu6VdIbQ1lrIm9nchJ1PxANOhdilyr3XJc=;
        b=OtD6qwiE/xjRkFYXroUQPdydWH+cBSnKGq+KMHxbhX3JTdFgjVa4AuhFKiecvcRhPh
         UbqFiXWsl+H3ujiCTX0a73paetUKbqntI/xPMhDUqQtAziJBdHi9MFgJyy7/pM5JKnHB
         ZemDcs0H2RFu5XnNaVcPnc/n7gY0ERN8wDOt8W58n4anKPzRW7nshudm8Fz0CcG/xa3H
         ZxyUm4+9eZ79kuijrVsGvtbc3bPnPi32fpGiDgXkxhNb7yrkHCdT3rnlfWWZDtVUgoQP
         cXihCgonSSDgT56fvV+dTTMS5PHNo1BUA5E/Um6TYKoyXUiRCdRB+W472yrsXli7LsKo
         vv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690494932; x=1691099732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuRwDXHlppu6VdIbQ1lrIm9nchJ1PxANOhdilyr3XJc=;
        b=FAUUGe7UtlxjvUx1ULZezeDhd+gQ3meB4DwDsZgVu2SkZ4buFSlA3aT1f+a8MD8i5V
         k0EJMKydcPKBjDnb94reV7S0mKI/sm5vig91rDQdrc3+sJtbuOhecrJFE+YTQe1B7oSD
         Mn9z/kpV9j8+W1b4akzEhRyi1XF8k9Tf7ljxdY4/cEGgKmYXdhu50/kEFYwPkmcXGn1s
         snq6BORwxkWTwPMC3hO+CoLEy/ynpEyjwEBRteQwYvYKyyCeGJoODvNR6udAwTYdpghA
         itkd+yFfBKXH1VGXiATlRJ2Wt5TeGIrfqerlGcowmIHMSMbPTHiILJV+ID3FacCYipxd
         1oxA==
X-Gm-Message-State: ABy/qLYj2q4NkHUTm5ZdSNYVydB0+iicHnN/iHMEIPDimK30H7efTZRi
        9NGRdb+WLefu8Zrj98h7TUi1JlkXlj4=
X-Google-Smtp-Source: APBJJlHrAvySVS/8BZwbZZw4swkFlPOlDiKcuJUj3JZm2h2yhkLY0LFrD1lcd/hHNeD1UfGT+zxhaw==
X-Received: by 2002:a17:90a:1285:b0:268:5aaf:fbe with SMTP id g5-20020a17090a128500b002685aaf0fbemr4898353pja.10.1690494932022;
        Thu, 27 Jul 2023 14:55:32 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id mg20-20020a17090b371400b00262fc3d911esm3183902pjb.28.2023.07.27.14.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:55:31 -0700 (PDT)
Date:   Fri, 28 Jul 2023 05:55:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZMLnz25brQvcwBVW@sol>
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol>
 <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 10:17:05PM +0100, andy pugh wrote:
> On Thu, 27 Jul 2023 at 21:54, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > That is not how the line_bulk API is used.
> > You don't request the lines separately and then add them to the bulk,
> > you add them to the bulk then request them with
> > gpiod_line_request_bulk_input(), or one of the other
> > gpiod_line_request_bulk_XXX() functions.
> 
> I did try that way first, but it didn't seem to be working for me.
> I am currently upgrading the system to Bookworm (gpiod v1.6) to try again.
> 

If you can repeat it, and ideally provide a failing test case, then we can
take a look at it.

> > Btw, the primary use case for the bulk is for when you need to perform
> > operations on a set of lines as simultaneously as possible.
> 
> I am trying to do things as quickly as possible on a predetermined set
> of lines.
> I am experimenting with gpiod as a replacement for an existing (and
> no-longer-working) driver that is part of LinuxCNC.
> 
> I suspect that gpiod won't be fast enough, ideally I would like to be
> able to write to 15 IO lines in 15µs. (because the code will run in a
> realtime thread which can't overrun)
> (There are other reasons that it might not work too, you can probably
> think of more than I can)
> 

Depends on what Pi you are on.  A Pi Zero would struggle, but on a Pi4
that is doable, of course depending on what else you are doing.
That is based on benchmarking libgpiod v2, but I would expect v1 to be
similar.

On a Pi is it significantly faster to go direct to hardware using
/dev/gpiomem, rather than going via the kernel as libgpiod does.
I do my best to avoid using gpiomem these days, but if you really need to
minimize CPU cycles or latency then that is another option.

Cheers,
Kent.
