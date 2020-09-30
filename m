Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C2B27E40E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3Irb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3Irb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:47:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B4BC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:47:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 77so1182666lfj.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cr4F0zeDS/obqT3hxezbEXoAuNHnHKvlXLl42w4NaIs=;
        b=uvnIFiV7FZ+zzxcN3L+fCOcCWuTR9m5Qa6z3OabpBiheRDK7oh62P0AGiTJ6XmPIb/
         LbyEdCxFU83nObD/1diqJRWJlStu0Z5jC8YKKXrNm/btn67XGWCMhOkviYDGeFTih0lr
         tPMt6Whw+O1h3ZbA2rZ5mimAi8PWwVpQy4ek4HBScVoprn0iLZoVa0t7Netjtmmiil/V
         REimQjACKl1DgKtpQ4Yt7dPbJTE0au96lQDi/QUkdIMgVoR80ZwpE1cTIF8nKW0ss8ix
         AOKNfOOB7C9QqYFsUjoqnadPe2jn4unxwRkIBRv3NkTXHBsNHuJzF4m8hRO5E7+PmYO0
         svaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cr4F0zeDS/obqT3hxezbEXoAuNHnHKvlXLl42w4NaIs=;
        b=fIpCmtDVvNgW/Ng6biGpfrptASycUmCU17f5t18qWp8WxnnTFuQa+vu1yP/huSV2KB
         yupfZwvAjOn2xUgTGevV2ikCefbb8jNh77mwwLn+Gpym7ClQf/wTgnzEf2jGn7fTprxB
         /kz6NE6gGtZ6QgDjA3WMrob2IaFn00bWYepIPrYZ8jGixjMXIFqskhYWo0PpCkgswyNt
         N612g4HSY/UybwNB5lVVA+6fYAHdOQ5uQcp8STfiV7+/sblnAJdsB+Mcc+A/yt9fEkBm
         gOe14E5iriTzez31cqpvj7kFYhTFCgww4pFyjOK+JayAQii0JZS7yVwi3nehuB1JXYt1
         TOig==
X-Gm-Message-State: AOAM5322Pz4nW+excatUDdNovUDef+cKvB9fCyesFaGQ+++OUMRsTPzM
        gYl4Otw/5LKtpZPQJX8arG+xI+gYBzxvGv5KvKsFiw==
X-Google-Smtp-Source: ABdhPJxOpTPzyw1+Tet95je7SIFAGeXemd7JxYndbFKN8UuWccBXA0YLrbqMLAAR6lN3f0fEFaZho/Y4cHjNa8sCDj0=
X-Received: by 2002:a05:6512:20c3:: with SMTP id u3mr473893lfr.572.1601455649061;
 Wed, 30 Sep 2020 01:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com> <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
In-Reply-To: <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 10:47:17 +0200
Message-ID: <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To:     Sean Wang <sean.wang@kernel.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>, hsinyi@chromium.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:

> v2 seems the same with v1 or I was missing something.
>
> I just thought we call devm_ioremap_release to explicitly to free
> resource when a certain failure occurs after
> devm_ioremap_resource?

What is the semantics around mtk_build_eint()?

If it is called on the probe path no explicit free:ing is
necessary: anytime probe() exits with an error code,
any devm* resources will be free:ed.

Yours,
Linus Walleij
