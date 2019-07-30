Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6DA7A63F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 12:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbfG3KuJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 06:50:09 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:41996 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfG3KuJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 06:50:09 -0400
Received: by mail-lf1-f44.google.com with SMTP id s19so44367895lfb.9
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=F31cQ0ne3p3xFuaSlxROjZYeTvKp+9tCo1IZnDyB5kc=;
        b=HRkCSNByu31f39s+lOU22nTucb6QbcbWxwwj2ZbJu2tlOmUkF6O1+iJIl6/diz7cjg
         VJ144Pqm1gbPTn1+ZPtAKLEjE7uhacH6kI7XZaj5nsEooGsiyEsFUT2qdQqLNRMurpZA
         NGSIC3XDmnQdAJOWMInyzabVKWoeGcS/K3+4nJ7RcucAwhGOpxPVD2pZfD4+1slua4f4
         ZwN9ay3V3Jgh6yIYHl+k6FMe66BVMzDCRsvS7wpUqsXSaswZbsSls5E28EfPSZEO6wcN
         LfzadRc9jB/AVts4r+OUvrgBhohfoKa+tsEuimsamKkhxylbovNJwMwJmdclpDIuTMj0
         lMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=F31cQ0ne3p3xFuaSlxROjZYeTvKp+9tCo1IZnDyB5kc=;
        b=h9gIJmSQ8CUtRcpAkOp6Yt7Wew295Y2UDgYxybgf1TeVfr5UfmJXyw7i3jAo9Xygjl
         NfitLRD5pvoRZhxvkUdVEe7Spjt2QaYKbUsSfO9yzaugIM1M8tQOhB9gY7qcZRFibSZn
         frlLhv6w5A4j9NE0rpAQX2BhfLiFhJ6W9GOQOZWE1opftrxQ2WBeikVIEuqFa3qzLHNI
         VhomlU9Q7MXMYle3Kbhd4Ttb8H/7ImX9RHZGHXsqegrZoTGJW8LLz83nsfDQ1EwBsFuD
         ia39xa4cp1uT8h2lBPx3SFNwvb/zt25eRY/Z0TXv/sRsteg8Mp3XlWQXL1ZqpKzDAzAC
         Wq7w==
X-Gm-Message-State: APjAAAUVz7CXE7CxbfzG/zSdSBdbOi7QJffRqQzAxpHQM65HA2CX9b6I
        tJaVwASo/SWGJ+jaeHZOLrf2NOrsIMLXwBTHHyCb4g==
X-Google-Smtp-Source: APXvYqy3j01W1DiK77paO5P6wAyETN2Q1v+EqaF8qkc9KhP+lBvg1oeHOI1YhDj6KVh1ScwmIbAm5j/jergMRP5DZrE=
X-Received: by 2002:a19:ed0c:: with SMTP id y12mr246679lfy.191.1564483806778;
 Tue, 30 Jul 2019 03:50:06 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 30 Jul 2019 16:19:55 +0530
Message-ID: <CA+G9fYtWFhak1_N1sAJk=HGo+yzYvrU9DDfZRV_3a8C9JUMT0Q@mail.gmail.com>
Subject: linux-next 20190730: undefined reference to `gpiod_get_from_of_node'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        open list <linux-kernel@vger.kernel.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Today's linux next 20190730 build broken for x86_64 and i386.

drivers/gpio/gpiolib-devres.o: In function `devm_gpiod_get_from_of_node':
gpiolib-devres.c:(.text+0x203): undefined reference to `gpiod_get_from_of_node'
Makefile:1063: recipe for target 'vmlinux' failed
make[1]: *** [vmlinux] Error 1

Full build log link,
https://ci.linaro.org/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=intel-corei7-64,label=docker-lkft/574/consoleText

Best regards
Naresh Kamboju
