Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292D5361D95
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Apr 2021 12:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241052AbhDPJgq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Apr 2021 05:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbhDPJgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Apr 2021 05:36:44 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B47C061574
        for <linux-gpio@vger.kernel.org>; Fri, 16 Apr 2021 02:36:20 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id r12so41217516ejr.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Apr 2021 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2A01xOL17DhbZZ1SBuxgQIUTgi/UpVaSiB1NZqicE0=;
        b=EhwmsuFV/+i7FhORfDbOf+Yfu0kSq6Vm3ci+ae0LmMtCOu38cMWTC1r3hPwTvkusDk
         th+FHL3N9uHuomO08NfXpZo4piQc2h0hXeYt/r4cS3Xen24WOIptGr2XRFciJMDClV/p
         VistowD6uYh8AJGse8tvHqyEvSslCKIlqasuGjZLOr/RBzu4YvscuDIYWDbN53IlgO0o
         gt+7pFXc+80QrKryITFBoJHcxdJ+SNUS56aDFoXmv3l413k5pJCPU2To1YHAm+GAQWBu
         p64TeJPXG3cLLDvUAj03VyWZ41/khfZXdW6HMTaWJd/f+k2kZh/4PPLmQazqIgZgQAeO
         3yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2A01xOL17DhbZZ1SBuxgQIUTgi/UpVaSiB1NZqicE0=;
        b=mDGFonz9VdCatNFu4ZrdAqv1HzfUf5gqY1h2ntzDsvKY9UIBDMHyvvooY0dRgO6yLy
         7utv0OOK4yauPCf8z1AbNLtuCjlXJvn+dfUIHjyqU8GmNzt205d+RNoNGn3PqhWYM5Ai
         OdzcQZ+Zs+KUAfRnKuOlJlakiJxloTziS9hnRc8llOj5cyj01zn35CzAuuTQDaTPyH4l
         6NboTlomSor8wgfN2pa2FTntoWMCPCM1h00NAvj4GHDD/P1Bo2VqnS8jaBpZ4m5O1P8o
         RG8Gc5zHRuJMSCxw7QOzb4gxg8ihM74rFrTTlRSJ1Gq3ZIo5DjbQoLxben1kAFqXXDIL
         1o6Q==
X-Gm-Message-State: AOAM530Wl18wmVJkzkZ7+prJ1EzPe/1bqMU+5irf/0UxY7fffPGKvyv7
        sZBf4F9q2H0itg7+bV3Q7gj1Kja5ZuUvLtD3KGg5qg==
X-Google-Smtp-Source: ABdhPJxR9QCCDABFBo4lnHQp3J2lRYyphPJYXIiHBnELIw0lDkA8zLnkhVT+FPMZxNfxTEpyJ524JgA8n67k8GnJvb0=
X-Received: by 2002:a17:906:b7ce:: with SMTP id fy14mr7432073ejb.261.1618565778898;
 Fri, 16 Apr 2021 02:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210410145157.30718-1-brgl@bgdev.pl> <20210414141534.GA20266@sol>
In-Reply-To: <20210414141534.GA20266@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Apr 2021 11:36:08 +0200
Message-ID: <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent!

Thanks a lot for looking at this.

On Wed, Apr 14, 2021 at 4:15 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sat, Apr 10, 2021 at 04:51:51PM +0200, Bartosz Golaszewski wrote:
> > This series introduces an entirely reworked API for the core C part of
> > libgpiod. It's not fully functional as the bindings are not modified,
> > and starting from patch 5, even the tests stop working. This is on
> > purpose as I'd like to reach an agreement on the interface before
> > spending time on reworking the tests.
> >
> > My plan for the development of v2.0 is to keep the changes in a separate
> > branch until all bits & pieces are complete and then rearrange them into
> > a bisectable series that will be merged into the master branch.
> >
> > A couple points regarding the design of the new API:
> > - all objects have become opaque and can only be accessed using dedicated
> >   functions
> > - line objects as well as bulk containers have been removed
> > - line requests are now configured using three types of structures: attributes,
> >   line config and request config structures, which follows the kernel API
> > - line request handles have now a lifetime separate from the parent chips to
> >   leverage the separation of chip and request file descriptors
> > - line events are now opaque but they can be stored in a dedicated container
> >   so that memory allocations are not necessary everytime an event is read from
> >   the kernel
> > - the library code has been split into several compilation units for easier
> >   maintenance
> >
> > The new API is completely documented in include/gpiod.h doxygen comments.
> >
> > Please let me know what you think. I am aware that these patches are huge and
> > difficult to review but I'm really only expecting a general API review - all
> > other implementation details can be improved later.
> >
>

Just to clarify why I did certain things the way I did: there are
certain semi-standardized guidelines to creating low-level C libraries
for linux user-space interfaces. They are gathered in a sample project
called libabc[1][2][3]. Most plumbing-layer libraries follow these
guidelines more or less rigorously. Many low-level programmers will
make certain assumptions based on their previous experiences when
working with libraries and it's good to be as little confusing as
possible.

> In that vein, I'll lump my comments here, rather than scattering them
> throughout the patches...
>
> Overall it feels much tighter and clearer than the old API, though that
> could just be personal bias, as it is also closer to the new uAPI.
>
> I find the ownership and lifetime of objects confusing.  I presume you
> want to use the reference counting to simplify the object lifecycle, but
> that just formalises the possibility that objects are shared - further
> confusing the ownership issue.

Interesting because in my mind reference counting actually simplifies
the life-time of objects - everytime someone (the caller or another
object) stores the address of the object, the reference count is
increased.

Reference counting is a de-facto standard in C libraries. Look at
libkmod, libudev, libpulse, all the systemd libraries, the whole of
GLib.

Reference counting makes higher-level programming easier. An object
lives as long as there's at least one user. In C++ bindings the
objects were refcounted using shared_ptr which causes some issues. Now
with refcounting implemented at the C library level, we'll be able to
use the PImpl pattern with unique_ptr and still keep the objects
copyable.

To summarize: I don't see many disadvantages to using reference
counting other than the fact that my documentation is not yet very
detailed and lacks some general information about how reference
counting works in libgpiod and needs some clarification.

> e.g. gpiod_line_config_add_attribute()
> - who owns the attr after the call?  What happens if it is subsequently
> modified? Is the attr copied or does ownership pass to the config?
> As written it is neither - the attr becomes shared.  How is that
> preferable?

Yes, it becomes shared. Its reference count is now 2. If the user
modifies it, the config will use a modified value at the time of the
request. To give you a real-life example of such behavior: in GLib
where all GObjects are reference counted, if you pass a reference to a
GFile to another user, then set its (GFile's) attribute, they'll be
changed for the user sharing the object too. Same with how Python or
Java handle references, except you don't need to manage them yourself.

> Similarly gpiod_line_get_consumer() - who owns the returned pointer and
> what is it's lifetime?

Since simple strings can't be refcounted and this function returns a
pointer to a constant string, the life-time of the string is obviously
tied to that of the line_info object. The doc should probably say:
Returns a pointer to the string stored in the line_info object.

> I would prefer the opaque objects to be able to be free()d normally, and
> for any calls that involve a change of ownership to explicitly document
> that fact.
> For objects that require additional setup/cleanup, try to make use of
> open()/close() or request()/release() function name pairings.
> So gpiod_chip would have open()/close(), gpiod_request_handle would have
> request()/release(), and the others would all be new()/free()d.
>

This makes you use a different set of resource management functions
depending on the object. Additionally some objects can't be created -
only retrieved from other objects.

Having a simple ref/unref pair for all opaque data types looks more
elegant to me. Another real-life example from yesterday: I'm working
on a small library to go with the new gpio-sim module (meant as a
replacement for libgpio-mockup) and when I tried to use libmount (to
verify if configfs is mounted and where) I was super confused by its
resource management which is similar to what you suggest but also some
resources need to be freed and some transfer their ownership to other
objects (without reference counting) and while it's all documented and
you can find info on that eventually, I still spent time debugging
strange double-free and other corruptions before I got things right. I
find libudev and libkmod with their consistent reference counting much
more instinctive to use.

> Conceptually the config for each line can be considered to be independent
> - the uAPI encoding using attributes and masks is only there to keep the
> uAPI structs to a manageable size.
> At this level you can model it as config per line, and only map
> between the uAPI structures when calling the ioctl()s.
> So I would drop the gpiod_line_attr, and instead provide accessors and
> mutators on the gpiod_line_config for each attr type.
> That removes the whole lifecycle issue for attributes, and allows you to
> provide a simpler abstraction of the config than that provided in the
> uAPI.
> For the mutators there can be two flavours, one that sets the config for
> the whole set, and another that accepts a subset of applicable lines.
> Accessors would provide the config attr for a particular line.
> Both accessor and mutator would use chip offsets to identify the lines.
>

I had exactly this in mind initially but couldn't find an elegant interface.

There are two options I see:

gpiod_line_config_set_drive(cfg, drive);
gpiod_line_config_set_drive_index(cfg, drive, index);

or:

gpiod_line_config_set_drive(cfg, drive);
unsigned int indices[] = { 0, 3, 4, 6 };
gpiod_line_config_set_drive_index(cfg, drive, indices);

The former would require a separate function call for each line, the
former needs a lot of boilerplate code because we'll usually have to
alloc & fill the indices array. Eventually I decided to go with
attributes but if you have some ideas/suggestions for that, they're
welcome!

> Not sure I like merging the direction and edge into the request_type.
> I would tend to keep those separate, with set_direction and
> set_edge_detection functions, with the latter forcing input direction.
>

If there's no way we can use output with edge detection, why even
bother with allowing the user to try to set output mode for
edge_detection or vice-versa? It's just more error checking for no
benefit, right? The user will still find out that the line is in input
mode with the line_info.

> I would rename gpiod_request_config to gpiod_request_options.  Config
> is long lived and can be modified, whereas options are one-off.
> And it would reduce any chance of confusion with gpiod_line_config.
>

Not sure about this one. With the current naming, it's being made
clear that we have two separate things to configure, the line(s) and
the request itself. Naming both "_config" makes a clear distinction.
Also: the request config can be reused too for separate requests.

> gpiod_line_mask should highlight that the bits correspond to lines on
> the request, in the order provided to gpiod_request_config_set_offsets(),
> not line offsets on the chip.  Perhaps the gpiod_request_config or the
> gpiod_request_handle should provide the mask functions for a given a
> qchip offset, rather than require the user to track the mapping?
> Then the gpiod_line_mask can be opaque as well.
>

Yes, this is one of those things I struggled with. I wasn't sure which
one's better because if the user wants to request 64 lines, then set a
separate config for 20 of them, it's a lot of function calls if we
allow to set line config by offset of a single line, or we get a
complicated API with allowing arrays of offsets.

Agreed for the line map functions, it's probably the most confusing
element of this new API. I'll come up with something.

> I would rename gpiod_request_handle to gpiod_line_request.
> And request.c to options.c, and handle.c to request.c.
>
> gpiod_line_attr_set_debounce() can use a zero period to identify
> disabling debounce, so the debounce flag is redundant.
>

Sounds good.

Bart

> Cheers,
> Kent.

[1] http://0pointer.de/blog/projects/libabc.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git/plain/README
