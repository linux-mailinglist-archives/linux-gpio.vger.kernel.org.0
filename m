Return-Path: <linux-gpio+bounces-1878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185B81F38F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 02:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEA68B21384
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 01:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F17D7FB;
	Thu, 28 Dec 2023 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US2qZWRV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935910E3
	for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ccbd9000f3so29796841fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 17:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703726431; x=1704331231; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=enfV9vYRZpC/atynuj1hSr/yhMcTHvPtKFvOrWACAs4=;
        b=US2qZWRV2k29CPquYPdNwRwHQAPhNXS/9uqSaQ7zsd64i1aBO7h/WcEthtnlixtLGw
         g3gdB7OYoI9i3gwCcoIDmGickd/3cIsoWH1dmeeaCHmuzHoNQ50JvJ4LjJ6PiwvaYS60
         M5t1K0XrQtUQ20vC/4mXoSRJ8v16VZcKCIE2cyEymPgvu9ZfMd6PnXVa4P3cKjcSEWJo
         wStnQ8FC8+/9nS80v+CT2fnBOlZ+F/PZK9AZsXfRrWU+FVZF8RSI061fuqljIY+7WAgP
         4ZD3PlOH6Z0emOnzDw7nl1mQPbxEntsnHbQhWYeQiyvo6+ixOtZxPKDZb+Ow7zHVUFDu
         VxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703726431; x=1704331231;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enfV9vYRZpC/atynuj1hSr/yhMcTHvPtKFvOrWACAs4=;
        b=bz+kJUZo5GE3Mkn0+9PD5Bo20LARpjoLssnoSrMsJpt53NEeeCK0kbA7snNunZJhSK
         QRjs/S59NVGejSi+5WjDCNS/e0GScLkki3gcaNC2dj5GrjlsruXJFd4vYhpH8Uoqzlth
         +yazdFwjLnJCWkejGgl59GoNV32KU+8TyYXY1VhHTpfV5g7ZkR1rwF39576rK9FO+gFa
         /wh2sKdNkI7v8KIUIsIB62h+n8RGbjGl8LlQGUi+ZA/gr6CKkM27SrHiaFFaSSO4NPo6
         C0uPdCpE6FLRBVWQ17B7H+XcBMo6xIjdDPJ4g2LSd7BGd9zRnhNRokVxwlIuJEYYe6ZS
         ihog==
X-Gm-Message-State: AOJu0YxR7ehZHeO2Z4t1gVXV2gKp3uoedj/uAG82BakNnEtAMtlLf2BM
	pxKKiBD/ncjjU23wf/nLgH6KaHhTtQR3FtK6lRVdl19az/8=
X-Google-Smtp-Source: AGHT+IHeoS/lVEqmL5v6ZeblRa3A2h12Ibf45kPZbJTtyaPdFyFToedEREBLe4agSl/sjXR7mNw1PuW+KoY0CuRPbDE=
X-Received: by 2002:a2e:86c2:0:b0:2cc:6b07:e271 with SMTP id
 n2-20020a2e86c2000000b002cc6b07e271mr3513371ljj.54.1703726431177; Wed, 27 Dec
 2023 17:20:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 27 Dec 2023 19:19:54 -0600
Message-ID: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
Subject: Some thoughts following a brief test of libgpiod ver 2.1
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I've done some testing/evaluation of the 'libgpiod ver 2.1', and I'd
like to share a few thoughts from that experience. By way of
introduction, I have a degree in Electrical Engineering, and I like to
experiment and build things using "small computers" that run Linux. I
have zero Linux kernel experience. I did my testing on a Raspberry Pi
model 3 running a variant of Debian "bullseye".

1. I do not agree with the lack of "persistence" - at least as far as
it seems to be practiced in the 'gpioset' tool. When it comes to
"turning things ON and OFF", there is a long-established paradigm that
says when something is 'turned ON', it remains ON until the user takes
an action to turn it OFF. This seems simple and obvious to me. Using
the light switch in my bedroom as a simple example, I cannot see the
logic behind a Design Decision that requires me to keep my finger on
the light switch to keep it OFF so I can sleep.

When I was in school we studied 'state machines'. I felt I had a
decent understanding of them - they were useful in designing automated
systems. Yet, in 'gpioset' it seems the concept of a 'state' has been
turned on its ear! We can 'set' a GPIO pin to a state, but that state
reverts immediately (a single clock cycle?). There seems to be an
underlying thought/theory at work in 'gpioset' that demands that it be
kept resident in memory to maintain a 'state'. There may be hardware
systems that demand continuous software oversight to function, but I
know of no such GPIO hardware systems. Also, AFAIK previous
programming interfaces/libraries all had "persistence".

I'll make one final comment re. 'gpioset' wrt to the '-z / -daemonize'
option: First, this option seems to admit the failings of "lack of
persistence", but beyond that lies a question: How does one control
the daemon? The only way I could terminate the daemon was to search
for, and then kill the process. At least with '&`, one gets
notification of the process id.

2. Why does a tool with 'get' in the name write/change GPIO
parameters? Would it not make more sense to relegate 'gpioget' to a
simply **reading** and reporting the state of the GPIO?

I'll stop here. I don't really expect a considered reply because AIUI
this (libgpiod) project has been going on for 5 or 6 years now. I
assume that there have been other attempts to inject critical
thoughts, and they have clearly been dismissed. I felt that without
expressing my thoughts here I would fall in with the silent majority
whose enthusiasm and support for the present design is assumed... I
can't have that. :)

Rgds,
~S

