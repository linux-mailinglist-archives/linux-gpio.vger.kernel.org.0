Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821834D924A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 02:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiCOBen (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 21:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344298AbiCOBem (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:34:42 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EC43A718
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:33:31 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id s42so17105784pfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V1VrRTcq8dlo9eD4Eyq2A0dA94VL3onaB24zVOa8cPs=;
        b=gonXNA9SAlxEKRJDorvpW/eMbmS8DYY/dHDlFhk8Lx1AAcpzCTHs3lIV0/lO+fThVo
         yegGGCGTfv+ctRypZqwFYm2rOL/sCHSRTmSL8WlOnnqtA90LWAfLtTV7DD2z0B2ESF3M
         FedIAtBp1g9PGEPilU0uqhgbCVtTK0tAhv4UNcV/ZWLtZxJ+/ClIU64uw85qc5FJKebo
         F1cFI4aEliSOYyr1lYRc0MaTU9dJC1LIxGawr/M290lOziY0bcs5gWSozhvs01jBY+EU
         M09/A5dc9ksGlSecMUfLxYlngNj20jz2OrTJOvShgzaNEVFNQArsVbj8YssfM+SUU64J
         dbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V1VrRTcq8dlo9eD4Eyq2A0dA94VL3onaB24zVOa8cPs=;
        b=RM1J2W0Dd3yCIEYHjQQi+diqWoGqzNBwYkESLzq3pkjF4xmhNpc/I0W2PDpSAD+J2H
         14lOB6w8LsNb26pfkbFyDvp645CnatlXlBTAMnVwuAGe0wgcuTFbTM7ZBClIeKSO9ShS
         3Y9N+4aYZH6Wuiatbzp2GlRuehlZyU6es89hQxmvMEUa40xK6MY02WXwLdYvKicFA8oG
         QCKb52KnpNZ1xcH6IZCHkEekV5yQXrI7O3jkYg6FORYH5/kKr4fhIMD/afNVw9ybGRoJ
         VDJV+3n0NBhGbCaxl/7B7Ap4KBjAr4T01JVLCmFSYIXrW6WdbLzJy3EgtMixA/wdeG5B
         RANw==
X-Gm-Message-State: AOAM531uVHtt6ysEdUEBEgxHrRnKcfhFc2pnALQZqAB2stsO4r1QM1+v
        1+gD0N1IqINXOhR7Zz7fKD+iaATx6a5Qww==
X-Google-Smtp-Source: ABdhPJz/owDK12MFKKPgwXIKN/io1SFhJmjAw5tcZt53Co4KDaaAaoqvJqFY/rD5sGtAUP2RXqPFnQ==
X-Received: by 2002:a63:5051:0:b0:374:5fd0:f131 with SMTP id q17-20020a635051000000b003745fd0f131mr22531938pgl.431.1647308010887;
        Mon, 14 Mar 2022 18:33:30 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id f13-20020a056a001acd00b004f76d35c1dcsm17574821pfv.104.2022.03.14.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 18:33:30 -0700 (PDT)
Date:   Tue, 15 Mar 2022 09:33:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 0/6] documentation and other minor tweaks
Message-ID: <20220315013325.GA27978@sol>
References: <20220311073926.78636-1-warthog618@gmail.com>
 <CAMRc=Mf1MYgNGt2jK_iEXaHv7UUip+_uNkF2Ewm8rr76CnvHXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf1MYgNGt2jK_iEXaHv7UUip+_uNkF2Ewm8rr76CnvHXg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 14, 2022 at 09:31:27AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 11, 2022 at 8:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> >

[snip]

> 
> Hi Kent!
> 
> Thanks for taking the time. I'm mostly ok with those changes,
> especially the documentation as I don't really know better (ESL). I
> think I may change a couple minor things in the first patches but
> nothing big. As far as patch attribution goes - do you want me to
> apply it to next/libgpiod-2.0 now and squash it later with your name
> mentioned in the commit message or do you want me to queue them for
> later once the C++ and Python parts are in as well?
> 

It would certainly make sense to apply the API changes before the
binding changes, to avoid having to update the bindings later, even
if the changes are minor.

Whatever works for you.

Cheers,
Kent.
