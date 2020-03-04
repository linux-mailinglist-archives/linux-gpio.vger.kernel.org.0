Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9680817922F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 15:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbgCDOUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 09:20:46 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:40469 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbgCDOUq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2020 09:20:46 -0500
Received: by mail-qv1-f65.google.com with SMTP id ea1so835883qvb.7
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2020 06:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i+y/kPMT8bVvrx4fXB/kL/rmkuWZJIQeJMw7GyPIJT0=;
        b=IEfR2bADw8lBvqOToIzYhPXCCPQnjTGxV9itWmAmDGi0+jRUnjOlztVEYh5f2i+sMA
         4Iv8m3Ki6B7bk/uT65rAl34ttdReFvUgCAHwH1qLn/ivTJxa5dNE5d6MGcUi+chM5di/
         jRCFVpQRt8b1ae/N6unuM7+vHAki9g2uKZRctK5ZEJe/B0DGm8xTqP0pRcrOk20usUo4
         +4W3nMoisQGALVLayZ0Hpb69QgYHMx0Yl2cGjTMoliONZJUpu5PidD3HFUUFitbZ7qWj
         VstRWl+2DqoxiMqE1Tt688S1/1+HBCCRaHWgOxdL/SpI2hepShe7FJCwyTQD/dwjaOSa
         IX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i+y/kPMT8bVvrx4fXB/kL/rmkuWZJIQeJMw7GyPIJT0=;
        b=XS/JFMwxzWRUtFJe5/Aq8nsDt4J/sBGYi6n9Jg9FGosbXOYzvcYeV9IHO2+9+6GRwn
         yWd4YO31fce9wLW4Ht1TZ0yp2EpDCf8zuLdesRfXPohu5GapQl9sY30I0oL0/EhwjIiQ
         rRbvayEIsRJtmYt8CnWHCKvfpkohO+sbqwm3RL0WDoodWISovguvwShcy96SVFaLrAAK
         FzFViUkdszV5d2JYgGGf8qcPCUh1BLIglgxwwbjAPKl4n0Zh0cRjQCai1wxlY3T1MyBt
         N+jcqdoQxj2b2nMOt21QE9yGVIUnf6sJjFflj1s61gMfJuC2W8QYV/bwIxSCc1gVYEuC
         NZMw==
X-Gm-Message-State: ANhLgQ3s5i+WRxn6+aO51yHgUDS0ILFbEAPR+8/Xbe2gkxxLb3mKoul9
        ilsNvXipHfns3VJwwqAQ6AuDDXeuVwzbPNP1WMeP8w==
X-Google-Smtp-Source: ADFU+vvFWgi4t6KeCmj3sctTCapMYf1XocPqqoU7xw1lccJfATRkseBw6vBz8PTsAQUZ0XrUe1UHfJiewsa9Qdq/M+4=
X-Received: by 2002:ad4:4e4a:: with SMTP id eb10mr2208184qvb.96.1583331643738;
 Wed, 04 Mar 2020 06:20:43 -0800 (PST)
MIME-Version: 1.0
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
 <9ee92407b467fd0b482a680bcce447f907df2278.1583250595.git.mchehab+huawei@kernel.org>
In-Reply-To: <9ee92407b467fd0b482a680bcce447f907df2278.1583250595.git.mchehab+huawei@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Mar 2020 15:20:32 +0100
Message-ID: <CAMpxmJV=+02F5SDQhDK2p8ZuZrRCgHDJh0y_bXBKYXjfFN-pVw@mail.gmail.com>
Subject: Re: [PATCH 5/9] docs: gpio: driver.rst: don't mark literal blocks twice
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 3 mar 2020 o 16:50 Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> napisa=C5=82(a):
>
> Two literal blocks there are marked with both "::" and
>
>         .. code-block:: c
>
> This causes Sphinx (2.4.1) to do the wrong thing, causing
> lots of warnings:
>
>     Documentation/driver-api/gpio/driver.rst:425: WARNING: Unexpected ind=
entation.
>     Documentation/driver-api/gpio/driver.rst:423: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:427: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:433: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:446: WARNING: Unexpected ind=
entation.
>     Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:447: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:449: WARNING: Definition lis=
t ends without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:462: WARNING: Unexpected ind=
entation.
>     Documentation/driver-api/gpio/driver.rst:460: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:462: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:465: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:471: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:478: WARNING: Inline emphasi=
s start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Patch applied. Thanks!

Bart
