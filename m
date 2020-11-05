Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09D32A80DC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730975AbgKEO3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKEO3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:29:41 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AF7C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:29:41 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id j12so2000584iow.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dS1WlH7IfBxOJ27+aYXRtoSQ4CJbfqc9FiHL7/NxK8k=;
        b=us1XonsA/A8MWjulghdD87BuucFNGGkVYwTwXVVvQJZvK844Xnttbmq8bOpAQYlyzo
         /eRwS6MeamMgJz8QE5CFv1F69UtwLIB7ZZ4GsgVJBQhTwPQ3Gp3QafEJZ2QT5lY3Dnbl
         XLdMAZc56SgXu8E+/CbHULXrJksw3zst2tuJ3GfhMyl/TSDyeVpX47N5nLwLciuBZdOl
         B6rUIRAEA1YLyX3ZSQn/4fUyD26BAgHvT+7ou5JRCdVUY+ydIHUMMc5agG7ZKITP3986
         sN7rKskDPQKHditVKSFwygOwSUX5LIca5M8iUD++CWls1GN8QlDzmVSLI6IPj6QPsVQf
         MkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dS1WlH7IfBxOJ27+aYXRtoSQ4CJbfqc9FiHL7/NxK8k=;
        b=Vsg4DvVeoUpzxLE+pQiIpcZNEFMrG9QAGYCoqQ+o97JfRR3JWlmvb9lgJXSOSXMFeu
         yW4/MiBD1Cw4DldP2ucoFUdEleUiKOctvN4z6+sWKDKTnmdu0lgBsiJt44gllIguYjhF
         stDHteOgS8UOpFRiB7YZ41uwk6Uv6lO1xrnZ1aZ+3jiDlNxH4sUpqT3JDI6L9yy5p5bk
         IeI4/xemLFuxzfqYdahWiw9UBQ3dEh2E115xR+t2CQvKzlf9Y6HTBpJpz3pi6/fu1tET
         robASlESB4IVqqyw9SHHU8l7mOuoFzr8aR4rTfXijAt3NP/NkWaZ/LMWjCEOd39eSu9i
         RkgQ==
X-Gm-Message-State: AOAM532LDP0kSAMBAq1PJf6gInDGb+ko5HTp+MOZulIKEoAC/5LxOe+B
        Ztppyjq/yWOl6xdpxB2UxXb0UXRCut3/R0XI7SMrvw==
X-Google-Smtp-Source: ABdhPJxPx6hE3uf4dw4WQ+XXy9yECroHynzPvfBVOx+iqFTAtmcfjZS8LnOAXdL54cPL7vgDx6R2EU2z3lfzkYLmfCY=
X-Received: by 2002:a6b:5a19:: with SMTP id o25mr1842325iob.119.1604586580349;
 Thu, 05 Nov 2020 06:29:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
 <20201105030913.GA11741@sol> <20201105073248.GA13434@laureti-dev> <20201105135037.GA100212@sol>
In-Reply-To: <20201105135037.GA100212@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Nov 2020 15:29:29 +0100
Message-ID: <CAMRc=Me5qb=tO72dPFBqbbaHOK5+ju-40_1_Di1dCq2z1u6nzw@mail.gmail.com>
Subject: Re: [libgpiod] libgpiod v2.0 API discussion
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 2:50 PM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

>
> As I think I've mentioned elsewhere, my preferred approach for
> rethinking the libgpiod API for v2 is to shrink the API to the core
> functions, rethink that set wrt how it maps onto and exposes the
> features available in uAPI v2, and then expand that revised set with
> helpers as appropriate, and then rethink the bindings.
>

What I understood from your previous email is your preference for
going into the direction of exposing more of the underlying kernel API
to users or maybe even: mapping the kernel interface more strictly in
the library. I don't think we should go this way. I want to keep the
<chip, line, set of lines> model which I think is convenient and
represents the underlying hierarchy well. I also want to shield the
library users from ioctls, file descriptors (unless it's to pass them
to poll()) and even HW offsets of GPIO lines as much as possible.

This is why I'd prefer to return pointers to line objects rather than
HW offsets in event structures. Same with line requests: I'm not sure
what the advantage of having a separate request structure would be in
the library (except for representing the file descriptor received from
the kernel upon request - about which the user doesn't need to know
unless using external event loops).

I agree that there's a lot of cruft to remove but I wouldn't be so
quick to remove helpers for simplified use-cases that we have now. For
instance: if we decide to go with an opaque config structure which
needs to be allocated dynamically, then users would most likely
appreciate having helper wrappers allowing them to request lines in a
single call rather than having to deal with resource management.

[snip]

> > > > For config: I believe an opaque request config structure will require
> > > > a lot of getter/setter boiler plate code for not much profit.
> > > >
> > >
> > > The profit being a guarantee of ABI stability and backward compatibility,
> > > while still being free to completely rework the implementation
> > > internally?
> >
> > I think you can gain this profit without opaqueness.  A user can only
> > use those aspects of a config that did exist a the time the code is
> > developed. For that reason, there can be multiple versions of a
> > configuration type and the consumer can use whatever type they happend
> > to see when the code was compiled. The current configuration type can be
> > typedefd to a standard name and only needs to be API compatible with
> > previous config types (i.e. only add new fields with default
> > initializers). In C++, one can leverage function overloads to implement
> > that. In C, you can use symbol versioning or do poor-mans-symbol-
> > versioning by #defineing the consuming function names to versioned ones.
> >
> > The only downside of this seems to be that libgpiod would have to keep
> > the old types and overloads for all eternity.
> >
>
> You underestimate the power of the downside...
>
> How do you go about testing all that?
> And propagating those multiple versions through the bindings?
> And testing those?
>
> I think I'd prefer the boiler plate.
>

The scope of the library is well defined and unlikely to be expanded a
lot. To me it seems that user-facing structures for events and request
config should be fine (as long as we leave some padding for future
extensions). I don't see why would we even need multiple types of
configuration and all this nasty casting Helmut mentions? Frankly: I
don't even understand how it would work. In the end: it's not much
different than the situation with data types used in ioctls - just
have a structure with some space of expansion.

Elsewhere Kent mentioned users providing buffers for opaque event
structures. I think this is the worst of both worlds. Users still need
to know the size of the event structure and its internal
implementation can no longer change arbitrarily because this exported
size would change. Users would never be able to use static buffers
when the size can change from one version of the library to another.
Not to mention the unnecessarily complicated code this approach would
require.

Best Regards,
Bartosz Golaszewski
