Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB3F0150
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 16:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbfKEP0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 10:26:25 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37980 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfKEP0Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 10:26:24 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so1268382pgh.5
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dFx/QhPuCiSUKXIeWcnpd2F3pB4wncYPjRodMn8p5PM=;
        b=EvAhePzpaG0Ry83BiZVRkZCp9LTMe/noRjP1rM3C0nYu9XLF6e+m44LEGyiC4162NA
         3FyVp0Jff86Y+hnn/hjScsNefl56C/lhgpikCHtPlvyNMdACHFBSRWH8UERa25Pb/3wN
         sNPirQmWCNlJq/yga0KQKBLdwKiys+3zlYY7aOYjjVvuO6Td89H3An89gQZkuEhNnE8K
         9QtHz6GK5P/rJsZWuMAXoWC2ly2gzrgs7GkJaug8gsOki5ctgmKwV9mCjS2wVASOxD4L
         usrfMLHm3LCZZpBnTIxCq9qr41pZkG00xhIJBvgw6mVRKdxRTApLMtxb3J3KI5ELZprx
         U9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dFx/QhPuCiSUKXIeWcnpd2F3pB4wncYPjRodMn8p5PM=;
        b=ZusFkMdCIu+J6Y2nE7bGHn4vAS5KBQ5EODelo+NyTorAVKuz5sv9zWBU6Q4afyK1nA
         A4tItWzhKf/tsKIxRZ2tTxFhAtUcEvdg5f1ViFBHxgVXULoYNHROtKynuLCUp2ZzxwPq
         Nh+pI7Ys0aEGMI35DWdanUYy+xKdQzEGql5qav4khW1yvXRYUyAIlfFR/kSadTeyqvfO
         vAeg851vsBDrBDIwcm0Ot8gPRt+a8cjB/xcF/NA+4xN0DZx72bud1XPuoH8r08DAFkqV
         V2N/oEHE424F00fiJ3zhtjtMWq+i1+xD632GtEIlx17+IUxWXvJX0x9Rtv23MACDI3hY
         8KXQ==
X-Gm-Message-State: APjAAAV/SLIn6Ivqcc7WlAyQlXxbBs3fWxjS1jWfm/r582ACDY7k4fXA
        rmo/jfkaz1lpZ5y/eAcCGaDvATqWmzWmeQ==
X-Google-Smtp-Source: APXvYqz7aBofcegrI65u2mtR+wc7nzmIfnMezXvGtrvetiuNTI/DtUmg+O5xdroSYEd+pqwsExXfCA==
X-Received: by 2002:a17:90a:bd0b:: with SMTP id y11mr7694993pjr.28.1572967582207;
        Tue, 05 Nov 2019 07:26:22 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id f33sm19516678pgl.33.2019.11.05.07.26.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 07:26:21 -0800 (PST)
Date:   Tue, 5 Nov 2019 23:26:16 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     drew@pdp7.com
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191105152616.GA19978@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> Patches are against Bart's gpio/for-kent branch[1].
> 
> The patch has been successfully tested against gpio-mockup, and 
> on a Raspberry Pi, in both cases using the feature/pud_set_config 
> branch of my Go gpiod library[2], as well as with my feature/pud 
> development branch of libgpiod[3].  Patch 7 has only been tested using 
> my gpiod library as libgpiod has not yet been updated to support the 
> SET_CONFIG ioctl.
> 

I've just pushed a first pass at SET_CONFIG support into my libgpiod 
feature/pud branch.  It is causing me a bit of grief.  Due to the way
the libgpiod API is structured, with the direction flags pulled out into 
the request type, I thought it would be cleaner to keep changes to direction 
orthogonal to changes to the other handle flags.

So I've added these methods to the API:

int gpiod_line_set_config(struct gpiod_line *line, int flags)
int gpiod_line_set_direction_input(struct gpiod_line *line)
int gpiod_line_set_direction_output(struct gpiod_line *line,
				    int value)

along with their bulk equivalents.

I've coded that and started adding tests when I tripped over changing
bias.  The kernel requires a direction to be set, but I'm setting it
as-is in gpiod_line_set_config - so that wont work.
Open drain/source are in the same boat - they require output mode.

I see these options:
 1. set the direction as part of gpiod_line_set_config
 2. relax the kernel restriction.
 3. don't support changing bias or open source/drain.
 4. rethink the API.

The first option requires caching the value set for outputs which I'm a
bit hesitant to do, though I'm not sure why - I've already added caching
of the handle flags for the direction functions.

Any preferences or suggestions?

Cheers,
Kent.
