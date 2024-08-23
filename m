Return-Path: <linux-gpio+bounces-9072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA995D165
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1D81C235F0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EE018890B;
	Fri, 23 Aug 2024 15:30:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703CB1E529;
	Fri, 23 Aug 2024 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427024; cv=none; b=gazPJ7YeKfAcupS8G2dCRAr8B7Wm8f+nWoO9x6MCj9ALNE/yBLD7S0Fq8amiNbC1wnbpmXfqaClzv+mvsgAOSt/4losvg4GgSer61eSE+cVED+j2eXK/8XLkARCWSrCZlKjg9bYjSuoZlfdm236EHlpCswU+TMSUeOtprEO0obA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427024; c=relaxed/simple;
	bh=MYhe+0dimdjupQz3+SID53Jf06YJ9yx0cG073VN8KUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAR6r5nzy1wPxhIClrEGONPjX2uMwNpLuJMwhZhRDssU2fyae67Eb8IOlbjL1c6lOqU9dbRKF6RPtOhNQH9VQgC7VLehJNlM2+hqHsfIY3KtW3zp4XyOu5MUUNl3KqWv4M+4zbg7y+38Xt1IMKTj9h9B6XYlxLwjkWLvSrb4800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1205de17aaso2168182276.2;
        Fri, 23 Aug 2024 08:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427021; x=1725031821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfbrrY27H13omvCwK9916CfiXzhyrylN8NolaO2kmUw=;
        b=D5qT04/cINdGy1kB50ijYOjCbK/AmT0oC+FpxjokirANb92RYozzag2JEsyzOJAS+z
         9iTJul3pUnjj5gprzlxRax8APFbqryEIQM0uunJ2nTU/+OB8zMwb57p1C/hj8z9DpG4v
         +rtqqrLQV9wHtedM6Q8zmkF8zP9jcdLxIB6PwOGaDtmt5Q0ICj0xBIb1uMzbGYeRh1g5
         jbGDiOBrn24eigwJOOvA5d9mg0/nE4SIL7tQCUMOtUA0R7mpVdGx4KdnKm7mbTWvlZxN
         7kPfqCgXHsdHKc9EotWzBLV2eDfmq9EOnEdAV4aGyviiytN/zCOvC5Qzlr0Ws1kLqcRj
         4tfg==
X-Forwarded-Encrypted: i=1; AJvYcCUD8gQRws9825pzbKggGuVVW9V4pHONQ1GI1j4EH/A6uhQegwn4a3pMCoaMwo7161Id2/zoxIrzPK7F2SxmqxNOJ1g=@vger.kernel.org, AJvYcCUWiHiwRn9lQtcyio+W9FQS3X32UutSl1qScLEPRnDKFRBLVsBQmc2K2M2oOmczYTeOxLqxuWKukLfC@vger.kernel.org, AJvYcCXLqgk4alpSEgvvJ9LNdPEKo3ZEYtrqB8K4X/fvROGenVfS+YbizpvBfwdzAptUF8CksijYvNyq6O1IeJPo@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeIR391T/T2a0n0voyq3blAzf2QSrQiNDX5gnXrGZaDUo0bew
	H8VNLmCkyAOp4E5gBuYzgiY55aS1JiSXX/GNRJ5f5o2PiV85brfNJal3ZInr
X-Google-Smtp-Source: AGHT+IFNWc9gJLuCIl8f9PnAKYtAGEMUxz5m0F8sp5F0DW+krHteANK+J/HnyymVvaWnE9wAuZG9Tw==
X-Received: by 2002:a05:6902:120c:b0:e0b:5d76:c22c with SMTP id 3f1490d57ef6-e17a83b2b3fmr3389578276.5.1724427020716;
        Fri, 23 Aug 2024 08:30:20 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4638c5sm692477276.18.2024.08.23.08.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 08:30:20 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso2104576276.3;
        Fri, 23 Aug 2024 08:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXrv64aUG/VcVEFgaxJRmRFnkzMG6orxmrtEbPFuTituZU2RI7NKGF5F5hesQcv7JS9NIOufqOQxTg@vger.kernel.org, AJvYcCWf1zV/A3Hdfs9Wlr7R4aZsyNiPPx2a6j1WO/rq3BTRajxJfu/ehHfGm1b3RVucmHWuqZStb2AuKHsO0KCd@vger.kernel.org, AJvYcCWfRH4o8+d3NbZnDajR3+aIo46oamh8nP3S84+x88KVWFEZH7B8Dt7TaBAk4/RDbyrKA13sOihVnORMRoHoRiPbwQw=@vger.kernel.org
X-Received: by 2002:a05:690c:4585:b0:65f:dfd9:b672 with SMTP id
 00721157ae682-6c624fb6c9emr23894087b3.11.1724427019711; Fri, 23 Aug 2024
 08:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822061438.14617-1-shenlichuan@vivo.com> <ZsipPZz7O0yrOHE9@black.fi.intel.com>
In-Reply-To: <ZsipPZz7O0yrOHE9@black.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 17:30:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=T04FizyGQ4QBWYw_Ug8ODg6K+dQ=Cqg8L7pmA6wEDg@mail.gmail.com>
Message-ID: <CAMuHMdX=T04FizyGQ4QBWYw_Ug8ODg6K+dQ=Cqg8L7pmA6wEDg@mail.gmail.com>
Subject: Re: [PATCH v1] drivers/pinctrl/renesas: Switch to use kmemdup_array()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shen Lichuan <shenlichuan@vivo.com>, linus.walleij@linaro.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Aug 23, 2024 at 5:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Aug 22, 2024 at 02:14:38PM +0800, Shen Lichuan wrote:
> > Let the kememdup_array() take care about
> > multiplication and possible overflows.
>
> > +     cfgs =3D kmemdup_array(configs, num_configs,
> > +                             sizeof(*cfgs), GFP_KERNEL);
>
> Geert, don't you want to fix the indentation issues?
> Perhaps even combining these to a single line?

I have already done so while applying ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

