Return-Path: <linux-gpio+bounces-26208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79679B59A01
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238143A5291
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 14:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8E8322C99;
	Tue, 16 Sep 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R4/0NPsK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458B25F7BF
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032571; cv=none; b=WIVXZzB/zsZEgBVoD6oDiRYJpUtL4zpYCecK8BpcUIre15OogEVTEaT6DCGLBj/lL3fYN07J+gWhCgU/njf5hSiXlhOa++6uq+XwIjw8QNSpW86j58rmiXtjmfXxn/B6PWFgM2+hHhe9lZ3ILeXqMXk//6Foy+x+wdeR+VUMi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032571; c=relaxed/simple;
	bh=E2gQL2fHVFBODGTwxAaNcZqrZhrab0RUt4NYkYVNeBg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Afb9waVoL5CJxo1zJW0s2uUkuJJsR69RUdPXdQwcU9NMI9u0qeYI0Bu7bSDMm9050Qi6kUZNKwHiz2IofOmFF9LXBb19SnUEw8uTqSb7RSanyHdruXZrM8RtABheVi8NQ/bkf0WUJtIfVEpPs6Cr864n/fI0RxctMlIrepyLB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R4/0NPsK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5720a18b137so3297148e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758032567; x=1758637367; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2gQL2fHVFBODGTwxAaNcZqrZhrab0RUt4NYkYVNeBg=;
        b=R4/0NPsKa/mklAl1KdE7TlLbIxEYwn/7gaz2WhgAQ416Gtr4H0Jg0RCumNN7OO4RSB
         CfsMVv49Jb2ufOoDHM9ury1cDhSVuE2dL9WJouDDDC/ozmqaU9z2pxHM5oUYJKCd2wLj
         FeOYFFGaIu7QyWNWrQlA72a5wZOJXBPm9T5BdqQamU/bQO32L8SpKHTPQvSvAUX+zOqS
         xOlRHE0UQgHb2iLDsnnMRlSZcMHEq6mCBtyjeUXfrBv/VkKa3mSHbCrSekOS1i6b2wH4
         qo9Luj/uYyCr/rsufIQe4rxVxq1eaKbc8UXQCTgZTQWdNrscqAFAye2VAOzZwL4hOX7A
         tomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032567; x=1758637367;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2gQL2fHVFBODGTwxAaNcZqrZhrab0RUt4NYkYVNeBg=;
        b=o675T0m8Vi+ZmK0Nxa0ArBxsK78a8K/BoIkbTomV81gcaB8oSV/h3LgRSNJ7m1GJgP
         i8ZM/BwEdirHQjHBXbVpZhazNxlNChluiwq+inekE2wQulzO85vaIm+i4V8Tzmme8J4W
         6TRVpUBX/qxSkOhRDS99Qady9SI8jx0jrkqwdPCEQmXzzG3ADBKqqHO25eDGSa7Dx0OB
         x557JdidIopgS1qPDr//GN9gyx+M0z5x/JQ3lEdLWxMLLfSVXRaP5qTPpKh5kyjAPL6C
         qXHrAkvfLoQfGpBOnWyaCUu/dlz4dLcEnRjBDnfL5+BsNnrxsFaQjDurwbfG4JgR1JIs
         wFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQTmbSPsNDpMACSiu96q2HGtUo/Tp5PeDb5PJcth6s9Ej1mG3HVcdBHkF6tyYieBqnPgsEohJjxkCq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7f7xj6zqw6vHFL0qNNo+5QuJMB77mfgBWnnvvXfFXZ13Dve9Y
	0jKBpTUvA0A5Cr66pW3I/bJeayHwMxBr8Rbd/1jUtp8e8bYO9jFK2xIrbTeHJ88cN+YplLFbTi3
	IhUjOCHT0QOeK0QovKiLGJgvZoHK47xkGq1dLFZqlYA==
X-Gm-Gg: ASbGncvA9triiq2J6clSJxegfFE5ZVaofjMV6oN63tMbbDZBdGnh7iHwwSq+4IS9iDp
	ahgmdqeTNmpGVFFm8+g+pgj8c2alhKQReepMKcpHy+9uksf6ZG3GYArJiLtZiHhvU+CyaQydnVJ
	Tw5f8bsyQp/M8d1aLI18nmWW0Eyvh4X3RMrHVBGkt2u8EbWd154ANdpCoGfxe/RVzrEV6p4Ex1g
	Z75wg==
X-Google-Smtp-Source: AGHT+IEQKCYsCLaO/ECm+4Aj7KegEjLf57ZUqxknw3DSBC7BiQTpC8tIRJIRATtB1MZQhr2JdIHIk/cGFBl6zgWPPPU=
X-Received: by 2002:a05:651c:438a:20b0:336:bcfc:a422 with SMTP id
 38308e7fff4ca-3513db54feemr43589961fa.26.1758032566710; Tue, 16 Sep 2025
 07:22:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Sep 2025 10:22:45 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Sep 2025 10:22:45 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aMlHLwC-1nuc_JW8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMgy0K-jpmegAp-d@black.igk.intel.com> <CAMRc=Mc5eYN3=mWAkjwkS+-qfBpsVM3v1vP9v+eFk+-Fs1oKpw@mail.gmail.com>
 <aMlHLwC-1nuc_JW8@smile.fi.intel.com>
Date: Tue, 16 Sep 2025 10:22:45 -0400
X-Gm-Features: AS18NWDNcOTFUtS_pwk0SjHR1CGuPbJQfcDt_8cshItwpMO0XsMgU-7ZuJBTUsk
Message-ID: <CAMRc=MfpK+RCrwKpa48DUpCCOKHbeYRw3xArtFR8PM9dwPvRQA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.17-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux GPIO <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sep 2025 13:17:03 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Tue, Sep 16, 2025 at 02:39:45AM -0700, Bartosz Golaszewski wrote:
>> On Mon, 15 Sep 2025 17:37:52 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>
> My takeaway from the discussion between Linus and Darren Hart [1] is that
> if you do automatic `git log`, mention it clearly. Do you read it differently?
>
> Note, PDx86 does this for ages and since than (see [1], it was 2017) Linus has
> no complains over Hans', Ilpo's and my PRs.
>
>> Just a nit for the future: please don't do "automated gitlogs" etc. Linus T
>> is known to frown upon such things and you're also duplicating the info you
>> already put into the tag. Just manually summarize the changes this PR brings
>> in.
>
> [1]: https://lore.kernel.org/lkml/20171118180910.qzbuh4donbwrxbyg@smile.fi.intel.com/
>

Ok, so let me state it differently: as the receipient of the PRs, I find these
automated short logs useless, I want to see a short summary of the changes
written by a human and the rest I can get manually from git history. I'm just
speaking for myself now.

Bartosz

