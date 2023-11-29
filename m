Return-Path: <linux-gpio+bounces-737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A797FE232
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 22:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941642820B4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 21:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2616F6166B;
	Wed, 29 Nov 2023 21:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4Pbi6uS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C4310C9
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 13:43:55 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-db35caa1749so182116276.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 13:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701294234; x=1701899034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHvHwF4r0ol/6A89XHXlGqO8DIoBfroEzsFv3QQWhuM=;
        b=W4Pbi6uSQEuQOfFFuF9/mB+5JBIPr4eg3fOgNNJrn3c0nDFXZiSg8OvCj6qRi+c3gw
         gopuIwuty5dCZgzlXY7lJoyoPU1mfi1+xgf0R5jNhVswWRi0gkyW8OF0SyYRQUlSWow8
         wpwzuY8uc21udT+72MsMGaxHW90YwpLJ+6PJgsQ58ZMuu2cNb69F4Pj5Px0J/Lo5RFnc
         NZb0HWRHx4PO2DL518w/KcMaLydL9hqUhzraYNyX1qR+AjcsbJ4c2BtP22Tu99hOs1Mt
         SrW9wXlF5oZ676oBnom+74zso5IaC7K0uNHNu1HlVoSRCUPHOUhbJXsGN11HuuxvklCj
         OrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701294234; x=1701899034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHvHwF4r0ol/6A89XHXlGqO8DIoBfroEzsFv3QQWhuM=;
        b=cg+/7ej/ADnYwO/G2uStsyzMcxvbSOXXQfeicPi2QCX1HHwGNm/yt+hM7GIe9JqbKP
         pT7qApRpecKWqXwA6mYgHcu2WSwjRfdKeq1tojNqkjnMBJsuCBU2A/i5iQGL2ABJsfJq
         0MZ9GBDl8L/KR2sYg4blbUzGMbyXqtuoZlaf4sgnSEb8t9jp+PgL1CTOmj4bukjW23pW
         ifdqceNJD73b4XxIWS6ImpqmSLysa9iKkL6iviiIIJoOjztMHKbdWwZGVSXk4zwHrHKo
         NrUQAHUnML2mN61ZRG3VDFHRVDn7+ZHSdnWM+I0MUiEPSZyQ7g2vxduvzBf3RJ26JUtF
         Mwjg==
X-Gm-Message-State: AOJu0Yz0q4Y3gIMkg1lzFdxOjERiQv7FhyZpsBxk+fLMWGXOlyEvM9kD
	fky5d2WDMLkEOrVJ60jfgrYK3ljrjvqheSDlY/FuJA==
X-Google-Smtp-Source: AGHT+IE6hT3lAdjiLDM2v/jobqD/zOiK/jGYz0PHMZqE8j4h+LgkMHS0A8fLarjbXtR4/nzEpRE9D4seIrBcQcc99Ws=
X-Received: by 2002:a25:820b:0:b0:db0:2161:5950 with SMTP id
 q11-20020a25820b000000b00db021615950mr18519105ybk.63.1701294234500; Wed, 29
 Nov 2023 13:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdb8dwq7OYUFuyjJCv7VN9mH1zEmibcOwgFip0wDv5H1gA@mail.gmail.com>
 <CAHk-=whZj3WZezdj8wq6thUeRfzua2y2QsrnoPG9dqfmk-=rcw@mail.gmail.com>
In-Reply-To: <CAHk-=whZj3WZezdj8wq6thUeRfzua2y2QsrnoPG9dqfmk-=rcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:43:43 +0100
Message-ID: <CACRpkdbSxTDo4dDeJ_jdjVmX1Fwso7rXXGs53bdqa835yprVJQ@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fixes for v6.7 minus one patch
To: Linus Torvalds <torvalds@linux-foundation.org>, Maria Yu <quic_aiquny@quicinc.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 4:48=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, 29 Nov 2023 at 07:18, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > Here is an updated tag on a branch where the only change
> > is to drop the locking READ_ONCE() patch until we know
> > more about what is going on here.
>
> Bah. I already pulled the previous one and pushed out before reading
> more emails and noticing you had so quickly re-done it.
>
> So the READ_ONCE() workaround is there now, but I hope there will be a
> future patch that explains (and fixes) whatever made the value change
> from underneath that code.

Fair enough, we'll look closer at it. I just hope I get some help with
that from Maria.

Yours,
Linus Walleij

