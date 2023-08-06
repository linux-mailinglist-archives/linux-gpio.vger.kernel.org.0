Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74637771321
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Aug 2023 03:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjHFBCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Aug 2023 21:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHFBCQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Aug 2023 21:02:16 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A2C2109
        for <linux-gpio@vger.kernel.org>; Sat,  5 Aug 2023 18:02:14 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8b4748fe4so21902145ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 05 Aug 2023 18:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691283733; x=1691888533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tdu2apCBYHFkThe8N30W0Un7MzVWI7KSOyIrlXy8t+k=;
        b=DFsO9J8DmSg3aG+X+qJrSiyUSkPbexmRJRWlERGy+rT5dMPerf7Bd92UIb33fRYtrd
         480hFI+aMCjnVAxkeMeT8cGmfbjDlh9KOdxUai/pHZe9/yvNidDMdyc0Hb91032gQifT
         JIChXK0VtGMiHZhVm17YbWU5fq3+PFmn5H3qFai9XjFA6OrrhshBNwCiMK3OBef80Q54
         i+S2rh30BLh6KRFsuypuY4docLVD2C+y+FOPC5dkyFHfImdN/dbGHoGV4FkyIT/xv8mh
         mC4br+I1mjfwLcp3J//F0u46A1jywcNfenTtX6juVKFCpK8LMNbpqGtafzXdNR+su36a
         gCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691283733; x=1691888533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdu2apCBYHFkThe8N30W0Un7MzVWI7KSOyIrlXy8t+k=;
        b=eNjNkKOBVVBWzHDtcpI/Yvp4vtk4LwxUnzyrH6gn5k0owKwYi3AIwvNo0rtRo7Ex0c
         D7z1nHm5OtFGM+XH1yxmAI75FpmvbQQbGZpF3NLaysppK/2aZCNPxLrXtZMOTOjCC0R3
         zruKsMmnPGjyYmXW0vhWeRomiLLkFBG0pPeqNiUHlfCwEVJ2GWyzVjumEtFmJWoRr3iv
         n9ywyWyG5xmQIQ7pcAfaNuBb5Bs5xdg83UXNqm1ar1uDIB8YIdVVIgnUxlywVMDxGhcI
         6JDsLEdYI66nwdlyjYA16ScjFRBdKwRXpKybTJoXd/vTili4SGlfo5/Y145hiVdPqUzh
         CbAw==
X-Gm-Message-State: AOJu0YzFbB0QSofSeDjsCgxK5hB+7IddBElJvC3elEXTL7K5ISOmr28z
        jSv0scJo2/YaCromd0fribg=
X-Google-Smtp-Source: AGHT+IHK0EbUrY2eMuvHJSilqx/saz2lAzqoJ3JW6YiJrxYCx2m5f+HAhGcRL45tqbUftfYPxlVjOQ==
X-Received: by 2002:a17:902:c943:b0:1b3:d6c8:7008 with SMTP id i3-20020a170902c94300b001b3d6c87008mr5066902pla.57.1691283733559;
        Sat, 05 Aug 2023 18:02:13 -0700 (PDT)
Received: from sol ([220.235.36.234])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001b53be3d956sm4077255plb.167.2023.08.05.18.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 18:02:13 -0700 (PDT)
Date:   Sun, 6 Aug 2023 09:02:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZM7xEbr0essN2qY3@sol>
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol>
 <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
 <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol>
 <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol>
 <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 05, 2023 at 11:55:44PM +0100, andy pugh wrote:
> On Sat, 29 Jul 2023 at 03:03, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > > Unfortunately I won't know what chip the line is on, but I have
> > > already considered that and plan to have an array of structs
> > > containing the "bulk" and the "chip" for each chip that is needed
> > > according to the IO line list submitted by the (pesky!) users.
> > >
> >
> > So the IO lines are specified by name?
> 
> Yes, they are.
> 
> Before I go too far down the wrong path, it has occurred to me that I
> probably can't allow the lines to go out of scope?
> 
> ie, this (pseudocode) won't work
> 
> for each lineName in lineList
>     temp_line = gpiod_chip_find_line(chip, lineName)
>     gpiod_line_bulk_add(&bulk, temp_line);
> next
> 
> As each line in the bulk will actually point to the same (last found) line?
> Or am I missing a subtlety?
> 

This pseudocode is fine, as the gpiod_chip_find_line() returns a new
gpiod_line object for each line, and that is passed to the bulk.
So they are definitely not using the same gpiod_line object.

That pseudocode is essentially what gpiod_chip_find_lines() does too,
though that requires all the lines being on the same chip, and I assume
you have a separate bulk for each chip, so there is more going on in the
loop than you show.

And I maintain that the wrong path here is to use v1, rather than v2.
So v2 is absolutely not an option?

Cheers,
Kent.
