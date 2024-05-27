Return-Path: <linux-gpio+bounces-6628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A68CF9B4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 09:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41DD1C20C12
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEC41757D;
	Mon, 27 May 2024 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxMgO9TZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A45A1426C;
	Mon, 27 May 2024 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716793541; cv=none; b=VCcIc3sDaWzMDfy135DD/4tIwMpXWjU5e9enAe1M7pzxDzl1NOxC+Xm+vs4mfBwVE3FWIqS2TwRWYk1akIALnm0cLQcc0Ukmg3Ss7y+CPr4tjpzKemVzpF/rSCKBXvFgpenXAHMgULoguK1o0Qs3Tau7hAxJrcayTciI7++SJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716793541; c=relaxed/simple;
	bh=waWFDIqHc6f9ZTq0mX02kYkS8bmFi6Uo0RTqroajRbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PgxE0BogmOyMuwNIkbRDe73xOoCz5R1p0BREO3qFET20r5DewJ8bsf3pbjKV9IRvZxfD3YNgEzeizzKl87xd+W3ngviREAJMorMDEgzTJ5ksSYB3b14Jp4BFiOmE7AOG/R0adscRSFpgMLFi1kxJqqQu0JFndf3bgVeWN0HTm68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxMgO9TZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57864327f6eso3170148a12.1;
        Mon, 27 May 2024 00:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716793537; x=1717398337; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuwKjSLQaKbx6in6zzTevv0Oz4E78rNc3iEadRtQmSM=;
        b=ZxMgO9TZhuSpieak+wq9ORzUEnw6IkTs4pgtL5Mzb7riTIydbDO7IQajCi8d564+0F
         HkHJfgUG3xwsmpYsiTxEr0MvdHy5OiMwrq9zln8JtkmxQ9p8faIl12eQakef8Hjmk9B1
         Vzny3ZZasJZJju9tRGPLdIEtRLNdg5nEweYO9DIWH3Oc9kJHkqiCwAl4ezpeOKKDqVaN
         BixHtQB9HBue2/7zIrz5O9ccyYMxZUiwsIyrBDor3SvvFvn7EJYtuw2FcJnq18MlHVM9
         cStsk+HsDHBN8TkzIOyzUdyw7FsJFLPbjoE2kgSMtwZmK1ZSH/wj977RX/8jHVWMUmGu
         vQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716793537; x=1717398337;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuwKjSLQaKbx6in6zzTevv0Oz4E78rNc3iEadRtQmSM=;
        b=dY43YWhwlYZCXhiCdV6VQg79Y2cj/NRyuc5S2W30dpQCe2KBI94RovFUMKXeal9sld
         vC6MxXIPdQHi/t5xTqAYGF5SffecPaakrBvPqo6BpTVqMzsz4PcUnhT/MMMETjYRcNWj
         /qoB64lojOnehYbTIPahjpmKDAQgAtus+QVqkvl7gDLw6Fy+VZC4fA1XCo6ZWpwdBjO2
         Val/vTlIsxD/gOohqotgT0iufOrxFH0QohsHvdHdi5gpr+OjtguwmTx55r/XHzw1GVgk
         ADm+o+8L7dWiroPQOzeBNXEwWVA41g8TBVQJaI6AiESVY7jTlJqo1mPsE0aRcwJaXtQc
         WnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfBsQ0x4WIl8YHje8I9whIgWWJLTm82GEjQA77t11Zh3jbhPr8NDDJ9kwZFhjFNUENZ+dScnUaeFFgocpo+a+M3xKNheXT//2ElWNDsPIyLSPqRED5wY0ZHt4IGa613MoC1JqIkBHxKuF+vR7X8YZxxgkZg2FIK7F69w4EMPve4cIjsg==
X-Gm-Message-State: AOJu0YxSuDeL1CRhGHrHxjuW9VekvTKsCXB++EFpqY2FJ9jDvAHvbXKD
	8dXI6b5OuNmhbIW0sP+Dy7LlKjwrGCmyT+9wLxAslLCMOBEmNm3NXj1MbfaKrqKHjUlkP/w6Qx1
	bQif130VEwEk7gV6RKVjvbvR2UXU=
X-Google-Smtp-Source: AGHT+IGeYBYP/clZS12weWp/XG22q1opoNsiXc6Csg6HUYMQMqdCn6+EKVCyXGWIFI5qoXT55hslsI6cypKv/6/WXvE=
X-Received: by 2002:a50:d716:0:b0:578:c168:e513 with SMTP id
 4fb4d7f45d1cf-578c168e634mr4135861a12.3.1716793537404; Mon, 27 May 2024
 00:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
In-Reply-To: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
From: Huichun Feng <foxhoundsk.tw@gmail.com>
Date: Mon, 27 May 2024 15:05:26 +0800
Message-ID: <CAFbkdV175LdW_r04DhhG7pkE4xs9W5305Unk6RK06SiudvnzFQ@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kindly ping.

Sorry that the last ping wasn't sent in plain text.


Huichun Feng <foxhoundsk.tw@gmail.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8812:12=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
>
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
>
> Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>
> ---
>  Documentation/driver-api/gpio/legacy.rst   | 6 ++++--
>  Documentation/userspace-api/gpio/sysfs.rst | 7 ++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/dri=
ver-api/gpio/legacy.rst
> index b6505914791c..c1a083444b0c 100644
> --- a/Documentation/driver-api/gpio/legacy.rst
> +++ b/Documentation/driver-api/gpio/legacy.rst
> @@ -648,8 +648,10 @@ and have the following read/write attributes:
>                 poll(2) will return whenever the interrupt was triggered.=
 If
>                 you use poll(2), set the events POLLPRI. If you use selec=
t(2),
>                 set the file descriptor in exceptfds. After poll(2) retur=
ns,
> -               either lseek(2) to the beginning of the sysfs file and re=
ad the
> -               new value or close the file and re-open it to read the va=
lue.
> +               use pread(2) to read the value at offset zero. Alternativ=
ely,
> +               either lseek(2) to the beginning of the sysfs file and re=
ad
> +               the new value or close the file and re-open it to read th=
e
> +               value.
>
>         "edge" ... reads as either "none", "rising", "falling", or
>                 "both". Write these strings to select the signal edge(s)
> diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/u=
serspace-api/gpio/sysfs.rst
> index 116921048b18..bd64896de91a 100644
> --- a/Documentation/userspace-api/gpio/sysfs.rst
> +++ b/Documentation/userspace-api/gpio/sysfs.rst
> @@ -97,9 +97,10 @@ and have the following read/write attributes:
>                 poll(2) will return whenever the interrupt was triggered.=
 If
>                 you use poll(2), set the events POLLPRI and POLLERR. If y=
ou
>                 use select(2), set the file descriptor in exceptfds. Afte=
r
> -               poll(2) returns, either lseek(2) to the beginning of the =
sysfs
> -               file and read the new value or close the file and re-open=
 it
> -               to read the value.
> +               poll(2) returns, use pread(2) to read the value at offset
> +               zero. Alternatively, either lseek(2) to the beginning of =
the
> +               sysfs file and read the new value or close the file and
> +               re-open it to read the value.
>
>         "edge" ...
>                 reads as either "none", "rising", "falling", or
> --
> 2.34.1
>

