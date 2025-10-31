Return-Path: <linux-gpio+bounces-27892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A3C24748
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 153844E75A9
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9045D33F8D9;
	Fri, 31 Oct 2025 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1XTiHZWL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D132727FA
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906437; cv=none; b=UdbAAX+mDhFGNtCxLy7Gf4X+imSvqPR+62wmgvW4fBXHhZRr39/srZ2nt/9FnZ86i4dn8PLwKsBQUTzJbx8C/cPPg+mrls9g2KNWxHsr7YZ5t0QXxnDQ3794+gbjqBdgusFmoL9HtG//zlyfhoaIwyXT49zWmW7d7YqDbzCq4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906437; c=relaxed/simple;
	bh=LZJjK3oBrjpMjUbg96mJVTjbUwuIdFSzDRhJE0m26JQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SURAWQ863akM3xAo1iyplAvET6lQursJEBDOVKL4dW06ZE89OvVAfDh4PdchwZPvm29KY+mBs1Ka7UU9DVgzJlZBaWQWyvV1SwpGR/DKE6dW2qoCG/MmEDAJ6yU8yIxlT8gQbcUd7Y2ZhlXaMYIeF0NQl40XHxImNqs2F1pLW6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1XTiHZWL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3761e5287c9so23080741fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761906434; x=1762511234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNOU1iRdcbi0x6KU+9+XlLF3cgDUgehMK+0RcldpnIE=;
        b=1XTiHZWLRywz1jgUl5oU4KKcSWlnxkl5AuoB8ztAuIRNjofKjiZOl5QQMN213ASpIk
         /63Kvs8dR43qiY5kzd64ke4Np6NVDZuUScBIiCkfnJKQ4kUWDOPPl/9ti6nBMAPcOvff
         XyC3XkfvGHRb04KpmvzUtiejHsDeyOdzsi/LWG3R1y/Dv7ZC80cuwTY9k6Ld3U0hnTgr
         1tENe9LJB2Vkg+511sjc4hJP6RyWJFyD3bLfBbpJSHDFqo7Gx41t4j8YBNYZX/TzU2wo
         5+32MNlcWW0qxZJA9ZFTw3rnqCEZlHIyjIZME/HeQSodN6HyEpJgBKRvwfqM580XMLXV
         FBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761906434; x=1762511234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pNOU1iRdcbi0x6KU+9+XlLF3cgDUgehMK+0RcldpnIE=;
        b=wmXk5YW8UThtR8FR+azOBRrZyFm2J0GFVU2hHMwK0zFeMgU1JrGhRLYkhOYaou+lJM
         0XjyS1F0QKl6BbciW8zPGMEJEBCC4CLnemT1eFfmAcpgd8+nLH0h6ul9s+aVcbk2lwu7
         9VnVgh0vg4wrT36dLEIWJIb77+7cPLF2uzuZJIR5l4/YieGf/dBfe9w9g8ZxMeniqdKf
         R4oKfXJUgc4Fx7HvJdYEkOJfNkan6vaSLfRuCxNZ3i9JS77zPRXytX5nb4JaNnI3NqF3
         1BjWZlHh/tfcJj8IPNY/CH0nRgD7PgZPFZDciTLfEtIVfWYjD/54WNrLo9/MFNEIrvqF
         Cy6A==
X-Forwarded-Encrypted: i=1; AJvYcCXXtD4/b92jKJUbnFEmQKk1npAW7Ulwr22Gypv7HNdwu0WzT2n0dYJPNJbJnNSTfbw28bYG16/4U1px@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Vc1lB5X8OcpxsFGa7w2im4+wwlis850M+i4HWJ5yyIgqds6z
	Fx1sLLFnPC+jC+jjucsZYzlrBmeY3gHYpXKGFi48obJKzL2QfRCpmbI7d0YudiZKjT1QzyKnhdk
	S4/g7duZ6nXVG7zcKFvGcTn+NZWak1YHQoI3dvXt2YQ==
X-Gm-Gg: ASbGncuZ5yyvMe4nyAj/mfmhFT88ezJ41Rddqtq0/uBZ1AnGoAUegdMRfIowAxx48CW
	cgn1VCRdcG5LPTodImHwDYUTsoxvBVbiqzwr7bQxVRNrRhx8JXetVrKK8KwwuGdFeY72AroDg0L
	kX74y4FBQQd6HL/pUd/u+kt4Z3ye2kDlw4fWb6MWJcZTtGjii9RVtNQHhw52p8CcCphDgkdR3Oa
	L9AEO/Y1ufAmH5sx6vFxi/s20eJs/RUiPMsOWuNFpqk34y6oE6+Wi4EJ3mzoipLrcOgwJP4qmKQ
	iTvXUwS7/W+8QcWp
X-Google-Smtp-Source: AGHT+IFo3peC5StgeTxxGQqDBXnQdp1UAiFfDKKeZSL+XtcRWdzRvlhIPKe567Wwjp5cIPhZ6+UfJrC81qMWudtMilk=
X-Received: by 2002:a05:651c:31d4:b0:36c:7a76:d17a with SMTP id
 38308e7fff4ca-37a18d87b15mr10021321fa.9.1761906431943; Fri, 31 Oct 2025
 03:27:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Oct 2025 05:27:10 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Oct 2025 05:27:10 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aQSFDhUp89xul2AP@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
 <20251029-reset-gpios-swnodes-v3-2-638a4cb33201@linaro.org>
 <aQMxNgC9SWQp-yUy@smile.fi.intel.com> <CAMRc=Md=Dcwj0qDu5ysDafjuV0Ud9z2Ky3PQpDzfiKRt2L-HgQ@mail.gmail.com>
 <aQRztwrOFCWk8IG8@smile.fi.intel.com> <CAMRc=MezQ7RC=ZjiKkMa0qiaKTRXePOKxOCDjjV=-qUYto2jqA@mail.gmail.com>
 <aQSFDhUp89xul2AP@smile.fi.intel.com>
Date: Fri, 31 Oct 2025 05:27:10 -0500
X-Gm-Features: AWmQ_bmvuRg5selCz60KVvdQ444EnQp28Ff1ZBUj00ynWwJi8NQDD4tLMKkPhnk
Message-ID: <CAMRc=MdfbbkWBeAgw3G=k7xgSc8TPhZQ56ks9Or9p9Ah-y5YQw@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] software node: increase the reference of the
 swnode by its fwnode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Oct 2025 10:44:46 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Fri, Oct 31, 2025 at 10:03:47AM +0100, Bartosz Golaszewski wrote:
>> On Fri, Oct 31, 2025 at 9:30=E2=80=AFAM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>> > On Thu, Oct 30, 2025 at 03:33:02AM -0700, Bartosz Golaszewski wrote:
>> > > On Thu, 30 Oct 2025 10:34:46 +0100, Andy Shevchenko
>> > > <andriy.shevchenko@linux.intel.com> said:
>
> ...
>
>> > > Andy: the resulting code after patch 3/10 looks like this:
>> > >
>> > > struct fwnode_handle *refnode;
>> > >
>> > > (...)
>> >
>> > Let's say something like below to be put here
>> >
>> > /*
>> >  * The reference in software node may refer to a node of a different t=
ype.
>> >  * Depending on the type we choose either to use software node directl=
y, or
>> >  * delegate that to fwnode API.
>> >  */
>>
>> But this is incorrect: we're not really doing that. We either use the
>> firmware node reference directly OR cast the software node to its
>> firmware node representation. We ALWAYS use the firmware node API
>> below.
>>
>> This really *is* evident from the code but if it'll make you happy and
>> make you sign off on this, I'll add a corrected version.
>
> The comment should answer to the Q: "Why the heck are we calling fwnode A=
PIs here?"
>
>> IMO It's completely redundant.
>
> This is unusual case for swnode API (see other functions, they call direc=
tly
> the low-level implementation instead of going to a round via fwnode). Tha=
t's
> why I insist on a comment of this piece. It may be obvious for you, but t=
he
> unprepared read would be surprised by this inconsistency.
>

I propose to have the following:

+       /*
+        * A software node can reference other software nodes or firmware
+        * nodes (which are the abstraction layer sitting on top of them).
+        * This is done to ensure we can create references to static softwa=
re
+        * nodes before they're registered with the firmware node framework=
.
+        * At the time the reference is being resolved, we expect the swnod=
es
+        * in question to already have been registered and to be backed by
+        * a firmware node. This is why we use the fwnode API below to read=
 the
+        * relevant properties and bump the reference count.
+        */

This at least adds relevant information on *why* we're using the fwnode API=
.

Bart

