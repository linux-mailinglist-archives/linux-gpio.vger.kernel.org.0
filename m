Return-Path: <linux-gpio+bounces-1352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB8810EE5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 11:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B977C1C20B92
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FBB22EED;
	Wed, 13 Dec 2023 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN72oClR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09FD183
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 02:49:55 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7cb48ecbc20so167578241.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 02:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702464594; x=1703069394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQ/eqZyInWvPV/p/BnJCchD1NxYc5f2d9uZwx+OK+W0=;
        b=eN72oClRc1c6RLwtMmYyibkDWCFpXhE7SGAfd1Mi54tpSg9MSXsJfW05TQcAX217An
         H58cnozdihay09emK4Ry3eH8YcY5OlhXCLedahqWWgNAyptN2fttC+suQAdPazF9hV2u
         mQLps5w4B7l+Lsms0vkWfsaTvKFj7/2Ho3pb0w+Bb5+0Ehk/GuCtLgn3+fbq0QsNeU9u
         1slD4OdukCm/ujRMNKfnw+DLTWDwMUUEv8xgx/Ay9rMYNIB7szSqlWuWMKD1pclIppGs
         l6YauUokxQjcPznLu5je0788m/GfGoCvsElqttrIuSCPAiGIwzJrW8tZ4RrsJ3TJgO+7
         Wo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702464594; x=1703069394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQ/eqZyInWvPV/p/BnJCchD1NxYc5f2d9uZwx+OK+W0=;
        b=U9VD63CLpexnxVVFHfOFaH5SPoiDwyXmo7bfY/jO0+TVpy2WY0vl9fEtWJ/oqOX8vQ
         UANoZ5nJOErdQM+zW4GJ6MSrIsLeLlzjSjLTR1GhxSKPOOSb3cKeeKgRK1jIWGrMh+pZ
         IpGYSuoEoMtFj5QQuf6ny6oJbSYUK0QlGD+RDnx16bM2Ol/MtgT1vQgb6ZgJTP1cpVAw
         /xmzvovfo0PhaPXc8FwjBxyyuxbQqWUSwPZ20iyWAslmzuwBGIjC+ESqgqAOwdq29/+I
         LwmJvkCHFYg/wbPRk7ztBmUT6WGungjwNSDB4U7XAJeZS4tBO4zh8djYUmxbD8nc6H35
         sQQA==
X-Gm-Message-State: AOJu0YwBcP/kBAI9Q4ufCA8VTDVz3/nv6+iyhwCdMMuIYhL1fSJ5dSMd
	BGLaOoG6qLnvFzduJ722GYk2fFfVx31rUWBPODQ=
X-Google-Smtp-Source: AGHT+IGLOxTd1kRXYKZTbbp7p7qfperTRpRjvpLXPo9VsQaRKfyOF+Wo8YoRqraJVtVE4J69agTCn5Zq6/ksiyaq04M=
X-Received: by 2002:a05:6102:3711:b0:464:4753:d3b6 with SMTP id
 s17-20020a056102371100b004644753d3b6mr4734253vst.26.1702464594102; Wed, 13
 Dec 2023 02:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
 <ZXiEBXWFVmz_cmdM@rigel> <CAEydidkEikZciGD_EzS95tMXznPH=OFP__Q2Bkk6HrQ+sNhkxQ@mail.gmail.com>
 <ZXkD7f5GUZ2WWfoD@rigel>
In-Reply-To: <ZXkD7f5GUZ2WWfoD@rigel>
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Wed, 13 Dec 2023 11:49:43 +0100
Message-ID: <CAEydid=UvfRZMHRVRgXs0dtc4p72exc-h6Bs00OHsp3+zsS8XA@mail.gmail.com>
Subject: Re: [libgpiod] - fast writing while waiting for edge events
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mi., 13. Dez. 2023 um 02:08 Uhr schrieb Kent Gibson <warthog618@gmail.com>:
> I wasn't suggesting that you were using libgpiod to generate the PWM - but
> the PWM signal is being used to generate edge events, right?  And you
> use a libgpiod request to receive those events?
Yes, exactly.

> Or are you using separate threads for lines within one request?
> That is not what multi-line requests are intended for, and you would be
> better off with separate requests for that case.
> Multi-line requests are for cases where you need to read or write a set
> of lines as atomically as possible - but you would do that from one
> thread.  They can also be used where you only have a single thread
> controlling several lines, so you only have to deal with the one request.
> But if you want to independently control separate lines from separate
> threads then separate requests is the way to go.
I have one request object for 1 line 'req1' that's monitored (=wait
and read edge_events) by 1 thread 't1'. At the same time,
there lives another request object 'req2' for multiple lines, that's
monitored by another thread 't2'. My use case is, that
when t1 reads an edge event, it executes a callback that requires to
read multiple values of 'req2'. Now the dilemma occurs.
Does t1 interrupt t2 from waiting for edge events to gain the mutex,
risking t2 missing edge events while t1 holds the mutex, or does
t1 bypass the mutex and violate the libgpiod threading contract?
I think this scenario could also be boiled down to a having only 1
request for 1 line. Monitoring edge events, and at the same time
trying to read/write or other performing other operations on the
request object would result in the same dilemma.
Again, this might just be a a very specific use case with strong time
constraints (that I wish libgpiod supported out of the box).

> Correct - going by the documentation the edge event handler thread
> should be the only thread accessing that request.

> My preference for higher level languages is to bypass libgpiod and go
> direct to the kernel GPIO uAPI (the ioctl calls), which is thread safe.
> Then you don't have to worry about libgpiod objects or the libgpiod API
> and wrapping or mapping them to your language.
> That is the approach I took for both my Go[1] and Rust[2] libraries.

> OTOH I'm very familiar with the kernel uAPI (I wrote v2), which is a bit
> convoluted due to the restrictions imposed by ioctl calls and kernel ABI
> compatibility.  And I initially wrote the Go library to test the uAPI v2
> as I wrote it, so libgpiod was not even an option then (libgpiod v1 only
> supports the uAPI v1, and libgpiod v2 only supports uAPI v2).
> Going direct to the uAPI also means you can support both uAPI v1 and v2,
> if you want, though that is becoming less of an issue now uAPI v2 has
> been out for a while.
> Anyway, libgpiod is not the only option.
Hmm... sounds like an interesting challenge... and there would already
be something to look at.
Maybe a project for the future ;)

Regards,
Mathias

