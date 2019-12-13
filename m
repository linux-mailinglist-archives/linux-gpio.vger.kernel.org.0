Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAE211E14E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 10:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfLMJ6H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 04:58:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44460 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMJ6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 04:58:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19so1931979lji.11
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQvjoAIq1lwY1cihw0edTlVsvS4hblrvKhZLt2o7yRo=;
        b=U/gCvQa0C8fp3iVKJhx0vBUt0PKFuNFM6SSSB6ihOGiYf8DrW7iq+1YekeCTTxXOVW
         wA9kO32dpsd0uQM8TAz8UtneQN+P/STd9y7C3oklU8IKWKq4HLmauGD6BnpmZ7iDuZng
         SQo0ak1qNqQdQLAdjdJpaRZMNsmlbROrTck2PxWSMWA1pEXtJHWUll0tFoE44sU342Nf
         +iVXD4rDz2GqEaL+j34YCkxDq6MgJkT5saOWL12O+djrWRrzFUS/8TEWdE85vTOOgq0/
         p+FTg/6IfT6Yw6EICXB0kxMXmQY+b4urp1jV9t48Nuj+ruxYKT1BlDjg1hghnJZ+lVvZ
         t1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQvjoAIq1lwY1cihw0edTlVsvS4hblrvKhZLt2o7yRo=;
        b=kHgE2K4SIQA9wrGHbegS9E9ZzgQzxIGvG1RJj2MS8WaOgGVf60RtWvc3hjhsRb16ZF
         u0N9Tytzzjs27IWrFbVB9bwXVBtKoKnS1iU8TkjAeXlus/B2rkWhQeY5O0XTb8U++M9+
         ZLKeWvUh7nEAG9zt33evTs1TfliZOtCSHUtL7z0lxqmZBLUfj59zCLPsOzmo4VWbRCrQ
         RJuqiW9U1pqMFwJEKeiSLOYIOFxH6pnY2RfPLYRLDzY5dDqBjkHw7u46JiapvqbiXsH2
         MZUiiaGfL+doZo1D0ilh6OPRqNR2dbIGZz73ubAtgsb+YZaqwLWHRQDORJ+gmpdChg4R
         OLrA==
X-Gm-Message-State: APjAAAWN/jTbAzyvg/q3IkGnOumNYZnD8uOVPNmQUnUn9mAoTRmjZ7j7
        +TVrPw/UYhSWC+bINJRyhAbsefgUO5K9nB/a36Xcww==
X-Google-Smtp-Source: APXvYqzu8HOUUFv2+ceRlEgeqgx8XNvHnW+7dom4XrnAzRcH0CCbokozbEW15A+wcVH7XZt92FtVTGxMTi9B00CIqHI=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr9102521ljk.77.1576231085018;
 Fri, 13 Dec 2019 01:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20191204144106.10876-1-alexandre.torgue@st.com>
In-Reply-To: <20191204144106.10876-1-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 10:57:53 +0100
Message-ID: <CACRpkdb30kFbpxb52GALXJM67tFvJ8tR83NR+44PMOKJzJjruQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinmux: fix a possible null pointer in pinmux_can_be_used_for_gpio
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 3:41 PM Alexandre Torgue <alexandre.torgue@st.com> wrote:

> This commit adds a check on ops pointer to avoid a kernel panic when
> ops->strict is used. Indeed, on some pinctrl driver (at least for
> pinctrl-stmfx) the pinmux ops is not implemented. Let's assume than gpio
> can be used in this case.
>
> Fixes: 472a61e777fe ("pinctrl/gpio: Take MUX usage into account")
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
