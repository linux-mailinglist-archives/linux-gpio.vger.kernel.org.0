Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3808E22C255
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 11:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgGXJd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 05:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbgGXJd3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 05:33:29 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFBEC0619D3;
        Fri, 24 Jul 2020 02:33:28 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id x9so6707093ila.3;
        Fri, 24 Jul 2020 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcMfOD5MtvQGZ9E5B9qN3UgNCKk+57UbGUFWp26wSLo=;
        b=sfbXV0YGF7Fj8DQaTtOkcPreIN8aFQJVDRR1gsFH4WNtfwjVcdnUdpnrdatpjOdrsW
         90ML9UnjorLBH3RqBCKXyfYdM2pJ0vYGb5gRnZOQTqhaITvVasa/cS29Hes64qc2oimX
         evub1Brrluk8G9qQQWhVFZA8Fto5scFdeJq76SxEqkTt1NAI/RAlYNDuQWZTL3jB+Umh
         6x1Q4LNKQN2KYUUIS9vubVwf8t4IvFgGQn+IIyKuu+OryMBc1TrM7eoBCNZoqaQiBMMJ
         xVhig/MmqoVTJLbsxz5rm2J9XXWL6EvEvpHZdc1moy7QpnR8vRaYMeQiGpnv3D3vKVrx
         PUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcMfOD5MtvQGZ9E5B9qN3UgNCKk+57UbGUFWp26wSLo=;
        b=BgOAKWgl1RFEg1WpTVRAo0IwQKwfLwBEBY02zsOD9vbPj5HlCa7Md4MEOeYJ0yxAG0
         QG9Eve99zKbKAy8pQaUEvQ+36ZEPNmbbp1vY5I97DRF8uH6Wad4iZznnUZ2Eoke6j3Rb
         qDxJRmTmzfZ0rF24VpvNeT8eePAsYfToq/bATsrUSI4yuiRTYcDzHkdEtyfZszjCqXQB
         Qqaf1VQCCPItnpsjgbuZExImOEGxfzhRSxtbsN9QwMsJ3MlGj33zNge+urlCAq3Wspgp
         noQJEBUi2z80dhWG5/2XfrcP1MT0WPjcFF9X6HZgHgJ9kbS2hJ0BzuHOXG3etXbLarkV
         hi6g==
X-Gm-Message-State: AOAM5335Z2fuCqhMUqDkhN+7zBi02Y57cmCEeaYj/JyRSOpo2l+o2m53
        QxUS0pc9w1/QnCo/VZC0e+4KnggNjo4EiWinWqo=
X-Google-Smtp-Source: ABdhPJxY69gmaaAzmvW7k7FjyJK3JnEKWbEmfx7jf1Swstl6CZYMROOBsb3ssppnerABun9HLrKhuTxDzsiYLJndR1c=
X-Received: by 2002:a05:6e02:8e3:: with SMTP id n3mr9849554ilt.259.1595583208221;
 Fri, 24 Jul 2020 02:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com> <1595513168-11965-4-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1595513168-11965-4-git-send-email-srinivas.neeli@xilinx.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Fri, 24 Jul 2020 15:03:16 +0530
Message-ID: <CAKfKVtFLZNwe7xRQipanE3M2vjLPvrh2uNpawbGHMrtXmYF--w@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] MAINTAINERS: add fragment for xilinx GPIO drivers
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 7:37 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:
>
> Added entry for xilinx GPIO drivers.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
Acked-by: : Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
