Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75276228BD0
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 00:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbgGUWHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 18:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgGUWHh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 18:07:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6333AC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 15:07:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s9so306065ljm.11
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncQuNOv53s7g/VQPluEnhkkg4EO/QcmSbgFoZgr2f7M=;
        b=svZk/1VY45PvR/BWbRCblrxdBhafhfxnBZfjt4ogKuqZWEem3whPWt6WC9m8602lTH
         zZ+g27dqHrvWmBFc0HDmup348jVCNnIGVIHNHmNL73DElXYLYh/7btQhwoAxaaDGJcFk
         sgRKzHzYVftL5ftKIvAUT+Ze2cBy3RmNiy1lNFTZ2Api8kNMAVC1GmD81gEO6OZNuIIT
         GhqG54Jx0x/tHrUPVNIQ7cv8KUmUVltnhHJEFPm8kV+xzB9xmKfNIlQbpj8RHoTvRVov
         zmNev78s42doVYWOPTYWNJ4iS+UUZ//mkiHz9vYtOhWonh0Kk9VN9TbgQFc9Hjy1C2Wf
         QABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncQuNOv53s7g/VQPluEnhkkg4EO/QcmSbgFoZgr2f7M=;
        b=I3RVNtRS+SOJ8txoz+PRbnyZG8e15um9ne5nLZlpJLXVR+BqXCM2nrXQ0HJrBusKtA
         +RfXs/KEcay8a2VN8DWdEvocH5XpolgoP7zoPFX0JSQVmvYq6LqdA3hYVFm97w6NAD7d
         BBWIqUsQTc6EtjpF/y9HrQgmDkrrhyaT6iOI9MtkuE5LCqzxENtrvqTq7NLmkism/tEz
         ScL0wA+BFCrcyOlipn8pZEHsDBXuJx+jdfGDOMNH+JKu8b26gcQClKpLFcoUPgn0ltg5
         zOGMdd6CXaCyLn4UyWSUEcuxILDH1MujMK1GBtatpvXK9JRntaE8kRnzUSHRsKnhx8ef
         FVPA==
X-Gm-Message-State: AOAM530rysrI6P9D6WTFB+A4WckRDMjV+C1R4T7smAYaIaIbHZA0nWf3
        nl30NzPR/YhBB7iwLGM6LZXGxKzwqtiyYdzS73cH2w==
X-Google-Smtp-Source: ABdhPJyXq/5sZYNWgoYdbTUtUPKwBo5P4th3aGqM/zCEAsOLTkq+vO7zeHzF0VSbJv4nLw/Dm59N1flYPVFhULJePlU=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr12629129lji.338.1595369255870;
 Tue, 21 Jul 2020 15:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200717194043.1774643-1-drew@beagleboard.org>
 <f27995fd-5885-9dbf-c42e-73dbe69fcfab@embeddedor.com> <20200721100221.GA1982085@x1>
In-Reply-To: <20200721100221.GA1982085@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Jul 2020 00:07:23 +0200
Message-ID: <CACRpkdZZjy1+BjYXe4MYCfFpHf09HGY__CUkUiNokEAS-Dk-FQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: omap: handle pin config bias flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 12:02 PM Drew Fustini <drew@beagleboard.org> wrote:

> Linus - should I submit a patch?

Yeps, normally always submit a patch to fix something that is applied
already.

Yours,
Linus Walleij
