Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F682D953F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgLNJ1e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 14 Dec 2020 04:27:34 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33302 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgLNJ10 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:27:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id l11so28424489lfg.0;
        Mon, 14 Dec 2020 01:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jo/1+FyF+IsssW4QTtp7VT7/1NWdibvPFQ9XrhExF8Q=;
        b=EIQFkoMlAwqzxgVCMHCJRMYpOs+eNEArjJyDPOfeyNoQlyrqX1hFDcc40c1g18XWcJ
         7T9qVgyaBRibf38ie7LeIK8r4KQjHJD4XYuATJvLL08UEgbQoqFwA71YV5hi5DEupkND
         PSbd1PBG1MkopkOXULersDScbCs1ROeA+k1xSfi3iXhHRtDrztH+khVtpkyXy1Cz6kDA
         yst01+hcDXyTZuYf9bg7sMceWRURLVqmbgDuHvKER/vPgxNqBNNts/fhHgYgOkzR7Uk8
         WycOShHi4NRYsYjaR26fXZOY7dR1gbPXR5VUgCQga2dmZwHVNNkp1c2lO4DLd/N00zuK
         e9ZA==
X-Gm-Message-State: AOAM533O3tQ4STwH0QoRpaWbbFNEkGwAbWY7h7l+JTYGogoGxb9Vo4gp
        2/cGVzc3HcKMiKKUA9lsEFZaI8IW8RN63w==
X-Google-Smtp-Source: ABdhPJwhCq7dLa/57hd23oCtY9WoqeiiPRGrS7IB7zA9wbypY1uS1GMwwCSIqJuRwxyhq7PRgw34Gg==
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr10152363ljp.35.1607938003377;
        Mon, 14 Dec 2020 01:26:43 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id f2sm2249967ljc.118.2020.12.14.01.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 01:26:42 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id x20so8852902lfe.12;
        Mon, 14 Dec 2020 01:26:42 -0800 (PST)
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr9929044ljc.282.1607938002616;
 Mon, 14 Dec 2020 01:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20201202135409.13683-1-andre.przywara@arm.com>
 <20201202135409.13683-3-andre.przywara@arm.com> <70df5b048c81485053df91a3e53dc840487677e3.camel@aosc.io>
In-Reply-To: <70df5b048c81485053df91a3e53dc840487677e3.camel@aosc.io>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 14 Dec 2020 17:26:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v65N9nn52tpgH3Jr_ndYO515bggvg+a3ON6ji12oZ-nX8Q@mail.gmail.com>
Message-ID: <CAGb2v65N9nn52tpgH3Jr_ndYO515bggvg+a3ON6ji12oZ-nX8Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: sunxi: Add support for the Allwinner H616
 pin controller
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 12:28 AM Icenowy Zheng <icenowy@aosc.io> wrote:
>
> 在 2020-12-02星期三的 13:54 +0000，Andre Przywara写道：
> > Port A is used for an internal connection to some analogue circuitry
> > which looks like an AC200 IP (as in the H6), though this is not
> > mentioned in the manual.
>
> When developing for V831, I found that PIO controller in H616 (and
> V831) has the functionality of selecting IO voltage of PF bank (needed
> to handle UHS-I).
>
> How should we model this in PIO driver?

I suppose we could expose it as a regulator for the mmc node to consume
as its vqmmc-supply?

ChenYu
