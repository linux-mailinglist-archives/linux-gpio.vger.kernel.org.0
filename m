Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD1570F059
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 10:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240045AbjEXIMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 04:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239852AbjEXIMX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 04:12:23 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3344712B
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:12:21 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5307502146aso483598a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684915940; x=1687507940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUIQWhLLykcFFIEuVz1KEotXtyYFQRJ8pok4RiizEgE=;
        b=fm12v+nz2woCaAQtitb4/l7miL0Lh90D9aKA5dbnfJ5sFuEFp25pCf3ccSIBtLghvw
         CUscF8xTUCq0jK8+urHcakrmZwNt2lXqzODLYDZQLkGs4G18NxmNc7LrWBjN/0btxmYH
         UG/+2IdLM7ypacDUa26y9ZeFqh2pQ79zNmGcCaSarbp9LyeEMkbUTWrCsyFpyOs/zdbx
         mG6k+F/8A00kEz1E4+Cskb1JYR4HifINjuwpiMd2mh5RMIdmQtE5CcK6Mz2ymoGasbWV
         iGdJaKat9QnsTi/N3IWJm07Y/+17e0szAgVYg7IpWhgkOFpvdTL2p7HYtL5kD/lTb1U/
         06nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684915940; x=1687507940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUIQWhLLykcFFIEuVz1KEotXtyYFQRJ8pok4RiizEgE=;
        b=OynH+5krDasEASbweB6Qx8uswDazhuF2T3Pf4EHqh5bTFeb4Ez66eypyh5onYF/Vgj
         woP7D68w0ixtiGgr0nKPln2gWfUlGZvWS72eB+q/2LuMIEQvKNKFiKKhJ2kki0EAsB10
         HBfNMffUVJgvAFbBKBs/MLGrY1UsOpVDW7ZGNxEk1mj+5MQy6F1C8J07Dq+kIXGikmvY
         VDw6/RxSmDIB/OojoGBo0A4Yqkr5lRBi4EajNthrxn0i1hhKx4Z9EA6hkON7Vs6fTgnN
         JRB2JJwCS6lcd03umwR4VkaGB3EhGIRNaFhk5xuomSmrziA3p6R80l0+mkQpZViqUs3B
         Q/rg==
X-Gm-Message-State: AC+VfDyJk/R5GnR06VZd+kHwv5uUfxbGEzOQQLpinU6O7xBktUFVbnW0
        yH+EARMEUVUDL1in/6wMu0E=
X-Google-Smtp-Source: ACHHUZ7QNDsGmin6QBCaBTVpZvuUci3Nam9z/Gdagitt5ccCPATsTANfUJPDS21EJjiM5TXNW93a8w==
X-Received: by 2002:a17:902:cec6:b0:1ac:8148:8c3e with SMTP id d6-20020a170902cec600b001ac81488c3emr19822476plg.32.1684915940463;
        Wed, 24 May 2023 01:12:20 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id ja2-20020a170902efc200b001a68d45e52dsm8102914plb.249.2023.05.24.01.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:12:20 -0700 (PDT)
Date:   Wed, 24 May 2023 16:12:16 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     esben@geanix.com
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH] gpioset: only print prompt when stdout is tty
Message-ID: <ZG3G4FMUYmB8Ogfv@sol>
References: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
 <ZGzdaJ/wBSUDsJdU@sol>
 <87pm6q9r7a.fsf@geanix.com>
 <ZG29npyOJVyJPsLM@sol>
 <87lehe9ncs.fsf@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lehe9ncs.fsf@geanix.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 24, 2023 at 09:53:39AM +0200, esben@geanix.com wrote:
> Kent Gibson <warthog618@gmail.com> writes:
> 
> > On Wed, May 24, 2023 at 08:30:33AM +0200, esben@geanix.com wrote:
> >> Kent Gibson <warthog618@gmail.com> writes:
> >> 
> >
> > Yeah, it isn't a whole load of fun, but it isn't intended as a full on
> > daemon.  It is an option that was added in v2 so you CAN now write a
> > shell script that can request lines and change them as necessary - without
> > releasing them.  It might not be pleasant but now it is possible.
> >
> > If that doesn't suit you then look for another solution as you are now
> > beyond the scope that gpioset was intended for.
> 
> I guess I will have to do that. Although I don't agree that I am out of
> scope. I just want to do exactly what you have described is in scope for
> gpioset. I just don't want the prompt when not using a tty, and the
> reason for the prompt being there is to make the test work, not for a
> real-world use-case.  Anyway, I can do my own thing.  No problem.
> 

Not just for testing.

In the real world the prompt is there so the controlling script can tell
a command is completed - same as a human would.

> >> > This works for me as a simple daemon script:
> >> >
> >> > #!/bin/bash
> >> >
> >> > pipe=/tmp/gpiosetd
> >> >
> >> > mkfifo $pipe
> >> >
> >> > trap "rm -f $pipe" EXIT
> >> >
> >> > # as bash will block until something is written to the pipe...
> >> > echo "" > $pipe &
> >> 
> >> I believe this is not just needed because of bash.  If you don't have a
> >> writer on the fifo, the gpioset will end up in a busy loop in readline
> >> until a writer appear, spamming a prompt out on output while eating up
> >> 100% cpu.
> >
> > I don't see that.
> >
> > What I see is that bash blocks until something writes to the fifo - not
> > even launching gpioset until that happens.
> 
> Ok.
> 
> What I am saying is if you actually do manage to run gpioset with stdin
> connected to a fifo, and the fifo not having any writers, you will end
> up eating up the cpu in a small busy loop.
> 
> Because of the problem you describe, you just haven't gotten to that
> point though.
> 

No, that is wrong. I mean I've tested it. Just now. Again. To be sure.

The only reason it would spin is if you connect it to a pipe that always
indicates it is ready to read.  And the named fifo doesn't.

> > That is typically not what you want - you want the line requested and
> > set NOW, and you can update it later through the fifo.
> > The echo is just there to get bash over the hump.
> > (btw, if there is a better way I would love to know it)
> 
> I haven't really investigated that.  I just made the process running
> gpioset hold a dummy writer open to the fifo.
> 

Yeah, I don't know what you are doing, as you haven't shared details, but
if it beahves as you say then it obviously broken.
But that is not due to gpioset.

> > With the named fifo, as used here, gpioset will start, request and set
> > the line, and then will block until something writes to the fifo.
> >
> >> > gpioset -i GPIO23=0 < $pipe > /dev/null
> >> >
> >> > Does that not work for you?
> >> 
> >> That is basically what I do.  Just output directed to a log file
> >> (actually, a pipe to a process writing to rotated log files) instead of
> >> /dev/null, and then no prompt noise in the log files.
> >
> > So redirect stdout through a filter to remove the prompt?
> 
> Yes, I could do that.  But having an extra process running, and managing
> to keep that alive...  If I need to carry a tiny out-of-tree patch to
> avoid that, I will do that.
> 

If that is easier for you.

> >> Anyway, what about adding a new CLI option. Either something like '-I'
> >> for no-prompt interactive mode, or '-n' to be used with '-i' for the
> >> same?
> >
> > I'm not keen on adding options to gpioset to massage the output for
> > different use cases - there are already better tools for that.
> 
> Ok.
> 
> That I guess leaves me with no options than working around gpioset,
> using filters and what else is needed to do what I need.
> Or out-of-tree patching.
>

You missed writing your own daemon. Or asking ChatGPT.
But you do have options.

Have a good one.

Cheers,
Kent.

