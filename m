Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A8DD3969
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 08:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfJKG02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 02:26:28 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:35163 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfJKG02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 02:26:28 -0400
Received: by mail-ot1-f44.google.com with SMTP id z6so7048775otb.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vw7BQuVKMFNW+WZRGVeOg66Ujh8gaZY0nxSgYDeiHds=;
        b=hG+Q2fTjNOpi8mXmKWydbNlkNGuJy+qnfn21eOL2rEabgZ3lelDs9vTPbZdAZbvaYY
         jq4bj/EADluMEI3zLRQZFF5iHf+6WhwOTbeQB/Lt6xqJFKjA0H/RnTshIp3BBASvJyJu
         jcyOwQO1Uf50vJjMFb5vsBDOxUzz0KhCKDJOyvx9pKDhsGrIfCGy7s7ITtdjVsV0GRu1
         Kr5HZ6+GFZ9vPJBTA5FPxcp4W7jmWGlPc+2BKgipRofRs7gix7rKkWLDuCY0IDbs+geZ
         81XAAMbU1kEkG41u/l9CM/EVRpEScCF5Ajie3g+Ku6TLXoguzWKJ+0krHOfBzhiiC2WW
         ojig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vw7BQuVKMFNW+WZRGVeOg66Ujh8gaZY0nxSgYDeiHds=;
        b=FXIzB9UhfTpcj9SbcIujhh+812PKw7IhPatLy6AbqWfPovskNIkkLLscp/xI+Zc057
         /8yU91RYCwp/fAvGSliJt0SiW9J/2pAldvMGE5Hk8xlyrOKmZIoO9HdKKSOLAobwpVbd
         gNpr71M7SCwk11oeYfryomiGS6MkSGmlQK1a64IhAViiR+B/wdM9vTVXbxgw3nooiDAZ
         ARCGAzWVUijo5fF49qg+zfHrO5HBgE6zZZeLm0n/mRmX/3PeojB7ulEhL+voPVdn5UkZ
         Otmk/zPwIXR2NQQKy4CGtKK79QJBThY/ooelFSF7Ys45dkYLslJCxYTDY5LWrhZGGjO2
         GoGg==
X-Gm-Message-State: APjAAAU2STNWzD2FjJq+CyKFmBeju14wydoceitAabgWWt3oqoc+kBav
        0Q169/jXa7TniEL8fS/ziWU65Inrd3/la8UQYoqTX0l6ew0=
X-Google-Smtp-Source: APXvYqw04feU/cZeDgBUg/dMf3LmD2uluLdlj8lPDu04rvtSDsp/Rm3HQkyav1a9oQQ7RjXGQwGODOygEkhOIt4rr+g=
X-Received: by 2002:a9d:7cda:: with SMTP id r26mr11472308otn.290.1570775187296;
 Thu, 10 Oct 2019 23:26:27 -0700 (PDT)
MIME-Version: 1.0
From:   Jay Aurabind <jay.aurabind@gmail.com>
Date:   Fri, 11 Oct 2019 11:56:15 +0530
Message-ID: <CAOsEZohCedO1d+-oQkGnxpZm6kJnBCRgGPswRKGOxkx41yCxiA@mail.gmail.com>
Subject: GPIO controller driver pull up/down without pinctrl
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Quoting "Documentation/devicetree/bindings/gpio/gpio.txt":

         Optional standard bitfield specifiers for the last cell:

         [snip]

         This setting only applies to hardware with a simple on/off
         control for pull-up configuration. If the hardware has more
         elaborate pull-up configuration, it should be represented
         using a pin control binding.

So if I do not want a separate pinctrl driver, how can I do the
necessary pull up/down setup in the gpio controller driver? I could
not find any drivers using the simple interface. Is this facility
available?

-- 

Thanks and Regards,
Jay
