Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB75F2FA558
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 16:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405768AbhARPcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 10:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405931AbhARPbM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 10:31:12 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E194EC061574
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:30:31 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b10so18618240ljp.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+3sNVgL0LuoHaM861FhWix9OIOn7Lo3T734hNOEQJg=;
        b=wlddnKF8bWJWBfgTbY2Ua0DCsBqNmSBc0R/Qx3WhFGMZ1MqmWxBn3esDX+jVoxn8KU
         VztvLwGOqR0WDrbZLgOwHJanUVP9/LEqsuQbVjBUIR0KDLnY0BI4o4bjNTomvGIVlxDK
         ZuOzbLdeAPpddSwJk+Avwv+9bEZcrrGqq8j9g55UflVz7rwYNqFd5OGwiOPZ/hqC9yPz
         QV++oTwZpT7tBZTsKzFWHWH28okD9G8uTFeAiNLkMdO3IkalcpeJggjNMjaPTMNjxjyL
         HuWNnX1Mn5IkilOKzwvPIyWluUBEWvWD6zqQKPEmBUbgti7rCyqvi4s0mQf4eQ65quko
         uG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+3sNVgL0LuoHaM861FhWix9OIOn7Lo3T734hNOEQJg=;
        b=nxcJr20tSLSdSPZFB9SkFN597DBUtU03LcA8Yw59H4gjkE7T/d1XoxzOQyL8IHBICM
         VU4YrDNrTZBrcKJdskNbi9f98xIBW4+IA+Z5CuDLToDxoe5/Fc0PDr5ma0C+3WOqefvo
         e0wd7v8ZRS/6Enlt08ceKSi4yVksgQOu3OD9OlZDTEpKGSFSRDdjPvyIJ5Qhl2xz1aDN
         LSybU7EXdgRlkdz/gbVXRM4X/tceL1oEpvT6SwoYzo0ngIRzSgQ1iQeSWmr9Ef6Ddjs1
         lgRtHAiUVW+NOAodUChwg8uBbb0OHT1o+KhOo3tju1yVPXo60TXxACEn1dIO6uFrti+f
         IJuw==
X-Gm-Message-State: AOAM531YkvhcUlWGk7teuii/P8JN9qsof1rndWf8SPRwoihRBpl4TyZH
        J8WcOD5m8Cl5LG4MPaomxUvzFhVXCRgTBkc/b+uXZA==
X-Google-Smtp-Source: ABdhPJwXqF9W55z6hD/9ScyJKIW1P3VLZucjIU/Ka22BoeugA3T00Kh5YfHsTXUqFIpasWNRwjSk+yErvM8knUtydb8=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr91088ljj.438.1610983830488;
 Mon, 18 Jan 2021 07:30:30 -0800 (PST)
MIME-Version: 1.0
References: <1610705349-24310-1-git-send-email-abaci-bugfix@linux.alibaba.com> <64a316c8-bc53-69af-8325-2746f6f1827c@broadcom.com>
In-Reply-To: <64a316c8-bc53-69af-8325-2746f6f1827c@broadcom.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 16:29:19 +0100
Message-ID: <CACRpkda9KrKU2PV3qghAqYNPoBtW+pb0K-+8E5BhOcgo9QOuWA@mail.gmail.com>
Subject: Re: [PATCH] drivers/pinctrl/bcm: Simplify bool comparison
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 7:24 PM Ray Jui <ray.jui@broadcom.com> wrote:

> > -             if ((pull_up == false) && (pull_down == false))
> > +             if (!pull_up && !pull_down)
>
> Looks fine as improvement, but I'm curious why there's a warning to
> start with.

There is no semantic difference. This is a purely syntactic warning.

Yours,
Linus Walleij
