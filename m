Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D976698FE3
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjBPJfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBPJfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:35:44 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDD02DE5D
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:35:44 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id a63so295842ybg.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3y4bw6GQesUCYrM8lis0WvdENjgj0RlUu/LhibMrpxY=;
        b=PaTJaQpzVY4n44fUYEU3go+2LorWYRq5LFW5eZ5q2Vis4GOFNhPMH8hI4IyHd6nyPy
         cWQZPIOuCh7Dl55J4xhKoH1nFMuI4WHuJIul923E6hfwqPxgEC2XsnlHyxQ3o2x8pBWi
         pP0nBWBuSSUfMAefoQkCq9UsOIqQ6MBOvuD1DN/aQLRL9A0BHgUtFwkhmsF39GjeJvzW
         6LJ7GAh0hCJ7QEgKvhg3IL0qDGkuckmL7pSpS8HfEzEZKAZps/3lyus0oao9UFf9NIOK
         A8z4gQg6SHy+nFk26zmY7K/7Tf/Ge8W2yGFQf5oEXdB1ogAM55pxmW7OL9K0Qerqq2Wd
         Yb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3y4bw6GQesUCYrM8lis0WvdENjgj0RlUu/LhibMrpxY=;
        b=GVDqYFaD9o563wYHDD6ETVbWR25mgY70v9w+BGehw4CqCbTSBN5wu5tz7n1q07zFPv
         mDh1vOgdNY9i3zEIp5WZJ55+t5oas8FYXk1p5BVPgHn55tMEvM2mVfXJQ7lccj8psr/q
         IAuxSAHu2dKQvKFfwXifz8/aP31Lzx2/bCjDTva1qEw//xmkgcmVsRZqjM2GrFW7FhcQ
         +eyBz/dPzyYC65N/ifXl8sMKsIP3ig1y+YLcYAAyYrfb85rak26iUnjx5yJWb0gt/pGw
         jyIUp2QejpB1J2sPjIIml/DaClOe9rrOiWjBFRtGQd9fuBLAuXnr6szBV2xPtpoaC3Lt
         8VwA==
X-Gm-Message-State: AO0yUKXyLyhd7Zf7S1NFDbK6+lJgRLIumQQJ1mnysQt/N/IIdLB/tU6k
        E6lM1q9NlSg5O+S2gSXFP6ozhIMoQb3L77wrwMO3kk0a4QJgyw==
X-Google-Smtp-Source: AK7set9wb2tgVBhw9boPuReITEchx6rJLBf6IGy3JEHqz/Iq7AOF/xTr0Nai1u+FoyViR7MMSmkBgNoMGNy9ZwwNolU=
X-Received: by 2002:a25:9f82:0:b0:8ff:c39e:af34 with SMTP id
 u2-20020a259f82000000b008ffc39eaf34mr521210ybq.280.1676540143179; Thu, 16 Feb
 2023 01:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20230215213843.1737181-1-linus.walleij@linaro.org>
In-Reply-To: <20230215213843.1737181-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:35:32 +0100
Message-ID: <CACRpkdbP9HQp2TwB_KLgp11h+DArOmtGYRS+gRBrGb244YqZ9A@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Drop irq_base
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 15, 2023 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The OMAP1 at one point was using static irqs but that time is gone,
> OMAP1 uses sparse irqs like all other multiplatform targets so this
> static allocation of descriptors should just go.
>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Incidentally this patch needs to be included in a bigger set of
immutable conversions (17 patches) that I will send out now.

This is because of contextual dependencies.

Bart: they should probably be merged as part of the big set
if the OMAP guys are OK with it.
Sorry for the inconvenience.

Yours,
Linus Walleij
