Return-Path: <linux-gpio+bounces-1924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B7820350
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 03:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2211F2291D
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 02:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5292A5B;
	Sat, 30 Dec 2023 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JldBBLvO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5247023A0
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 02:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dc36e501e1so570902a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703902901; x=1704507701; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELdQzqd3HpJ9nvvUy6oHNtPwQrsI0qBHsiqmexKeCWs=;
        b=JldBBLvODpbv+LsmYG/relW/FBd4vwTxoLv4h4juCtXItYQ4rUdwxZP4n9Iw9Bqqui
         9hjyS2uOngZIc0gGzP6MSl864xga59LPO+cwdmfgQYhh/dXB9YdGsXBRaeLROH48zu5i
         oNOge4vR6gUvl3yfWGcd+OBgcU5D1GGPjlLf9orRGUMsyZ0EaGxuEzdina+dona95/BP
         K0Eb10w87VD3KKQslSftUmjy8W/kfIL5HTDQFivx4V/6DF0CPfz5OcIaowHD8wAxuvk5
         /7QIZAO/Lp/jHf1nfreNcxKGhtS2Ohb9BgRgswnMnq8XuJGofMjuMRsLqRcecXi8iNvk
         8qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703902901; x=1704507701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELdQzqd3HpJ9nvvUy6oHNtPwQrsI0qBHsiqmexKeCWs=;
        b=pCw+S1mdmNSZK2WbIivbRzzKgNwzn3F9LkiXjQ6Epci8BMIRUmATdVxUFM/6DPlNXd
         ZpIHt96Mo5qX30aCdqsb+2ZLxvFXkOWfUTggDDpTQiMrvEmrhrIiP6r9JkBxJa+xC76z
         5a+HeJzjKqchki+KMl9HKH+r2ua2fHIYtifVZpEsE7nZwZt7cMz7LLUxlfw7O05g9Nec
         TwvKOtR4DdR2xOfwjnl6RYpIfrZDxg1T9yosgBHE6Whw0G57VCTUw2PIl/cPlN6qLDmD
         tLYt+MIpT15wLuJeu65tf3dS6azKG0WFNa5RlkSCbr/EwAqCtsBzbIZ+7PvlEjrEYsGx
         kwEA==
X-Gm-Message-State: AOJu0YwlSpz5Bs3L9YWNWDPjTD2JHc0YBDgoL74evM8J1pSaPPWu2It0
	Jh7J9Tf2OT+FEF8y8ksW3WEv8iJz3Nc=
X-Google-Smtp-Source: AGHT+IF/cU9Eaojc2T26bnXTrbfoNk1XyXEyZ0HgtwTPdbrpe4VDbyLkqimRHGj+i6WTMbPUwl8Kyw==
X-Received: by 2002:a9d:6a8f:0:b0:6db:ffa2:f6ee with SMTP id l15-20020a9d6a8f000000b006dbffa2f6eemr6133813otq.6.1703902901396;
        Fri, 29 Dec 2023 18:21:41 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id h11-20020aa786cb000000b006d9abda076asm11579014pfo.179.2023.12.29.18.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 18:21:40 -0800 (PST)
Date: Sat, 30 Dec 2023 10:21:36 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231230022136.GA19799@rigel>
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel>
 <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>

On Fri, Dec 29, 2023 at 07:50:21PM -0600, Seamus de Mora wrote:
> On Fri, Dec 29, 2023 at 9:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
>
> > This works for me on a Pi, both bullseye and bookworm:
> >
> > $ ./autogen.sh --enable-tools --enable-gpioset-interactive
> > $ make
>
> That option ('--enable-gpioset-interactive') seems to have gotten the
> job done. I had to back out of 'libgpiod-2.1/tools' to
> '~/libgpiod-2.1', and let './autogen.sh' take care of the '#define'...
> instead of me trying to add it manually to 'gpioset.c' via '#define
> GPIOSET_INTERACTIVE'.  I do have **all** the packages you listed below
> installed, so why my manual addition didn't work is still a mystery to
> me - but not one worth fretting over.
>

If you want to change build options then you need to re-run autogen.sh to
regenerate the Makefiles.

The option is mentioned in both TOOLS section of the README (but I note
has a typo that needs to be fixed) adjacent to the interactive example,
and the configure help, which is itself mentioned in the README:

$ ./configure --help

...

  --enable-gpioset-interactive
                          enable gpioset interactive mode [default=no]

...


That is not enabled by default as some platforms lack, or want to avoid
including, libedit.

> > That is with the following packages installed:
> >  autoconf
> >  autoconf-archive
> >  libtool
> >  m4
> >  libedit-dev
>
> Thanks for your help!   :)

And thank you for the SE un-upvote and downvote!

Cheers,
Kent.

