Return-Path: <linux-gpio+bounces-19611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FD3AA9B3F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 20:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D96189145C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 18:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D507D26E16F;
	Mon,  5 May 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGzzKRxg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDABF34CF5;
	Mon,  5 May 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746468662; cv=none; b=Nv0wsU8AEIuDCuD7MgY85gtrfL4rW6ZrwtcCuANPl2JIp8GciPaSyEcJzxCL+OofCndgNtyUMkOE/SA4X1o3KcupBVTvcjMWDQR1BoB6N8OTzDk3RCrWmMr9S1EuTyNohfcu2sBHksm0rnzY9obFonJniSwbhEH9TAtMrD6IsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746468662; c=relaxed/simple;
	bh=S4JVNNRAHQC1IsHI8UKDQdF1A6vH940vVrxojzGMxzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPg4vZc+fNSSmE34RxSmlEgv9LyTYkkxStcRSq9m0WYi25TFR8+6iXh4Ln2WdjQvcCjaN8Ij06KMruJJYKg6HO1QTK+oRvLjH5TvZaB5de7ORyJTKwPirjRpOw6538PDIGCsWBkJmfQKKqdRouFIdcZd8aYxeykAILPpB+3ZrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGzzKRxg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso118315866b.0;
        Mon, 05 May 2025 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468659; x=1747073459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4JVNNRAHQC1IsHI8UKDQdF1A6vH940vVrxojzGMxzU=;
        b=RGzzKRxgysMtSXVwspPXq5xV2I9bv/yWZPgxpAI9J8bLk6jnsl4VnYawHXxsVwDTJ/
         10U432laGb/Atm7gfXB83VriRxMMrqj7Sx0dkZI7PaxRVf2yWSjHS+nXppw4UjJE21rw
         6oJWV4cM12vDWdpIcuMshmuJjUZlIVL+fd9zXpVUr2qBAremnXhBCQ18JU1Ag372hTg0
         zz6U8PqdqEUvXjHrhms4Y2TViIYfXjxkGHy/uWCjtDJ85glbQrZ2BuRFA1FGBNBlU2iJ
         Yn1uhu6jliTrfWuuPXW3H1zqnRJFnUdENHug9kruD/jnFxtFe2Kcoo9fkawXQg0zWQiY
         JZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468659; x=1747073459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4JVNNRAHQC1IsHI8UKDQdF1A6vH940vVrxojzGMxzU=;
        b=h3XcUJqan9HArpHzGMSj5Zdr8Gk7EjJ81M++z6mS5oBW8+TsX/7H/6UOEEdUxbZpBN
         mjFfryf0CSucnoHCnj6b/rdK04FQhbGjv+za8IyFuxxuHI0fy7BYsimdLQOEX46y3qYN
         YDMYohJ7XSjn9+SSNH0O4RnwW8PZZ0YyD6rCTpNRFi+2LoJ+O2PmmZ3sZS0q9QpbXSYU
         9cMxOFjUmzUnCnlSBLM24j+q9pBke28rutCU5gPvPEjWSyErhKFcgcgXohahlVq+W5jv
         +4Cxrja0+WfR+g1fsmOTlw7rcvWuq0ELMQvbR6UBYIIzU9QLEeWk7lzQQIr69rmcVIeF
         REEw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+AxFNuNHBgva1+Gb5fsHN4J+QZAxAFbVQdJgFoJ7Op4BZGCx06DuN5Yv4/ktOrRgtiO7UHBUKhpg@vger.kernel.org, AJvYcCXjNG9GeXnWw54ELUdKH7j058etBj1xMvqccAJnx7dgrw9GtZR0B5+3YD348qPKhbsftlcF2rLElg2UofFk@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZbXePCG4j6JHMJpp4YhBjXNldS9/bzzwXtOXWASMUStvfNQG
	TQtAHUcvzWNytQx2KbZYVLjAaiMDFxZXnYxSc3du0eFGKJg4lVb5XS8MEQ6CqasUFkTeX324bO7
	F/altQeceGEcmMc46nBHyb/WaI4Y=
X-Gm-Gg: ASbGncuDlpv/W52uzbhkvudYH2eAqUUV4DKQTXskALUJi7m36f8kkZjGtERTnDNzDPY
	YsyHDM/LhM8SpoYphu0QEiOMcYCpcGoI8lPxlOAQ0momzqeEaClcAx6ctLnkJM7x754coDwNjZu
	Spj9udf5KeX2e49yop9gQlLj1V
X-Google-Smtp-Source: AGHT+IEfx2C4geN85uheMhLmEtIhzDh1m1Nd8hV5mcDTccGvEa03VzDxcd6XyxMDz9a94t4VZFN+s8qWhFznjEb9dIc=
X-Received: by 2002:a17:906:dc92:b0:ace:d957:d6d8 with SMTP id
 a640c23a62f3a-ad1a49fefe2mr754274066b.34.1746468659113; Mon, 05 May 2025
 11:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430153239.7137-1-ariel@simulevski.at> <CAHp75VdzqoxKwVhSqHVcnjCyBT1+y+020iTADc0isX-kqDJY8w@mail.gmail.com>
 <CAHp75Vcc0jX_AXh25sicRJCF1o7au8oOeCkN4GoTUTHyXYQv5g@mail.gmail.com> <CAMz-Jg-nNqUyzWpayBhPqhsGWOAKJPEa7uRWpOX0HWJDzqiQsg@mail.gmail.com>
In-Reply-To: <CAMz-Jg-nNqUyzWpayBhPqhsGWOAKJPEa7uRWpOX0HWJDzqiQsg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 May 2025 21:10:21 +0300
X-Gm-Features: ATxdqUGWTTtsKkDNNg9Hj15Sbot0c7T2_GPm3U2_CREY5C1rNUgOqi4MoacnKBc
Message-ID: <CAHp75VdeMpiaA8V5J5F2etJnkkiBJVu5-Wwyrzm52pXr5JeVng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Document supported platforms in
 Kconfig help
To: Ariel Simulevski <ariel@simulevski.at>
Cc: mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

First of all, please do not top-post! In the (Linux kernel related)
mailing lists we do answer after the respective context.

On Mon, May 5, 2025 at 9:02=E2=80=AFPM Ariel Simulevski <ariel@simulevski.a=
t> wrote:
> Thanks for the feedback.
>
> Just to confirm: for the Kconfig help text, would you prefer keeping it s=
trictly to a plain list of supported platforms (e.g. "Supported platforms: =
Tiger Lake, Alder Lake-N, Alder Lake-S") with no additional explanation or =
context?

Yes.

> And only PINCTRL_TIGERLAKE because I think that the note on PINCTRL_ALDER=
LAKE is actually quite helpful.

The similar List should be added to all of them, but after good
research done. The note about the certain touchpad or any consumer is
not okay. This driver is not about a particular platform or
configuration. That note gives actually an opposite, i.e. confusion.

> I want to make sure the v2 follows your expectations exactly.

Sure!

> On Wed, Apr 30, 2025 at 8:17=E2=80=AFPM Andy Shevchenko <andy.shevchenko@=
gmail.com> wrote:
>>
>> On Wed, Apr 30, 2025 at 9:14=E2=80=AFPM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>> > On Wed, Apr 30, 2025 at 6:32=E2=80=AFPM Ariel Simulevski <ariel@simule=
vski.at> wrote:
>> >
>> > Technically this is a v2 of the previous patch, but it has been
>> > changed a lot, so for _this_ time it's okay to have it still v1. Also
>> > note when v2 or any new version of patch is required the changelog
>> > must be provided (after the cutter '---' line below).
>>
>> On top of that, you forgot to include (all) maintainers of the
>> respective code. I recommend using my "smart" script [1] for sending
>> patches to the Linux kernel subsystems.

...

>> > With that, waiting for v2.
>>
>> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintain=
er.sh

--=20
With Best Regards,
Andy Shevchenko

