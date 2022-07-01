Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2555632EF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbiGALwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbiGALwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:52:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8EF8239F
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:52:12 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id o18so2179183plg.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VYaPnc9SkUK/P536DMUKD89YKZOIzDCnlVAhCDhEOx0=;
        b=Km2o5gUD4uMZ+TlZ/eYzi2q8nBSPfpmI2kuUFD1j/UP0KfogPAAPVdnvlkyrambg5n
         WyJ/EEGTw5uEi1Uj11wWRBna3DhdM7eo8+1qUc4JJmROf/2C5o2hTRoVCChi0Cvzg5ve
         r6Rj/OkHWKN7IMYPRZ/PYHfjeznkvapc1lD6fdEk+UVodY3VI70m/H4BEojQw8Xw/wvF
         uW6CFeMFkGok3FShp1zblmgyiLsnnlkmh35grXy2ELuBPqGMu4PVtxQBRpLFV0H2UtsQ
         02wWouaH0h2xrm/PtwlgmJpnKJcA/xc7LjAmjBwTY3+SQNgCieTufwv8feB8rbGx5m9J
         GCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VYaPnc9SkUK/P536DMUKD89YKZOIzDCnlVAhCDhEOx0=;
        b=QS51t2yz8QGw3q548+0xe8lWzzMx9nlrqE3CObVu84Hn5ll5m0xXGncYX51cm1pyP4
         tqvElSWIv2ABmfCcfCw3oOYhdL+/WIn+8l+caRyxQ2LBjcH82+Dj1SScdX5vRG2j2hsf
         ewPKrP5Mcb1FsLVsssPXFkerVEEJE4WXQWAJg8/benSKNxcrfBIyxZNcJK3+VLLJr4CQ
         fgr2oAbOqImb4OdJPbGXX4QwlX5AtEpqMFwE9jPZOlLoLOd/4jU5OIYXXbj/DLc4AQ2T
         aXB92QrbMuxa4h0RaIhEZvEvZI/0+ie2h3hf3VQxGNIqa1PHs+wXQ7z3Tfyb8g2hzNRv
         sBYw==
X-Gm-Message-State: AJIora873a3rcTJBae9yDOe2v31X/p6dvVD4Qk9mEsUxfXrMEjlZ4RPg
        MvvO5uvvUHVKafT4BfPXZd/p7RnS4t4=
X-Google-Smtp-Source: AGRyM1t/5EHLW2HP3hICDplKyH3v1S7lSzytYcZE4VWowZjVrnCjh816uJ+LGdgXjGS3l4rdAPqRJw==
X-Received: by 2002:a17:90b:344f:b0:1ed:9f:a2de with SMTP id lj15-20020a17090b344f00b001ed009fa2demr17948865pjb.174.1656676331665;
        Fri, 01 Jul 2022 04:52:11 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c3c400b00163f5028fd6sm15438243plj.5.2022.07.01.04.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:52:11 -0700 (PDT)
Date:   Fri, 1 Jul 2022 19:52:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH] treewide: allow polling functions to block
 indefinitely
Message-ID: <20220701115206.GA42057@sol>
References: <20220701110025.58399-1-brgl@bgdev.pl>
 <CAHp75VeG3=uAk6V6MD9soFytrjsDgVnWNK8CodDW+_aY7f5Dug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeG3=uAk6V6MD9soFytrjsDgVnWNK8CodDW+_aY7f5Dug@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 01:10:12PM +0200, Andy Shevchenko wrote:
> On Fri, Jul 1, 2022 at 1:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > All polling system calls have some way of being instructed to block
> > indefinitely until some event is registered on the file descriptor.
> >
> > Make both the gpiod_chip_wait_info_event() and
> > gpiod_line_request_wait_edge_event() accept negative timeout values in
> > which case the underlying ppoll() will block indefinitely.
> 
> Long time no user space done by me, so here my silly question: how to
> kill a task that is blocking indefinitely in ppoll()?
> 

Yeah, you don't.  In a multi-threaded app you never need to - that
thread is dedicated to handling events, and it will keep doing that
until the app exits.

But if you want to be able to cancel the wait then you add an eventFd,
or similar, that you signal to wake the thread to exit.  And that is why
libgpiod exposes the fd so the user can build their own ppoll should
they want to do that.

Cheers,
Kent.

