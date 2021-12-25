Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D9C47F455
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Dec 2021 20:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhLYT0V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 14:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbhLYT0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Dec 2021 14:26:21 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158E6C061401
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 11:26:21 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id d201so8455046ybc.7
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 11:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=BKg+9vAejA2Ct26Kbi9NE7+VUa+BlHarruky9ShakkM=;
        b=UrD6bpXSB4bHFfu3jWjncYL/0Rhn1OkovtOUeQ43sE79nmI3OoUnXw4e4W1HL6KY/A
         yLuqFBRyY9eUdB9sukB9YzUU/BD5aNbGjfwRF/WSjt1mcexFcYe2HUVokm3ZuJ+9TE+r
         MXNJtkJ5ZpKfPEj4/k3XUeSvpsurTnoiBghzoes2FQ2GqiH4ddjXE/rg+mHyllpJH//2
         SZ5j5xf+lkSw0qoR5lGu2Ux+UcI4XoKNl7Z8ShVeDn3HH3+0Ja0sMU2pwzSXAWNnTpUh
         bEvS0IUXF8MrlpmqMfJBtZcO+AgcUqKhEO2TLWr024+nw6HLqw+Syw56tJDZMkyBkdIl
         xCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=BKg+9vAejA2Ct26Kbi9NE7+VUa+BlHarruky9ShakkM=;
        b=hUPHfXoHGn0csM2nj4N/tG2SnhM2tWF6nGQzWIjzIDvb7vhwsVPu9oh+qP+zEPZ7fH
         Hx3KzVKFvZATlscGzxByzx0P5KbINpJpU40HsyGYxFebhFsd9Y0z4kPSPL35YHm2FS17
         VilGNl6G2aWxZ97C2JrJpJQn1E9I3Qj3Mnd/osVQSBkQYXSvXNCueubh7e8hp6dtQ9dr
         2VqGIPPvANkv3Y1miOWa89TvYZuLG0G4hxX4LMnfgn7+JeD3d3jCNcRfiezjSPXxSh0K
         Z1Cl2sqWUW+d4uTi1cy92cNGnlUA13YqHK8ntTNodxNEpkrlsRS8OpSCQaXUM+6IDpz8
         xrZw==
X-Gm-Message-State: AOAM532q79mkPe8b1IoNHGfV7mR/amdBEZm4262qFDjK64wbgeZAQlco
        1LD63fYkLK3PKBcq2mSlREdUNHxWJeA8bvDTgftT0RswSi4mKR2R
X-Google-Smtp-Source: ABdhPJxECBdOVl0LqF9LjL0DNdhMYzSngvU4pg/GGY3dKYuFX2bGgu4Rm0sH3k+FLIPSW6SDEXpMaWDnHaZjcsEVU3U=
X-Received: by 2002:a25:380b:: with SMTP id f11mr14950148yba.49.1640460380020;
 Sat, 25 Dec 2021 11:26:20 -0800 (PST)
MIME-Version: 1.0
From:   Ashayam Gupta <ashayamg@gmail.com>
Date:   Sun, 26 Dec 2021 00:56:09 +0530
Message-ID: <CAOgBvpkPOaKdwi-eWR2WAzJxQpOqAZWijKKs2twAZ9dUQ+ibgg@mail.gmail.com>
Subject: [libgpiod] Issue in gpioset (Tag v1.6.3)
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,
I have used the v1.6.3 Tag from the website
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/?h=v1.6.3,
for doing a simple testing on the breadboard(Hobby Project).
The source code has been compiled with these flags: ./autogen.sh
--enable-tools=yes --prefix=/home/pi/gpio/install
--enable-bindings-cxx.
I am facing the below mentioned issue with this build.

Issue:
Command used: ./gpioset --mode=time --sec=1 pinctrl-bcm2711 27=1
As per my understanding, after 1 sec the pin @27 should switch to 0 ,
but the LED keeps glowing even after the command is complete and later
on when I run the
./gpioget gpiochip0 27, the LED switches off  and the value printed is 0.
Is this supposed to be the desired behavior for the above set command,
or it is supposed to EXIT on default after the mentioned time limit.

Setup:
A simple LED connected using a resistor with GPIO @27 for output pin,
and a GND pin used.

Please let me know if some more information is needed, or if there is
some help I can provide in testing the library further with my small
setup, also kindly let me know if my format for filling issue/bugs is
not correct, and in case it needs to be posted elsewhere.

Thanks
Ashayam Gupta
