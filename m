Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93C413C2B9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 14:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAON05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 08:26:57 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34956 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728896AbgAON04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 08:26:56 -0500
Received: by mail-lj1-f194.google.com with SMTP id j1so18548235lja.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 05:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IveF9K9ZvQHL0XCm0NhMK8V0t0Mh/Q+IVIFeaL32PDg=;
        b=Vid4ORIFzRzRLvESZpBs3Ah4aXP8I9dQvIMEoJ2abQEipxzFgRbq9cgs9qV9tZo8dG
         r+ALUOnRFW2hAYj80mACUV0tm2AUq+uiOJAz+mpLJtu+HvdKUdsgrIMqP81AttT6bPAo
         1iHOwyHySY/4v/351X1jQCrAfvgaejUZBV4oWitZ86TuNguKyKPqrdRsNH9EEYJIu+ke
         53zqhsRIr0ZRuBjgFtn1h2jzcpYaaDdvzuXzBv5EnJgleDjRzLUmBMOFTxPgCbwigVIN
         P4Fga4cDvP8gNm3KESwycpE4VyKfdY23u3ZtYMFvsV+t2rXJZt0ViTH6zsxGQsNoh/A/
         pmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IveF9K9ZvQHL0XCm0NhMK8V0t0Mh/Q+IVIFeaL32PDg=;
        b=L8/e2awhudreSTbOLQQsdFO2T+XNUNH1uNbQ2SO6MP3Mt0C2lJO89oc82+6Pn9Pn6Z
         ByWF33fRz/7dmhhg4fAOe5KLVVD+0R4+AE+Xdux0DGEvy+hfEgUzLJnFZ3Mz3fCYFDPs
         iiNs7O3W7dPsoIHAYFmiFhFrCgJKqdXJ8SclEYzdl5lW3BkdFcPVhxuEYM1eGG4gENFB
         mIyquJKV+9iN0vxPEmrq0uxAHO7kxyoNiZVn3YMpxWt7vQraorb3Z1Q0bBH7FkRw4qkN
         fHBU6E7pvbwFejLZce7M3C1ffPxikS5Da0MW2hDu/UaCk1S6xhMtLx8dBcQJi9w1Rma+
         9d5Q==
X-Gm-Message-State: APjAAAVBN+xM2JxQkchmkjiTYcRmZRttJFl3IQBTliB/qaJrSZ5/d3Vh
        plkF3IbGFrSdrN8JtmKki/j32u0D1enoCShPtPc7Ww==
X-Google-Smtp-Source: APXvYqzEhjenLEHzG+AYX+BQqoKY2hyu8eJGNOhb1pcFBkrZR5Ijv0RrNHTx/pnJ+SIgH09JhG4jxqIioUO98aLqqnc=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr1649272lja.188.1579094814272;
 Wed, 15 Jan 2020 05:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20200115073811.24438-1-bigunclemax@gmail.com>
In-Reply-To: <20200115073811.24438-1-bigunclemax@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 14:26:43 +0100
Message-ID: <CACRpkdbefJsH2km3p433NN2koNck7hgNqLWpD3q4r=Um75GZEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: clear irq in edge cause register before
 unmask edge irq
To:     Maxim <bigunclemax@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-pwm@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 15, 2020 at 8:40 AM Maxim <bigunclemax@gmail.com> wrote:

> From: Maxim Kiselev <bigunclemax@gmail.com>
>
> When input GPIO set from 0 to 1, the interrupt bit asserted in the GPIO
> Interrupt Cause Register (ICR) even if the corresponding interrupt
> masked in the GPIO Interrupt Mask Register.
>
> Because interrupt mask register only affects assertion of the interrupt
> bits in Main Interrupt Cause Register and it does not affect the
> setting of bits in the GPIO ICR.
>
> So, there is problem, when we unmask interrupt with already
> asserted bit in the GPIO ICR, then false interrupt immediately occurs
> even if GPIO don't change their value since last unmask.
>
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

This looks correct to me, a review from the MVEBU maintainers
would be appreciated.

- Should it be applied to fixes as a regression fix?

- Should it be tagged for stable?

Yours.
Linus Walleij
