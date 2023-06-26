Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BB373D97F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 10:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjFZISq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 04:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjFZISp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 04:18:45 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC1D95
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:18:44 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6686a05bc66so1618127b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687767524; x=1690359524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k36oxx+5KaxyRdDZ5D2EstHcNLdrfvlWY7OMKbYMf6k=;
        b=F4zZulR0hyy6QwxbpxoIRqpWpj93zmtZVg54zYPS4GBN7CYUR6huuWtVWrIq4T6kEy
         0hg2B3TIVLOmDZrxlAg590ivG3hTisnsMHYsgcOnE8C/7HTwjZcqN7dnRq5/4S0tTUVj
         T148ETaBXOd/fahKMuAxLgfc8eN8TlF/J5xyKVCx/cLmQy8fgETkSHWTJoAYGqd7LzUI
         9DG0SIgs34kZQtTtFaY4lFjXrmJ5yA49+onNQAWc1vAcy4FQFY4Dv0QvOxorMQlCPyd2
         tc7R6TFPV5rUYNovIGO6J/MJZ/UX9ANtqX58mp5DgKkNoEbZ27h58U6ndK+mDB6L2tE7
         Czow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767524; x=1690359524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k36oxx+5KaxyRdDZ5D2EstHcNLdrfvlWY7OMKbYMf6k=;
        b=kBgqP5G+lXFT8VWBKJbmHj57DBvHqcR67cDp1yXYoBZnzxTwQjNEPidNHwVH+SY2y8
         sULWBTVWrQ1daay8qzLUWNjLRS9VuD5yjoFQbcMKc8aJ+dWb7nC39p2eyV9xC0FCzK57
         WvIExu6TvbljOMDqvN8vsOPwbS3PC/0uWzmpbmkTpjX5SjpQJRFoYD5EFWRTjsaIBD0w
         8SvpcSQZB0K0GGneExH6PeDOjQEHh5SzPXXgk8USCQt1O85rYUbysEe7Z4Kct99A371l
         fpFHm2daWlD8ebFuLP4KGmnxLOhU4TaSr6hQ/1vNv3CsSuTvtyTi7Xieu0jrEH3BFDJz
         pkww==
X-Gm-Message-State: AC+VfDzDn7AesCsRbgBX6UgQ9HikoSXH6CtieaXIk11/EzMAhX1HVd4N
        EXGz5JGYLIfX/Osiop4KSzk=
X-Google-Smtp-Source: ACHHUZ5Alb2to65e+J8CGk61jPy2pGHSWbx6qIvipzMwY5EWTRjIFbN+WE13dzAE2j2Sae7Wvy7mtQ==
X-Received: by 2002:a05:6a00:c91:b0:677:a7f2:cdf3 with SMTP id a17-20020a056a000c9100b00677a7f2cdf3mr2418638pfv.8.1687767524402;
        Mon, 26 Jun 2023 01:18:44 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id p15-20020a63e64f000000b0051b0e564963sm3673335pgj.49.2023.06.26.01.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:18:43 -0700 (PDT)
Date:   Mon, 26 Jun 2023 16:18:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 1/4] bindings: python: examples: replace tools
 examples with use case examples
Message-ID: <ZJlJ30c6psXjtXnz@sol>
References: <20230624052054.13206-1-warthog618@gmail.com>
 <20230624052054.13206-2-warthog618@gmail.com>
 <CAMRc=Mdi2cGYjV3GV-iqOazscnRe=swfToRyT2TfeJPv=_yDsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdi2cGYjV3GV-iqOazscnRe=swfToRyT2TfeJPv=_yDsg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 26, 2023 at 10:02:33AM +0200, Bartosz Golaszewski wrote:
> On Sat, Jun 24, 2023 at 7:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Replace tool examples with use case examples drawn from the tools.
> > +        while True:
> > +            # Blocks until at least one event is available
> > +            for event in request.read_edge_events():
> > +                print(
> > +                    "line: %d  type: Rising   event #%d"
> > +                    % (event.line_offset, event.line_seqno)
> > +                )
> 
> This still uses the old style formatting.
> 

Well spotted.
I only fixed the one you pointed out - didn't even consider that there
could be others.  Turns out there are a few - probably all
cut-and-paste.

> > +
> > +
> > +if __name__ == "__main__":
> > +    try:
> > +        watch_line_rising("/dev/gpiochip0", 5)
> > +    except OSError as ex:
> > +        print(ex, "\nCustomise the example configuration to suit your situation")
> > diff --git a/bindings/python/examples/watch_multiple_line_values.py b/bindings/python/examples/watch_multiple_line_values.py
> > new file mode 100755
> > index 0000000..658ecee
> > --- /dev/null
> > +++ b/bindings/python/examples/watch_multiple_line_values.py
> > @@ -0,0 +1,42 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> > +
> > +"""Minimal example of watching for edges on multiple lines."""
> > +
> > +import gpiod
> > +
> > +from gpiod.line import Edge
> > +
> > +
> > +def edge_type(event):
> > +    if event.event_type is event.Type.RISING_EDGE:
> > +        return "Rising"
> > +    if event.event_type is event.Type.FALLING_EDGE:
> > +        return "Falling"
> > +    return "Unknown"
> > +
> 
> As there'll be another iteration, maybe change this to get_edge_type()
> or get_edge_event_type_str()? I have a preference for function names
> to reflect the action in general.
> 

Yeah, I use _str elsewhere, not sure why I didn't here.

What an I supposed to resend the update as given the remainder of
the series was merged - v3??

Cheers,
Kent.
