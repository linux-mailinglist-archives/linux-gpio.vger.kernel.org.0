Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05DEE4EA974
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 10:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbiC2IkR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 04:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbiC2IkQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 04:40:16 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53802124D
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:38:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gb19so16714442pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pEsNUjcDU07D0Qh+05HmnDoXqtZUuIo8j9GRqsZ+HaQ=;
        b=L0k4PSEE4vwbw006U2fod87E6bkzTVgD8pa9Q3lMfFm5OJawKmt9aaZVObLB798DFq
         XlfK7VXBqw6pFi79kjnqzrD8jVtWOLjqoDUU3uQgeJK0qA6+zPT9q0pqN6xSk9V/19yL
         R3V7QFI7uyITKnuq+uaG5TuGmYw9Iljn10nSOs0mYkui5lBrpatE+LYgCY+3++46wLu2
         QF8x9/tOT2RDT6n+uPB7vF15Sk81EDj6wpnwp8PUCxXy4JyvYW4T14BNFG3FdLEabQ/m
         V9IDEwqIvg0PMUs10FEcYa+t7YisR8tbOWgFHjdAmdQFz17Uk4W5gdzaOZM3bIoGm+XO
         32Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pEsNUjcDU07D0Qh+05HmnDoXqtZUuIo8j9GRqsZ+HaQ=;
        b=vMx1mkuYLy7BpGlmIslQBHct7xWRSChCI3LlIrRZNQH/C8Su41Sgm30BDDOp1iUtVV
         al1OXwlMJhT8Ogwgi0VtVUDVnM4LttNRtvi8RVmq7BQYkbtUCZ1nNaHi2Lt4N6JNlCpq
         ocSX7sYPPSMFGvVOmnNbuVXFzkieVJRyWzF1+koKtqZ4W238iIFzXkMdzCw68EMwHMGd
         AMgDkDBWCQKINkYbmrMVNi/FJIHdwDB76yy4tSqSd0JzyBsVfs3MPNDoKz/S554X3BIx
         2lLKncOgW2W30jChBsOW/DCAm0/zS1FESnbZPfRLRsIFZJDYa6Oygh5f/JSYFfXaAEtY
         Xz6g==
X-Gm-Message-State: AOAM531JJ8ichXx1YJVTExOoS25dkPgVxlcpyG90p8hX/T0uqm4sdOqN
        bciIeRUsUX+cQvSVCGC6Tck=
X-Google-Smtp-Source: ABdhPJxdmROw909JY8bhBP8mJ4CrUyW+6CTkWOLfJG48weXiMkFXY0saZ44vuqWPbQZf2XPfteK7Cw==
X-Received: by 2002:a17:90a:3e0e:b0:1c7:ca0e:a11 with SMTP id j14-20020a17090a3e0e00b001c7ca0e0a11mr3441589pjc.19.1648543108165;
        Tue, 29 Mar 2022 01:38:28 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id r11-20020a17090b050b00b001c741fd4890sm1939383pjz.9.2022.03.29.01.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 01:38:27 -0700 (PDT)
Date:   Tue, 29 Mar 2022 16:38:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Edit/gpiomon: Question about mode
Message-ID: <20220329083823.GA94201@sol>
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
 <20220329033840.GA14149@sol>
 <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
> 
> Am 29.03.2022 um 05:38 schrieb Kent Gibson:
> > On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
> > > Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
> > > > Hi,
> > > > 
> > > > what would be the right mode for gpiomon call from
> > > > 
> > > > a shellscript executed as root from systemd at system start
> > > > 
> > > > waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.
> > > > *changed
> > > > 
> > > > 
> > > > Lots of interupts, Signals and other GPIO ongoing from other user APPs &
> > > > threads in multi-user state.
> > > 2b more precise: I wired a GPIO Pin to GND.
> > > 
> > > Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
> > > 
> > > the program exits immediately with 1 event, although there was never a
> > > rising edge due to the fix wire to GND. Is this a feature or a bug, and is
> > > it reproducible?
> > > 
> > Not a feature and not reproducible for me on a Raspberry Pi4 with the
> > setup you describe, so probably a bug specific to your hardware platform,
> > whatever that may be.
> > 
> > If it is 100% reproduceable for you, and assuming it is an initialisation
> > issue so you only get the one spurious event, how about using -n2 as a
> > workaround ;-)?
> > 
> > Cheers,
> > Kent.
> 
> It appears 2b reproduceable 100% on my OrangePi zero+ (Allwinner H5) and
> using -n2 does the trick, but isn't gpiod not supposed to work on all
> commercial HW platforms and related kernels, rather then only on RPI??
> 

gpiod will work on any platform with a supporting kernel.
How well depends on the underlying hardware and driver.
The RPi4 was merely a counter-example demonstrating that your issue is
not universal, using hardware I happen to have readily available.

Cheers,
Kent.
