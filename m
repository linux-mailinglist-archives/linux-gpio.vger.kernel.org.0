Return-Path: <linux-gpio+bounces-2094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F2828B77
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 18:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A370C1F25CF6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 17:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B193BB3E;
	Tue,  9 Jan 2024 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gadgetoid.com header.i=@gadgetoid.com header.b="g9yGQEck"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D333B796
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jan 2024 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gadgetoid.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gadgetoid.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-203fe0e3fefso1741059fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jan 2024 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1704822575; x=1705427375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQUzDGBpioryhzaPBcxMXNN23RqY3pbLc7O5lTbkKrk=;
        b=g9yGQEckp6cUpz4QKDdiw7+nVr+HMBYzIDptf1A3CvLLaj78M1VBHya+9H3B0z9ts2
         uLrQwcrf81SwhyyrT0WKOQ8IdqjdgFpuugsbzhlF9m57MJlQLmYrmvZnncGkt+Kg4v3B
         y/M1bwhbyjOLzmXDd6OsGAjkBuP9dQfvxEer6aAlWmKGstAh70ToRoO61BNBO3cRJz4X
         /DbXn281jYwEJ9N02p0hvAHLKjqJ1IyvwUqQE8RDASveD6c3PSOP8UlEnCn17QyfDT4F
         03hNi7bLJo7rSHfqo63nRZ5LpMk+SBM7N8CUrO7pohk3lDIq7zTpXqZNLRwj5DoiYEj7
         sW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704822575; x=1705427375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQUzDGBpioryhzaPBcxMXNN23RqY3pbLc7O5lTbkKrk=;
        b=tY/k8ja+/SufVgJr2/enYHeQUDkIHv+zZhnPfCQX3bv5n+iHw9p3HYL0MMwixUR8J0
         IZ+j9ZcYVwjaR3YsCNqHrx9Tqotq7QuSeAcgtHBTDJhFWomxzx7Ndhn0qMJPYtlIStdX
         2fkFWThFOIDfdGhyH20BmgaAWZ8PRMdZCW1nf/VSSh8pd4YeCFmZKHenhG5FqJHKG6Yp
         9E82UXt+ZHcdcGj3aYeLUUtS3wfR6v64bjZ90NRgjXMAniKJhsdO0yB49pNOsyr5esJI
         UTFs6dLRRUE+R1MIcs474BmH/b2AakyGUa0/NKTomBZkGZJL5zHGmbBB6Yf0eHIl6+vr
         YVyg==
X-Gm-Message-State: AOJu0YxaoqZQtqOFjrATjCetcTo0g85FoIroB7JstWl2Y7IV30qfWudL
	4omnB/gUJMRHzbLhoY1Jq6zE8KuSjHc+VcPQbv8WNZrWMB/v4g==
X-Google-Smtp-Source: AGHT+IHy+YBjX4jzDvmM0v/Z6VL+5F0gbgYu0TGBn//W6lJ5O04GCMQn7UeyilHAKWVPhiYqOHuSiv+gpJ+Lx1Mrr5Q=
X-Received: by 2002:a05:6870:ae85:b0:206:6f1f:651c with SMTP id
 uw5-20020a056870ae8500b002066f1f651cmr86646oab.39.1704822575498; Tue, 09 Jan
 2024 09:49:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
 <20231231035114.GA15400@rigel> <CAJ8C1XM_+nhwNvxMh6xbMyLRexaRye9+Z5sTe6fLUte=uk1ufQ@mail.gmail.com>
 <CAJ8C1XMx=5PLLyBTP4-3A1dEQ9FZb6drd9dP4KJN=2T66hfYzw@mail.gmail.com>
 <20231231090226.GA45535@rigel> <20231231105039.GA53984@rigel> <CAJ8C1XODdrTcskCYbjbJxLvVUmK9Xv1edt=k6Upd2-BaA8y=rg@mail.gmail.com>
In-Reply-To: <CAJ8C1XODdrTcskCYbjbJxLvVUmK9Xv1edt=k6Upd2-BaA8y=rg@mail.gmail.com>
From: Phil Howard <phil@gadgetoid.com>
Date: Tue, 9 Jan 2024 17:49:24 +0000
Message-ID: <CA+kSVo9Sqcyh7gKu6pS1=7p6cgF=g1ZO6WY--tjzSU6H3XJTYg@mail.gmail.com>
Subject: Re: [libgpiod] Documentation question
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 31 Dec 2023 at 19:40, Seamus de Mora <seamusdemora@gmail.com> wrote=
:
>
> On Sun, Dec 31, 2023 at 4:50=E2=80=AFAM Kent Gibson <warthog618@gmail.com=
> wrote:
>
> >
> > Oh, and you are still wanting to clarify why the GPIO uAPI/libgpiod onl=
y
> > deals with the GPIO subsystem?
> > Not sure you will find anything that states that explicitly as it is
> > minimalist Unix philosophy - do one thing well.
> > So the GPIO uAPI only deals with the GPIO subsystem, and libgpiod only
> > deals with the GPIO uAPI.
>
> No - it was something I read. I want to find it again so I can use it
> as a reference for something I'm writing.
> But not to worry, I'll make do without it... and it's obvious once you
> begin using the library :)

Dollars to donuts it was this:
https://lore.kernel.org/all/CAKdJ40QqZt3MbeLNZ1fuYRgaTqSJeDaDdHkQSx1-KWCW4B=
cJPg@mail.gmail.com/T/

If I may pull a quote:

"No, you haven't missed anything except Unix ideology. That ideology is
telling us that one tool for one thing, and in very featurable mode.
That said, lingpiod is exclusively for GPIO ABI between kernel and
user space. For PWM you need to access the PWM ABI in a way how it's
represented by the Linux kernel. I believe there are plenty of
libraries more or less okayish for that purpose, but I never heard
about any official library and/or Python bindings for it."

>
> > If you want an over-arching library that deals with all the possible
> > functions of GPIO lines, like lgpio tries to, then you can always write
> > something that sits above libgpiod and the other subsystem interfaces,
> > though I'm not sure what advantage that would provide over treating wit=
h
> > each of them independently.
>
> No, no - nothing like that...
>


--=20
Philip Howard
Technology & Lifestyle Writer
gadgetoid.com

Gadgetoid gadg-et-oid [gaj-it-oid]

                                     -adjective

1. having the characteristics or form of a gadget; resembling a
mechanical contrivance or device.

