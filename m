Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00A55EF488
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 13:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbiI2Ln0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 07:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiI2LnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 07:43:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11254137914
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 04:43:24 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id u69so1226434pgd.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VffcU/I7l0bKIbYm1ircaLOmu08RzELOCVStQe2A14o=;
        b=dQHvALQSIq5qRUaXm1Ml+LJzlfaRu+OQzMs/9l7p231W0xkv1I2PIeDNJlSNgjK9SX
         EuoxcoKjuFHmbDzC4eXiKq3cvPmrlhEYAhUbdSTPhQKgvEAs5lISZibR7csBLcWXiv3d
         JoLBj1aV7P6VPudj1A8iT9LaLbQuGXbTyNGHfqW4Vanbm5X9rEIdSFqzP5B0XJov0fnc
         iESlesiRG3BAVoHf3i18CpHE9H6mzosjrDIr3rCUOn+vgQKh6wJa59qJ8mbRq3ccyifZ
         +46y16SWDPiF2rEACq0Dnu+M/t75EwlCpw+IRpd4Uju1QuXgPVAk4ecor2KEKspIhlN8
         KM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VffcU/I7l0bKIbYm1ircaLOmu08RzELOCVStQe2A14o=;
        b=kc7In77aDjLtYiguRjGjj2AADGgT+CTIBlOYBHFTzcEpb8zpTe4UfBbpain0mG/CIY
         +xceXuxiYPDbBnMUxHpCagPqm6bITezdJlmrjDZ9oHPpCZPVfPaMBUGLnU3HhcPR40/G
         W5Khd8UpABibWDMbL72WaOOy+QYXAVlYguPmnymGGRdh8q/Tv1RyFPsYnQGC5iA11vyw
         zoYSlwBSL5FXO3UgMLJzpTlH8G17q52bWP+6NXD9zEoil+rZa2y2P5RtUgriuPz1lx9N
         qd6Wb7JIJAA/V/styECCiZ6iwCEWBu2rbPPjdD6WMngXp3ZuV5G32OdgUUG6/NvYt5pl
         4GHw==
X-Gm-Message-State: ACrzQf1yCjCr7y/21BOQl0TJca9gXsYFYvtHWp0849lDTkH+qALgsEl1
        buNwov8zDYzwxo3qtRJV7w0=
X-Google-Smtp-Source: AMsMyM5DzwqHvrgCjI/LgyMpfujtuLxSaNokxtSfVEORlSBPEzR8mOxUjXuWc26VxF2bx75SyufdsA==
X-Received: by 2002:a63:85c2:0:b0:43a:dff6:d42d with SMTP id u185-20020a6385c2000000b0043adff6d42dmr2535589pgd.519.1664451803484;
        Thu, 29 Sep 2022 04:43:23 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id g30-20020aa79f1e000000b00537f16e25d3sm5971226pfr.75.2022.09.29.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 04:43:23 -0700 (PDT)
Date:   Thu, 29 Sep 2022 19:43:16 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <YzWE1BpdCEqJqDJN@sol>
References: <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <20220929065409.rqilrzxaczvvds4i@vireshk-i7>
 <CAMRc=McSZWLdPNESPLfDD4UgyvtyU7BcvB-ZZrvDWM3LDYjEMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McSZWLdPNESPLfDD4UgyvtyU7BcvB-ZZrvDWM3LDYjEMA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 29, 2022 at 09:37:40AM +0200, Bartosz Golaszewski wrote:
> On Thu, Sep 29, 2022 at 8:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 28-09-22, 19:54, Bartosz Golaszewski wrote:
> > > On Wed, Sep 28, 2022 at 5:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > Hmm, so what exactly do we want to do here then ?
> > > >
> > > > - Don't allow events to be referenced ? i.e. make event_clone() the default
> > > >   behavior ?
> > > >
> > >
> > > God no, that would be wasteful.
> > >
> > > > - Don't allow read_edge_event() to be called twice for a buffer ? that will be
> > > >   inefficient though.
> > > >
> > >
> > > Not good either.
> >
> > As I expected for both of them :)
> >
> > > > - Somehow guarantee that reference to all the events are dropped before issuing
> > > >   read_edge_event() again, else make it fail ? I am not sure how straight
> > > >   forward that can be though.
> > >
> > > In C++ the preferred way is to do buffer.get_event(0) which will
> > > return a constant reference. If you store that reference as const
> > > edge_event& ev = buffer.get_event(0) and reuse it after rereading into
> > > that buffer and the program crashes - that's on you. In most cases you
> > > should just do buffer.get_event(0).line_offset() etc. If you do:
> > >
> > > edge_event event = buffer.get_event(0);
> > >
> > > You'll copy the event and it will survive the overwriting of the buffer.
> >
> > Right, same happens here.
> >
> > > I'm a Rust beginner but my understanding is that the whole idea of the
> > > language design is to *not* allow a situation where the program can
> > > crash. It should be detected at build-time. We must not rely on
> > > "contracts" defined by documentation.
> >
> > If everything was written in Rust, then this problem won't occur for sure. But
> > in this case part of the code is available via FFI (foreign function interface)
> > and they guarantees are a bit limited there and depend on what the FFI
> > guarantees.
> >
> > > Is there a way to invalidate a reference in Rust? Have a small (cheap)
> > > object in the buffer which the event references and which would get
> > > dropped when reading into the buffer?
> >
> > I am not sure. There are locks, but then they have a cost.
> >
> 
> I'm not talking about locking, this should be left to the user of the module.
> 
> Can we force-drop an object still referenced by other objects in Rust?
> This is what I had in mind - a small, dummy, cheap object inside the
> buffer that's created when reading into the buffer. Each even would
> reference it and then Rust would not allow us to drop it as long as
> there are references to it. Does it make sense? Is that possible?
> 

No, Rust will explicitly prevent you from dropping referenced objects.

But is this the sort of thing you mean:

use std::process::ExitCode;

#[derive(Clone)]
struct Event {
    pub id: u8
}

struct Events {
    b: Vec<Event>
}

impl Events {
    pub fn get(&self, idx: usize) -> Option<&Event> {
        self.b.get(idx)
    }
}

struct Buffer {
    count: u8,
    events: Option<Events>,
}

impl Buffer {
    
    pub fn read(&mut self) -> Result<&Events, ()> {
        self.count += 1;
        self.events = Some(Events{b: vec![Event{id: self.count}]});
        self.events.as_ref().ok_or(())
    }
}

fn main() -> Result<ExitCode, ()>{
    let mut b = Buffer{count: 0, events:None};
    let mut ee = b.read()?;
    let e = ee.get(0);
    println!("{:?}", e.unwrap().id);
    let cloned_e = e.unwrap().clone();
    drop(e); // <-- comment out to try to create a dangling event reference
    ee = b.read()?;
    let e = ee.get(0); // <-- comment out to try to create a dangling event reference
    println!("{:?}", cloned_e.id);
    println!("{:?}", e.unwrap().id);
    Ok(ExitCode::from(42))
}

That is a skeletal proof of concept - the small, dummy, cheap object is
the Vec in Events.  Is that cheap enough? You might be able to replace
that with something cheaper, but Events needs to be able to pull an
Event reference from somewhere (from the borrow checker's PoV) so it
made this demo simpler.

Comment out the two lines to try to carry e across the buffer read().
The compiler will not allow it, as e already borrows from b.

In an actual implementation Event would wrap the C event, and Events.get()
would get the event pointer for the Event and return that as a reference.
The Event clone would call into C, rather than being derived as it is here.

Key points:  Buffer has to own the Events snapshot that is returned by
reference by read().  The return by reference creates a borrow on the
Buffer.  The read() requires a &mut to prevent the Buffer being read
while there are any borrows outstanding.
The Events returns individual events by reference to create a borrow on
the Events to prevent it (and the Buffer) being dropped or modified.
The Event clone returns a concrete event that does not have a borrow of
the Events or Buffer.

There may well be better ways to do this, and you would really want to
do some benchmarking to compare it with the immediate clone option - it
may well be worse, but hopefully it at least demonstrates the semantics
you are after.

Cheers,
Kent.
