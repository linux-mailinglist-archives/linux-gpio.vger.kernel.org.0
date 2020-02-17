Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0214160F8D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 11:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgBQKHY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 05:07:24 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41476 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbgBQKHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 05:07:24 -0500
Received: by mail-qt1-f196.google.com with SMTP id l21so11606415qtr.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 02:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QKmvUuTt70pSAatHZ0jteOvjXuuDVvr+bCMj5+FFq08=;
        b=vCFFrRZrjoPXbs1+l6naVB0eUJ3yxVHXvgsyCrb5LjhS2ONKBUaYUtYVw8ooD3MpVN
         rXDdKtQu97wRmL+FqAuQ7abYMjL9ccTqfVst4GoDIVCLzyEgIowJpIQIpOm8kGoeWN19
         0sqaDpLR2KWxdmYkc+d0qvaarFa+9Y2mjq2kaOi/a2ysWjbnV/G0/acHVaeS3PrkED8Y
         p+6l4U2D2xkPj0Zv/wY+ZaJfYPvDNR/+Z/mt8cz+c+K+ueUQY9WA1KfqUPdBBQ+TCEaV
         CQ6Au2FpqwJYghlMkX11cuJgyBb8zSchrJE+gzsroZtPXEGUB7i8rW7QW1Ekz4/5whZ/
         5bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QKmvUuTt70pSAatHZ0jteOvjXuuDVvr+bCMj5+FFq08=;
        b=PE2s33jEJS5laX18sJtmi/H0MSvvKPDKiFmjHnMNgVSvKAWQ4eIoeWknKtsqQ8HWEa
         tsmDNOvaGN+5wfQLwoQceAtgNq46/s71zTQBluPDiAZvTdazx6A+eAjTyLC19z42ccG2
         5nfe9YCGJbpp6PSbuFkDBY5amILW0VsB24zuk4HVJw71IsMO/BqUF+91/DVqRB0zDVCa
         M3IwJWRo7z88b9ISKgOUmogMUklOmAB0uNgQ8I55b2MDyTEh6yJsqi+V5mSu9rNhtl3L
         7v0Hxad80DHWo4KIHzNuMsCvgkSVM5RcylPwDcw/ZvsESxkJ+b3ttX/lo/ZpfsrQ2O9d
         WH+Q==
X-Gm-Message-State: APjAAAUGYIotijyUH0LyRiUR4705KyFX3kHu6AVFADUV4HdjOXaz95wT
        47TD6CCZVYhWch6w1nm+tQt437KKlcy8Vp4d9xxhEw==
X-Google-Smtp-Source: APXvYqwVP2B36bbYFlQML/AXp94nphTIrkBxle/EKeNaBgmECufJ48t3oBIbJyL9Vm9rR/3FxaY+WDfBPXcQXWiWeHg=
X-Received: by 2002:ac8:44d1:: with SMTP id b17mr5644819qto.208.1581934043023;
 Mon, 17 Feb 2020 02:07:23 -0800 (PST)
MIME-Version: 1.0
References: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com> <1581664537-14386-5-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1581664537-14386-5-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 17 Feb 2020 11:07:12 +0100
Message-ID: <CAMpxmJVLh6uq=0PKdHZ1CrmfCTuJen3UyVeNMqmCHv8bFAYARw@mail.gmail.com>
Subject: Re: [PATCH V2 4/7] gpio: zynq: Add Versal support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 14 lut 2020 o 08:16 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add Versal support in gpio.
> Only bank 0 and 3 are connected to the Multiplexed Input output pins.
> Bank 0 to mio and bank3 to fabric Multiplexed input output pins.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Versal devices are the industry's first adaptive compute acceleration pla=
tforms.
> https://www.xilinx.com/support/documentation/data_sheets/ds950-versal-ove=
rview.pdf
>

Ok so you added the description, but why isn't it part of the commit
message? We want to make this information part of the git history -
otherwise it'll get lost on the mailing list.

Bart
