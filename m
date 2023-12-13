Return-Path: <linux-gpio+bounces-1353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A2D81108A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 12:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D2171C2099E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 11:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC1628DA1;
	Wed, 13 Dec 2023 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHr/71w5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C93B0
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 03:51:59 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b9fcb3223dso3692586b6e.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 03:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702468319; x=1703073119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kzY4dfF2EVravhkNwqxvYb8qj3gpv3p+PrP+OyUvRLk=;
        b=bHr/71w5GMX2bxy4cGIbodIcIxG1uUx/Vg/SZRubtrQZ+U+mbbZoGhHKvbCKnMgcWk
         mUUr6ibdzoAAfvbIqFEQYcwd6F34UqIqiVXlPaSIAQ1ucZMEiRNVItbJuCIoV42X5UfW
         9PKwtKMgTgk2DX4SdlH8uY4SxsnWYiGI/D+s3BfSQ/iPc2YZbv3yOgZ9LQLuy+WaILiD
         mdEwP0Mkt+Yqo/UOYDsTQS6gYQwKK/57NbkxJW9afYI7y0ayDMklEV2obkZCEugzfGj8
         Z+938yf8TRR8eAaqurvkuv6v4/mj32Mj5jxFKzVYRFaZapWeF1Jhy2ZmQogxRmJvuKOO
         VCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702468319; x=1703073119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzY4dfF2EVravhkNwqxvYb8qj3gpv3p+PrP+OyUvRLk=;
        b=oDvAiLHXVe/lFdwaXBQoOy7d9bjuTVoBS6EFbC/Nr0SPlZYHTfXGPcGrzjdnFS0fmT
         eWRtDJfA9F4awsAEgffGdiXAuDHqgYTAB0B/3YXxyy5wCVNb6IfkeDG6tFXZi+XBXdfh
         jnElJc8KkEoX+tIIqPrnFpafA6U5XacYtWKzuxbxnM4r4h5sY4XAyBJrb/r4AqCaQDzX
         xLGQ6DcMtHe0Bz8Jm/ycpHG0fnIvIYl7wtrrhfi91YiW2GIkeDMXA2Rk18gnXb2T2y3f
         LII6paw/n5WKlhSdkYgtQHBzKm/GdoOCt7wKqgyel8JowSsBnig1Bcvzms6k9bRuLbfq
         B/1w==
X-Gm-Message-State: AOJu0YwXViSx+apkTMQ7j9smqiWDX9RixnpwxAmShHwTEtmL4GL/E/g1
	Bt/9B/1bwrxchA+ybTauFfVs3KK6G70=
X-Google-Smtp-Source: AGHT+IGEBYftKeG2408UxogiPRIv+Tr+naKQ7essRFGXzhfGPADyAIim8hbEiR58vVE6TKLQcsLp5w==
X-Received: by 2002:a05:6808:1b23:b0:3b9:e2bf:c24e with SMTP id bx35-20020a0568081b2300b003b9e2bfc24emr10972590oib.15.1702468319120;
        Wed, 13 Dec 2023 03:51:59 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id b9-20020a056a0002c900b006cee656cb3fsm8684998pft.132.2023.12.13.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:51:58 -0800 (PST)
Date: Wed, 13 Dec 2023 19:51:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Mathias Dobler <mathias.dob@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] - fast writing while waiting for edge events
Message-ID: <ZXma2gzOkbjawsH2@rigel>
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
 <ZXiEBXWFVmz_cmdM@rigel>
 <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>
 <ZXkD7f5GUZ2WWfoD@rigel>
 <CAEydid=UvfRZMHRVRgXs0dtc4p72exc-h6Bs00OHsp3+zsS8XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEydid=UvfRZMHRVRgXs0dtc4p72exc-h6Bs00OHsp3+zsS8XA@mail.gmail.com>

On Wed, Dec 13, 2023 at 11:49:43AM +0100, Mathias Dobler wrote:
> Am Mi., 13. Dez. 2023 um 02:08 Uhr schrieb Kent Gibson <warthog618@gmail.com>:
>
> > Or are you using separate threads for lines within one request?
> > That is not what multi-line requests are intended for, and you would be
> > better off with separate requests for that case.
> > Multi-line requests are for cases where you need to read or write a set
> > of lines as atomically as possible - but you would do that from one
> > thread.  They can also be used where you only have a single thread
> > controlling several lines, so you only have to deal with the one request.
> > But if you want to independently control separate lines from separate
> > threads then separate requests is the way to go.

> I have one request object for 1 line 'req1' that's monitored (=wait
> and read edge_events) by 1 thread 't1'. At the same time,
> there lives another request object 'req2' for multiple lines, that's
> monitored by another thread 't2'. My use case is, that
> when t1 reads an edge event, it executes a callback that requires to
> read multiple values of 'req2'. Now the dilemma occurs.
> Does t1 interrupt t2 from waiting for edge events to gain the mutex,
> risking t2 missing edge events while t1 holds the mutex, or does
> t1 bypass the mutex and violate the libgpiod threading contract?
> I think this scenario could also be boiled down to a having only 1
> request for 1 line. Monitoring edge events, and at the same time
> trying to read/write or other performing other operations on the
> request object would result in the same dilemma.
> Again, this might just be a a very specific use case with strong time
> constraints (that I wish libgpiod supported out of the box).
>

Firstly note that you cannot lose edge events. They are queued in the
kernel in case userspace is a bit busy.  It is still possible to overflow
the queue, but it takes serious effort.  You can check the seqnos in the
events to detect an overflow.

It is also a bit odd to be monitoring a line for edges AND polling it
at the same time.  You get edge events when it changes value, so polling
between edges is redundant.

I suggest not holding the mutex while waiting, only reading.
Holding a mutex while waiting is generally poor form.  Use a structural
mechanism to prevent the requests being closed while threads are waiting
on them. e.g. cancel the wait before performing the release.

Though if you are using a libgpiod function to perform the wait you are
still stuck, as going by the documentation you have to prevent other
access while you are waiting....

So you have to not use a libgpiod function and wait by poll()ing the
request fd.
At that point you may as well wait on both requests in the one thread.
And then you don't need the mutex as you only have one thread accessing the
requests.

Cheers,
Kent.

