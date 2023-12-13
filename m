Return-Path: <linux-gpio+bounces-1339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31081074C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 02:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3751C20E0A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 01:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26800A53;
	Wed, 13 Dec 2023 01:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SV3CZBMr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280BB9C
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 17:08:02 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cec976b197so3663609b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 17:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702429681; x=1703034481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZgV4+7h5FvquOXD3BbTOC+xkF/l28SqUDxOBNlsEk0=;
        b=SV3CZBMriBBhdUruyHKCbvTawr6661l1xR2ZDeEKI3w1JTSi49wGLbuUHTGr/9YgWK
         PdvEwLpiFbc1L6F5yhXCpOC3oxdIVz8rRpWAgBMrfXuYuZR2rV6Qdx3wy62qg6GxG8iU
         +ERV9FmH6gCWLM3AH/jvuuM/PNRDNeyPwaAxsfJWUieDC7kr4dxi5eF8Y110rPG5Wm9U
         jlVYGo0rUWlH64wsueX+36SVnfeUc3Lmiz3MGzThTAc0uETYrsTX89BonAPtCBXdbpX4
         5cyP0kxWcGOYniQpAKW1YNe/A7PRCNGQsvglICfmGDEltKTGD363yMb33hP7wRlBnejN
         0QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702429681; x=1703034481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZgV4+7h5FvquOXD3BbTOC+xkF/l28SqUDxOBNlsEk0=;
        b=A2Qw0e2c2H6LWS8lTtz0ahh8NcOfbTyGFT31RJQtJPW6qyRxZwXp4OtwA9IqAYrPrq
         URqftRYX2XwBqiw7W920vgT31E4PFHFXrU5LFjNAjbRupWmGOsLKZz/lbTaAY3f/s25H
         5OnxYi4Uu3dt9/GMTgZBLzQdoxkhcJr/gFZaa+py/B5RntU0B4Q0icnF/sDAvEj0fsGu
         dmRnED/VkrkRC59NbSfOw0QNZi3pWo9waFv242bytZST/6+SC92aoxKZwPTuSVwhAfxU
         YL+xBYWNL1erg1ZgqFumZyeyolHnlONQ6dBVC2d1NYnM5t4NtHECGTyJE31Z6RM+/z0z
         iP+g==
X-Gm-Message-State: AOJu0YylD1blabwb4RvFGVdatc4z70AH7w8DCnEqM1FmryuLLrj3/KXF
	gPrTrI9Ue/GLOGA0MMk7JZA+aLoHDWU=
X-Google-Smtp-Source: AGHT+IFgMi9qznO+LB7VBjkyaCLJNOtc6v8dbEKbe/je6mehsPUXg/ngWiybmLLPrqNpi+v594uzKA==
X-Received: by 2002:a05:6a20:7b12:b0:190:adc:7fd0 with SMTP id s18-20020a056a207b1200b001900adc7fd0mr3225360pzh.21.1702429681468;
        Tue, 12 Dec 2023 17:08:01 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902704200b001d06b63bb98sm9224127plt.71.2023.12.12.17.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 17:08:01 -0800 (PST)
Date: Wed, 13 Dec 2023 09:07:57 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Mathias Dobler <mathias.dob@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] - fast writing while waiting for edge events
Message-ID: <ZXkD7f5GUZ2WWfoD@rigel>
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
 <ZXiEBXWFVmz_cmdM@rigel>
 <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>

On Tue, Dec 12, 2023 at 06:06:54PM +0100, Mathias Dobler wrote:
> Hello Kent,
> > Don't top reply - reply inline instead.
> Sorry, still new here.
>
> > Firstly, as noted, if you are talking separate requests then they are
> > separate objects and you can do what you like.  So have one request for
> > your PWM edge generator and another for the lines to read/write.
> It doesn't add much, but just to clarify, the PWM signal is not
> generated through libgpiod, I only use line requests to read lines and
> edge events.
>

I wasn't suggesting that you were using libgpiod to generate the PWM - but
the PWM signal is being used to generate edge events, right?  And you
use a libgpiod request to receive those events?

Or are you using separate threads for lines within one request?
That is not what multi-line requests are intended for, and you would be
better off with separate requests for that case.
Multi-line requests are for cases where you need to read or write a set
of lines as atomically as possible - but you would do that from one
thread.  They can also be used where you only have a single thread
controlling several lines, so you only have to deal with the one request.
But if you want to independently control separate lines from separate
threads then separate requests is the way to go.

> > In the current implementation, the gpiod_line_request object is immutable
> > so it is safe to access it from multiple threads.
> Thanks for giving insights into the current implementation. Knowing
> this opens up a lot of easier options for synchronization, for example
> synchronizing only writes (maybe not even necessary).
>
> > Or it may be a defensive measure - in case
> > a future change makes a currently immutable object mutable.
> However, I also understand that the restrictive nature of the
> documentation could presumably be designed for changes in the future.
>
> Due to this I am a bit undecided whether I should base the C# binding
> on the current implementation, but there is probably not much else
> left for me. Even creating a separate request object for every
> individual line would not fully solve the problem to be quick in
> reading edge events and reading/writing lines of the same request
> object, while adhering to the restrictions of the current
> documentation.
>

Correct - going by the documentation the edge event handler thread
should be the only thread accessing that request.

My preference for higher level languages is to bypass libgpiod and go
direct to the kernel GPIO uAPI (the ioctl calls), which is thread safe.
Then you don't have to worry about libgpiod objects or the libgpiod API
and wrapping or mapping them to your language.
That is the approach I took for both my Go[1] and Rust[2] libraries.

OTOH I'm very familiar with the kernel uAPI (I wrote v2), which is a bit
convoluted due to the restrictions imposed by ioctl calls and kernel ABI
compatibility.  And I initially wrote the Go library to test the uAPI v2
as I wrote it, so libgpiod was not even an option then (libgpiod v1 only
supports the uAPI v1, and libgpiod v2 only supports uAPI v2).
Going direct to the uAPI also means you can support both uAPI v1 and v2,
if you want, though that is becoming less of an issue now uAPI v2 has
been out for a while.
Anyway, libgpiod is not the only option.

Cheers,
Kent.

[1] https://github.com/warthog618/gpiod (one of these days I'll get
around to renaming that to gpiocdev, but that day is not today)
[2] https://crates.io/crates/gpiocdev


