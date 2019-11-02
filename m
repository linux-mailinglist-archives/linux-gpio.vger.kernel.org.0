Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E410EED100
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Nov 2019 00:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfKBXOS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Nov 2019 19:14:18 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36352 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfKBXOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Nov 2019 19:14:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id v19so9517953pfm.3
        for <linux-gpio@vger.kernel.org>; Sat, 02 Nov 2019 16:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ligZHYD9+uIaF2k26FKknlIIxTIz1PvoehpbkFRBhZQ=;
        b=KJy7nlDehz9wpGj1FLfC4szC7ddUGbgC9zE+zP/fjw33lnzhhutZaQPL6iCiBOSXOm
         Be0mJuY2tojxvFx8ck1P6tXGIriY9mnA4nm6Wp5d07FaW7T/Nlj2qw5ZtgAJfJwG8cst
         /FN8W3m8mAxGSuaeP2PL3Zvg/CNrZG/DF2JnPiK4f1Osd0u9uL+vvyKbOYHZJel73j83
         WRddVVTfVB1h8Js+WJTLz0B9FN57ubw3TAEI3355RHjZfYWUPjM/JpFLZWdnI3KCn/QY
         Sap2Yywhwj7LenPBqyOLFjKg+MOiLkx4S6dIMrjHgxYnerF5dunCQSAAIOEfoCcrfULk
         SRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ligZHYD9+uIaF2k26FKknlIIxTIz1PvoehpbkFRBhZQ=;
        b=m/wtEizExZPuzub4DqdTakgu31q1Fbwb0qsPBtNPn03cnmnuZNuOGWfxIUCY/npNDZ
         igPQO5e2Tt9msgB5bqhHUIS5pHGhGBGXMkfk69N+UAar3aLKgs3LNBgrc0pkf8zNlyzt
         DPyZ5X8tZPuFoadaVH4ErAn9qz20pEd/4NOQgH/e39DnHQL2UhDyUPjyqMUC9AZHZxql
         UIaJN42cRK3/SbzSxKzXtBgTUxUAvX/lvzQSkSyX0FchZfLuOflHDBu6H63h/bru3spI
         DnXDFWfX06o0LmEHxjYXjftTl99vcfWtXTUpYEuO7Jrjjs+NLR4dVdxFIf8UeMY2JNSO
         u9nw==
X-Gm-Message-State: APjAAAUP+mnqJP27q2v4QUxHcism7xGE8JV9snnUClml9/cHexj+4Q+z
        MSfQby1ZqgYIJxams9C4L3h9nODsuWg=
X-Google-Smtp-Source: APXvYqw/Tecv9J/47nZA9HgyNY7ZRVWG+H4YDYOctV9t9Jm4g2DSe9c5bmsaSRXOWcK7neTtIoaHIA==
X-Received: by 2002:a63:5966:: with SMTP id j38mr22068306pgm.304.1572736456735;
        Sat, 02 Nov 2019 16:14:16 -0700 (PDT)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id j7sm9828417pgl.38.2019.11.02.16.14.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2019 16:14:16 -0700 (PDT)
Date:   Sun, 3 Nov 2019 07:14:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: add new SET_CONFIG ioctl() to gpio chardev
Message-ID: <20191102231344.GA3447@sol>
References: <20191031144825.32105-1-warthog618@gmail.com>
 <20191102210205.GA26757@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191102210205.GA26757@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 02, 2019 at 10:02:05PM +0100, Drew Fustini wrote:
> On Thu, Oct 31, 2019 at 10:48:23PM +0800, Kent Gibson wrote:
> > The patch series is against Bart's gpio/for-next branch[1] with v4 of 
> > my bias patch series "gpio: expose line bias flags to userspace" applied.
> > This is necessary to support setting of the bias flags introduced 
> > there.
> 
> I'd like to apply this to test but I wanted to check should I still be applying
> all the patches from "[PATCH v4 0/5] gpio: expose line bias flags to userspace"?
> 

Yes, this patch series is based on top of the full bias patch series,
so I would apply the whole series.  It definitely requires patch 1 and 4
from that series, as they define some of the flags it uses.

I don't have any corresponding updates for libgpiod yet - and even my
gpiod library only supports the new ioctl for testing.
I was holding off to see if the UAPI changes were ok and if Bart has 
any preference on additions to the libgpiod API, but I should look into 
that now.

Cheers,
Kent.
