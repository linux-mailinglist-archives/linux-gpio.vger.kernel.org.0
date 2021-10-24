Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E92438C25
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 23:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhJXVg6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 17:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbhJXVg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 17:36:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0704BC061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:34:36 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x192so6597549lff.12
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZPW7xjaRp4Hr+hJkHCqWII1gH67HS4t+IkCZy7aFFFc=;
        b=GGQ8UArU56cB+RD+AoCYyoP3l+siFbiwdTtCXNqsFe7Zc2KxwKhe9naYVlzQmG1AsF
         cyfhgKVfYMm6vS97ynkA9MyT3M8kV+JDkML0JVG9gwsicuCK1I5UIRDq5l3AzgOKfzeK
         hac4/JABp3qj4ajJt+8KDpPo+vlvcmjOx5Ex5C7KY/u+o6+91jk6kv7BKsa/ID8gR26o
         ipoAt1uPafBDAS4nwVvAtMHU03m4DAvmHZM2tT17wLilrGTVrZmnY3IQa5YsX0NvytzQ
         vM57gVSehavr0lHOyV6Xe8CgLsLXxnEEgv7KlqoaPzkXCcCTMevL0a+6Nwvwy5e2SNqZ
         EpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPW7xjaRp4Hr+hJkHCqWII1gH67HS4t+IkCZy7aFFFc=;
        b=fbRkceekzxf2EaBFaHut+9Uxz6jzRGyYM4Z5XbUknwNSpbwZGIqa5dnNk3bQgop4nI
         8zwY2TYSOqM71rGXOpBJsWpzbGqCfylo9Dw9HFpNLKO24zTQ/CI14cRQClGzmRAPZ1Be
         m4MkqfhzeLHfXkNPkT2DJTQpZGItoe4EPLgucSAIRM4tbhxhsrCoF3qdPoWJEKuh3XVP
         +KNbcNhuzdGwriHOo3lzK/Bf+0JhW/oVALHsybdDKdWjIEsIIeKDtKqog53dbb48ljiY
         KDRpUjAIeLeIvv3s6gnL2GXDRa3pw5m9/i7sRzgIcyYhuIqYU8UTcPCpEh1+cwiOe3+v
         wJGQ==
X-Gm-Message-State: AOAM532nolf+Lr4+VVutrs4+47z1lKOJzdlLcRLhZ5YAFr8dX3dwmYMy
        JuxrVzxi14VnopPvlD+GQZ/AAsR6s/RGq/dHt/F9nA==
X-Google-Smtp-Source: ABdhPJzQFEsPjqi9ritYdnxfHCq3a6oU++3lC2ldocq8lg2iM+o9YuX9jBIGxGJrQoDOE3sdVW1QNhci37L3+Cjz9Es=
X-Received: by 2002:ac2:430d:: with SMTP id l13mr6578344lfh.656.1635111275299;
 Sun, 24 Oct 2021 14:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211024101838.43107-1-joey.gouly@arm.com>
In-Reply-To: <20211024101838.43107-1-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:34:24 +0200
Message-ID: <CACRpkdZ26Qt00YU5sPUVVag4FRHK631iO492G_cA6yXhgQdO_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 12:19 PM Joey Gouly <joey.gouly@arm.com> wrote:

> Here is the v4 patchset for the Apple pinctrl/GPIO driver.

I'll wait for Marc Z:s comment on the irqchip instances, I'm
lost myself, I always solved it with per-instance irqchips.

Otherwise the patch series looks good to me, if Marcan
ACKs it too I am ready to merge them!

Yours,
Linus Walleij
