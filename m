Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2AAC2EAEF1
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 16:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbhAEPlR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 10:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbhAEPlQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 10:41:16 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23648C061795
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 07:40:36 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y19so73368853lfa.13
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 07:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Izau05cqCVuspLwen2iXN40K1vFFwnjcmg+GBN87/4=;
        b=n4aOGrqLYsUxHvSNfaVQ0n17PnnxNEO3CyeRdPHqF3WaAzn2l3eHx0rdg4pHSYpacS
         sK3xG+7yZvT8JmUbiaaaIJcJ8tPZc+AjCWFoIKM71arnkQTEs3YzZZUu0VedvRSe5DDQ
         jRPqXC5dOB6jhlxKgVJDX8NXW3IrU2DHHddugkKcnHCAKmXX41qg5v2fVkbumQ5QEZpR
         56yhijf05Ugp5A2d4VJ0VQxwD1LDjTnR3B5cdB964NZx1tnaBbcIjl1KcYbnTzZ9eZda
         BQ/s5UHM6nw2KysL6ud6BMSgNIQsKsaTh+yCWUW2JoiGMr3jYTVrbSJRaQ2KYP+N9RQo
         juIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Izau05cqCVuspLwen2iXN40K1vFFwnjcmg+GBN87/4=;
        b=ROPvfZPQlhs0ha5ry6UCVOq9ZmRnrnKBakYwVtaYy1/AJvHMfMdJ/cXX5ozJJ47G0U
         VeM2WfVmhe/kgcUHvyZcaakYByvw5UCCBVZtXYSLidAxBnaIibWoeBLzRUqoAvn5eNRt
         oN0KSx86vkMp5fV3+6q1zL7QYvuo+i22jW5OH+FBwlM/5qUcwp4SH5iXAG+pksjDtdAw
         mGP1a/tOGEhrmaV/A7hbA0N2eajcTB9f4zI5dbLuSmuf/VuDKE8Jkn7XwOkL5sAFGXUl
         JmgXIttDbiRZot6mUDSMaJSZt0ZU3Y2VsdswHANdy5cQtX840XbP8lmCEuuLTaqIUAgE
         DdJQ==
X-Gm-Message-State: AOAM533oEUIdmkj8RdeNW0BG/jwQi+DSPrQ8140zHuoIuygnXmIeJqWD
        JnQ1jq+XIilHAzPjsZ9WJ1IIgmUb0dkLgX/rxhrt/j0YQuP9uQ==
X-Google-Smtp-Source: ABdhPJyrHSZvc9Zm994DoD7/LF3CdtsRP5OW7X7zvRIRc8zB9qsQVSjTN8n4X4p8c31MzoIh8MZJCoXrXLt3QL6qXOY=
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr37174018lfq.586.1609861234575;
 Tue, 05 Jan 2021 07:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20201230214918.17133-1-festevam@gmail.com> <20201230214918.17133-2-festevam@gmail.com>
In-Reply-To: <20201230214918.17133-2-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 16:40:23 +0100
Message-ID: <CACRpkdZvOcQ3Xcxa-iguHhamh5KZWtrobhhcsYe_fA499LfUpg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: 74x164: Introduce the 'registers-default' property
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, sandor.yu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 30, 2020 at 10:49 PM Fabio Estevam <festevam@gmail.com> wrote:

> From: Sandor Yu <sandor.yu@nxp.com>
>
> On the imx7d-sdb board, there is one output pin of the 74x164 that
> controls all peripherals power supply (PERI_3V).
>
> This pin should be at high voltage level when the 74x164 is probed,
> otherwise the modules dependent on PERI_3V3 will not be powered.

This seems like a usecase for a fixed GPIO regulator.
Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
drivers/regulator/fixed.c

> Add a new optional property called 'registers-default' that allows
> describing the default output value for each shift register.
>
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> -Add Sandor's Signed-off-by tag.

Again while poking some defaults into some registers does indeed
solve the problem, what we really want is to assign initial values
to GPIO lines for cases where there are no consumers.

If there are actually no device drivers on the GPIO line you can
use GPIO hogs.
Documentation/devicetree/bindings/gpio/gpio.txt

Otherwise e.g. properly obtain reset or GPIO regulator etc.

Deferred probe will sort things out,

If you just need the line to go to a certain level for the short
period between initializing the GPIO driver and the proper device
driver taking control of the line, we need initial GPIO line
values, which was discussed in my previous mail.

Yours,
Linus Walleij
