Return-Path: <linux-gpio+bounces-2937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C784959D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE09283FB9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 08:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73291171A;
	Mon,  5 Feb 2024 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KMR0oUi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F0611706
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707122760; cv=none; b=ZNQ5IqJErWosaisdsg0zpMZO768DwWXfNTF9NOgMVbVQ84rbOddrEPTdO0hGnm9tdjs7FqLqcUCpP9Pe3WA2XuJNSBpKaR+mKax12vG42q3yv5RYDFhkvwZxHjNrbRSlVItaczvuXlNiKo4RdCs16QooHytzU+RducNCqM7y4qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707122760; c=relaxed/simple;
	bh=ANx98WXU4SIYjvjMhms1hpnz8HK7EhBP4Rf4fz8NdhM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0BjH7ca2JyDQtPMOIwwsHwFJLYfWV+r1fkPyjTjgwBU2oUBBbd47ppBrNHAmCECRj9F9vpVeG3BG1fXO0Ehgs43EsW6SYJsf3AAhmHQvQ4SaZ+XEvG2XDf4uHL+GCvqm7+njlNUn4OfKOqUl/ZOedUiq06Zgr5Sel91BdbGaPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KMR0oUi3; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7ce603b9051so2033055241.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 00:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707122758; x=1707727558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhJLzNVxpL9Ag/27Wsjbhpw2A6yBvcg5QVuhrwUrEA4=;
        b=KMR0oUi3pWxJ5KuuqVeJjqn+IdDPSv3V2mVmVCWQrB2Mrl7CVXec3BMyMdrMKydEpS
         7ooIc+tcgF8evBx9C05vEvoaSGfdpL7HuDtDsRc08Yo6Lm1uP/Wc0gmbkRepnf9kp/71
         K67BESEhlIwlTZRj+4BoX5hAOj0R5r1e+RB39SFK/NJMUHAT8+YAaXT7yjIZ90Y2Qq+y
         vqgr8c/AKvRx3+rw0g3iEDUVz131E943harTv36CVMvxmttjDGctZOZ6NrwKls2NkosS
         l1rTo8facQrpAl83dA2mgGPFr6d9wEZlaYuI2OqY7Crrqg6J6cxWpijVuoXdsxqBT6V3
         +Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707122758; x=1707727558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qhJLzNVxpL9Ag/27Wsjbhpw2A6yBvcg5QVuhrwUrEA4=;
        b=DiTSj4qeDM835DqmxsSiGjfrpRvtcDtMu0gs4OHhNVB0+UhZrNa9+bYdEoIFW/C2Sm
         8A0a53/bareDJnNm9FepXkIuiKfccLimoYnEy7+X978ixNl4DFxFYZ+9DbKc6SwJ0YNy
         LAat6OQNOIH0Eg8aU55FGgaBj7EufV3ZbCkg1RUTeLtNRCD3fdAVlgJkTXKQx7X80Oys
         ZRPRetysulB9pA1z1moGW2GAdLnYdG7MVuCnCb0+47PIVA/4kyPq9+Rl7pF36wPsQgIm
         YnPO7o347jCTZXZsmQ6UQyZeaYyeWlHhKLFy/M+sXa500fuuFeovibWB07zckOBDuut0
         ufQA==
X-Gm-Message-State: AOJu0YyyDniUnGQitpfiXqN1n33AUXPmbTPf8owv+PIszQjVtUHZLdeE
	+eL4F9f9+vQZ/dc8iFg/Zf3iAX9OBdLrvdFNod3+B34FJN5mfJ8ai5tmDtpDsjJJPYA/YSesrk5
	/y/7bIqLBNeWpvLZv2qmkngAFO4UsN8GH2EZ7BQ==
X-Google-Smtp-Source: AGHT+IECKa9goTNAO7Wc03rJBYjkwARpaJVvj7up5r/TbL4NNdrazZME98r1wzndT/jTn7d1WZ81/x3fX8RAM/OiXpo=
X-Received: by 2002:a05:6102:12d2:b0:46d:2d45:74d9 with SMTP id
 jd18-20020a05610212d200b0046d2d4574d9mr1593200vsb.31.1707122757827; Mon, 05
 Feb 2024 00:45:57 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Feb 2024 00:45:57 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <v5cgkajd7vqz63jsflpx56lvofozh77w4kwomlm5kkwcb36uxs@yqlkx2eduqhk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204-bus_cleanup-gpio-v1-1-82d91b4ee1de@marliere.net>
 <CAMRc=MdSApjK2b66LxLE9XZufvT-+SThuqjdr+yG-hsKEb4sVw@mail.gmail.com> <v5cgkajd7vqz63jsflpx56lvofozh77w4kwomlm5kkwcb36uxs@yqlkx2eduqhk>
Date: Mon, 5 Feb 2024 00:45:57 -0800
Message-ID: <CAMRc=MehgMNZ39wrtbFXFFs6gUN8m8K4NhYWUVNj=ETziKMfpA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: make gpio_bus_type const
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 4 Feb 2024 20:41:52 +0100, "Ricardo B. Marliere"
<ricardo@marliere.net> said:
> Hi Bartosz,
>
> On  4 Feb 19:34, Bartosz Golaszewski wrote:
>> On Sun, Feb 4, 2024 at 5:29=E2=80=AFPM Ricardo B. Marliere <ricardo@marl=
iere.net> wrote:
>> >
>> > Now that the driver core can properly handle constant struct bus_type,
>> > move the gpio_bus_type variable to be a constant structure as well,
>> > placing it into read-only memory which can not be modified at runtime.
>> >
>> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
>> > ---
>> >  drivers/gpio/gpiolib.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> > index d50a786f8176..24d046268a01 100644
>> > --- a/drivers/gpio/gpiolib.c
>> > +++ b/drivers/gpio/gpiolib.c
>> > @@ -63,7 +63,7 @@ static int gpio_bus_match(struct device *dev, struct=
 device_driver *drv)
>> >         return 1;
>> >  }
>> >
>> > -static struct bus_type gpio_bus_type =3D {
>> > +static const struct bus_type gpio_bus_type =3D {
>> >         .name =3D "gpio",
>> >         .match =3D gpio_bus_match,
>> >  };
>> >
>> > ---
>> > base-commit: 3eac8bbed22e940ac1645a884f221bef408f675c
>> > change-id: 20240204-bus_cleanup-gpio-57eea8d32a5a
>> >
>> > Best regards,
>> > --
>> > Ricardo B. Marliere <ricardo@marliere.net>
>> >
>>
>> Ha! Does the same work now for struct device_type?
>
> From a quick grep it seems to be the case, but maybe you should wait for
> Greg for confirmation. Also found this:
> https://lore.kernel.org/all/1305850262-9575-5-git-send-email-gregkh@suse.=
de/
>
> Best regards,
> -	Ricardo.
>
>
>
>>
>> Because I just sent this:
>> https://lore.kernel.org/linux-gpio/20240201162758.50733-1-brgl@bgdev.pl/
>>
>> And maybe I should make it const right away.
>>
>> Bart
>

Turns out it has been like that for years:

commit aed65af1cc2f6fc9ded5a8158f1405a02cf6d2ff
Author: Stephen Hemminger <shemminger@vyatta.com>
Date:   Mon Mar 28 09:12:52 2011 -0700

    drivers: make device_type const

    The device_type structure does not contain data that changes
    during usage and should be const. This allows devices to declare
    the struct const.

    I have patches to change all the subsystems, but need the infra
    structure change first.

    Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

I queued your patch too.

Bart

