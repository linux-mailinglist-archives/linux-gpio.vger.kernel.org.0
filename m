Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250B43A0F83
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 11:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbhFIJVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 05:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237961AbhFIJVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 05:21:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315A1C061574
        for <linux-gpio@vger.kernel.org>; Wed,  9 Jun 2021 02:19:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id r16so599692ljc.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2VfAdxpLFSH2lKBrvUpwO3xN3M0sVoWmcLtknql0Nk=;
        b=GkH2boXUs4nV7pBNeoqE9Jw4OjjFDzM1XubJq0jrQJU6aEc2x/USoEPuI016SjJ/Nw
         6Cu1R0eYwGewSVwx/6AJ90lF+PsE8LXM7S5Z+/P/AlS3TZL+/yBmkkItbHS1EGdmEQkS
         oUwpzVaulho1zoLt1Cw3B0SXVZWdSzOzP1uLtM0QXUpgUCAXGxkqUlmaWBtpcA612kgG
         F1vsXlpEbOHvSXKHz0nNGmgN0vg1JnQGJ+tRNmCAIIoxphLHNP7aUf/axk6EbcngoH/1
         6oKbNABh9lJveFpG3XoDp+jEfS5UgZno/3oaiA09N/reROq0VjtTgMDaocKiYrrMPoQf
         6r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2VfAdxpLFSH2lKBrvUpwO3xN3M0sVoWmcLtknql0Nk=;
        b=T41XrQHw1RVRbvl08GL1GbeocmPeHRY+KbeICj/BXHgxg6q6mhFgSL0n4kTwI6BMbh
         y1H2oboRc6/d83Tr0eY66g6kXCrXey4NrrcbtUhhoz8T80IjVg/aHzEtdAGD33Fvl3AG
         bcvPl6U6pO7sijIS85i5W4nwHQ2+M0Hk9avr0Y9kAALSxQ/q99pAIcug7X5spNDBM0oX
         hfASTaD8/ml3gFy6TXF+5sikWA1MJJ9HR0NDkcwwaV1Yje/hvI66aQgmrxw3Wh2X90FY
         dmrjpB46IVPnwOfgNd0lVij1HROhnoMYKATPMFlraa/fnb8e7/mzGikhqs93UzPveLw1
         BBKg==
X-Gm-Message-State: AOAM532060bo3dNzY78ylDrKoOVVDkeBC+MVfyB1CARJPZZ/ygCv8af+
        5NYj18qsy7/NhXV2OOURpE3JC/FlV8/vCHNgbWziKw==
X-Google-Smtp-Source: ABdhPJx+9yId/nH8i7TP64z+S9xoaiGdlcTIUWjloG27YUnksxOAk4gXMrytRJ4tF/cdaFmNp/Y/mw1HRTXJ40b9swk=
X-Received: by 2002:a05:651c:1411:: with SMTP id u17mr11002125lje.438.1623230346495;
 Wed, 09 Jun 2021 02:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 11:18:55 +0200
Message-ID: <CACRpkdamjEmV1n+6iKBt+ocTNB=WHZsZ3PggSy20NrtvK6gZqA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: bcm: Constify static ops structs
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 5, 2021 at 8:59 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:

> Constify a number of pinctrl_ops and pinmux_ops that are never modified
> to allow the compiler to put them in read-only memory.

Patches applied!

Yours,
Linus Walleij
