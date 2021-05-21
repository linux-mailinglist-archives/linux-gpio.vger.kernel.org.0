Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2349438C7B6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 15:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhEUNXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 09:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhEUNWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 09:22:45 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5B0C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:21:17 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id j30so18184640ila.5
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xbVslEDCXZqr9GQsPgesZninZAO5fJ8cP+O7eR+D2ow=;
        b=WXHL18usQi6/X1DY0P70c46qL5S/W0CO4eAaoTcpGTnbT5adPqyBw9vIAENH2Q090m
         2sWijX15tu2g5GCoRwDDMioK+ZndWOGpyIhffX+SG9wieUqydJufYiPiq0UQr7/UXQVd
         VN6q6iHizBjg56hrlAqExOTzUdMbT1T8+T5O+1G9dapo9RzYr6fPCTUeIEx1iLiitNt0
         Xjzc4bmq/BbEiwDym1y+pvyt0FsoqE1hCYAu/MRnE/H5tHxyrXUVwGskWJ+uD1gZ+gv/
         2L8Xb2tO0Fsvep+3LTZBYZnuqz5JRL33oHvlZiNNhVP8Zg4cHALC4U9zTMN01mdcLV9L
         wHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbVslEDCXZqr9GQsPgesZninZAO5fJ8cP+O7eR+D2ow=;
        b=b24Y/9kh+vEyTlG6ZdYCfoIi/AOP+vvgwQRidZ3NZvgpD8XaY/FFyA/bBBmofrOPMr
         MOkOfyUQNafsoFQt7jB8x8+Gx7dTmBBgenoIV9V7QUJNoz7640Rmi09yP8W/VD+8/w3J
         ILAINI972+6szoOJv7ZnLuXwrc+neAmrrFwmhiaIOMQqusRCvOx3YVWl02waIYF/V5Ci
         NSbtIuPzB0NomxUxFOMxZhah+cPsmlpa6oHG+JhjaI4vZGuaw7lMoZlmRhb9IsOzF6QH
         jTpV2Fh2WsUyqDmjLNU+VUx1dS841YhR5PqQZdu+lG/hkTIrzL+b8fL3e1k/n/M3EcWh
         DRBg==
X-Gm-Message-State: AOAM533vAuKd6wMIZ+N42NijE/hzpa/23eRo3uGUQYlCcf/NxgJx/kA9
        TMCTQmofxgFsu0xP6AtYF82Zohkn+ILOuWGYEK50uA==
X-Google-Smtp-Source: ABdhPJyYDXBEABM+ZMXi1dpuXIBZ6wsLpvjkTRRh4YyhYrRftimgUINWny+L2YfAziSbR/6/cYnnkFB4d9ujQ/51so4=
X-Received: by 2002:a05:6e02:671:: with SMTP id l17mr11894813ilt.267.1621603276872;
 Fri, 21 May 2021 06:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-3-robert.marko@sartura.hr> <10b67a4dce693f013eccfd6f46ecb4c4@walle.cc>
In-Reply-To: <10b67a4dce693f013eccfd6f46ecb4c4@walle.cc>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 21 May 2021 15:21:06 +0200
Message-ID: <CA+HBbNHikM_8sCrc9FM-z7nUXVLwjpZ=Lg7fKWGbgWGBrfciOg@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Michael Walle <michael@walle.cc>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 6, 2021 at 6:38 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-04-30 14:35, schrieb Robert Marko:
> > Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
> >
> > It is a mix of input only and output only pins.
> >
> > Since there is no logical GPIO numbering arbitrary one is used
> > along dt-bindings to make it humanly readable.
>
> Can gpio/gpio-regmap.c be used here? See gpio/gpio-sl28cpld.c
> for an example.

I suppose it can be used, I need to look into it more to see how could
translation to register and mask be done with it.

I have adapted the driver to work with simple I2C MFD so far.

It still leaves me with a finding the logical way to number the GPIO-s.

Robert
>
> -michael



--
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
