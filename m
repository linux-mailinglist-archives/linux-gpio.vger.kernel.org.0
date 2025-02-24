Return-Path: <linux-gpio+bounces-16454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD94A412CA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 02:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCC4E3B1811
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 01:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C5ABE40;
	Mon, 24 Feb 2025 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaSWpB2g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA318802
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740361785; cv=none; b=VQLhsONO/kZnasZahoS62a6WViqH/JYuDaGf4/WdfWQp50tetG+iETq33tIGIpICB/t3dEAu6MrW1aIn5oAt/7HBbHyBqHy3mk40oY/eCPB2bBzmJT0Gg7yzDT49QS8HHXJ1oCyAu+2+G0A2XbMJH8anJSDK4V8hdqFX7+u3IO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740361785; c=relaxed/simple;
	bh=q5AtDy3Pq//3EF/2zPaZfVGjcPenuWNZCBVqPyBwvsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QT1SmksA9D+uAVVPVrVMFcAXXVK21UqdbJlVBM7VoRDbCZTrL5v5z6QCwj1TDr64+VNfeFvkhDJAQ8QQzs4yMAMqfqfDPtkriaUip89j+kITf+LJUeo2/GKS2lHPyZxqZ1GMl0c/VSfzPhuApP31mDxfcxpTenYZHVP6Y7Oom4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaSWpB2g; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so7930154a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Feb 2025 17:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740361783; x=1740966583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCBtThWYi5+i+WATMlI9jlgX9eHetjIpVt9hn65foQ4=;
        b=jaSWpB2ghLf2UKMNmsrugxephZ856zcu8AFq2A6cmrCW31GMImLEB5ZNhNYVtoZvvf
         ZUt2kNsTNWBC4qenJ2S7oyG07sQHADfuSE1vAN5pWv0AyYKARjLbeonOpAlh9dFPeXNt
         WITEf62iO6NNHXcM/WNE8qjBeJ9rH274x1EnDFmms/9+30YIIYfcrf65tuU6g/LMo0ct
         1mTG3zi0bGxkQqIcleToU0plHICR0VF4v3TA1Y/EeXVlLZsg+V7uf62KaPl+FtzN5ujM
         u0mfGOI5eQtFaMrljn0PlPfr+JWc/e3gEkUoFy5soh78N17Eg1HvYkahS0vIHAD14bQC
         hqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740361783; x=1740966583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCBtThWYi5+i+WATMlI9jlgX9eHetjIpVt9hn65foQ4=;
        b=PbTVktVrnUAuvW4RpwnZ1AMmUGMtVySwOFnZpFbFRZZR209YwytWCoRIPlqs7+eExv
         wW+OdmNz/e+By5gEuT52L03sT9IfFQbZIIF1tb9rdDv2XTQxPKGnKZVTRAWRvzyXNww+
         fobf6wBOvdeQWY5ZRlUkNaCBsOHX1i38KFQOjcVD8jd44XUtvE6MOQFoqyZNP+gKxXoU
         KAzqafSIFQxm2pKYgmvxLX8HcPRYqEIKud7f50f9EM7sSMqUDjF6kGxrpwPHlrnk/6IH
         ByH+CW9eeKslR8vedDiPJDmyRqLPZRCQ2CJOTldfX6nIprj62/scC387/QvH72lx4pEU
         7Uhg==
X-Forwarded-Encrypted: i=1; AJvYcCWGGwfcYXO7DjesqQAZQ4RcvpEMIPJQNc4DzZgHhsdm1zo16VnZ24R1p/gGM+1qstA8mlRJHPKbkmpp@vger.kernel.org
X-Gm-Message-State: AOJu0YwFRLTbc7u1qoiB/LYmnUEZlC9a/+6UnnkLIuFL9gWAak7YvOVQ
	AZdngx/Li0uEDfX9D7IBtbbBH8KqJrII9vUq8OWZD5wRqmzIT+6u
X-Gm-Gg: ASbGncs9VyKNiuWsOUVPumxBrqSE+Dbw/S236EbhP1sp7XajpAubSKcB/Qtsruq7Bhm
	R9gGoRTWhu6wLSzqGrR/1plX9fzbtDs1WSp8ZYaI3CNBstRiXcEmNvT/WOpQSTTtNQLSd4iVmX7
	IBHMh4RiNQmy6QQsXAPzIsLfIlrr0xxO04BMhIX/mD0ag3YqwzzNlqjWUnWBnTq4luJPJH3RXrD
	VUKeqshSXY5ZnTLZThA1guso7Auowz+WamOzWv2/SYGlWK+3GvukdCKjqDM7wnDKnqByCQEVyNE
	/uoYTcZcNozQfsUULwE//XbfDL93Z8l25ZRF0I9xZ6yBqAxz6Q==
X-Google-Smtp-Source: AGHT+IEDcROmbLVDhTf+j6JExAIIBytnAqYwHIzPrNtSyBd78ELJZmBLk3SzTUyFuRFh+QF7WeZ96w==
X-Received: by 2002:a17:90b:2688:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2fce77a0195mr17625471a91.3.1740361782851;
        Sun, 23 Feb 2025 17:49:42 -0800 (PST)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d990sm5961314a91.1.2025.02.23.17.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 17:49:42 -0800 (PST)
Date: Mon, 24 Feb 2025 09:49:36 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
Message-ID: <20250224014936.GA12854@rigel>
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>

On Sun, Feb 02, 2025 at 01:45:58PM +0100, Bartosz Golaszewski wrote:
> Hi!

Sorry for being late to the party - was AFK for a bit.

>
> I'll allow myself to start a thread about it before anyone invests a
> significant amount of work into it. Yesterday (01.02.2025) during the
> "embedded dinner" after the FOSDEM 2025 embedded devroom concluded, we
> discussed the motivation behind my wish to remove /sys/class/gpio and
> the reasons why many users prefer it over libgpiod or even a
> user-space compatibility layer I presented during my talk earlier that
> day[1].
>
> The gist of it is: some people need to play with GPIOs very early, for
> example in an initramfs that is very limited in size and doesn't
> contain anything other than busybox so echoing into sysfs attributes
> is preferable over trying to cram additional tools or even the entire
> python interpreter into the limited system. An alternative to consider
> is of course adding some limited GPIO functionality to busybox.
>
> The main thing that bothers me in the GPIO sysfs class is not its
> existence per se but the fact that it identifies individual GPIOs by
> their global numbers and not hardware offsets which is the biggest
> obstacle to removing the global numberspace and the legacy GPIO API
> from the kernel.
>
> I think it was Ahmad or Marek who suggested that users aren't really
> attached to the global numbering but to the ease of use of sysfs.
>
> I floated an idea of introducing a backward compatible change to sysfs
> that would allow users to identify GPIOs by the label of their parent
> chip and the hardware offset of the line within that chip (like what
> we do for the character device) in the form of the export/unexport
> pair of attributes inside the gpiochipXYZ directory associated with
> given controller. These attributes, unlike the "global"
> export/unexport would take the hardware offset and create the line
> directory within the chip directory of which the layout would be the
> same as that of its global counterpart (in fact: it could point to the
> same directory in sysfs as a single line can only be requested once).
>
> We could then encourage users to switch to using the chip-local
> exports and eventually at least remove the global export/unexport pair
> if we cannot make the entire sysfs class go away.
>
> Please let me know what you think about it?
>

TBH, I think you will have trouble getting users to adopt it - they
require a solution no more complex than what they already have or they
will resist the change for as long as they possibly can.  So if you want
them to migrate before removing the global numberspace then that will
never happen.

As it stands the user needs to search the gpiochipXYZs looking for the
matching label. It would be easier if the chip was identified in sysfs by
its label, rather than (as well as) its base address.
So no searching required.

Aside: Speaking of which, once the global numberspace is removed does
exposing the base address serve any purpose?

Similarly, it would be even simpler if the line could be exported by
name, so the user wouldn't need to pull magic chip labels and offsets out
of the air.
Though that would be a much more extensive change.

Btw, I am well aware that line names are not guaranteed unique, so this
approach would only be viable/enabled (potentially on a line by line
basis) where they are - and that would provide some incentive for them to
be made unique downstream, if not in mainline.

> Bart
>
> [1] https://fosdem.org/2025/schedule/event/fosdem-2025-5288-the-status-of-removing-sys-class-gpio-and-the-global-gpio-numberspace-from-the-kernel/

My primary takeaway from your talk is that you are more of a thrill
seeker than I am comfortable with - making jokes about Rust in a
live forum - THAT is living on the edge ;).

Wrt the Q&A at 19:42 - the Pi BCM driver with its module parameter and
"why only this one driver is allowed to have it and the others not" and
the suggestion that there be some flag that can be passed to the driver
to request persistence:  I don't like your answer - it conflates specifying
the default/safe state, generally defined at boot time, with an ability to
override that at runtime.
Extending the driver API to allow the gpio_chip user to request that the
driver NOT reset an output to its default state when released seems like a
viable solution to me.  Am I missing something?

It also didn't address the fact that, even at FOSDEM, there are developers
out there that think that some drivers are getting special treatment.
In this case the Pi devs have pushed their own downstream solution
upstream to reduce their own maintenance burden.  And that was accepted as
it didn't conflict with anything in mainline.
There is nothing preventing other drivers doing the same, though no one
has AFAIAA.
Though the module parameter solution is rather crude - if we are going to
start touching all the drivers then why not address it via the API?

Cheers,
Kent.


