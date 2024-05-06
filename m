Return-Path: <linux-gpio+bounces-6138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF278BCDFE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 14:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D72D7B22C9D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81BCBE6F;
	Mon,  6 May 2024 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aLihEO1E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70719748F
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998792; cv=none; b=Q4g3hXxCnqVn3C8UcXjf738CgrOIELoh9VbUjVtn1ZjNg2LypCP53lLQkvPZrdxqnzUeR2qe2hHjNte2oarq35QrtwdTRKmEV4yXAv8Bykh/MDfUAqKYSWeS/C7DSE14dwcBwK4sQX+9z16t9W18AJ3yn31Ds4v0faKofOPMGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998792; c=relaxed/simple;
	bh=r1g3/sPAblQscsHYnoxcNBQy60b/W2xc6aPxBy0UEn4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cJM9HNozHoaWVgw3l+47/4FPoTCl7sTvSEgzGzdUmyZ0DJQB2i6lOudfK1T684O1gZrnIqfhfAZ6pKzf7+dfODjaCxtIG9fqvcxtZWwhxn3nJC7PgFpHnUaYIJq2le+dgv+XniMb1nwAHqusZcWYEJH3vpyT6dq1vn5RQdsRJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aLihEO1E; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51fa75d54a4so1620565e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714998788; x=1715603588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Cyth3ps2pplfuA4iOlm6A/62v9Oc8ZXP9//p3zy1Tc=;
        b=aLihEO1EdpDmoSddzJdy4DAihfuNYm3K+MCr4q5xrO0+EMN4Wiiadxe0sRAerOE4jU
         ZHyVgBP/N5FxA3ej3vonBEVEX4JteYC7Oa1YpJ/InnMMuPXy4wf/dBBCEFHoLAJbPL7L
         M555d5h0BO1uWDDEd6ra89XHoeCH8HlqBrd+T+Ne3qBXslCnb24D62t5Dn6dEYqkYe14
         rCObkkvdJSK3xjE17KQ53kuElbReSZ3qJz24gOo4qBhRvgZ5WNSGYhxooEjLzew3Gsii
         3z0ATwUvZfC+nPyRwcJt1LpTANEY4luvhI0UWRAQT1TheFLNcCB+6+cvXYgoDE8kPFI8
         2B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714998788; x=1715603588;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Cyth3ps2pplfuA4iOlm6A/62v9Oc8ZXP9//p3zy1Tc=;
        b=VDdm7tFfutRnGVbBVOrbvVD2+fDfOleaV4L1xhllXKZ0v4U4lbkNdHVTNvcXq5+6GV
         KmXRXyEPSNw492qSy4tETECNYlx9rHouCIzXsI9XR+/Dda+IEn05GbSNG8SGnB/8wNNX
         fZ4hzdbzHN+wXC+bxIdcoAvCtqAt99DbygDeoYv9X7r4u04bIwyZsnNHU6cNgAwiL7vO
         ktg5lAP58rPP7V8abwYoStU4wSU+4qRsYpsTqkB5TayrR4CX+n5isMbr9I89QfrcTGgH
         BxGCF4KQho35zMK4b9UVLOZ/9D+ac07FixCiYZPkkuiUTI0mbQA54BBuvY10VSRY1bDu
         +Sfw==
X-Gm-Message-State: AOJu0YyGos10X2mUxqcC56gxSjOkm++OJ/Z1DW9ecNcmbZclNcNLvGMS
	A83+NNfXu78q+fTMmhKO4tHJ5nFIX5SljlZ9/lEDNt7WGT1ubecwS92IQWvAEiclIcHwdpgzU9S
	uPovdTfNWMoqJuIeeYEwVeJMzB29zrBFOMyQ9og==
X-Google-Smtp-Source: AGHT+IENrmH8mUcaBzN3pdOTE/58e0flqWIGUZ7mjBEOF+F6ZGtZDKcffy0H+cMLXZP5q7+2N9GSFPh+tCNoMyWYS4s=
X-Received: by 2002:ac2:547c:0:b0:51d:8ff3:f835 with SMTP id
 e28-20020ac2547c000000b0051d8ff3f835mr2990167lfn.26.1714998788390; Mon, 06
 May 2024 05:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 May 2024 14:32:57 +0200
Message-ID: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>
Subject: Performance regression in GPIOLIB with SRCU when using the user-space
 ABI in a *wrong* way
To: "Paul E . McKenney" <paulmck@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paul et al,

I have recently received two independent reports of a performance
regression in the GPIO character device. In both cases it was bisected
to commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with
SRCU"). I assume it's caused by the wait imposed by synchronize_srcu()
in desc_set_label().

In both cases the drop in performance is caused by the fact that the
user-space code in question does something like this (treat it as
pseudocode as in both cases users were using libgpiod v1.6.x but the
result with libgpiod v2 would be the same):

    for (;;) {
        req = gpiod_chip_request_lines(chip, ...);
        gpiod_line_request_get/set_value(req, ...);
        gpiod_line_request_release(req);
    }

This pattern can be seen in code that implements some bitbanging
protocols etc. from user-space - programs that call request/release in
quick succession can indeed see a slow-down now with SRCU.

Please note that this is almost certainly wrong: in general the user
process should request the GPIO, keep it requested and then perform
any accesses as required. What this code does, would be analogous to
the following code in the kernel:

    for (;;) {
        desc = gpiod_get(dev, "foo", ...);
        gpiod_set_value(desc, ...);
        gpiod_put(desc);
    }

Of course what drivers actually do is: call gpiod_get() once in
probe() and free the descriptor with gpiod_put() in remove() and
user-space should follow the same pattern.

While I could just brush it off and tell the users to fix their code
as the libgpiod test-suite which executes a more realistic set of
operations actually runs slightly faster after the recent rework, I
assume I'll be getting more reports like this so I want to look into
it and see if something can be done.

It turns out that performance stays the same if the thread running the
above code is pinned to a single CPU (for example: using
pthread_setaffinity_np()). Is this normal for SRCU to wait for much
longer if this is not the case? I don't know enough to understand why
this is the case.

The offending kernel code looks like this:

    old = rcu_replace_pointer(desc->label, new, 1);
    synchronize_srcu(&desc->srcu);
    kfree_const(old);

I was wondering if we even have to synchronize here? The corresponding
read-only sections call srcu_dereference(desc->label, &desc->srcu).
Would it be enough to implement kfree_const_rcu() and use it here
without synchronizing? Would the read-only users correctly see that
last dereferenced address still points to valid memory until they all
release the lock and the memory would only then be freed? Is my
understanding of kfree_rcu() correct?

Bart

