Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED981F5105
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgFJJUh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 05:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgFJJUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 05:20:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2683DC03E96F
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:20:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n24so1538925lji.10
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8zDUyaGBWXgk6E+N6JEYs9ue1EJLN+M9jJJcrTGqvFA=;
        b=WU7bIdPcYpxZkpiKwzmOX8mjpxLoBeYgVeMolWE5iA+cc0b+ggsENZ/YJLXpbcaWOK
         ICmhqq7DQghydBnXTmTHxA3xdbPj2GuY8jD2tMopXOVOEg3ZSIHnRNtyR6h8dqAB02V1
         W1yqhQDNn2+BpEO/1jal/dt1E9xDJ0iiL66R7T8QOiABinhNv0zpEDN71o/v9EYACJG7
         9a43dZEeOXNVy1CBEhzcEyKTRihBDQkAbsltBSed/4HXzaLHE3ZxXQldlRG5klYBQ9B1
         xviuXV2/V0BfQLHR8D82OLPOVFRrxy+oddWO0xKr4DchSFmu51mE7xdhmxYiLUk41dMH
         34XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8zDUyaGBWXgk6E+N6JEYs9ue1EJLN+M9jJJcrTGqvFA=;
        b=W7U+d6a7tw2Cnw/3a010MoE472yztsWol+MdkiYKbp5FbyURmKa1oSiu63nQcXHyVQ
         g4a1Zwdoe4HOJP5XKWTSpTIYpR/smjQwS7qZFA3hk+LFkz66Wol9BjI2YyhPyWwY6yXF
         Odl/ANHfy3WkKJe/0VtkmHdjP/qQoxBxtBukVZKiHalKPhni6MRuvrA9cCXGx5dGG5pE
         mZLvpL3fTXYHpz+IxIiIS3c3sgsyVIPt4ORHVZ649JM5oBAEFPf36qj+rfKnMT65FOCC
         91bxeaQhH881cVSPJSnXIhqKUGIu4huzP3VKP2XHbXTJ8MOO9vWcdfkmtUUSLhqICjNS
         L46w==
X-Gm-Message-State: AOAM530z/c4mZDiow4FpHyPPBsAQjFNiy74xqaP3N9XbCrcK0wTZj+T7
        NIpL8Jt0hT8Q0eDHk6Sjph8Yo+DfXhkqjDq/TQdadw==
X-Google-Smtp-Source: ABdhPJzPtU3KMpm+XWIXLCLhDp0pumpZX0IYN74s6n8M6UWjpA0vpLDCuIdx4eRrFugXjgYJcX9JjvZr3t5D3BUNUEc=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr1346976ljn.286.1591780834630;
 Wed, 10 Jun 2020 02:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200605030052.78235-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200605030052.78235-1-navid.emamdoost@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 11:20:23 +0200
Message-ID: <CACRpkdb0B0m+8d0_wLPpi=gLe4BDHC18Dbbqr3z9GEEk5sY_7g@mail.gmail.com>
Subject: Re: [PATCH] gpio: arizona: put pm_runtime in case of failure
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        patches@opensource.cirrus.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>, wu000273@umn.edu,
        Kangjie Lu <kjlu@umn.edu>, smccaman@umn.edu
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 5, 2020 at 5:01 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:

> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
