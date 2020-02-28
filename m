Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC00E1741C7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 23:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgB1WF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 17:05:56 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38539 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgB1WFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:05:55 -0500
Received: by mail-lf1-f67.google.com with SMTP id w22so2204714lfk.5
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8LpeFRkJkAVGCGFA7ZkDQ8EDfylVrvQYhKNrzB5Agw=;
        b=ojCXi//c/Oh73F5Il6IazTwlBEsFoNfw47/YGyUECYl4dvUC6WgxSI3iyIlBLbz3mZ
         OSWB0BXF+JhGvD/zk+/GTAVNuJymMfHWiE5Sv3OzrtLzD8wvItVwx6Rc09jJQNdTPYzX
         r+nTnXjxGnxb2Xi53R4UsUcTjKMg0E5gsaEkeqNNdoLNPTlR4pZw9KtGmo/qhkaQZY0q
         Ebc8ul2qrGS9XuhqUFeb5gUHcchMPES2yWxB5pCRDT3o5006DzOBQ6kNkjHlHYrGFg3y
         /wC1+1VRU56iKegko8xSykYkKhnvdO+/IIHG94etItcj9WvTOxgl9cgYOkx6IiaBsY6G
         TagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8LpeFRkJkAVGCGFA7ZkDQ8EDfylVrvQYhKNrzB5Agw=;
        b=KvHQMfD5RkZbnEM3Qaqy2+AoqRd8hiye/eEyYMDiGRM2ExNogZE6By0H30gWKnM0vH
         MCxY+Xb5TMvXAOeYtgNB3+aohdNiuhmAi3hawMgnWbrWQNWbgLCgodetVa6JPH2G742Y
         E27HP5JXeKlDX/JtMLv+wGXg3GihuMxMFpoz2x0rM9owD/ZPuOgkiFJVNAS9ISAfc1kJ
         lnO5tWtIl2RgYCfB3ii+gIIIos5apREBRvOk2+NA9+zcsON9MNJ/FJEnlDNDNU4j0lgb
         ODWwr3aweAb/7HAAVgPjdyKfqB4i0NRGe995u/Ud7z+2oc3EhBCcz55zhw6gK69NGYLq
         xwag==
X-Gm-Message-State: ANhLgQ35FMlz+t33xrExHDHwbLNbAP6rmg7MJ8MLeD73hTiLfnUn7U9w
        CqU05QFy9fU12e5pMrkw4+cxk5kStxHbnRm62oy3yA==
X-Google-Smtp-Source: ADFU+vsnW+F7X3gpdEz8AQTDqD1Tj7f66W9FTRZOnyRHh9OXBDCJ69RY3C5fHJ4DyNMTzylusEt2hk5oPHgCphc0DMY=
X-Received: by 2002:a19:87:: with SMTP id 129mr3655815lfa.217.1582927553833;
 Fri, 28 Feb 2020 14:05:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582913973.git.hns@goldelico.com> <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
In-Reply-To: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:05:42 +0100
Message-ID: <CACRpkdYSde=6JBBbe3sL3hDHhGAeOfwadT0BvL0n+-F0O2vX0g@mail.gmail.com>
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> From: Paul Boddie <paul@boddie.org.uk>
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

This looks good, can I just apply this to the pinctrl tree?

Yours,
Linus Walleij
