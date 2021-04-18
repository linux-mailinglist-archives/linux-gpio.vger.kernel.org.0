Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11232363347
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Apr 2021 05:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhDRDso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Apr 2021 23:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhDRDso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Apr 2021 23:48:44 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1E4C06174A
        for <linux-gpio@vger.kernel.org>; Sat, 17 Apr 2021 20:48:15 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id h20so15988121plr.4
        for <linux-gpio@vger.kernel.org>; Sat, 17 Apr 2021 20:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RJULyASVMg5EypNxvVWSLIPDd5cwltEicyl4w8AEgaM=;
        b=BFoGRj1W2+W3PyN7qyDkAnijebqhYglF8NYBPEoNOioSuW4IERgsvS8i0k3U/yUH7i
         ftRSOGPMZsTAsjxKxwhnhJQg8+5JJS7t+N34xzKd9hfyMDweJAmOmShHj8sexoq9lwSh
         Wgk/ZCngkQEEzJ54wom958oOJfj43G8AqDOWmJTy43AFB0HFQVXqslS2HA8851oHZjW3
         X6vebJZOeQMAes3+3qUXlUUqvDeIrnaVasuLAJTqV1MMu/7+gXf3mp89UJHErGn2MzGm
         M4nywH1XLEEZ4AbPTKPFkK8PkpB9pvgxXkcs/yBbJidGWqbQjhRpw83PAod2EJJo4rtv
         yi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RJULyASVMg5EypNxvVWSLIPDd5cwltEicyl4w8AEgaM=;
        b=eJkdGDVg1cbpNepDteWtIA+pYHH1qOcrY5yj0Jq+B/eTROMZ7Kd8S9MM2XcnDCQ9Zt
         vGNtSfvGPy7bJbKydNISdMcujhmTRZFFPigaK7yz22sieBeydR1cHnPGkruhKj52Lsv4
         0AvuadpieAnWw/IduxkLm+QUZBHz2tuNTnFa/xXBpjEnJZSZqlm9Jlc73LbKtXbyQJfw
         WTWf9IrvsqGikVwSy5ubCswfnolWyM9YNLy4Qpcur55sTfC8wcYMpJuntlAt8LZKWjpL
         sfGG3Ye1E7p2GINJw+T7OW6JsZOm9U3e0N09HwV93NhU+a1Z524zTtf2H6rwote2sjxQ
         Os8A==
X-Gm-Message-State: AOAM532qafo2+zx9HKSyOMOxc+xG/BIZxWGv4H966anbipAr04AZSSYk
        +3POCNxZ5y6Rg8xWtbLkkh1AOBScxJQ=
X-Google-Smtp-Source: ABdhPJyhjtRkkcEVZE4FffmxVzSrpq3Ljoasr/gps6ay5p6UA49nd5QKRR4NH8WmtwBlLeQdr+h0og==
X-Received: by 2002:a17:902:e803:b029:e9:1f79:2427 with SMTP id u3-20020a170902e803b02900e91f792427mr16900635plg.21.1618717695119;
        Sat, 17 Apr 2021 20:48:15 -0700 (PDT)
Received: from sol (106-69-169-198.dyn.iinet.net.au. [106.69.169.198])
        by smtp.gmail.com with ESMTPSA id ot17sm10736651pjb.50.2021.04.17.20.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 20:48:14 -0700 (PDT)
Date:   Sun, 18 Apr 2021 11:48:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Message-ID: <20210418034810.GA9261@sol>
References: <20210410145157.30718-1-brgl@bgdev.pl>
 <20210414141534.GA20266@sol>
 <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol>
 <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 17, 2021 at 01:31:01PM +0200, Bartosz Golaszewski wrote:
> On Sat, Apr 17, 2021 at 9:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Apr 16, 2021 at 11:36:08AM +0200, Bartosz Golaszewski wrote:
> > > Hi Kent!
> > >
> > > Thanks a lot for looking at this.
> > >
> > > On Wed, Apr 14, 2021 at 4:15 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Sat, Apr 10, 2021 at 04:51:51PM +0200, Bartosz Golaszewski wrote:
> > > > > This series introduces an entirely reworked API for the core C part of
> > > > > libgpiod. It's not fully functional as the bindings are not modified,
> > > > > and starting from patch 5, even the tests stop working. This is on
> > > > > purpose as I'd like to reach an agreement on the interface before
> > > > > spending time on reworking the tests.
> > > > >
> > > > > My plan for the development of v2.0 is to keep the changes in a separate
> > > > > branch until all bits & pieces are complete and then rearrange them into
> > > > > a bisectable series that will be merged into the master branch.
> > > > >
> > > > > A couple points regarding the design of the new API:
> > > > > - all objects have become opaque and can only be accessed using dedicated
> > > > >   functions
> > > > > - line objects as well as bulk containers have been removed
> > > > > - line requests are now configured using three types of structures: attributes,
> > > > >   line config and request config structures, which follows the kernel API
> > > > > - line request handles have now a lifetime separate from the parent chips to
> > > > >   leverage the separation of chip and request file descriptors
> > > > > - line events are now opaque but they can be stored in a dedicated container
> > > > >   so that memory allocations are not necessary everytime an event is read from
> > > > >   the kernel
> > > > > - the library code has been split into several compilation units for easier
> > > > >   maintenance
> > > > >
> > > > > The new API is completely documented in include/gpiod.h doxygen comments.
> > > > >
> > > > > Please let me know what you think. I am aware that these patches are huge and
> > > > > difficult to review but I'm really only expecting a general API review - all
> > > > > other implementation details can be improved later.
> > > > >
> > > >
> > >
> > > Just to clarify why I did certain things the way I did: there are
> > > certain semi-standardized guidelines to creating low-level C libraries
> > > for linux user-space interfaces. They are gathered in a sample project
> > > called libabc[1][2][3]. Most plumbing-layer libraries follow these
> > > guidelines more or less rigorously. Many low-level programmers will
> > > make certain assumptions based on their previous experiences when
> > > working with libraries and it's good to be as little confusing as
> > > possible.
> > >
> >
> > Fair enough, though I don't see anything in libabc that conflicts with
> > my suggestions, nor that require some of your design choices.
> >
> > > > In that vein, I'll lump my comments here, rather than scattering them
> > > > throughout the patches...
> > > >
> > > > Overall it feels much tighter and clearer than the old API, though that
> > > > could just be personal bias, as it is also closer to the new uAPI.
> > > >
> > > > I find the ownership and lifetime of objects confusing.  I presume you
> > > > want to use the reference counting to simplify the object lifecycle, but
> > > > that just formalises the possibility that objects are shared - further
> > > > confusing the ownership issue.
> > >
> > > Interesting because in my mind reference counting actually simplifies
> > > the life-time of objects - everytime someone (the caller or another
> > > object) stores the address of the object, the reference count is
> > > increased.
> > >
> > > Reference counting is a de-facto standard in C libraries. Look at
> > > libkmod, libudev, libpulse, all the systemd libraries, the whole of
> > > GLib.
> > >
> >
> > I don't doubt that reference counting is out there, I question whether
> > it is necessary here.
> >
> > In my mind reference counting is a tool to be used when you need to
> > share objects and it isn't clear who is responsible for freeing
> > them.  I don't see any need for sharing here at all - for all objects
> > (excluding the gpiod_line_attr that I would remove) it is pretty clear
> > who is responsible for them at all times.
> >
> > > Reference counting makes higher-level programming easier. An object
> > > lives as long as there's at least one user. In C++ bindings the
> > > objects were refcounted using shared_ptr which causes some issues. Now
> > > with refcounting implemented at the C library level, we'll be able to
> > > use the PImpl pattern with unique_ptr and still keep the objects
> > > copyable.
> > >
> >
> > That still sounds to me like you are sharing objects that shouldn't be
> > shared. Or copied.
> >
> > > To summarize: I don't see many disadvantages to using reference
> > > counting other than the fact that my documentation is not yet very
> > > detailed and lacks some general information about how reference
> > > counting works in libgpiod and needs some clarification.
> > >
> >
> > I understand your argument - which is exactly what I had presumed.
> > But I still find the idea of having _unref() acting as the universal free
> > function to be distasteful.
> >
> > > > e.g. gpiod_line_config_add_attribute()
> > > > - who owns the attr after the call?  What happens if it is subsequently
> > > > modified? Is the attr copied or does ownership pass to the config?
> > > > As written it is neither - the attr becomes shared.  How is that
> > > > preferable?
> > >
> > > Yes, it becomes shared. Its reference count is now 2. If the user
> > > modifies it, the config will use a modified value at the time of the
> > > request. To give you a real-life example of such behavior: in GLib
> > > where all GObjects are reference counted, if you pass a reference to a
> > > GFile to another user, then set its (GFile's) attribute, they'll be
> > > changed for the user sharing the object too. Same with how Python or
> > > Java handle references, except you don't need to manage them yourself.
> > >
> >
> > This is all mute if you drop gpiod_line_attr, but I still don't see why
> > sharing is preferable in this case.  It feels like the worst of both
> > worlds - I need to alloc an attr for every add, and I need to unref them
> > as well.
> >
> > > > Similarly gpiod_line_get_consumer() - who owns the returned pointer and
> > > > what is it's lifetime?
> > >
> > > Since simple strings can't be refcounted and this function returns a
> > > pointer to a constant string, the life-time of the string is obviously
> > > tied to that of the line_info object. The doc should probably say:
> > > Returns a pointer to the string stored in the line_info object.
> > >
> >
> > I would dispute the "obviously", particularly since you seem to expect
> > everything else to be unref()ed.
> >
> 
> No, the ref/unref mechanism is customary for opaque structures. Const
> string pointers are always stored in some other object because passing
> const char * to free will result in a warning. In libc all functions
> that return a malloc()'ed string return char *.
> 
> > > > I would prefer the opaque objects to be able to be free()d normally, and
> > > > for any calls that involve a change of ownership to explicitly document
> > > > that fact.
> > > > For objects that require additional setup/cleanup, try to make use of
> > > > open()/close() or request()/release() function name pairings.
> > > > So gpiod_chip would have open()/close(), gpiod_request_handle would have
> > > > request()/release(), and the others would all be new()/free()d.
> > > >
> > >
> > > This makes you use a different set of resource management functions
> > > depending on the object. Additionally some objects can't be created -
> > > only retrieved from other objects.
> > >
> >
> > Yup, different objects have different lifecycles - even your way.
> >
> > > Having a simple ref/unref pair for all opaque data types looks more
> > > elegant to me. Another real-life example from yesterday: I'm working
> > > on a small library to go with the new gpio-sim module (meant as a
> > > replacement for libgpio-mockup) and when I tried to use libmount (to
> > > verify if configfs is mounted and where) I was super confused by its
> > > resource management which is similar to what you suggest but also some
> > > resources need to be freed and some transfer their ownership to other
> > > objects (without reference counting) and while it's all documented and
> > > you can find info on that eventually, I still spent time debugging
> > > strange double-free and other corruptions before I got things right. I
> > > find libudev and libkmod with their consistent reference counting much
> > > more instinctive to use.
> > >
> >
> > I find dealing with repeated frees preferable to dealing with issues
> > related to unexpected side-effects when ownership is unclear.
> >
> > > > Conceptually the config for each line can be considered to be independent
> > > > - the uAPI encoding using attributes and masks is only there to keep the
> > > > uAPI structs to a manageable size.
> > > > At this level you can model it as config per line, and only map
> > > > between the uAPI structures when calling the ioctl()s.
> > > > So I would drop the gpiod_line_attr, and instead provide accessors and
> > > > mutators on the gpiod_line_config for each attr type.
> > > > That removes the whole lifecycle issue for attributes, and allows you to
> > > > provide a simpler abstraction of the config than that provided in the
> > > > uAPI.
> > > > For the mutators there can be two flavours, one that sets the config for
> > > > the whole set, and another that accepts a subset of applicable lines.
> > > > Accessors would provide the config attr for a particular line.
> > > > Both accessor and mutator would use chip offsets to identify the lines.
> > > >
> > >
> > > I had exactly this in mind initially but couldn't find an elegant interface.
> > >
> > > There are two options I see:
> > >
> > > gpiod_line_config_set_drive(cfg, drive);
> > > gpiod_line_config_set_drive_index(cfg, drive, index);
> > >
> > > or:
> > >
> > > gpiod_line_config_set_drive(cfg, drive);
> > > unsigned int indices[] = { 0, 3, 4, 6 };
> > > gpiod_line_config_set_drive_index(cfg, drive, indices);
> > >
> > > The former would require a separate function call for each line, the
> > > former needs a lot of boilerplate code because we'll usually have to
> > > alloc & fill the indices array. Eventually I decided to go with
> > > attributes but if you have some ideas/suggestions for that, they're
> > > welcome!
> > >
> >
> > I generally avoid variadic functions, but this might be an application
> > where they make sense.  i.e. make your indices variadic.
> > Oh, and make them offsets ;-).
> >
> > > > Not sure I like merging the direction and edge into the request_type.
> > > > I would tend to keep those separate, with set_direction and
> > > > set_edge_detection functions, with the latter forcing input direction.
> > > >
> > >
> > > If there's no way we can use output with edge detection, why even
> > > bother with allowing the user to try to set output mode for
> > > edge_detection or vice-versa? It's just more error checking for no
> > > benefit, right? The user will still find out that the line is in input
> > > mode with the line_info.
> > >
> >
> > You are adding another concept for the user to grok - the request_type.
> > They will need to understand direction and edge detection anyway, why
> > add a new concept to the mix?
> >
> > Oh, and wrt error checking, in my Go library, and as I suggest above,
> > setting edge detection overrides any previous direction setting and
> > forces input.  Similarly setting output direction cancels any edge
> > detection.  So the config presented to the kernel will always be
> > consistent and never trigger an EINVAL.  And that is all documented in
> > the corresponding config functions.
> >
> > Similarly the drive settings.
> >
> > The library policy is last-in-wins, which it can be as there are
> > distinct calls for each attribute, whereas at the uAPI they are merged
> > into flags.
> >
> > > > I would rename gpiod_request_config to gpiod_request_options.  Config
> > > > is long lived and can be modified, whereas options are one-off.
> > > > And it would reduce any chance of confusion with gpiod_line_config.
> > > >
> > >
> > > Not sure about this one. With the current naming, it's being made
> > > clear that we have two separate things to configure, the line(s) and
> > > the request itself. Naming both "_config" makes a clear distinction.
> > > Also: the request config can be reused too for separate requests.
> > >
> >
> > I meant one-off wrt a single request.  i.e. changing the options after
> > the lines have been requested can never impact the request, whereas a
> > changed config can be applied with the set_config().
> >
> > > > gpiod_line_mask should highlight that the bits correspond to lines on
> > > > the request, in the order provided to gpiod_request_config_set_offsets(),
> > > > not line offsets on the chip.  Perhaps the gpiod_request_config or the
> > > > gpiod_request_handle should provide the mask functions for a given a
> > > > qchip offset, rather than require the user to track the mapping?
> > > > Then the gpiod_line_mask can be opaque as well.
> > > >
> > >
> > > Yes, this is one of those things I struggled with. I wasn't sure which
> > > one's better because if the user wants to request 64 lines, then set a
> > > separate config for 20 of them, it's a lot of function calls if we
> > > allow to set line config by offset of a single line, or we get a
> > > complicated API with allowing arrays of offsets.
> > >
> > > Agreed for the line map functions, it's probably the most confusing
> > > element of this new API. I'll come up with something.
> > >
> >
> > Ideally I would like to avoid the gpiod_line_mask totally, and always
> > deal in chip offsets.
> >
> > The API should be simplest for the most common use cases.
> > Those far corner cases can be a pain to use, but must still be possible.
> > I would put the priority on handling the most common cases:
> > A. all lines
> > B. one line
> > C. a subset of lines
> >
> > I would expect A to be the most common by far - that was all that the
> > previous API supported, then B and then C.
> > I had suggested providing A and C, with B being a special case of C.
> > But I could live with C being implemented as multiple calls to B.
> >
> > A variadic function could manage all three, with no offsets meaning all
> > lines?  Though in practice I would probably provide distinct functions
> > for A and B, and reserve the variadic for C.
> >
> > Cheers,
> > Kent.
> >
> 
> Thank you for your insight and suggestions. You are right about how
> the config should be handled and the example with priorities is
> spot-on. I'm still not sure about the naming for config structures but
> that's a minor detail.
> 

I forgot to add that wrt the config mutators, you need to allow
overriding of existing config, rather than returning an error on
conflict, so that you can change config for the set_config ioctl().
Hence the last-in-wins approach.  And as a consequence the mutator is
always right and so needs no return code.

And you might want to add a copy() for config to allow the user to
easily create two slightly different configurations.

> I was on the fence wrt reference counting but then realized that in
> C++ or Python we still need to provide a mechanism for unconditional
> closing of chips and releasing of requests. For the former it's
> because otherwise we'd need to make the object go out of scope
> manually (probably by storing it in another object that would be
> "closed" -> pointless abstraction) and in the latter case: Python
> doesn't even guarantee that the destructor will be called at any
> specific point.
> 

Hmmm, ok, I was assuming the C++ bindings would wrap the C objects in C++
objects, and the C++ destructor would release any associated resources.

For Python I would probably go with an explicit close() or equivalent.
My Go library has to use that approach as there are no destructors in Go.

> So it seems that it is the right way to go after all and these objects
> simply will not be shared. In C++ this will be addressed by providing
> move constructors and operators, in Python reference counting is
> natural so there's no problem. Same for GLib bindings I want to
> implement before providing the dbus API.
> 
> You haven't commented on the line & watch events. I would love to hear
> your opinion on that too.
> 

Didn't have any major problems with them on the first pass - nothing
worth commenting on anyway.

I presume that the info events don't get a buffer as they are
expected to be low rate.

A zero timeout in the wait() will not block, and just return the event
availability?

Perhaps the wait() and read() should be strictly orthogonal, i.e. the
read() should never block (blocking functions are bad, as per libabc).
At least the wait() will eventually timeout (assuming a zero timeout
doesn't block forever).
Or the two could be combined?

Oh, and in the @return for gpiod_line_event_buffer_copy_event(),
"decreases" should be "decreased".

> For v2 I intend to apply the renaming of chip accessors to master and
> then squash all patches adding the new API into one because splitting
> them doesn't make the reviewing any easier. Except maybe for the line
> watch patch which is logically separate.
> 

Fair enough. In this case I applied all the patches and looked at the
resulting gpiod.h, as I wasn't terribly interested in the changes - only
the final result.

Cheers,
Kent.

> Best regards,
> Bartosz Golaszewski
