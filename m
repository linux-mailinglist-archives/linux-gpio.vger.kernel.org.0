Return-Path: <linux-gpio+bounces-2184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F982C900
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jan 2024 02:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27BE01C210D6
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jan 2024 01:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B87F18623;
	Sat, 13 Jan 2024 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHzLNdU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185318C27
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jan 2024 01:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3606c7a4cb5so44179295ab.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 17:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705111061; x=1705715861; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bUBMmzbDxHnH5wt6bkbtiK5PQtIACXuJYCK1Nyfppow=;
        b=XHzLNdU7oDupnM0BBzHFmTk6LrLnH0xU1/Ht91xmMPV/g8AhlGrywXyqb+oY6pFaTl
         RKii9sqA4LufyChUuctL6WCpYX1RTpT72dWc1aHc1vu9nEXjqhdUQr+1oT6HXaNiHM5l
         EZFN1dEO4yZYv5i1AVhDla4PFCLO5qBHBDGPQdaLXZrV6DWx7ZYdlNPGX41gYUXn8Iwn
         fhc968EOslFb7PZZc5wTO9W81sKXlfKjPpqavZbmde6547q2RqffAdDR8NCxeZVTuU3v
         zXYzQO3ro5W8nU9dGDKwvBMzAJwZ/SJ3sJSZqQnDOnYbTFl585YfTdzP0o6PWucntazX
         PkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705111061; x=1705715861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUBMmzbDxHnH5wt6bkbtiK5PQtIACXuJYCK1Nyfppow=;
        b=Bc2Iv8Pfe1Tg1wdFrBAKeSbuM8dIaEouQtsSB8MozGeqDx0pKaYEglvq/lmhupGHSX
         IrttyAvB13yWlqYT5+/2y1k+60uWC3z8oiKLwXSVbsPsYCBY5pmEDKpuXAk8Z01LXgH/
         iD07FbXhC9O/uatCesz1Br6dxVmR5kmUxpyqk8djHChvbwUlQNtIsbyNhytzBtOa+kEJ
         9yzLv16olwgjGRUFRWCdpgDg2IZSUj767PzmTzt7JQ7Z2NX+f+OQNZk818pJ2NbnwXoA
         GjJyN9wCTe3232dot2/xYpT7Pnh/rbCHZou5sbGDyyiCwh2kIZjK3IWAxQ/cSbW+hA8Q
         Zz5A==
X-Gm-Message-State: AOJu0Yzjgh21rw0SUhN1q4XOqxxiFde95uorFAWrSMsfdj/LEmQrHcW5
	7op7iuHBrfVFrWJntzfVnzI=
X-Google-Smtp-Source: AGHT+IFKGM7m/4TG+KqRMixDzVREVKYXdByfCwgg6qsUQhUadZrNChhsNKReYhZ92D00imYQJVI3hg==
X-Received: by 2002:a92:6b09:0:b0:360:a340:dae5 with SMTP id g9-20020a926b09000000b00360a340dae5mr2008377ilc.31.1705111060767;
        Fri, 12 Jan 2024 17:57:40 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902e04500b001d05fb4cf2csm3843688plx.15.2024.01.12.17.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 17:57:39 -0800 (PST)
Date: Sat, 13 Jan 2024 09:57:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
Message-ID: <20240113015735.GA3233@rigel>
References: <20240112150546.13891-1-brgl@bgdev.pl>
 <CYCTZY7PE9TQ.1SJWALQUCVPAC@ablu-work>
 <CAMRc=Mc_-0FiB16afOgUxyX3ic07EKbH08Z1Y2aUSoPkzBQm5g@mail.gmail.com>
 <CYCV04Z0DTXJ.EL52UULK796I@ablu-work>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CYCV04Z0DTXJ.EL52UULK796I@ablu-work>

On Fri, Jan 12, 2024 at 05:13:37PM +0100, Erik Schilling wrote:
> On Fri Jan 12, 2024 at 5:05 PM CET, Bartosz Golaszewski wrote:
> > On Fri, Jan 12, 2024 at 4:26 PM Erik Schilling
> > <erik.schilling@linaro.org> wrote:
> > >
> > > disabled for the public.
> > >
> > > - Erik
> > >
> >
> > Should be good now.
>
> Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
>
> > Should I create a wiki too?
>
> Got no opinion on that.
>

I think the wiki could be useful for linking to things that aren't in
the README or that you can't readily link to with a plain text README,
like links to the readthedocs documentation, kernel patch submission
process, maybe some hints on building for different distros (e.g. to
identify packages that need to be installed first)....

And speaking of the README, just noticed it mentions 4.8 as being the
first release of the uAPI, but libgpiod uses v2 exclusively, and that wasn't
introduced until 5.10.  We might want to update that - still mention 4.8,
since you also mention deprecating sysfs, but also mention v2 and 5.10.

Cheers,
Kent.

