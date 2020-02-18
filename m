Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C7B162185
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 08:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgBRH25 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 02:28:57 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38816 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgBRH24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 02:28:56 -0500
Received: by mail-lj1-f195.google.com with SMTP id w1so21716821ljh.5;
        Mon, 17 Feb 2020 23:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ecO73Tz4R3BzjxpGeijJ+hbGI3X2WrncLno2Gd5yhc=;
        b=qvXPwFFrAD/ykGjO85luJE3kU77HQXUWu8f4slCNgNL8zyJDGMdLGg4PAlXA/DQAzl
         WmhWIx3s3e9LKVudJlmMBEb/nh0DlDsExif6opzL9sNHX4eUz0lSTSIibX0pegnra0B1
         YoJL9Sc6y9lO605QB1ckz4BlCOzKMFy9CA+RWRBJNEWJfuehXUSBd5IWdPcwgR0XiFL+
         an95vxEta88S/rXaKQ20GRhq5AIq5k6OTQfnFt/O4mH+ogGeRh5p8ykc/p7qpOKlJtUY
         TdOKvEU/5KjRVInPBKtkRKdCEJaaVmMEDuMDFhrT6v1E+2d/ebzPX1inrloJ73KO2McT
         ojLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ecO73Tz4R3BzjxpGeijJ+hbGI3X2WrncLno2Gd5yhc=;
        b=OiP1i5DluENm4sf3zTc5Jnw4RadiOosApz9miMX1qUKozU/LEFCSQ38bL0P50tvmCs
         3KPgDUg3F2imqUKv0VOFilgSqMPphAaWoGtEdlDsG6sY1AqO4jFk2hhDy08MqK6sgE83
         qmblSpiXQQ5F6nuTBM7SltdYHMm5hXuWvYlHYwafgj2Pb6fT0wckpoQ8FQjgUE5fRmeq
         +NHuMIB5f11KZfYTBStAW3Bx3ETzKygDR+1fTOOXwZ7R+X8YeKOEZ9ScHh7vfmqb/MfJ
         VoxqLS+mp5Da945C0zWLujuxhkBCo4Sj4He4h5BewKEMqj8gnDYI+zvE2pzgPb0f1gmP
         eW3w==
X-Gm-Message-State: APjAAAVnKVZv5ksbzdB4xPB9CSltLnzPoNhi1qTBIXsjcFAGdcTtJiEd
        t+8sNg3APC9SaiwL2WZDLphH23T+KWbaXZsAQkk=
X-Google-Smtp-Source: APXvYqzXF4qXUVGsYrNpcGaWpWuysDCxSYh9b0+WaFhTVbWD6IqzhOWe7wbQAi54Arggdc3xJEfAbyjZgbh42rkngzc=
X-Received: by 2002:a2e:9618:: with SMTP id v24mr11955147ljh.181.1582010934474;
 Mon, 17 Feb 2020 23:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20200125221410.8022-1-pthomas8589@gmail.com> <CACRpkdZjFpyp=fySNRfMCnm6-JJ0xY-sGU4deDc6i6iPOuAG+w@mail.gmail.com>
In-Reply-To: <CACRpkdZjFpyp=fySNRfMCnm6-JJ0xY-sGU4deDc6i6iPOuAG+w@mail.gmail.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Tue, 18 Feb 2020 02:28:45 -0500
Message-ID: <CAD56B7fNkP9oLD=+G8YSL+KBsdVG0Dk8X-mwr9F=EosUDpSC_g@mail.gmail.com>
Subject: Re: [PATCH] GPIO, Fix bug where the wrong GPIO register is written to
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Fixed up the subject and applied, added a tag for stable.
>
> Thanks!
> Linus Walleij

Thanks everyone, next time I'll do the subject better.

-Paul
