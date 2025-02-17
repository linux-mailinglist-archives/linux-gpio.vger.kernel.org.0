Return-Path: <linux-gpio+bounces-16168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB6A38C31
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 20:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A713B14EC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 19:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A327D23537B;
	Mon, 17 Feb 2025 19:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlUj9u4U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7370814;
	Mon, 17 Feb 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819917; cv=none; b=brURe0GyaS8GrdYzI4gOa36fofGrRqkXEFZ6QZYa8yCIGjAxqtGJvPzU2nf/hVibtsW/pKiRp6lK7KUx4b/P5ya0lPXZY/aCR5s3XrEa6dYQ29XXjAZSNx2EgRGB8j4Lb6TnakXPvU1qZY0oIH1wHGFAGZVUhM7AkjGCc4+vA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819917; c=relaxed/simple;
	bh=VWdGS0nckRh6LxW6Vwr/hsehvBXIK3XSsfwwMsmcls0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtxPMIrB7jIyBq6ey3Bg8+SsoeuLSISCyn0HNVExBAMT2O3G7EEy9CL4CUBafwCXdyoT4WuNeIyI6uHSH+x1/0S3KsAjGh8giiThKlPTQTAMjsgepuD1znWKmAqxZB27qHdvVw0HFPBKwbRqBxWU5NJQEota4e06dvuOVjW//Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlUj9u4U; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so946626766b.3;
        Mon, 17 Feb 2025 11:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739819914; x=1740424714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWdGS0nckRh6LxW6Vwr/hsehvBXIK3XSsfwwMsmcls0=;
        b=BlUj9u4UdHHtGtxL6df327Bta7FUGKeXx4Qs1Z1rVC8DkKtJUeip1ecJTAn7JWO4cV
         ZjXsgWwtdquF6euccQjOx02UVhiKlk11+r4wQS3BgR9eTe6MyVkENrSdfv+xPjYw9YaJ
         V1+3DlBUFPwyv5WwDTBiRPS0H5bfe2JmnmyQ8TygGOweeP7umGm7SfH8CqhM5cof8hVF
         YxJaLhc8M/ZYQqcwdddMHsk4FJgja17P1BelYVmWbGc+b1WqORA31Fnq0oYTdDX6t/Ur
         EaLrEhAIiWm8QrhkI7NTZyLbNGRC6VP6AuMgYswiT0u7UGoFHAFoamUsZ3yo7zdYJqN7
         Q7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739819914; x=1740424714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWdGS0nckRh6LxW6Vwr/hsehvBXIK3XSsfwwMsmcls0=;
        b=DUoZAFfsL+dJR7+QEg2Cl3pFUP20I2yfC4Q3xP2nQpKwgGm29/HwelNeEBcHY7TaGc
         Jcm50kQaLob5HNVk9u3C36wkswr2pKagjuLdN2HdphENctgNuVmLs4Hguow29ibdUugq
         ElXcrZ+jHcdyrHRS6sCU1spGKP/8WRUSZLY3ohG5F+rWQc/ITwRMs7ksqwGhvaV/Co9s
         0qZT8uO6NuEAx5xWQBmBC+FEVntqaMGpysqK8lXwyTiNcLsFo0hxG6nkGCCQhEggaWF1
         j1XEqp8rRF6pX3FJAEn4X6ttWfvfsxqzlNYPolT7Y5Tu+vq6c8laydRxAOkWpdrtx5Ws
         ME/g==
X-Forwarded-Encrypted: i=1; AJvYcCUMOM2aD0kIGV29Rthl4VjcF3quAl+0O9XDfb0uych7Sr3PmXXNv1iyhVA66Kd7m2PfO48CUm2kk96dsaKt@vger.kernel.org, AJvYcCWPejHplBrKGYpU/cjoNUeHRSfw+OYYB8hDZzi220cRigcXJwwxQVh8/ZuhB9Z9mJTej3pkS+tuf3NC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo79eMh7BzDqS9MfXmGe7bHn0rbHXHQPTeqThYMhsiWVb5h0/o
	77z6I94Er8KMoewZwtgRYyqTL0PAOm9jKUCL2AzDbU4PdGabFP7gQYCSffR4powJSSBxQyZbk38
	JdC6rk4w7KeFgJWWIaCZ0jnxMkxQ=
X-Gm-Gg: ASbGncu279IQdIo2QuIJlRSCc944cc8B7aaDuiRjVbIgA19zAxqkrFKH4lQCZpBf9YX
	UBk4HQizRFCHaUYRXwdnjgbAysO27NqstJ4oK5b6oH+I5pCXE7Q7tlaarl+hLUwOSxXD1FkIn
X-Google-Smtp-Source: AGHT+IG2CxfIqvvksdYGJnyGY39tE/1WMs7Lmf5A33yuUSpzb293yrhMEoBka1/v12Jz/uQTrbB9oODSXUuw3+MHuqM=
X-Received: by 2002:a17:907:86a1:b0:ab6:d7c5:124 with SMTP id
 a640c23a62f3a-abb710e1244mr1140390766b.43.1739819913736; Mon, 17 Feb 2025
 11:18:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122120504.1279790-1-mastichi@gmail.com> <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
 <CALieaedTCPNkMBZaaFWME9LHDE5OypcaOw0uDBK5fFFcNSO=wQ@mail.gmail.com> <CACRpkdbpWgZHUn4SouR3yL_xjhjnyC0ogb8bErDuECakyhPW_Q@mail.gmail.com>
In-Reply-To: <CACRpkdbpWgZHUn4SouR3yL_xjhjnyC0ogb8bErDuECakyhPW_Q@mail.gmail.com>
From: Dmitry Mastykin <mastichi@gmail.com>
Date: Mon, 17 Feb 2025 22:18:22 +0300
X-Gm-Features: AWEUYZkdD0f9HV-tGT7s6gTlNMFTtRlceWA_xNJCyC45Aer3U0F0VBun0lgDl-A
Message-ID: <CALieaeeVfDe8GBFO6O_=_Z5W+y7==WWbD8x-596EAw-qMXf9ZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"e.shatokhin@yadro.com" <e.shatokhin@yadro.com>, 
	"arturas.moskvinas@gmail.com" <arturas.moskvinas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Linus. No, I have no users. It's only a prototype, using a
touchscreen. I think it has to be redesigned using chipset interrupt
controller's pin instead of the expander to speed-up, although I don't
feel touch gets slower. I spoke about hypothetical users who may use
the expander as an interrupt controller at rates comparable to
mcp23s08_irq() execution time, and may get less interrupts per second.
Kind regards,
Dmitry

On Fri, Feb 14, 2025 at 12:10=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Fri, Feb 7, 2025 at 9:36=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.co=
m> wrote:
>
> > I made more tests and think that this patch shouldn't be applied.
> > It removes duplicated interrupts, but sometimes they increase the perfo=
rmance:
> > a new interrupt may come during handling a spurious one, and spurious o=
ne will
> > become valid (it's kind of a polling). I see the number of my touchscre=
en
> > interrupts reduced from 200 to 130 per second with this patch. It may b=
e a bigger
> > problem for users, than duplicated interrupts. Sorry.
>
> Don't be sorry about that, we code and learn by our mistakes.
>
> So is this patch causing any regression for users? Like touch
> events being slow to react? Also the expander could be used
> for other things than touchscreens. If it's not causing any regression
> for users it seems like a reasonable patch.
>
> Yours,
> Linus Walleij

