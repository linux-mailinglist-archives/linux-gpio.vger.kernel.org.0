Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970A82AD77F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbgKJN3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJN3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:29:44 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524D6C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:29:44 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id ay21so12714917edb.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Hjhyv1ODznxDZvv28mX53Q346Z2MPzaR8QZjz1eM74=;
        b=RXTSd0/eCptvcrfUbup7Lapd8x3eal4iaa+J2U0xlucffy89rj3SSCYfnyjSyb8e2i
         CkSmIgJg9ju8dt1ewBIdryqzQ4VtFwQhjvIHm+tmTPp/G4Tiua7hh8/LTCtlsMda+wAN
         SYEXl8GfDf0zlphnGMRgdmEA0C1ZDrRT+xQYy1xg1S2Urfhpkng1ypmZfO3aMR5XgI8T
         +Rhdn+AsPocyefwnW1Yzo7r8SVxS+vwdBL+rZvOT39wTqAyYTPqoI0DV1QAjQetUhl5C
         osoMPoFQe2e/s78tlNjwsUE3axo4SycH8zi82y8n89btzbo/+igN3Q+HHK0A18EwivFm
         xR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Hjhyv1ODznxDZvv28mX53Q346Z2MPzaR8QZjz1eM74=;
        b=i2rIjvtKx4SW2M8P7F3jVkFmpXwmieXCyl8qmkJ53533uL8BXWEZGKOY2zINston0I
         YzvN9s5/3/GZvM/J3HuEquX2Ljfya8AUkAc5mXJCNNoag2rUvPCfv4EdDnFzLf6LDm5I
         GZ4r0hA6m2llv4iAUekuct8aqGHBWfb1LG874feJTc7roJuvSPYMb+s3ps4edKs0Ng1F
         H0Z7O1FqExzaJb5/WIqICshWp/Tp/ZBlowXvzIpswlidOx/SX22rpCW9ba8hshZFsoXA
         WJr+ffc9hwIHFgRl3MG+q0zD5mE+tiQnQlPoSdlzvL9K4M73vYMZbWclKuQGmpkPEM+x
         0mzw==
X-Gm-Message-State: AOAM530R/BqKBgW2N5WOihcSMMisUCRbhzCyG/l23FdqQ/wBtRrLCcp9
        ivpzZsTxbjuX7Ngha/zW/hNxg+l48YflNgN0rHm1i4mLGq0=
X-Google-Smtp-Source: ABdhPJza93kzi5WELzMnY5jGFPnf1t9Ayc9HbuIqoLYEuFOVCRq9VhbWCOcWeIF9M/AGiFzn3mC1EDZSfIEnHErTa7U=
X-Received: by 2002:a05:6402:283:: with SMTP id l3mr21680277edv.232.1605014983110;
 Tue, 10 Nov 2020 05:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20201110123406.3261-1-brgl@bgdev.pl> <20201110123406.3261-7-brgl@bgdev.pl>
 <7f890933-71a7-28d5-75ae-8d80d6a67ff5@siemens.com>
In-Reply-To: <7f890933-71a7-28d5-75ae-8d80d6a67ff5@siemens.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 10 Nov 2020 14:29:32 +0100
Message-ID: <CAMpxmJXiuuRu0A=GPaqBg=YbW=nQX4WrBm9e-3SOkFuaT0rEFw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 2:23 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
>
> Unfortunately, this one still crashes:
>

Just to confirm: does patch 5/7 alone work?

Bartosz
