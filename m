Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EEC1A53F1
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2020 00:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDKWfB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Apr 2020 18:35:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54516 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbgDKWfB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Apr 2020 18:35:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id h2so5922018wmb.4
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2020 15:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=XTdhg+Xlf5WPZXZz0XSsY6zvLdLYzEpOReg3X3kD96s=;
        b=JpZPZ5IJaM6K9R8SqSPXG0qjQfqrwlkbzbZZRg+FRlF+C+xU5GZNWXJIuJjaMVjvsH
         WOmjPIa1UTU0gYkdITU0E91PWY2iqfSD3OCc0sRJOH53X6dgyk/nnS+ubn5oMIkBP4Ef
         wjRUmkDWldZPFhHGJw++v2MKpYpolwfx3SDEL75DY9Sg9zCmG8ITuKyvcWyDOo6w+TbB
         uEOIm9N59Kp5eueUtfhc/c085zbWjQP9uLYQeqM7tBG6cULZx5EE56zjVVROlWNxzjNt
         X54RVEx/HGh3owKuNAoLOU0ihXq7+DyCkriblVSHtjjS1RD8Uev1Eyz6FLns7U34cZcI
         vEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=XTdhg+Xlf5WPZXZz0XSsY6zvLdLYzEpOReg3X3kD96s=;
        b=ao4VAPOq4XbjlF6hcA3/mgdSZ4hsOmX/And8PUtPXLtsC8B1VNT712QxJkukUjjTH9
         6/GuFfwV18FHSRtfSDanpy1KWcRYcLlPOIYdOnJ7FaJ/MUpyvuIMcUBRTvBknFgR+Zfp
         k6JhCtv75/kmdzueI/c8O46kKisSdqR4sSb2mZhmjFbAsmV5r/MOeaMlrVA+UE/BP1pQ
         g42azhXBi76IYpkXHp3+lL6jTUStSEC77/OraC0NFBhfZnVKkyPSSPbmL612U5Y/TBfC
         caBMPxktTv1y9/tp5nTwuFd9QWcKvF1EN9POfhs9cFh8faxoK8XK8Wq3QPPJY8WZ6dgX
         idJQ==
X-Gm-Message-State: AGi0PuanIL6sTXckp6hzJ/TqXrn5hgm6M6ymsTCNoJZdZMC0UvJoY81R
        VlgQ7XvpPM8NyPf3ldLtaTP1FQ==
X-Google-Smtp-Source: APiQypLX5XnwJtkOI7FJ21vIuZMoYF8VfN0lscJ3iVpl8y6O/opkC8sIkWHHFQs0s3CaoWUAM16DZQ==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr12144840wmb.31.1586644498242;
        Sat, 11 Apr 2020 15:34:58 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id s24sm7127097wmj.28.2020.04.11.15.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 15:34:57 -0700 (PDT)
References: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com> <20200411170356.1578031-3-martin.blumenstingl@googlemail.com> <1jlfn2szqp.fsf@starbuckisacylon.baylibre.com> <CAFBinCDut=qY9f8BTwRrHC6zKMGK4DEqXFnd8BxN6S2OatXrWg@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v1 2/2] pinctrl: meson: wire up the gpio_chip's set_config callback
In-reply-to: <CAFBinCDut=qY9f8BTwRrHC6zKMGK4DEqXFnd8BxN6S2OatXrWg@mail.gmail.com>
Date:   Sun, 12 Apr 2020 00:34:56 +0200
Message-ID: <1jk12ltzvz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Sat 11 Apr 2020 at 22:53, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

>
>> There is an example of that in meson-gx-libretech-pc.dtsi with the phy
>> irq pin.
> I'm still hoping that pinctrl-meson will gain interrupt support one
> day, then the driver will (hopefully) take care of that :-)

I don't see why it should. If the meson gpio driver was able to provide
an irq related to gpio, I don't think it should do more than that.

In most case the gpio will be an input, yes, but nothing says it must.

>
>
> Martin

