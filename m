Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84BC1053FE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 15:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKUOLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 09:11:11 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39061 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKUOLK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 09:11:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id p18so3379155ljc.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 06:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oZp3HZ4CKNPLF//CwB8gN5FR3ZN9LXNqaq8gnIY9lss=;
        b=TV1dbV9lyonvtfSGvpV6EwZrUuYPTpxYOEMdb1LbCyh+VetcAIHKxihGj70aQmaHKi
         Jbfo0/nwGKrjOeT9naSsYqWbC0wFK2WNlWkcD796+PQoeu20wo8S+fo8xsAxhupzlyhm
         At2eTQ2nSxGaWd0VNTDcIjgkruYhepM4WFEJqpCMvRqc5JGBfowCbGDAFKSdHCjnsi2C
         rTtLqjjuYKoig5K8741JFDTNQX06tnpDlUzpQ0utEWbbIO9STHRxgEB+3U7nXV8SFFM9
         g+UHbJUaMBf4nM7iue+4JgIi4v4bCVAXNRQ4OM2htN3Qb8YYLjcanxo5t1VpCxaHn7gj
         uoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oZp3HZ4CKNPLF//CwB8gN5FR3ZN9LXNqaq8gnIY9lss=;
        b=pp7/5Tp0+IUd8y5ob2C+mLrKg1CkM4Rpg3qlMwPIZzBeRbqU9vlWE5vw2FUqk3skvP
         PkQPa6lxxlDDFOGBiynN88vFIBqjQBdtoh8KA4BPJUEpT6Xg759ZXOPToRMa0BVINjGW
         zgMXs8YHfgTK2oDcWTLob8EgUbhXjbVcXbzK2eIG+9rfGOGci+i97L8ML5M8PtRCb0gN
         0i3APC3Xr9I1lJXYaeRiiLedovn6O4BkPLJRQ1vLwjW7OHb3OgRLO8N8jdP2mjeAcqRA
         lnCPyx7AwBGd8IwFZb5fBmNTawdl7DLme3eA1G/rwQ2OYHoKPvsIHJKcuM0TcydpmCKL
         1ciA==
X-Gm-Message-State: APjAAAUYzoyBsfOlHKxizJt+PnWvmo351L2LO3+UK+4q5bwtB0txNwRw
        zdUL189nM+zfCyRI5TgwD8UG+dj4GtEdIFX4FxW12A==
X-Google-Smtp-Source: APXvYqw/OvC80RhBpcecfqxISdh2BHdrs0IQTSNl+RC5Xe3qzLrFkd3gyaJp1si4to4KQHXP9TembWEhedC2KDCY0Ko=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr7685413lji.218.1574345468756;
 Thu, 21 Nov 2019 06:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20191119155211.102527-1-paul@crapouillou.net> <20191119155211.102527-2-paul@crapouillou.net>
In-Reply-To: <20191119155211.102527-2-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 15:10:57 +0100
Message-ID: <CACRpkdbGeyu1xiz2TzRAOoF5Ou9irCSWNyPzZ4o+TAaveqUKmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Add OTG VBUS pin for the JZ4770
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 4:52 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Add pin mux configuration for the OTG VBUS pin of the JZ4770.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij
