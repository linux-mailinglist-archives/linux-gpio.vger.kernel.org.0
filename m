Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3198470E0AB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 17:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236205AbjEWPgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 11:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbjEWPgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 11:36:49 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942BAE53
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 08:36:13 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d2ca9ef0cso3851432b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684856173; x=1687448173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXu+V5nJnHH4YyVsiUEAa2ukmrSVQtNJr6qhVO18g0c=;
        b=hfWxMDSFbCwN1gbWjVwS6SyP0L+j5qH8mqnKlkiyBj1PgjmTMAHcasX+zdZMdAnS8w
         rS18dOMbqL1BwZXPguM2efop1a5Awx8hk0qGE6I9reEtCoJ11kg3pUnKD7HJHAX5d/Ke
         vXPUAjUi/jHJv+WR2dzkdAo3GqzuqnGQXNefTcQLYO+8CtBuu5unqqC+KVPoeXAhSAde
         MJwVn3D7ndMY9ro0Y1lZtPqFwTgpL+pAWnnZqaDU9Din/yFcNzZJGe7KoJf7XeZkLxdg
         M9RGGUEuzDiszOSeG809GEyxN8zNqdvDZr8iS3usGcovuyPCIC8LPjRiwB8u57Gx5AJO
         aU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684856173; x=1687448173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXu+V5nJnHH4YyVsiUEAa2ukmrSVQtNJr6qhVO18g0c=;
        b=SmFoiITLSmYuA2u5NpEL1Bd9SUDRzK+OBTfgXwk4JsDDjsUpDIUWF0n64AcGO69nq3
         N/VeLl/1rYssg2c/fQgIhsoW/cBS5wffRCTntEKJhx3gQLPN6kt0J6XkKriz6aWzUCSn
         S5JCd3y+C+a2xJtrtVwZ8AILb754JlvBI/6PSMaof+TAb/BD3FWfa7kxQ7j6cy8piYJ4
         Hq5vYViA+ZyroRZLNbUQcTu9HQc0A6bojDGI/2pIgJB9ZMcYGLIA54MNUg77imY355vt
         WljzxJolImKs5pgIJdWeMJRFI7mwRJEZvn0jk87yVVp4Zd0KjpluDpqS4IESDydLtE2D
         Fw/Q==
X-Gm-Message-State: AC+VfDwp5EbK1GW4uGBQxie5teg3XDL7ud52rDh6tEhtfQ58wEs3f4lC
        sBoq6t/RpiRiUExpJxY1qyNXnYtGfrU=
X-Google-Smtp-Source: ACHHUZ5lscEOvZcpE0hfu7gYCmzPHFCq3C64yGEiL9cs8FEwc3jXhSj1+qQqUaZFJQfUAeE5tOCYwg==
X-Received: by 2002:a05:6a20:7d93:b0:10c:3cf3:ef91 with SMTP id v19-20020a056a207d9300b0010c3cf3ef91mr4379243pzj.4.1684856172949;
        Tue, 23 May 2023 08:36:12 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i14-20020a63cd0e000000b005287a0560c9sm6285879pgg.1.2023.05.23.08.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 08:36:12 -0700 (PDT)
Date:   Tue, 23 May 2023 23:36:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Esben Haabendal <esben@geanix.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH] gpioset: only print prompt when stdout is tty
Message-ID: <ZGzdaJ/wBSUDsJdU@sol>
References: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 03:54:41PM +0200, Esben Haabendal wrote:
> When gpioset interactive mode is used as intended, as a human controlled
> interface, stdout should be a tty.
> 

Yeah, no, the interactive mode is also intended to be script driven -
checkout the test suite, gpio-tools-tests.bat, as an example of it being
driven using a coproc from bash.
Removing the prompt would break the handshaking with the controlling
script - that is how it determines the slave process is up.

I'll try running your patch through the test suite tommorrow, but I'm
pretty sure it will break it - IIRC the code you removed was put there
precisely to get the test suite to run.

Have you tried running the test suite?

> By leaving out the prompt when stdout is not a tty, gpioset interactive mode can
> be used as a really simple deamon for controlling GPIOs by connecting it to a
> FIFO.
> 

It can do that already - just direct the output to /dev/null.
Which you would need in your case anyway - the prompt isn't the only
output - try piping a get command to your daemon and see what happens.

This works for me as a simple daemon script:

#!/bin/bash

pipe=/tmp/gpiosetd

mkfifo $pipe

trap "rm -f $pipe" EXIT

# as bash will block until something is written to the pipe...
echo "" > $pipe &
gpioset -i GPIO23=0 < $pipe > /dev/null

Does that not work for you?

Cheers,
Kent.
