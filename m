Return-Path: <linux-gpio+bounces-1315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5CE80F1BF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 17:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83B072817C6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 16:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056DE7762A;
	Tue, 12 Dec 2023 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcgnTRYG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E1F118
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 08:02:20 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cedc988cf6so2252092b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702396939; x=1703001739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SBpnNeAeRYC05izx21phgMvtF916OmallyrK5tu/67s=;
        b=JcgnTRYGRTUBSkLKNq6yDnAjU/VyK2PAR9GqgVN5WFnOQ7iJzBStIGId+CIxEDpEBH
         ylid1VNt2rSmSiq/FBh/jK53nv1bgxtqVPnlR7uuzBnVSB1tZmZx1f+h3KAH34MZ/ran
         EG/GA0pmj+AiG7WLYw6lTaHkpNvt/ejlHFKzu2iqR0/Aj4sWQLa/PJsBZhG6Pw4kF6y/
         l+Di9J6gR9Wln+PIoVeyK0UPyBNjtatVZ3VF31rZuZyGVee/Xlg+UwxEoQYNBWYHyqWM
         ZuW26W76MymTfoVMpcqssCFVI/1JPhD5dgVnXi9OUDtrk6OWM2cCa15t8GTryPy5Z2oZ
         00+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702396939; x=1703001739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBpnNeAeRYC05izx21phgMvtF916OmallyrK5tu/67s=;
        b=PG7bDE1XC/Wj1uUVsyAGtMvoeEmS27iy042HrYEZD9v5lI5mj1CC9sBixSTtqJGCxx
         kZH4ETW3ioul1p+rrnt374qhs05CqrJks7eXkxuxfN8b+timgyXFFhZcyyqsh66z2k7t
         afeeh3FxYwAOImmplAMU2dOPgx1jzLb6xcKkFvx4ELwydzZTb8UZGAOa5RuxgnprtL2I
         f9sKnjfKDjXQmnJk2t9bpG6EEBWxo7PkGceptSR5SxRo/B+5IuLT4S7rd2GbcW7HoaIj
         dUIK+qwXZ9i3QEkZhjvE7gxCJKcbmXL43oNxNlmMSD9UyQlEEhdRP1w8Sn5mvgyTya8R
         mIpw==
X-Gm-Message-State: AOJu0YxLxSLbMbxA0Adqtx4+g91301JndURWOkdt8NpmhvTxB7j2zPQS
	mtXuKpradJdNOwYv9aSAtfezcQbjw60=
X-Google-Smtp-Source: AGHT+IEgrdjs8SgoPmBFhs20wRrlh2a17Qn0j1t7ZLgvF0rXT/KjbbDNP95AGd4LenA+9JNRLc3SmA==
X-Received: by 2002:a05:6a20:ba7:b0:186:555e:bc80 with SMTP id i39-20020a056a200ba700b00186555ebc80mr3027429pzh.25.1702396939305;
        Tue, 12 Dec 2023 08:02:19 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b006cb4fa1174dsm8267296pfh.124.2023.12.12.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:02:18 -0800 (PST)
Date: Wed, 13 Dec 2023 00:02:13 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Mathias Dobler <mathias.dob@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] - fast writing while waiting for edge events
Message-ID: <ZXiEBXWFVmz_cmdM@rigel>
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
 <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
 <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEydidnnqmaX_vAVFSq=7Q=UpbY_Owh+07=jBR-fHs5dc=RLsA@mail.gmail.com>

On Tue, Dec 12, 2023 at 02:01:51PM +0100, Mathias Dobler wrote:
> Hello Bartosz,
> I am writing a libgpiod 2 C# binding/abstraction for the dotnet
> community that I want to use personally. My use case is to monitor
> edge events from a hardware PWM signal, to react by reading some other
> GPIOs in a relatively short amount of time. This is likely a very
> specific use case but my goal is to make the binding cover as much
> uses cases as possible. And before searching for an alternative (like
> writing a kernel driver or so) I wanted to make sure I am not doing
> things wrong.
>

Don't top reply - reply inline instead.

I'm going to jump in here, as I think the thread safety documentation is
overly restrictive given the current implementation:

 * libgpiod is thread-aware but does not provide any further thread-safety
 * guarantees. This requires the user to ensure that at most one thread may
 * work with an object at any time. Sharing objects across threads is allowed
 * if a suitable synchronization mechanism serializes the access. Different,
 * standalone objects can safely be used concurrently. Most libgpiod objects
 * are standalone. Exceptions - such as events allocated in buffers - exist and
 * are noted in the documentation.

Firstly, as noted, if you are talking separate requests then they are
separate objects and you can do what you like.  So have one request for
your PWM edge generator and another for the lines to read/write.

But in practice even a single request would work.
While the documentation states you need to serialize access, that only
really applies if at least one of the accesses is a mutation.
In the current implementation, the gpiod_line_request object is immutable
so it is safe to access it from multiple threads.

Of course if two threads write to the same line at the same time that
would constitute a race, in the sense that you can't be sure
of they order they would write, but it is otherwise safe to do.

Finally, most libgpiod objects ARE mutable, so the documentation may be
restrictive to cover those.  Or it may be a defensive measure - in case
a future change makes a currently immutable object mutable.
It would be nice to have the gpiod_line_request documented as immutable,
as otherwise the safe option is to follow the contract in the
documentation and only access a particular libgpiod object from one thread
at a time, and for your use case to use separate requests.

Cheers,
Kent.

> Regards Mathias
>
> Am Di., 12. Dez. 2023 um 12:12 Uhr schrieb Bartosz Golaszewski <brgl@bgdev.pl>:
> >
> > On Tue, Dec 12, 2023 at 10:55 AM Mathias Dobler <mathias.dob@gmail.com> wrote:
> > >
> > > Hello,
> > > From reading other conversations I've learned that it's not a good
> > > idea to have more than 1 thread accessing libgpiod objects. But this
> > > raises the question of how to react to events and let reads/writes
> > > through as quickly as possible at the same time. I have already played
> > > around with the file descriptor of the request object to interrupt the
> > > wait for edge events, but this solution is not good because it comes
> > > at the expense of responsiveness to events, and requires complicated
> > > synchronization.
> > > How bad would it be to have 1 thread waiting for events and 1 other
> > > thread reading/writing?
> > >
> > > Regards,
> > > Mathias
> > >
> >
> > Are you bitbanging? It totally sounds like bitbanging. Have you
> > considered writing a kernel driver for whatever you're doing?
> >
> > Bart

