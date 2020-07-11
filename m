Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC4321C65A
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 23:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgGKVMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 17:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgGKVMv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 17:12:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F7BC08E6DC
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:12:51 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so10386977ljl.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HgHuk3yasiCaHOFp70C3S20yfZ/46i84UF/qS9vnKcc=;
        b=phqDGApFNUiMib/i5ixNCjfscEjoGG9dm6nGYkkuK89crua9hH+Tw7oPeffJC7QngU
         RONlsfsM4KQjjbP4mPDj9QElR/qCsD9yv/qaQpjBCA6/oyONnMwuRKN7BB4cC0vhIiwY
         kyAqCwFYD67vTukOgwi4SAOOJ3y4bWgX75+0NHKHaTOzQU1EfVepNIPR9OmInGdCueXn
         tgKw5T5UbQ3RnhfyKVS6CypNrb7d2z6WvMAaa21KH/66WCySXG/dPzbDMW17AY9luj2q
         ttE93UdvI29dJLsLDydAdDP/Ugx2PXg9S+F1Ay5326VSHypR6iQ4rRYxyLTwY7LgiIuE
         ug/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HgHuk3yasiCaHOFp70C3S20yfZ/46i84UF/qS9vnKcc=;
        b=BMO8e+BmNAMINPM+R3iykmF4m2bbPRNH1yfsZaVeRyRgs9TkMujLH1iOLl2dZLsSMG
         kdJnd5HXG/+W+5TULmV95EVbot5E1psIAVHMIOydjjlqSb8v8QwEL1l6Mycc9WwV2v8a
         NfYJiskmHqBuRfXU2S5PIgRZB0h3srn/ICsT2flz3gVcFRzK2yWBnpwkLkZTMaRSVcdP
         LVyB64yG74c/sDgqOatEZp8PbEv2LVMASl2BecpdZt+1e+s4m632xt4wLdIy3tanalXV
         4XcTGqVSmQ7nmj0+2aDZoHZUeOoGL7qHokW1r/RCIBRGxl3UauW39hYLiy64D3xTSg9K
         23BQ==
X-Gm-Message-State: AOAM530nO4RHhGIGNHkue+Qx1PJuwIetWLXgkWjgtdVMH/ZVaUybO+YW
        M+CKRNBPjRWWWNl1WBaTOa7+/lhv2uFLVXIgcDFKmQ==
X-Google-Smtp-Source: ABdhPJxfLX8yHShpQtjGOPNlAosmEBIPTvGmPBymA5g4mnnwVTGmE0j69am4R1NGfe/2Nhmcd1M6BuIbcIw3m1Dxgdc=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr27868119ljc.104.1594501970063;
 Sat, 11 Jul 2020 14:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org> <CACRpkdY3mUjczkJhV9BdZhUJGOgrbOMJnciBjOaPg6c9XUt8Ww@mail.gmail.com>
 <CAEf4M_ArGSpN5-7_zt6mQaWm8XkqTcQiOnCbs3_obCipDC1KNA@mail.gmail.com>
In-Reply-To: <CAEf4M_ArGSpN5-7_zt6mQaWm8XkqTcQiOnCbs3_obCipDC1KNA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 23:12:39 +0200
Message-ID: <CACRpkdZRnS=xt6FKy6pSUQ+itkxoimAAKBc+=kupTXpEGg+b8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 1:02 PM Drew Fustini <pdp7pdp7@gmail.com> wrote:

> Which repo/branch is the best for me to use if I am going to be
> posting any further dts patches?

Mine, pinctrl devel branch during this (v5.9) cycle I suppose.

Yours,
Linus Walleij
