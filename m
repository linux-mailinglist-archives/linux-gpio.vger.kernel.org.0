Return-Path: <linux-gpio+bounces-6321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5A8C3D22
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 10:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F113B282492
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 08:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4BD1474A2;
	Mon, 13 May 2024 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qEoGP7ae"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1E146A91
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715588905; cv=none; b=FiwngEPoWJrbMElZavMfzNVHYkaf5QYAOB2qztIh5DOVFnU6SLMMU6dPlR68Jwdhzr1x6FxpOlU6PKze+g4fQ4AdRN08SYnCxBysOo1K+eIh7uXv2oHPT9NTF5dGSEzc4uvcVXoSl/3P1TW398NZFKGcLqY4My+tWvkgWX8uTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715588905; c=relaxed/simple;
	bh=yTEMjAu9k1M0No0etUEO0L4vxut/mM2QW7tpz1Bmw60=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfqzUb48j9LMUDBmZAEvQSBbc1iG9Z9trrFzWShkvRN0K0lB8O0y/codXr5uKTs4KmeieImbFIjTxzkq2eH7DVHF878Xoxyw9aBdVWGlO9XXmZoo0IIGwWlvGkY7vj37jvWw4vU+DZlZg14eQI75b59uuQMjc0bnPbEE4NHbKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qEoGP7ae; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51fc01b6fe7so4167078e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715588901; x=1716193701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrNJGwkt1l5xBHkaXFnYy3W86c1gApp/Gp/XNr+uEio=;
        b=qEoGP7aerY4JJ4+W42dhyVLZBHRiTb2CEItP4XlnydGVGiRCMnkpgigK4CFihZLMgF
         IN/VCevg0CS1NnmoFYJWvOe65yjdlNdirpLBfiRsDMs46Ui/AZp8xs/ntGJNbLML50Rk
         QRynsF4L8xIDk3FdQ1gICgXXTDd3OoDk6WeNxiOepxlU2HyNdFGNabogVDHzY8T+qRdK
         6wwnN3tTmy/n/ManjH7FD5gd1LppwsArZetabTTLcfFX1F/0AcSwjLOQ39slRgSlYLGN
         fJ9Wxq2m0wL1YnM3Lo2mlTSk4uZSzREptRMxYtQzLdoMcTmOPvloNH2t+9qj5E6Vy/oJ
         LYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715588901; x=1716193701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VrNJGwkt1l5xBHkaXFnYy3W86c1gApp/Gp/XNr+uEio=;
        b=kHxWQQfownIgSt+MCpdTKvITWjGk37QZBro3qV11TAGlMgu7TcvNgpK6ePC91nFNY3
         Un2/BnKKZWTSF0mOMs4DyhT7oyPsV5EvZJkWKwqthaAdl88zckAVBefRkpFlgvn3CH/W
         DOzhA8H6aixYMfm/LwUf1e38bPf9n3jNDlWoZu04kQ11ckynCB9cuQLVMlPDsOqdS44j
         KjUuaOdIt0Nr2eCmMoRQKyVJb5+laBGPxtxbTLPpigYZPvF0dpuEtY58O8YLfcwLZoLx
         w7AK3dfWEUnjAEzLHHZb7ZiWDgRX2A6k0gLSbEO12AYuD0nR0w4fgrCSWPqKfmYgCSYO
         /k9Q==
X-Gm-Message-State: AOJu0YzUa40JqWS5X+tS18JVLnbqejddadl5dHKVnof9fWWrGPRZMuZL
	dIeIfdE6/cbHcmTf4mvVIZoQgwY388Jyz/heEZd7lB6WRFjOQ9A7H30BlZsr4Q3v67LgifrBIFu
	Ddh7RxwN9dkZmE7Hoy4Y0vuPiguanR+6j2igbWA==
X-Google-Smtp-Source: AGHT+IFoljs0L4Sy/dEMH/PyU3ABG5IUU5qJ8AZ32WKOLTd4pO6mLv8cGsUAhF4BdXNSC+LxnFde1ryxFgUs/Ej+TEA=
X-Received: by 2002:a05:6512:3b07:b0:51b:de3a:33ac with SMTP id
 2adb3069b0e04-5221058453amr7140316e87.59.1715588900411; Mon, 13 May 2024
 01:28:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 May 2024 01:28:19 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20240511011144.GA3390@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507022106.GC26136@rigel> <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
Date: Mon, 13 May 2024 01:28:19 -0700
Message-ID: <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 11 May 2024 03:11:44 +0200, Kent Gibson <warthog618@gmail.com> said=
:
> On Fri, May 10, 2024 at 08:37:08PM +0200, Bartosz Golaszewski wrote:
>> On Tue, May 7, 2024 at 4:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com=
> wrote:
>> >
>> > Hi Bart,
>> >
>> > I realise you want to keep libgpiod minimal, but in my latest survey o=
f the
>> > problems that new or potential users are finding with libgpiod the mos=
t
>> > common one was that it is way too complicated to do simple things.
>> > They just want to request an input or output line and play with it.
>> > They think that should be an easy thing to do, and will completely wri=
te
>> > off libgpiod because it is not - the learning curve is too steep.
>> > And they have a point.
>> >
>> > I've raised this before, but I think libgpiod is in need of a small (a=
nd I
>> > emphasize small) set of helper functions to simplify basic use cases,
>> > like just requesting a single input or output line.  Maybe functions t=
o
>> > control setting bias, edge detection and debounce on inputs (using
>> > reconfigure after the initial request).
>> > The functions would be separated from the existing functions by naming=
,
>> > e.g. gpiod_helper_XXX, or some such, so there would be no confusion wi=
th
>> > the existing.
>> >
>> > Any chance your position has changed since last I asked?
>> >
>>
>> Ugh... I really don't want the core libgpiod to grow... This sounds
>> like the old ctxless stuff that was awkward and I removed it in v2.
>>
>
> I understand - slippery slope and keeping minimal.
> But I think we do need some solution for simple one line request cases th=
at
> can get users up and running with a smaller learning curve.
> Then they can learn more if they want more.
>

I don't disagree on this point but I still think core libgpiod is not the r=
ight
place for it.

>> Do you think that users actually use it (core C libgpiod)?
>
> Yeah, they do, believe it or not.  I'm mainly talking the vocal Pi crowd,
> many of whom are used to going bare metal to the hardware, and are now
> searching for an alternative.  libgpiod as it stands is too complicated f=
or
> them - they just want to drive a pin up and down or read a button.
> There are a few other alternatives that let them do that, and they will
> switch on that basis alone, and never look back, though they will happily
> spread their rather toxic opinions of libgpiod vs those alternatives.
>
>> I would think they stick to python and C++?
>
> They are actually less likely to go C++ - more learning curve.
> And Python can be considered too heavyweight in situations with limited
> resources.
>

I see. We're being held hostage by the RPi crowd. :)

>> Would providing the GLib bindings
>> help in this case? We could extend that no problem. Or maybe a
>> separate helper library linked against libgpiod but also existing kind
>> of adjacent to it?
>>
>
> Sorry, I even haven't looked at the GLib bindings, but I will take a
> look.  The core would be better if possible - they would be displeased
> having to install yet another library just for basic commands.  But it
> would be better than nothing.
>
> This is what I currently have in mind for the C API:
>
> /**
>  * @}
>  *
>  * @defgroup olr One line requests - helper functions for basic use cases
>  * @{
>  *
>  * Various functions that provide a simplified interface for basic use ca=
ses
>  * where the request only contains one line.
>  */
>
> /**
>  * @brief Request a single input line.
>  * @param chip Path to the GPIO chip.
>  * @param offset The offset of the GPIO line.
>  * @return New line request object or NULL if an error occurred. The requ=
est
>  *         must be released by the caller using ::gpiod_line_request_rele=
ase.
>  */
> struct gpiod_line_request *
> gpiod_olr_request_input(const char *path, unsigned int offset);
>
> /**
>  * @brief Request a single input line.
>  * @param chip Path to the GPIO chip.
>  * @param offset The offset of the GPIO line.
>  * @param value The value to set the line.
>  * @return New line request object or NULL if an error occurred. The requ=
est
>  *         must be released by the caller using ::gpiod_line_request_rele=
ase.
>  */
> struct gpiod_line_request *
> gpiod_olr_request_output(const char *path,
> 			 unsigned int offset,
> 			 enum gpiod_line_value value);
>
> /**
>  * @brief Set the bias of requested input line.
>  * @param olr The request to reconfigure.
>  * @param bias The new bias to apply to requested input line.
>  * @return 0 on success, -1 on failure.
>  */
> int gpiod_olr_set_bias(struct gpiod_line_request * olr,
> 		       enum gpiod_line_bias bias);

For this to work, you'd most likely need a new struct wrapping the request
and also storing the line config. Otherwise - how'd you keep the state of a=
ll
the other line settings?

>
> /**
>  * @brief Set the debounce period of requested input line.
>  * @param olr The request to reconfigure.
>  * @param period The new debounce period to apply, in microseconds.
>  * @return 0 on success, -1 on failure.
>  */
> int gpiod_olr_set_debounce_period_us(struct gpiod_line_request *olr,
> 				     unsigned long period);
>
> /**
>  * @brief Set the edge detection of requested input line.
>  * @param olr The request to reconfigure.
>  * @param edge The new edge detection setting.
>  * @return 0 on success, -1 on failure.
>  */
> int gpiod_olr_set_edge_detection(struct gpiod_line_request * olr,
> 				 enum gpiod_line_edge edge);
>
> /**
>  * @}
>  */
>
> I think those 5 functions cover the basics.  That is it.  Done. No more.
> Unless you can think of something I've missed.
>

I'm afraid it never ends up being enough. We'd just open the door for all k=
inds
of extensions to libgpiod. Very soon someone would want a callback-based AP=
I
for reading edge events. Next you'll have people asking to be able to toggl=
e
the direction of a pin without touching the config structures which will re=
quire
us to somehow store the context of the request. "That is it" never works.

> I went with _olr_ as the prefix to clearly separate it from the existing,
> but kept it as brief as possible.

I don't like this prefix. In fact I think it's even worse than the - alread=
y
crappy - _ctxless_ prefix we have in v1.6.x. It's not clear at first glace
what it stands for and it'll be confusing as soon as we add more such
extensions.

> It also chains with the trailing "d" in gpiod so it is pronouncable.
>
> I was toying with adding get_value()/set_value(), but all they offered wa=
s
> dropping the offset param, so not enough benefit and I dropped them.
>
> I haven't put much thought into whether those should be carried through
> to the bindings, but don't see any fundamental reason they couldn't.
>

In most cases bindings do allow you to do what you try to achieve here with
one-liners already. I think this really only applies to C.

> Anyway, have a think about it.
> And I'll go take a look at the GLib bindings.
>

I have thought about it. I agree we could use some simpler interfaces. I do=
n't
agree their place is in core libgpiod. I understand we want to make this ne=
w
interface seamless to use for end-users of libgpiod.

How about introducing a new header and a separate shared object: gpiod-ext.=
h
and libgpiod-ext.so respectively? We could put all these new helpers in the=
re,
use the gpiod_ext_ prefix for all of them and distros could package the
"extended" part of libgpiod together with the core library to avoid having =
to
install multiple packages?

We'd keep the clear distinction between the low-level, core C library wrapp=
ing
the kernel uAPI and the user-friendly C API. Though the user-friendly API i=
n my
book could be the GLib library but I understand not everyone wants to use G=
Lib
nor is familiar with GObject.

Bart

