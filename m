Return-Path: <linux-gpio+bounces-1355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA60811290
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF70E1C208EF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECFF2C85A;
	Wed, 13 Dec 2023 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUM4a3Rk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E06DD
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 05:12:35 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d075392ff6so54310265ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 05:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702473154; x=1703077954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47eyAa2kKgGKp+Fi1xfoGcZ3l1KdgF0uY41hph7m1f0=;
        b=PUM4a3RkG6qiRt94yDFwYYgl19H7tx7qiyLuXWypu0hdJlW1a8cOBiEaElJEYR+gdl
         eYIYjtyGv5m+ZMtrjv2O0u2GU/W1Qyu6m1P7Do4J6YPGBPZyya2rpJLCew9Z3nWn1TL3
         xcGNr+c7Ke+kzLytGw9r2A+ZOMaePh6lZqK3B0quVKkTtRGOzhnmkQiwkgUE/e7VM6uZ
         jegtxCDHr9O+e1yXXz+G6pr/V8hlE9xyghjlNDWy4warbjI2sG7jK2QFrPI8S/DKZAwc
         EAX4vW8+bqbpWHn38eM4wKDpyQFZ+ZpTVLCuK+bPASEjey7ANGz8c0/QXlwG6arqZsSR
         T2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473154; x=1703077954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47eyAa2kKgGKp+Fi1xfoGcZ3l1KdgF0uY41hph7m1f0=;
        b=jM3RXddE06wnkxZmMAleH2Z2GaqewDZ66fMzUGNZDE6Jn81QVxfdusjFmzX8geR3va
         nx0Z+VfouzazsGZbiTuiRRDUI6jLZzADvSoJ6DRHHOnAygDmKqSFWMGPcTcZkAyufNV+
         WElg0yCujVyBrQ6XTzEvylZDLU6mIox16ytY9ou4YGOH74CAUWpBUcCOn+x5ftq4cJ2Y
         ygB0YV143IK0WGiclvggp5pUiYKLTxgVkOq38VKKqqIxfUKuR4bKTx1OUBbxR7bCGBSy
         LNv6MZqYiI3ja8L7YzaE3j3E+6npZ/qwYMdTyROeCxLueyVu2UNXikfJ3mhddhm7hawC
         4ncA==
X-Gm-Message-State: AOJu0Yws0wJdtrBXB/OzFZGSr1xjVPL01XuqwTx00SZajBIPy90upuoZ
	u5ojxbwJIqwTNHrzekVDjvBDrprykew=
X-Google-Smtp-Source: AGHT+IFwlYxqzEoC2zxR8OZ5P19MlyoiGHk8tip4OaTPjwiJy8y0KBTcpjgkoHv5Jyhl2/TmD6kzcw==
X-Received: by 2002:a17:903:112:b0:1d3:59da:56c with SMTP id y18-20020a170903011200b001d359da056cmr313112plc.49.1702473154433;
        Wed, 13 Dec 2023 05:12:34 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709026b0200b001cfad034756sm10393517plk.138.2023.12.13.05.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:12:34 -0800 (PST)
Date: Wed, 13 Dec 2023 21:12:30 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Mathias Dobler <mathias.dob@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] - fast writing while waiting for edge events
Message-ID: <ZXmtvuhehSkt7r9i@rigel>
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
 <ZXiEBXWFVmz_cmdM@rigel>
 <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>
 <ZXkD7f5GUZ2WWfoD@rigel>
 <CAEydid=UvfRZMHRVRgXs0dtc4p72exc-h6Bs00OHsp3+zsS8XA@mail.gmail.com>
 <ZXma2gzOkbjawsH2@rigel>
 <CAEydid=fgJNfmx41HLdaf27oa+5QWqqVr69DgiQHGaxfy95P7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEydid=fgJNfmx41HLdaf27oa+5QWqqVr69DgiQHGaxfy95P7Q@mail.gmail.com>

On Wed, Dec 13, 2023 at 01:52:47PM +0100, Mathias Dobler wrote:
> > Firstly note that you cannot lose edge events. They are queued in the
> > kernel in case userspace is a bit busy.  It is still possible to overflow
> > the queue, but it takes serious effort.  You can check the seqnos in the
> > events to detect an overflow.
>
> I think the only thing that is lost is my memory sometimes.
>
> > It is also a bit odd to be monitoring a line for edges AND polling it
> > at the same time.  You get edge events when it changes value, so polling
> > between edges is redundant.
>
> Yeah, I might have to rethink my usage there...
>
> > Though if you are using a libgpiod function to perform the wait you are
> > still stuck, as going by the documentation you have to prevent other
> > access while you are waiting....
>
> > So you have to not use a libgpiod function and wait by poll()ing the
> > request fd.
> > At that point you may as well wait on both requests in the one thread.
> > And then you don't need the mutex as you only have one thread accessing the
> > requests.
>
> I see. So that means waiting on the request fd is not affected by the
> threading contract?

That might technically be a breach of contract, but the fd is
immutable for the lifetime of the request, and I don't see how
that could possibly change, so it is pretty safe.

Cheers,
Kent.


