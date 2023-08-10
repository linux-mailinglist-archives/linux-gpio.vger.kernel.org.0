Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2642E776D36
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 02:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjHJAqW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 20:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjHJAqV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 20:46:21 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06D3B9
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 17:46:17 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68730bafa6bso1080625b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2023 17:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691628377; x=1692233177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wxN64KMBgJpviwELOeGDa8H66huE6dZUNApQ5tpNMY=;
        b=HXDRueGAenmohKvnvrJVFlJJcyYbHN9StqweLwGBwX18OIZqJ7MgR2vzNPb0XZuuc9
         FTihGWJnBuGhwDJ93MC+upuDMbhHP0WH7Zf8DsJqHwb3vAA6WWjyZfgk8fIAF2yhey6P
         OOwb7saI7xociTUbiEGkAGcDn7jTh1PLGNWn+Q/aB4AMOdyxPXb9s36hyub530fr6qra
         ve+zKPXAbhAGVBgGAg1YsRpS8UmyAFWoqVVuoRXR3YTzMTuypaEJGXgIxCow1QpECphQ
         KI7F/+2dys9GSIaezmREt4CYGugjVIE/AHp1if4cBKWearXxIR6nLAusEs8hE+QURD5p
         FPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691628377; x=1692233177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wxN64KMBgJpviwELOeGDa8H66huE6dZUNApQ5tpNMY=;
        b=dCnkQnYFGcoQZUKcaaeNEABirCWs2pZ+NeNgAUnPB2NsnhuHdPTYYuXxl8cKs02NNV
         /unvWOCLUbrUD7zHG1ikf/U3b7u2XjMmmJhWmMy4Dg7o0EH8eT/sS8hAoAxGBhow/+Eo
         JhuxWemrYbHhkJBLlANIPMXfOVAckLBrVPRulSiaRfJA110KTnFylw3wwkWWrqile6nJ
         A+89pwUWF1cUmx3buc0sSXTbQjypFHwoOcG1oVNtXWsHT+g3bf1irfcCZt8CwXOpHOAs
         GFS1zh1arWX9Vu+6wQYCGS8Mde6lOpAPBOZjkNVPTjb+ZQH/J+tpLzfpoLrlnJiBlM0g
         FXcQ==
X-Gm-Message-State: AOJu0YwP9Os/D7XwGuGnGCG+cYldD0h657WJ7iKR9DWYDPkykayfudPa
        bFa66mD6c5cYiK15uUB4O8JBKxHmodE=
X-Google-Smtp-Source: AGHT+IHsChFB2AFAzZilISs1jrgEOy/DCIGbt+06+wE56X1eVdauJle18q2kLXb353J8NCgIzdOMzg==
X-Received: by 2002:a05:6a21:99a6:b0:13d:7f7b:1926 with SMTP id ve38-20020a056a2199a600b0013d7f7b1926mr633977pzb.11.1691628377173;
        Wed, 09 Aug 2023 17:46:17 -0700 (PDT)
Received: from sol ([220.235.36.234])
        by smtp.gmail.com with ESMTPSA id g5-20020a633745000000b00563da87a52dsm228970pgn.40.2023.08.09.17.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 17:46:13 -0700 (PDT)
Date:   Thu, 10 Aug 2023 08:46:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZNQzT2MtskTTZTiI@sol>
References: <ZMLnz25brQvcwBVW@sol>
 <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol>
 <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol>
 <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol>
 <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol>
 <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 01:17:13AM +0100, andy pugh wrote:
> On Sun, 6 Aug 2023 at 10:29, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > You can't statically link libgpiod until it is available as a package?
> 
> Would that mean merging the gpiod code into our codebase? Or can this
> be done some other way?
> 

There is no code movement at all, this is just telling the linker to
link libgpiod.a directly into your executable, rather than dynamically
linking against libgpiod.so.

The specifics of how to do that depend on your build.

Later, when libgpiod v2 becomes more widely available, you can switch
the build back to dynamic linkage.

> 
> Anyway, I now have it working, to an extent, but feel that there might
> be a problem with gpiod_line_request_bulk_input() and
> gpiod_line_request_bulk_output() if the bulk contains more than 5
> lines.
> 
> My current code is here (Work in progress!)
> 
> https://github.com/LinuxCNC/linuxcnc/blob/andypugh/hal_gpio/src/hal/drivers/hal_gpio.c
> 
> The test input file (
> https://github.com/LinuxCNC/linuxcnc/blob/andypugh/hal_gpio/src/test.hal
> ) attempts to configure 8 input and 8 output lines.
> However, if I change the 5 to 6 in either of lines 157 or 180 then the
> output looks something like:
> 
> HAL: initializing hal_lib
> /home/andypugh/linuxcnc-dev/bin/rtapi_app load hal_gpio
> inputs=GPIO5,GPIO6,GPIO12,GPIO13,GPIO16,GPIO17,GPIO18,GPIO19
> outputs=GPIO20,GPIO21,GPIO22,GPIO23,GPIO24,GPIO25,GPIO26,GPIO27
> HAL: initializing component 'halcmd9608'
> smalloc_dn: shmem available 1048284
> HAL: component 'halcmd9608' initialized, ID = 02
> Note: Using POSIX realtime
> before request
> rtapi_app: caught signal 11 - dumping core
> 
> The "before request" line was added for debugging, the "after request"
> line is never printed, nor is the error message if the request fails,
> so my belief is that lines 163 and/or 185 are segfaulting in the
> bulk_request functions.
> 
> The driver appears to work fine if I limit the number of parsed input
> strings to 5.

Check the sizes of the memory you are allocating.
e.g. this:

	    arr[c].chip = (struct gpiod_chip *)rtapi_kmalloc(sizeof(arr[c].chip), RTAPI_GFP_KERNEL);

allocates the space for a pointer to a struct, not the struct itself.
So you are corrupting your heap.

Try
	    arr[c].chip = (struct gpiod_chip *)rtapi_kmalloc(sizeof(*arr[c].chip), RTAPI_GFP_KERNEL);

Similarly your other mallocs.

Btw, v2 uses opaque structs so this wouldn't be an issue - it would do
the allocating for you, e.g. gpiod_chip_open() allocates and returns the
pointer to the struct gpiod_chip.

Cheers,
Kent.
