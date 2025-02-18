Return-Path: <linux-gpio+bounces-16193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CEA39C9C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 13:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68FB118855C7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 12:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4510F265CB7;
	Tue, 18 Feb 2025 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="KQgVa3Wv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB25264A65
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883525; cv=none; b=CJtnchtpG7UgRs157SWM1ThjapYNYoJ/jnMpYVl7eb8XBhw7j39u66TjmSrRl8ZSXWVJxmyPsGzEth+fiObXxS5WDTRHaudZqoMv+ZYyWEa20lkWEDYIc/iLVsymMzVmojEPPTOlS+s6t0OJ85BtZMTmBMugm46XA8Lz5RUDcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883525; c=relaxed/simple;
	bh=oMH51VUXnnpfnm9nAkgicDi5ah+l53EWtaexQa428Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hf6p3f4zzNrJWwUNrkCKrop+gNBojmznlg5iPf5vxRTHoISwrlANvNLEBkpZYT8tjytm+qX8KffgIS05WkRPSZwysK7rGiJN98VigdNaes/JrFuVq8TKZz2hT5J/39q4dXr7xeiMZoinsS4fc9QDLbVs9K+bE9GYMkcKQMeYzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=KQgVa3Wv; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 45D203F27D
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739883520;
	bh=v9P5lSfpGSUeQi9lRANACSgvEEYXXekadVUZlYSjCmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=KQgVa3Wvke+1ffggoO/QErgOnlV4kh7aWXppzTxLyfScovyRDo/dwAiVw3nRPh/BT
	 JiRPBURiZvDvMR/UXmpOh0jgvrzbVO5sqFiOzRrJ5M4ESIxSiIN86o8Gf1OEVQjFpV
	 wldIRDEgJEveZ7pc95H63DYKdEYbIzUF1AAl/1P9jF3VQTWcmoG9cnRQHnynLj7Ws7
	 f+s1xmNBLnZqKhL0XHbyIFtt8a90iwi2FRc59baLUvHYEqkHTfCqfnNUJvk6Mc4AF/
	 Bpzkqj8WsfVuQbh05h5SGFgui0MuiPyBnvgUDGKSeLEevsmTYdKgzalTvrkY3sg18r
	 l5uqB+Q3/jDXw==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc1eabf4f7so9821118a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 04:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883518; x=1740488318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v9P5lSfpGSUeQi9lRANACSgvEEYXXekadVUZlYSjCmQ=;
        b=QklX3tDNOWYww4Umm97Ex9Lyw7Lqh4ORXMZs58nAW9ZxkN4x/JX6Jz57fMjTHEo7y1
         nkiij9KJLPMB0cMNZl9NeQkk0RKIWRMXE4Ce22XW1T4S+3WjYe5KjSToHFEeOZW8vmo+
         aNGJx3Y++WVL98Zztd688bRqpZHDzuc4Gw2qS6/N0LFPwGmLxDAUv9M6fecJQSmg9vT4
         Yq5pHnrKR3lgmrpMOU7nxts6AgktwsyceriC4ncGLhbBCT23DzyFt0hJLY91Cs47WH3X
         IsGXlMEsggEByaXEh5JbLH+TA1doGTH/R73aX+8cHuRWTxb99XtKTTE+i7IRDYsbEGlE
         RQww==
X-Gm-Message-State: AOJu0YxP70SFtD5RnsWGG9hk7ccVzJVRVwJMAPkQ2hTSTDoF3VCz74wu
	bb1tbMLmPkUiztHl9QlyjvTUHMGw9k+4s6ScepUHzsY/YU64KqJZxsb1JEDBTrxEOy4y12kJtUL
	FW5RVDhPy69mLa7u3/uySx2B8cly3uWbj0Yftw49odKLzzHPA9Xqjo6u6gJ4P8yb7Cy5G8qCL5O
	0=
X-Gm-Gg: ASbGncu1wFCaY5zSO5J4s++PcDqEWXfQbnnYR3sw1x3gwEwFZo0uNfJb6Tr8nFFYCt6
	UAagGh+PLoBg45+WI0Mk/lS2Mc8Fzx6eWRTEAT933peLq+LDDxKcvT70Er6j1rujYoOvQoCeJmP
	mZr0HPOuWRZMnXJJl+ObPUXXc/InbQ4dAWlW6kPHe6cOKKxwQ7Uceu7YYW+CKo5jgcmA4KDJqnl
	7W74XR3sUhVhqGlCTKXTv/MzSVZYFMydLhr8soD3cnF0/iiM9sNCB0izp+HMqMCKOzyyVmHK7Ww
	Cfdu0Z4=
X-Received: by 2002:a17:90b:2d8d:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-2fc40f22cd2mr25120743a91.18.1739883518339;
        Tue, 18 Feb 2025 04:58:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs26rQasnQvPUPYlw9nkWCSmusj5EGnCxCbFo1IYGbCgwn1O208wtCVjgu8sox+hqj8fWUxQ==
X-Received: by 2002:a17:90b:2d8d:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-2fc40f22cd2mr25120700a91.18.1739883517907;
        Tue, 18 Feb 2025 04:58:37 -0800 (PST)
Received: from localhost ([240f:74:7be:1:ad3a:e902:d78b:b8fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b602sm12136721a91.35.2025.02.18.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:58:37 -0800 (PST)
Date: Tue, 18 Feb 2025 21:58:35 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo
 gpio devices
Message-ID: <zfyzhahnhtozrbtgdod7wyfhcdtwuofx4hl3ndtxglmzacd2at@q4hmczbylwcw>
References: <20250217142758.540601-1-koichiro.den@canonical.com>
 <20250217142758.540601-2-koichiro.den@canonical.com>
 <CAMRc=McB0bcG4jERmUyrQ=eTP+kcfLBBAOaT7mCMKbgUB1W5nw@mail.gmail.com>
 <d2qdoq3f3jk6gzgsjeqszgaqk7z523r7cfnopxfq4ghsbsqgp3@zjw67ewqzi5u>
 <uogv4ckqo2e2byspffvfayu44v6fl46sxtu7eudweoye62sofi@5iwsumpttpca>
 <CAMRc=MdNtDW_Gbd6dsG345110SCWe1vD_rNd_QaWBYRApHBoxQ@mail.gmail.com>
 <saszavmizjwhzechspy6otune2xwtgjjygaitxminzclgj7zep@ofwfb5jdfcam>
 <CAMRc=MdDi6_neGThU3wq_uq2VA=DUHzTwvrv_wivj26ksNSnNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdDi6_neGThU3wq_uq2VA=DUHzTwvrv_wivj26ksNSnNA@mail.gmail.com>

On Tue, Feb 18, 2025 at 09:57:05AM GMT, Bartosz Golaszewski wrote:
> On Tue, Feb 18, 2025 at 6:01 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Mon, Feb 17, 2025 at 06:29:27PM GMT, Bartosz Golaszewski wrote:
> > > On Mon, Feb 17, 2025 at 5:21 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > > >
> > > > On Tue, Feb 18, 2025 at 01:12:17AM GMT, Koichiro Den wrote:
> > > > > On Mon, Feb 17, 2025 at 04:46:30PM GMT, Bartosz Golaszewski wrote:
> > > > > > On Mon, Feb 17, 2025 at 3:28 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > > > > > >
> > > > > > > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > > > > > > platform device and wait synchronously for probe completion.
> > > > > > > With gpio-aggregator adopting the same approach in a later commit for
> > > > > > > its configfs interface, it's time to factor out the common code.
> > > > > > >
> > > > > > > Add gpio-pseudo.[ch] to house helper functions used by all the pseudo
> > > > > > > GPIO device implementations.
> > > > > > >
> > > > > > > No functional change.
> > > > > > >
> > > > > > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > > > > > ---
> > > > > >
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > > Looking at this patch now, I've realized that there is nothing
> > > > > > GPIO-specific here. It's a mechanism for synchronous platform device
> > > > > > probing. I don't think its place is in drivers/gpio/ if we're making
> > > > > > it a set of library functions. Can I suggest moving it to lib/ and
> > > > > > renaming the module as pdev_sync_probe or something else that's
> > > > > > expressive enough to tell users what it does? You can make me the
> > > > > > maintainer of that module if you wish (feel free to add yourself
> > > > > > too!).
> > > > >
> > > > > I had vaguely envisioned that this might eventually contain some
> > > > > GPIO-specific code for some reason, and also it's just a tiny utility to
> > > > > reduce code duplication, which is why I placed it in the neighborhood,
> > > > > drivers/gpio/. However, of course you’re right, there’s nothing
> > > > > GPIO-specific here, so moving it to lib/ makes sense.
> > > > >
> > > > > I'm not really sure if this method for synchronous platform device probing
> > > > > can be broadly accepted as a general solution, but I have no objections to
> > > > > making the change. I'll move it as you suggested and send v2, setting you
> > > > > as its maintainer.
> > > >
> > > > Regarding this series, I feel that it might make discussions smoother if
> > > > you submit it directly. So if you're okay with it, please go ahead. In
> > > > that case, there's even no need to mention me or CC me - I can track it on
> > > > ML :)
> > >
> > > I'm not sure I'm following. Why would I submit it myself? You did most
> > > of the work already. If you want the changes to gpio-aggregator
> > > merged, then I think that it's time to refactor this code before we do
> > > that because repeating it three times is just bad programming. I
> > > probably wouldn't have done it otherwise at this point.
> >
> > As I mentioned earlier, I'm not really sure if this particular usage of
> > platform devices will be generally acceptable. gpio-pseudo was intended
> > solely to reduce code duplication in methods already accepted by the GPIO
> > subsystem. Moving it to lib/ would shift the approach, effectively trying
> > to promote this method as a standard solution.
> >
> 
> Promote it as a solution for this specific use-case - the need to
> probe "faux" platform devices synchonously.

I think we're on the same page.

> 
> > For example, if for any reason drivers_autoprobe is set to 0 on the
> > platform bus, the synchronous mechanism might be blocked indefinitely.
> > Moreover, in the first place, I'm not sure whether employing the platform
> > bus in this way is appropriate.
> >
> 
> It's sketchy, I know. Back in the day I was advised by Greg to use the
> auxiliary bus but I realized very fast that if I want to support
> device-tree too, then I would end up reimplementing all the code that
> already exists for supporting the platform bus. He eventually agreed
> that it's better to use the platform bus. We had the same issue with
> PCI pwrctrl recently and also ended up using the platform bus.

Thanks for sharing the background history. My view/feeling remains unchanged.

> 
> > For drivers like gpio-virtuser, which we can define virtual GPIO consumers
> > via DT, or for gpio-aggregator, which we can use as a generic GPIO driver,
> > the expectation is to use the platform bus/device mechanism as usual. In
> > those cases, adding a synchronous mechanism via the platform bus notifier
> > to piggyback on the existing platform bus probe implementation is
> > understandable and obviously has already been accepted in the GPIO
> > subsystem. However, moving just the synchronous mechanism into lib/ can
> > potentially be perceived as an abuse of the platform device concept?
> 
> That's actually a good point. I guess this code could be reworked to
> work with any bus (that would be specified by the user).

Alright.

> 
> >
> > Incidentally, Greg K-H’s faux bus work was recently merged into mainline:
> > commit 35fa2d88ca94 ("driver core: add a faux bus for use when a simple
> > device/bus is needed").
> >
> 
> Thanks for bringing this to my attention, I wasn't aware this existed.
> However it's not useful here - I still want to support OF.

I have no intention of dropping the current OF support, as I wrote in my
last email like ".. understandable and obviously has already been accepted
..". In that sense, I think we're on the same page here as well.

> 
> > Correct me where I'm wrong. And I'd appreciate if you could share your
> > thoughts.
> >
> 
> I don't want to block the aggregator work but I also don't want to
> have code triplication under drivers/gpio/. Let's do the following: I
> don't like the sound of the word "gpio-pseudo" in this context. Let's
> keep it under drivers/gpio/ but rename the module already to
> "dev-sync-probe.c" and use the
> dev_sync_probe_init/register/unregister/data naming scheme. Stick to
> supporting platform devices exclusively for now. [...]

I totally agree with "dev-sync-probe" and the overall idea. Thanks for the
suggestion. I'll send v2 later.

> [...] I don't have the time
> just yet but maybe in the next release cycle, I'll try to make it more
> generic (work for all device types) and move it out of drivers/gpio/.
> How does it sound?

Although I'm not sure whether there are many justifiable demand for such
generic lib, probably that's just because I don't know relevant topics.

Thanks,

Koichiro

> 
> Bartosz
> 
> > Koichiro
> >
> > >
> > > The code looks good other than that, just put it under lib/, rename
> > > functions to pdev_sync_probe_init/register/unregister() and send it to
> > > the list as usual. With that it's good to go. Just make sure to
> > > mention to Andrew Morton the need for this to go through the GPIO
> > > tree, I don't think he'll mind.
> > >
> > > Bart

