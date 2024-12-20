Return-Path: <linux-gpio+bounces-14085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDD9F9691
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457B01898A64
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2700821A44F;
	Fri, 20 Dec 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tlQUqUgh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35A21A446
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711931; cv=none; b=V4vIKeWPlUR9U+ANmKKfht59I3nq47U3OFpLHeEusYyDAJxYdAtGtxlCcKku3K4Ui2oi084Pn8L7ZVFWBVO7PLWVY4FhDFCwiviVSnEmgg9LCBaKjCJDrPi+5s9XBijaiWo+PKMrNpS7xHEKYipYhSjgHCKOLX9UOSgBS1Wk42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711931; c=relaxed/simple;
	bh=fgj3txWgGUPQ5X7pGoqJ46vP8JDLlzZfIRU5Uc33ooY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bYk/2v/t4rpVisY25jYaVp3zt7MeECBVq+87aA2QIUu4Zz2HwjVgeUolpJSrEqC28mkppKdqqNrRz5dZ2QNRKzKgpwjq544awToOW4VBM1ZlbMvmp8f7fqQPuL1BTm7wdsicrWjTXQKWvPJR6PhAQoIa4nxy0zDu3J/VAd0Pvlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tlQUqUgh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540254357c8so1994474e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734711928; x=1735316728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f5Z3iXKUUZkeT66nKwMJ6lOJB5Dz9GjSnNBFWJUzZeY=;
        b=tlQUqUghSnbdVPKfYMSCUVRyEQ0fh8esw/ooksWJR/q5v5soCCqoMJR0Ijz2QTQq9F
         EvlWJo4fXe2G7YCq2k+d+z2t537uPSGxg8tzdi4cDzqhFDSosDTrOlha0dwl9L3M72zE
         P+MH/cTpAyyrUwmi6DED687rUSynDNRxekkIuTwAnVEABG1PXCsEwpdpJKMAK9P47/WI
         TVc2qXjhxHcfg8yx6HvUnuoD47rF+x7sMWEJXlEG3ZriJly8CK/oV5G3U5qqR512Vvq9
         gkQQbqMlqEjmUzLQQDxwqJsj2a9DTLBr0HmLVUOuZraQivgf1MxR2JXpR30VkgfKys2z
         1Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711928; x=1735316728;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5Z3iXKUUZkeT66nKwMJ6lOJB5Dz9GjSnNBFWJUzZeY=;
        b=kWSIO/OLScxHA1Y5yk1INCPfgWQj6XKjWJtb3UcCSVX1wBKua2wsMbN8c0+FdPOuSq
         QYGm+VGySkXhCAxR7UySzDjUXhJfCMX9YKzKwl34Jh+1U5DszBwNIphqTvsWGLW4mpVA
         cb63yaM6Fgm4iVdM3Q3Ov+5jNnFq1ma1OQs3wp6R9Oc8XIzAsQqd08ek6TKhXWZlW7Bl
         wVu8xVbfnSUJLb+I3XA/t+oaACbACXjH9A1+s7xNkXKG9Ca6SliUerza4g0Hr3rcLmyt
         YlXa7RR+O/jDjgX0TNh5jaxEJsd0ZYOyr//V6aUcOjx6Id2LMdbHe/P8R8I3uMN+r5BZ
         5Wtw==
X-Gm-Message-State: AOJu0Yzdn+nwNSZu4Adm13ho74l099ulDDsi/Q+SwgDH8mZId7v63KfH
	EmPyhnqry0H1rmt4Bo+J0PcmEyMoEoirvfb/jCPayz7OnILbKKCz+Fj5ZUFI7pi74ZDs5oQ306L
	DaonXodD4wJuu89GAwSHwhdBGG/ZIxqFhJktmig==
X-Gm-Gg: ASbGnctAlLGEfuDK8yS0iGfyvgHmFbHkIcx0vri+GgA5ZFdGIfEAnRw88zAzddctiBR
	0mHOX/d7VLrmOpnREWgwHzhRiQc7SEir0qyfjhkxbPupqYr41WK07I/Q0LRVZSE8r3/ho9Q==
X-Google-Smtp-Source: AGHT+IEppwxsa9RTQst+gyWZvtsVUUlxg1nfTDOy83eK6eMVabx7NlEwbWhP9h1pSZ+wYgT9iKL/BvnwG51Y1T94c1c=
X-Received: by 2002:a05:6512:2252:b0:540:1cb9:850b with SMTP id
 2adb3069b0e04-5422954d620mr1372159e87.31.1734711927633; Fri, 20 Dec 2024
 08:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 17:25:16 +0100
Message-ID: <CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com>
Subject: build warning in libgpiod rust bindings with rust 1.83
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Erik Schilling <erik.schilling@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Viresh et al,

I noticed the following warning when building libgpiod rust bindings
with rust 1.83:

warning: elided lifetime has a name
  --> libgpiod/src/line_request.rs:234:26
   |
231 |     pub fn read_edge_events<'a>(
   |                             -- lifetime `'a` declared here
...
234 |     ) -> Result<request::Events> {
   |                          ^^^^^^ this elided lifetime gets resolved as `'a`
   |
   = note: `#[warn(elided_named_lifetimes)]` on by default

Could you please take a look as I have no idea what that means?

Best regards
Bartosz

