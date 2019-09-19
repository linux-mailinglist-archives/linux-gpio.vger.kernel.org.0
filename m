Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E0DB8343
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 23:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389183AbfISVZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 17:25:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37571 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390826AbfISVZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 17:25:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so5069398lje.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFlQqPMwF2oKRoCy99o/0fcbEkaEzqDPgo54HkJjGwo=;
        b=QYGEBRfB218lq3Cke9eCjqIiN6Wf0j2td7002hFcAjOvsFYVECsjYFCUkApgWn3no8
         gEApY84ExYwT1UuZmVMX50F9llaHaFWKCUWUK9WH5z38tbwkYt1iwCfqojcLmUe2Dc24
         DkNvqa74UAADSQNKgmT2moNbWhaBqIMeGf5Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFlQqPMwF2oKRoCy99o/0fcbEkaEzqDPgo54HkJjGwo=;
        b=JNYrWH71icw0ZkCwTzfFXrIh2YdgYhJ/svjK+1z9HFQ/2+3wbXqsr3DFFazWIKzV2u
         V/rwl/X4zpHroEYQERCPXNjx8ETRnZg4lEQLbyVlHtphrPRpT9QcLwUZbFqcmE6L30gC
         Se/G42gMmaSfLFEayhaDy/BPO6V8GqhRVGAbpFWP6uqMqHANW+dIiCjuyAz3HRn7DiOr
         2SuSpQoH4ix8dRRfBCn/oQeNsdMV3f96sdvrEqSNr8eJyQIACqCpG/l3VzjXcZpBQ+qu
         Cwq4TYxgsTuK1+N7dzOtmGjxw1NnRQZEyz9BuWNYInNGyb/M3w2z/iug+03QyjiGSL2l
         GqsQ==
X-Gm-Message-State: APjAAAWvmPSPIDnzCvpzKbf2rZiAx5Gp/nP9N/EJLiBaGLtJcsSKitkK
        50wgBTAN0Go5RbuCkCO+NSlfTFbPmWU=
X-Google-Smtp-Source: APXvYqwiQIOdk4R648oAMxpiIknJtLcdnLmB0qSn2Vb5+06nrXBLUI4OMLH9EIurSSwiawOeHI0uMA==
X-Received: by 2002:a2e:9147:: with SMTP id q7mr6583394ljg.95.1568928348185;
        Thu, 19 Sep 2019 14:25:48 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id z19sm1929624ljj.50.2019.09.19.14.25.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2019 14:25:46 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 7so5042033ljw.7
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 14:25:46 -0700 (PDT)
X-Received: by 2002:a2e:1208:: with SMTP id t8mr4478514lje.84.1568928346030;
 Thu, 19 Sep 2019 14:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdaHfhNjR-3GJOO-47rqopmO1SE9dLAU+AiCaWTuLje=8w@mail.gmail.com>
In-Reply-To: <CACRpkdaHfhNjR-3GJOO-47rqopmO1SE9dLAU+AiCaWTuLje=8w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 19 Sep 2019 14:25:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjP4YuM8myHkb20avZA8r=KCN3wLi2piWuPKBTH4T3vQ@mail.gmail.com>
Message-ID: <CAHk-=wjjP4YuM8myHkb20avZA8r=KCN3wLi2piWuPKBTH4T3vQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin control bulk changes for v5.4
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 19, 2019 at 2:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Alernatively you can wait for the m68k tree to come in first. Or we nudge Geert
> to send the changes ASAP. The usage of a wildly different pin
> controller on Atari hardware is only a compile testing artifact so
> we didn't drill deeper into this.

The m68k tree came in days ago, long before your pull request. It was
already merged on the first day of the merge window.

So no need to nudge Geert. We should be ok.

              Linus
