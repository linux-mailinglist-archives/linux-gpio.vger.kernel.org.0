Return-Path: <linux-gpio+bounces-6579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE08CC4DC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 18:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B521C21B6C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 16:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C9613DDC2;
	Wed, 22 May 2024 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dL/SNUPZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3E140397
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394974; cv=none; b=opNEVaCIqlhoF8IekPCGKHk7qDlXYx9uCtbtXcFPBTmiUlLyb52waw9nuY3lgy4BJxuKCx1Ot8hAYcTnO4rn0pPR6KSQ0qQprfwdVqLwWNLPyDFbWnt6SDG03MohaDhOsaIY9GoUIuCqyOUF4SdAv5qrLAUE5SdT9BoeXz3fonc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394974; c=relaxed/simple;
	bh=r+2wfkJzqsoJpWjNOSTE+psYUzsbphN4Q8x5ln4w8v0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEz1gclst+Omu8FX7CXtnWwPpsmiFKdaYjX2+q8KB8qhlbd9Bt7/deVhfk+BKeuMpSIyUsdVz7yOzZfR4nb8Ns/cJyvNppcyA43+bdDJE/MlIuIrNJCR95ZZMzxNWtdPaiGJ3gYVs/GWI93WPv7SNoaa49hr20ISAdJ6i9LhxTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dL/SNUPZ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e576057c06so63339351fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716394971; x=1716999771; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqYqadQQHjCvXdoSUo2QLFyhNRrZUm5I1Ub0rVBn88U=;
        b=dL/SNUPZG7sQEoezuICJ0mdYwIM4KSPw5RK8sWTeA0MQz+j/SyF5Vbu1hME/qpK2Jm
         ncUbjYsywg/112I8U4g2/qm/iXKjnsL9meE/2hcCEyif6l/ib9hQJd1x62MAgX5YNj2d
         q8y0OVpuxTuGw68u909Bkq9xy+zW2j8vHM2qRkLiH7ctjj6pnVq4RGyOtlTDMYE7Y0wR
         S2VSikyHqL9ik45/PmIWQnV89UQfb2Dp/c7C4GKTuOFc0KhmKngRmtuNubxGxHk8w6Go
         FMpcha7yPRGJZcZo/q8fAt6EFWsM23b3A0YCoH0AKxwTfP8BMl6w2GKcO9lN99/es3/e
         TbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394971; x=1716999771;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqYqadQQHjCvXdoSUo2QLFyhNRrZUm5I1Ub0rVBn88U=;
        b=bpz10JFYD4L2HKlVcqUTvQkHPGYv/RJqlDRx1m/OdZHlzGX7SePR7Qh+rhjcgd4nn2
         7uZoIGtpYVBqYYVgw4ygLWea3WbgHWUyP89C6YBS9dTyMEFR8IQeVcWUhaKm2uuUhflI
         rJGdqE5SLtgnBz3rDLbgIvYENV4cYzRrWzuLcCKNY0mRdsd57tAybuOro1tJX3VbGbXE
         IML4A2LfYH+4EznoDfbss0vB7L0HwEDeaHykxZWCDsGj8DP9bJBGRw7gQXz1jZLjKnRj
         H+QQf9qIvXKeLCFMW67FcEWUGC7r4IBulkbUWuhNRFoBuG5VSfHj+fln6Z0VjyjGp/t/
         jHxg==
X-Gm-Message-State: AOJu0Ywxf/KBzKrVoqG4Qh2x45OB4cIBVja5xjHFmi6qWEWbnEAzhQ5s
	2Lb3DYHAusV8MYcfxWU/sOkXkSeLxQT4XoPX4Gee1xn5bacXsgVdDTsQqdG5XG0NkdsNGnqwBam
	gPD4WE0G7kRY8ogm3Lg6TtKSvI7RM9sSzsKSjPw==
X-Google-Smtp-Source: AGHT+IGNb1Tf4VejpV4Fi+nFIlNJABXvUTVmbpDiArNEzpAmRCDv+TD/ZyadQVxYJbrYoI3zu9NV13PXEZo640nZZoY=
X-Received: by 2002:a2e:bc09:0:b0:2e7:14a4:1f71 with SMTP id
 38308e7fff4ca-2e9495bbfebmr19349901fa.43.1716394971049; Wed, 22 May 2024
 09:22:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 May 2024 09:22:50 -0700
From: brgl@bgdev.pl
In-Reply-To: <20240522004643.96863-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522004643.96863-1-warthog618@gmail.com>
Date: Wed, 22 May 2024 09:22:50 -0700
Message-ID: <CAMRc=Mfd_i7uBBJnxkVbuZkiudxcb2N3rM8RmZGZAG-85iAYoA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] support casting line.Value to bool
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2024 02:46:41 +0200, Kent Gibson <warthog618@gmail.com> said:
> While writing a gpiod plugin for gpiozero (Python), I had to map line.Value
> to its bool equivalent.  Casting seemed the obvious way to go, as it is
> essentially a boolean, but that didn't work as I expected - it always
> returned True. This is the case for any Python type that does not provide
> a suitable conversion operator.
>
> This series adds support for casting line.Value to bool.
>

Ha! Interesting. Do you think we may need it anywhere else too?

> Patch 1 adds a test that comfirms the existing behaviour.
> Patch 2 adds the __bool__() operator to make the Value behave as one
> might expect.
>
> As an aside, I couldn't for the life of me work out how to run the complete
> python test suite.  There are no hints in the documentation.
>
> There is a python-tests-run target in the Makefile, but that didn't work:
>
> ~/libgpiod/bindings/python$ make python-tests-run
> PYTHONPATH=/home/kent/libgpiod/bindings/python
> LD_LIBRARY_PATH=/home/kent/libgpiod/lib/.libs/:\
> 	/home/kent/libgpiod/tests/gpiosim/.libs/ \
> python3 -B -m tests
> /bin/bash: line 2: /home/kent/libgpiod/tests/gpiosim/.libs/: Is a directory
> make: *** [Makefile:677: python-tests-run] Error 126
>
> I tried fixing that but I still couldn't satisfy ld wrt the gpiosim
> (I don't have libgpiod installed - just using the local build),
> so gave up and called this particular test directly with
>

I typically run it like this:

    PYTHONPATH=./bindings/python
LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/
python -B -m tests

Bart

> $ python -m unittest tests_line.py
>
> While that passes, I can't guarantee it hasn't caused some other
> breakage, though it seems very unlikely.
>
> Kent Gibson (2):
>   bindings: python: tests: add test for casting line.Value to bool
>   bindings: python: support casting line.Value to bool
>
>  bindings/python/gpiod/line.py       |  3 +++
>  bindings/python/tests/Makefile.am   |  1 +
>  bindings/python/tests/tests_line.py | 11 +++++++++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 bindings/python/tests/tests_line.py
>
> --
> 2.39.2
>
>

