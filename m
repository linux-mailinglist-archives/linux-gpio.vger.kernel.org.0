Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7646F0014
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 15:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbfKEOlk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 09:41:40 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45215 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728909AbfKEOlk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 09:41:40 -0500
Received: by mail-lf1-f67.google.com with SMTP id v8so15283287lfa.12
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jBzTOxq85jxdofnlZM+XjruaJTIDQtuSsbh7qG9jKHg=;
        b=bBozmJV5Qw6b9lVapPQvukL2eua22QYk1tsW4G0355k0kjw9pURqm/uRwStnFEhLZR
         qC+5Ag8kIoG1xVD1hfQfSl7+po3u37+/b6N0zQAdCCEZWLhKMeOM3qvwZbD/y5ZPSoh6
         MTpvr6/VaUaAyoUz4Y8JccTmFEyS+gGu9TWdmB4keanawpHY4PkyNbC/Voz7M14+OnwZ
         TAYmCLZMTmHCvh1OlS+QhfLx88suOLdzkGHhH4anmzik178Ir6mYQkjWWe3B1jcu/+04
         a4brbdKi5sikiFVFPQq2Ib0/aLqGEoQrOSpOQwKU5qoOl+r+i4V2u+8HjMNE1sB13TOv
         FTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jBzTOxq85jxdofnlZM+XjruaJTIDQtuSsbh7qG9jKHg=;
        b=qETjJqrgT6TKO6BNYlbxgWRbdNSuCx2dmQoWWRXs9d977nD6VU/5DDTRzuXIdUaWZh
         xffuwgycaAzvQUy9miFpJwDGzCh3cr8C5SLYdF7DCZH/Ubby1UNxZoRDoZJxB5LrbdYj
         5pWr+4/WBO4n4RG8rlI3uR8f+za1G9J583uoEsVWQTtoKQ9Uq3XXYfE7OoJe2Do7B4u/
         86HaPVS1ngGEJh6NJBst7NgMZ1TqJnD52rN3I24oumZtdu8y5wTx8TP+yrO56XKMYVHF
         7+3e5f082aON/jUx80eTkwoAmIwXoq681MmVsZyJcwoTUPIvm44MBxt9/d/VjPT5FOqn
         m6OA==
X-Gm-Message-State: APjAAAXgr4hrXfuSwIn/GDKnNxrDbT8n9BcUVB6piMlGT1Qj6lEMt9My
        iY+mypdPdY1BEqrg2vfW6pK3YLeq3oxvq9qte5ORe06/YJg=
X-Google-Smtp-Source: APXvYqwfEk1h321csKMTRrt3DsgpCia8GUNn3QPeXjglwCRgaQ1riCiRrh9/anJdOd37y0N/igvpYMZJnznCmdaOJ5c=
X-Received: by 2002:a19:651b:: with SMTP id z27mr20715395lfb.117.1572964898491;
 Tue, 05 Nov 2019 06:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20191104175744.12041-1-krzk@kernel.org>
In-Reply-To: <20191104175744.12041-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 15:41:27 +0100
Message-ID: <CACRpkda6mtF=yjPMJReO50q1Xnys6i51zm2iJvHRidxZJCKU6w@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: Pull for v5.5
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 6:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.5
>
> for you to fetch changes up to a322b3377f4bac32aa25fb1acb9e7afbbbbd0137:
>
>   pinctrl: samsung: Fix device node refcount leaks in init code (2019-10-01 20:22:04 +0200)

Pulled into my pinctrl "devel" branch for v5.5, thanks!

Yours,
Linus Walleij
