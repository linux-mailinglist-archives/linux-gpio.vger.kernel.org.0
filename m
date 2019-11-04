Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92E5EE392
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfKDPVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:21:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34932 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDPVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:21:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id y6so12556675lfj.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WmqHJfKrHEuo8+nq0y5509yDW9+rTv0+ADIVFj4pe+o=;
        b=Wu/lDZ+WeUXXOX/13FqsU02HMEMgYvvB+EJ0LPqhTBPaOHLQT0fOaNd06zxDhbFciz
         +s1Tr2bvcFcTXAKFDo4sXqML9cn7Aj+b7WLcRtz8bPtLAK7XRUULMzjSibVZRIS2psZI
         mnYqdJndH0YktK4xeQ9C6a0HdlGGoGQjueJfHW5OwGQO3Y3CPSDtSgeubfVwq8uTJOf/
         0j4Av/a0R79S6GWb44T+HcJmI7cYybJNtYvru4SJbtvFWL9HhJxmRqpWmdC+iZl4d20f
         OhRSjsAsz71rzoRUgUMjmnkmujYF/Bf/DCMRxLBAxGNmF1ktLntxofpezkBtqYEVviq4
         TNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WmqHJfKrHEuo8+nq0y5509yDW9+rTv0+ADIVFj4pe+o=;
        b=L4HOb6yMlY65bMQFANl0M0ZIFZMBb+IJQsVqeVEXO2hLsNVeI8Y5EPlU1zPHAA27KV
         iH49J3Q8z8saeYrd6pzjYxkIrYlJRI8oek5FgBCbxek/LQd6fJQzbP6R4Ze0KtdewmaR
         AmHjSnMdGq6EAdMkFsHakOw+UkllBSdBoOnFF9A5Ek5XoM1hYDCrUDCCC3OlIPGf/FfQ
         YRNuN2KXj+cPLCpqIBzS1gl4IPhj4vj32W71+kGiXHgA/fq3WtK6t6T/4AEtP5l8G4J2
         lNK02Uvm2pecVhGZYxVM4ojWI3w6oG+BT2JI0W6/S5/hUxgXylsNijZ2Vqg++YlxRCau
         W4jA==
X-Gm-Message-State: APjAAAWJhgwo5lkSPeojRONfNvI7XLPu2rW3fUBoTYFxFzNX4fJ9bmi3
        H8HwU9P334tHnEYEqObkSUTjpJiSqk89nLua7JOgCA==
X-Google-Smtp-Source: APXvYqyb7sOTS3sJnVKALeqMLINw0jckqgVt+EfzBugF2XKADxqvI03Ya1086CmdBNeJEP74ox3oPirCl8Kl0+Qe9+Q=
X-Received: by 2002:a19:651b:: with SMTP id z27mr16940144lfb.117.1572880871163;
 Mon, 04 Nov 2019 07:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz> <20191104001819.2300-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191104001819.2300-3-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:20:59 +0100
Message-ID: <CACRpkda_5iB_nejfpOS9_f4w1E_-60DMVRJX+uzv40w5jNwDcw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: bcm: nsp: implement get_direction
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 1:18 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The get_direction api is strongly recommended to be implemented. In fact
> if it is not implemented gpio-hogs will not get the correct direction.
> Add an implementation of get_direction for the nsp-gpio driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>
> Notes:
>     Changes in v3:
>     - add revew from Florian
>     Changes in v2:
>     - New

Patch applied.

Yours,
Linus Walleij
