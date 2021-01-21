Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46BC2FE9BC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 13:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbhAUMPW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 07:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730227AbhAUMPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 07:15:09 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70132C061757
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:14:28 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b10so2206208ljp.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=40qqDLkfea9y6OAb5ktyENQV282P5G22MREwSllTT1s=;
        b=piKJaYRSj6GNrk9hUZZNnV/H4mudUKRAQgwVSmkYFg0RPghYKv6+TDjxk420xq3x03
         sf7RQvfWbPN3LJoDXR+m8OViF/sRoqH7V6JmmXZ1HHIzLoPpw16dHDPxkr63MS6aC9H4
         /mVza1PEBF3aQXqkQUV/ammRwYkta5CWw9R1HdXqdX6otPR7qcrCK/mUgPNVlgw+PRqx
         f6zq+2p25F73+KZ3gK1KBNlTAgGCW1rJkM+eH+crWVqSjVE6cYE77PrVysjEs11VC5mV
         2R6KhBW9OuynXDOEEeqTFYDgyeohCgoVibmRfb1/nUlwRzhnwvTsfQn536TpJ53y7LWK
         prXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=40qqDLkfea9y6OAb5ktyENQV282P5G22MREwSllTT1s=;
        b=so1frYDrRlDcsx9siY43Vcrf3WKPvqUXNn/7b3oBbAQFvehnWgWWSb5BWhG02qqx91
         zmF/mB8CeWGQjaUFr1DWMZz8CASyrirCE1cVFdmpq+0FIglTEVes2hoPQQC5CsbgFJ9Z
         GVCWDLKff+HE9hxifGCFKdH8qdWu++aLnw2QD9FoXgJpAjh5jCRSsBRhb34roZ7KWv04
         Lgp9TFBnQuuE1wyKT0RLuCUxmxR7LX733mvsPSKEx4OcgZ0AeAuA5yCEPBBCRDWI3dcY
         +gEh53A/sXkdVmeedDcX9sqxWTi3HSFjiq8Ako6Hp59OqPWZEAJx33DU2ffqed9j5Yve
         xRSQ==
X-Gm-Message-State: AOAM530Citg+V2AYIFGGsgf3247TyLp6au8D+gPJyN/gt70wMVPmo1tC
        VIv47ifrhBy4c+md3s6DGPXS7+eYu09inhHczzvIfw==
X-Google-Smtp-Source: ABdhPJxDisgdNRI0C7GnToJFLFhhW3b98HpitxMBUr1r37U3ysGPdUPM/HgvNxG9uHMPNPDpWUKH0nXuSrGvJ7lTbxk=
X-Received: by 2002:a2e:b4cd:: with SMTP id r13mr3739249ljm.273.1611231267010;
 Thu, 21 Jan 2021 04:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20210120132045.2127659-1-arnd@kernel.org> <20210120132045.2127659-5-arnd@kernel.org>
In-Reply-To: <20210120132045.2127659-5-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 13:14:16 +0100
Message-ID: <CACRpkdY+sF5VX1M5eb5Ps99psOTePuRugRmAfv=6xcnCSg_YVg@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: remove coh901 driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 2:21 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The ST-Ericsson U300 platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
