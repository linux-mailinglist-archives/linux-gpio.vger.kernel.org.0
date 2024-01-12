Return-Path: <linux-gpio+bounces-2162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A882C022
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 13:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9EA2284897
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 12:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDBA59B64;
	Fri, 12 Jan 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRnv2tii"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A606BB22
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso4857639a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 04:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705064002; x=1705668802; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMhh6lckIfCdgi3sO97nogT8fhW07KrrS/sziBmxw9w=;
        b=VRnv2tiiaKEgI35OpuUPT830O4wBi7d/YW/gT6onvGO2AbCQWU4tLBbIpdlLbqN/BE
         apYSgFXkwpTB0SIpug8w6WMf6BZMaJF/ELZOygh4FVxzaPus1qNSxis0HvzhSNCS2tPi
         i2gaLMtDJg/+uVg5WWN4yQp17C2X0czJyq2JtjnbBl7FYHmXJ0hhg6urJ/vdj/kWg1Ma
         sze3cVe0y+p9PMhsgnodEbHPdnB1nolMuY9P4hQ7/AXTEgPdw21Qf1HH9q2amiJS+9hP
         UBev4lTJTBQdhG3RCzwqHcA2ID02tZoVnqqkEr5xDSrBpdwg6xrp5bGKNvt2YQhuHxku
         nbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705064002; x=1705668802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMhh6lckIfCdgi3sO97nogT8fhW07KrrS/sziBmxw9w=;
        b=mzY94rsjrwapgC6GLrTn4+9GEci4FjYxAwGGeTBjCp7VylwdiPA2hEqwqtHQGe0qsP
         Ss4lXHWI66Or5T/jcOPPnFVSjGPIOsJlUH+TlK0hZZsmgNTyfLYI5Dc7IIVA2zL5Shpj
         BOpSsHmMn8+bKDk30lVT4Z/3MJyjOMrdUVzpO5oh+gaAWcb/REBhqtLa6zprcxp/ex60
         BtZkJ2PluDz+H26T2IkZ82d29lKqeafZNcRPaXfLEy+yltektev/MqyltlT44+jwwCel
         aEstazv7czw5EAD/9CVhW7AP595HkDjWw9pE/bp2C0YR7KTsqL25Yz+IyE51rGk9ql8C
         t/qw==
X-Gm-Message-State: AOJu0Ywj/EJsdvyQTD8We6DgXUP317x8H08odu9RDEyOWDbTYb3gLUe8
	vgV1GIB08e1IhKsKg3zv9Aw=
X-Google-Smtp-Source: AGHT+IGY0mD2WY+25wxMorzfk3/BT8qDUEqW3EjeWzUwlNCtoxy5IR/5bWVNKEqDBMJ8WaKuAgfslw==
X-Received: by 2002:a05:6a20:938d:b0:19a:33ce:495f with SMTP id x13-20020a056a20938d00b0019a33ce495fmr975987pzh.102.1705064002436;
        Fri, 12 Jan 2024 04:53:22 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id q13-20020a056a00088d00b006d998f5b890sm3102100pfj.192.2024.01.12.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:53:22 -0800 (PST)
Date: Fri, 12 Jan 2024 20:53:18 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Feedback from the Raspberry Pi community
Message-ID: <20240112125318.GB66782@rigel>
References: <20240112063158.GA22114@rigel>
 <CAMRc=MeWUA1UmWa3Bm3FLkheFRUNZJq8Cmwv2=3infezJkpV2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeWUA1UmWa3Bm3FLkheFRUNZJq8Cmwv2=3infezJkpV2A@mail.gmail.com>

On Fri, Jan 12, 2024 at 11:22:17AM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 12, 2024 at 7:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> >
> >
> > I agree with that.  I've raised it before and again now.
> > Having an interactive website of some form would improve community
> > engagement enormously.
> > I'm not sure what form that should take, and I'm not suggesting moving
> > the primary repo from kernel.org or changing the development process,
> > but I don't see how, say, having a github mirror that could double as
> > the community engagement hub could hurt.
> > (ok, on second thought after re-reading that, I can see how that
> > **could** hurt, but I was thinking in terms of increasing engagement, not
> > having to deal with some of the cr*p that would inevitibly land there.)
> >
> > Anything that would help address the misunderstandings,
> > misinformation, and outright propaganda I've seen out there can only be
> > a good thing, right :-| ?
> >
>
> I see. While I prefer using the mailing list as the single point for
> discussion and development, I understand that this opinion is not
> shared by the majority of user-space developers out there. I will
> reopen the original github repo[1] for reporting issues. Possibly for
> sending PRs as well for initial discussion but I'd prefer to pass all
> patches going into libgpiod by the mailing list anyway in the end.
>

Great. And that is what I meant by maintaining the development process -
patches still go via the list, not pull-requests.

Can we update the README to reference that?

> > Either way, the Raspberry Pi devs appreciate that v2 would be preferable
> > and appear interested in packaging libgpiod v2 themselves, rather
> > than waiting for Debian, and IIUC are looking into doing that.
> > They currently package libgpiod2 (libgpiod v1.6.3) and gpiod (libgpiod
> > tools v1.6.3).  I figure they can add a libgpiod3 package (libgpiod
> > v2.1) so they can install both library versions at once.  Wrt the tools,
> > update gpiod to contain the new tools and depend on libgpiod3, and allow
> > the user to pick which rev of the gpiod package they want to install, if
> > they want to support v1 or v2.
> > Requiring both versions of the tools seems like an extreme corner case
> > to me, and could be handled by having the user download, build and install
> > v1.6.3 into a non-standard location.  Alternatively they can package
> > them independently and rename the binaries from one...
> >
> > I don't think there is anything we need to do here, and with any luck
> > this will be resolved in the near future.  Maybe just keep an eye on it.
> >
>
> I am very bad with distros. I have no idea how debian or red hat
> packaging works (other than being a somewhat "advanced" user) and I
> just let distro maintainers handle packaging of libgpiod. For my own
> work I rely 100% on yocto and so keep the relevant recipes in
> meta-openembedded up to date but that's all I have time for. So there
> will be no help from my side on the debian packages. I just don't care
> enough.
>

I've created packages for both at some point, but never as part of
a distro, so I've got a rough idea how the packages themselves work but
no idea how the distro packagers select what goes where or when.
As with you - not something I've ever needed to have a concern for.

> >
> > The solution there is the dbus daemon. That would allow them to perform
> > random sets and gets on arbitrary lines on a whim, just like they do now.
> > They seem very open to that option, both the Pi devs and end users, so the
> > sooner the daemon can be available the better.
> >
>
> I know. I'm half-way done with the locking rework for GPIOLIB and the
> daemon is next on my TODO list. I'm estimating I'm 2/3 done with the
> needed functionality.
>

Let me know if there is anything I can do to help out.

Cheers,
Kent.

