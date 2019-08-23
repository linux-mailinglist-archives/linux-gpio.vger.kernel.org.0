Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279729A8FF
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733104AbfHWHhp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:37:45 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43658 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732839AbfHWHhp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:37:45 -0400
Received: by mail-lj1-f193.google.com with SMTP id h15so7934327ljg.10
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZZWCM1NaKkWZfHYdamHWGDCsp0daigJ/P9DBMZ7/h0o=;
        b=gnV+a8SbxnF8E7z2Tj14yFsvjUuIGqSsViiLQ/zAYEOipY0vHqYoB2FX2Q9pBj7Byn
         a8uth2qvzy+VzbI5mKAiM0vjBaR9exB16/ASG5Ddhfv8myEUUBaV67NAcnESCw6XGEYK
         oFsRP3hNBTbtXU7DMZdHowrtfY6DkD9y27XIUoOGoQbKnSVxe0iRViKWToVDqVCiNSrD
         1EC2EsLbxekU9X1hKemCBp9Upb3BVVc6Fa5SwH7ARexZmFgondpi+/1u8PgmTannFBIy
         LDqliBZWjE2ewubCbfQmU9vE2GMbIRij4CGeVQ544MW/Zc5SZtl2+01ffnjVd/XT4foa
         kamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZZWCM1NaKkWZfHYdamHWGDCsp0daigJ/P9DBMZ7/h0o=;
        b=ikUGpXAl2NQRlKezSfavoPw7eCXRbBZTDEQr9PIYA1t8otUurOylP2M4D40F9yortY
         jrb+UwxnIYH4d+gnX5IP6WD8IVk53lt9kSKvYDyb7eKwt9uk7XLqJY4WfVsmumME0969
         xt+d8NPiTpXpqU7gpsSeT+SNXPKga3cf+VLwYcmXxaWDje7V3CrdTGC+feG2ndRH+kdr
         bXHh2wp/4TaGKUvkSgmjO84PKYsjW1vutfiiDcJ8e18yAtv4n3TLG5D7HzBLL0tAxyk5
         gBZkqlUyv6DGIUEYwaOvEcx1SxDTBYaZOz02kqdn+L01pF0wARZpZ5OXtgztcnLc2kZR
         38ZQ==
X-Gm-Message-State: APjAAAVvCgOM3BS/FixSva3McF7leL0b/VdLm5Zj5DlIgrL1Qqlgcscq
        aqx49MjGQuCF/i/Wy1/FrExAxFg1OCcS68s1nMuwVQ==
X-Google-Smtp-Source: APXvYqwoTIF/Emnt9eBfMVVaR3D0yZcfntQldBQ8nXDMcgI62M2HujpKdWtwI9F1v3Vnmg1r5+YyulnqcRsz+8EBjBU=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr1930950ljg.62.1566545863148;
 Fri, 23 Aug 2019 00:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190808101628.36782-1-hui.song_1@nxp.com>
In-Reply-To: <20190808101628.36782-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:37:31 +0200
Message-ID: <CACRpkdbYEHQ=sYohxEC99T41qUBHYgBCYjM3MaAnD9PmY4YCyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: mpc8xxx: add ls1088a platform gpio node DT
 binding description
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 12:26 PM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> ls1088a and ls1028a platform share common gpio node.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied with Rob's ACK!

Yours,
Linus Walleij
