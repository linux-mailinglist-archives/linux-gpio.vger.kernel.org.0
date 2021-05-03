Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBFA3715DD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 15:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhECNU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 09:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbhECNU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 09:20:57 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D59AC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 06:20:03 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id h11so4140324pfn.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qRcqgnV5qa3Niit/FwljryAxRK7GQCNeG3/QF1F1aP0=;
        b=uX/nui0DUznFB6QE5hPAu0KNDwwOdjBw7nhiHn9c6rEtk3smTk2Vwwf3PWVuADsJ1C
         jKjM4Pbh8bbVbK64XB25gU26zUTSt1nqSOqnBkTloswkIMetokqQdfv1kCWdtldblZ1C
         rY0yPzveoAYEQ7qJM9CQCGJPzu01SdhxcyysMoMGynzKIDl9NirdhOkg9ycd0MiTUqNh
         wWbbanXZv8oPSKn61AIczo0g3dogCZGBefARpQM1nLyAKxQ0dvzQMmoxoSOlsSzrZdnp
         TWrMd7WY2GQ0xaKiAaqfsjVPsNWDD/2+XYvdERqk5Wq2q2GwPgmOCfYttwU/xArYf/Lp
         /yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qRcqgnV5qa3Niit/FwljryAxRK7GQCNeG3/QF1F1aP0=;
        b=krdoC5ok9aSNeDDWHWD8zwNvVswa6qakga5Yo7hZ50aoY/mysRc1g0CmRlcIv6uVIN
         zeHMrPSrgt2Xm7ZL5EAJVD7xWYydBSbt/LtY9Nvs6SrYrJsOGSvWEECWyhzsoUKwcXNx
         eK4t4JgGCciKrMv0LAgyxG6AzA3PgFgVSGZGu+kJH9fjhSu4rQB82UdS1mAWXRXJB41a
         Jfj8BYPyU+wzAOfRDgSHNnWblAUfLplld7ze7UqrNsqhN1LuGqCUAgMpQ6cs6Ce1PBYi
         Rl441WN73ru9Di9KDCBfOZFIKSaZyrXNaujeUq7x4mUvnw+KolnctNzB/qIySUDPUw+N
         gyzg==
X-Gm-Message-State: AOAM531qoSekNoTgPRHyYp9z7AeWXi5yRxOCrPl9GtfRdjUGNcc+93R6
        MdU2OhTSKJw2YHMza0ePa2j51XIh6z2WSVApBckOucpdMC73PA==
X-Google-Smtp-Source: ABdhPJxWnEmzpp/ZE0bEJNBViXX7p1Oi5RMh37mp4ghvRvh5WwlAfUnqOBGPIZXBBO/TztSaHmCyBhdSsHPHlx6kSkI=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr19304996pff.73.1620048002560; Mon, 03
 May 2021 06:20:02 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 May 2021 16:19:46 +0300
Message-ID: <CAHp75VcV+a1hLyZZH95is187OOZg1oDO9pk=+1xcUJ3Tj9gmrQ@mail.gmail.com>
Subject: gpio_chip::ngpio vs. gpio_dev::ngpio
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

Any shed of light what the difference is (between gpio_chip::ngpio and
gpio_dev::ngpio)?

-- 
With Best Regards,
Andy Shevchenko
