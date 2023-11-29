Return-Path: <linux-gpio+bounces-636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AC7FD008
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 08:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B71C28281A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 07:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B09610A3E;
	Wed, 29 Nov 2023 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMF6RhHu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9DF1735
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 23:41:45 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a0064353af8so117842566b.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 23:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701243704; x=1701848504; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+9kGQGNG1kH6S7sP8ruVCCUAGzWuSDwFlKb7r/1Tqo=;
        b=aMF6RhHuG0mu/9qukHF7ATIy/L7KSK3C2ewICOXWE82VRx7/ZLe9inV53OHaU1TOB5
         ECoBwNrfBReqns5zo+8ZICiaba8QjW8KMLeZPImm2oYpeiNI5s88uiAp6fXDjUE4znz5
         CVOQYFk0bk1kZKG8RrvN1ozrogkS5Wld1yE9mKH14A7RDUy7WuETKgYtGBZtV3foyywk
         iE0POW4wMwxkj/6+x4y8fa42Ik5XgFF2caIP3uUu9QqHameZCkfaFd8xxS72P+JQwc+J
         CMfzYQqQELG6TWuOb+HnTjaF9DvCdfsFljVJoOm9wdSZvxRneAAtNpNedv52MEc6vMcL
         JmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701243704; x=1701848504;
        h=in-reply-to:references:from:to:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d+9kGQGNG1kH6S7sP8ruVCCUAGzWuSDwFlKb7r/1Tqo=;
        b=gxAmwyt7Fan+MWFXzfdPu7g4b0FVU2z9L4hyIb9edvrmVqvQrk6qNqilul0msviuuj
         hKcaNql85fE5UIrravoZNkyjpsWi785/NmKg6JIRWu1W4hOgxYRihB9Gz4Y/c/r3qzTZ
         D3hFRL5gzxDnfflFKv1vo+VWgtlGzjvBxi0rPhFGeOwQzdq94VF4z5ws12qDe4kLLmG5
         3h1Vm9QCn9FpePYvhUv+0zqZWktPhIzUWzWHNIr+8+XgkewX3Ui03FpeOopCUlOmu3+P
         YXcZkcBEaoexJsmTXA4ebwgPvnNSx7Aqyr9fXkbvEEgYQB7q4B9g7dBtH3ey+AsIoXMq
         XKKg==
X-Gm-Message-State: AOJu0Yy0J6feDVcfj+dDbpqSXCmWRT/QmNRx05fcYsI0kjq/NlTMqA5r
	BXBFR1gW12hYdHVsdnk9dup0X84GUG34Bn7516g=
X-Google-Smtp-Source: AGHT+IGcp42JfqK4jKhRwLjathPZlnt1aifhtfq0TMUnNAbU+vHi5MZljikxGoY/rrz6wWO2Vj7fcw==
X-Received: by 2002:a17:906:394e:b0:9fb:ddb4:1285 with SMTP id g14-20020a170906394e00b009fbddb41285mr19859805eje.31.1701243704306;
        Tue, 28 Nov 2023 23:41:44 -0800 (PST)
Received: from localhost ([2001:9e8:d5b6:9400::f39])
        by smtp.gmail.com with ESMTPSA id kk9-20020a170907766900b00a0aca3de09fsm5430384ejc.184.2023.11.28.23.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 23:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Nov 2023 08:41:42 +0100
Message-Id: <CXB4K7SKB60P.3HQ6SAERTVNGW@ablu-work>
Subject: Re: libgpiod - stop waiting for events after request released
To: "Mathias Dobler" <mathias.dob@gmail.com>, <linux-gpio@vger.kernel.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <CAEydidmWPSiyQPOog=9poWEhLLWkJh7Ue4Me_O0Uvi_BYO7XKg@mail.gmail.com>
In-Reply-To: <CAEydidmWPSiyQPOog=9poWEhLLWkJh7Ue4Me_O0Uvi_BYO7XKg@mail.gmail.com>

On Tue Nov 28, 2023 at 6:21 PM CET, Mathias Dobler wrote:
> Hello,

Hi!

> I am writing a C# binding for libgpiodv2. There are some automated
> tests that keep failing due to the fact that each test uses the event
> handling functionality of libgpiodv2. First it creates a request, then
> starts a thread to handle edge events, does some operations on line/s
> which causes edge events to be created, and in the end releases the
> request. When the next test starts, it get's an "Error: Device or
> resource busy"
> I checked the freeing logic and could find out that the reason lies
> within the event handler thread that is still waiting on
> gpiod_line_request_wait_edge_events that returns only when the timeout
> appears. My expectation was that when the request gets released,
> gpiod_line_request_wait_edge_events  would immediately return without
> timing out, but that is not the case.
>
> So my question is, is that by design?

The root problem here is that you are violating thread contracts. The
hosted docs are not updated to 2.1 yet, but thread safety documentation
got added here:

https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/include/gpio=
d.h?id=3D055d401f88a6c0bb8f2ccd3773154baac991075b#n46

  libgpiod is thread-aware but does not provide any further thread-safety
  guarantees. This requires the user to ensure that at most one thread may
  work with an object at any time.

While you are in gpiod_line_request_wait_edge_events you may not call
any other functions on the line_request from a different thread. So you
may not close it while waiting. Of course knowing this does not help
your particular problem :).

> If yes, and there is no interest in changing it, I would find ways
> around it, like waiting on the timeout but that would force me to set
> it very low, to not delay the tests too much.

The best way to solve this is to have your own exit signal. You can open
a pipe, eventfd or alike and use gpiod_line_request_get_fd [1] to
get the filedescriptor that libgpiod uses. Then you can do your own
polling. Triggering a event on your signaling fd then exits the poll
immediately without having to use timeouts. See also a recent
discussion [2] that originated in a similar confusion.

Maybe it would help to add some documentation on the wait functions...
While this is a common pattern with system libs, I was also confused by
the same problem when I first needed an immediate shutdown.

[1] https://libgpiod.readthedocs.io/en/latest/group__line__request.html#ga5=
c0dbdcd8608b76e77b78bca9a6b03d7
[2] https://lore.kernel.org/r/20231113143219.43498-1-zinger.ad@gmail.com

- Erik

