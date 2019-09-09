Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2867EAD3F4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 09:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfIIHeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 03:34:01 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41079 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfIIHeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2019 03:34:01 -0400
Received: by mail-io1-f67.google.com with SMTP id r26so26356825ioh.8
        for <linux-gpio@vger.kernel.org>; Mon, 09 Sep 2019 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WB5ecakQvlUuOryAPKLab1dgMKUg1WRIx6qXfpDLfMc=;
        b=znn4O7h5+LF2rMSllOpZGb+wkph0PVCOCuzN3EKSepmprEv4unGEkEpu8Xpa0XADpS
         FrV8wO7WgmidV10kDVnj822GedLjgwmtUOPwKIuBK/a3ln9fuYY6AKS4mZWn5Ze0GJjV
         DpdxgoMWf/cEpal3EnCTl+ed7K9vHhikj7zRVbWuiIBTAEIVnPoG+RVof070NspwACx1
         Eu3Z+meW5jBOQap2tyhSGei3MwrBt/aeFpw3T4em4wCrwrXiZbAVGnwhGk615m7bX7JW
         h1tqSpDn67tNraq/j1mxu/OB69afkXMc0X8ttb5Xh82Unk7NI52BDlAPNPS8dM6aK2MH
         CMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WB5ecakQvlUuOryAPKLab1dgMKUg1WRIx6qXfpDLfMc=;
        b=O3gee76NB1L9JHKUELNWtz38H3Wdf3oSHkZQd5O8O5b1LOoG1O5XYdd1wJ6SwUWmBk
         sSaWHqOkkA3w/ehxWqof6QZDqPDd6JIIO0DUHcbAyoGuTIlhNMRvkS2t89afFn3DyKXe
         HiSqxh8/RgB716fBit9Ps/g+EACI4o/5v7bE/8DhpiXeStnAYYIvTZN9gWKbk3pz9x+g
         Jn6MTsTpiVWl6le2tTTcsN2rpZF3mSpTyqWUAYhBWPiFp8qimXh0EgmQytsOvwqJagaI
         ffUE0vwW+CmrAmmCJZ3GAII+Sgo1R1nltBTXlxqc0labQV+Vj6+EBNXBpXVKYEmMqd70
         zOhQ==
X-Gm-Message-State: APjAAAXXR7NhBnWAG3QOuLWFlhZfr3uyg8xr/cO3GohQTVi9CXns02uI
        muAMG59pHMVloLE1n1LtNlLo98gBzDNCYNY9Zn7T8eMa
X-Google-Smtp-Source: APXvYqzG1jbjY+43mDCYuRiHhljG6E8dslRS5ylndTp9P3tF8TklWbUYXBXVq8tyv/EIg+rIf2smdQupUdkL4C29Y2M=
X-Received: by 2002:a5d:9a18:: with SMTP id s24mr1481216iol.40.1568014440404;
 Mon, 09 Sep 2019 00:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190909032218.1901-1-warthog618@gmail.com>
In-Reply-To: <20190909032218.1901-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Sep 2019 09:33:49 +0200
Message-ID: <CAMRc=Mf9Jsgr1=Kzc=06h_MKNeZihRZveKac2msmwsWXqNmvXg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix line flag validation in linehandle_create
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 wrz 2019 o 05:23 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> linehandle_create should not allow both GPIOHANDLE_REQUEST_INPUT
> and GPIOHANDLE_REQUEST_OUTPUT to be set.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index cca749010cd0..7502230a4ec8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -535,6 +535,14 @@ static int linehandle_create(struct gpio_device *gde=
v, void __user *ip)
>         if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
>                 return -EINVAL;
>
> +       /*
> +        * Do not allow both INPUT & OUTPUT flags to be set as they are
> +        * contradictory.
> +        */
> +       if ((lflags & GPIOHANDLE_REQUEST_INPUT) &&
> +           (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> +               return -EINVAL;
> +
>         /*
>          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single reques=
t. If
>          * the hardware actually supports enabling both at the same time =
the
> --
> 2.23.0
>

This looks good, thanks. When sending v2 (after fixing the other
patch) please do the following:

- send it to Linus and myself (addresses are listed in MAINTAINERS)
- send all patches as a single series

Thanks,
Bart
