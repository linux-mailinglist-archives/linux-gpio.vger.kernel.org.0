Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551A17291B8
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbjFIHuJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239467AbjFIHtm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:49:42 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045803AA0
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:49:21 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so1411044276.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686296960; x=1688888960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3c2ntYAOnDdSkrfl6TadBZmpYpoDIkLc1TtVzVrRJ8=;
        b=IKrGMIFZ/EjMmj9mSBuFlJHyclCyZWfGsF9i5dacTEK78et2kPUekz7nYsXJRvbKVu
         AAlWv6lnPv4lVG3NxH/xCOskpaEXs+dwdY0EIGAiyA16DQVL9Tefc2AiqbVpPyfFiE08
         QrzR0llTMHM2kimq7fy7i6XtLWK2at8OpZYgQ3YGV8WXP0sqnDxCsP1Fei6uUeV2a8mj
         P9TM/TEh+u3CjCtabvhK/46qAB4NJOoLQUNwOnhuV/2dwCFJNvTXZD+zJz3aqKODPSAo
         /NqsIuD9Fen1gD303bC7MOIdDxxkt6Lewdtj4IKv9w/22g+yUWtAwUjjZ+8MGd78ROOo
         ZtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296960; x=1688888960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3c2ntYAOnDdSkrfl6TadBZmpYpoDIkLc1TtVzVrRJ8=;
        b=Aqu9+SDwpH3OzlVQsnSLPv+CUnFgOCpEPEm1mz8d82TgAXkh1oJKTlb8T9z3eYFiwJ
         GUvbNTUGKjQbeBOKeQJ2o3xNXAaqvBWX7ofxaIxGfXOOv9g0E1+byLgcmd2tCTkENZdN
         5SaiztI+Tp5YaKlLCzy6HqZ4FU90ap8okiVjvhkCwYA6l8u7HW4kmqPbgM9IBeEiQUms
         KqV0HTby/ekmRWXto0Z+qZ8JhekqAcg5A4GVyvvBo+kWPpflFhIkbHtSAENEJCqLt2Me
         qC+cw1em94TFUQ3emEnOqAM9BZMGv1gwjn2t7iGukpfmFIbz3/vo5E+/CYntNLRfjp5n
         Va7w==
X-Gm-Message-State: AC+VfDz5xq1SXKCtp5C/LEI3miP/klNfrunGmGtzH9gCdylQIFQOkfKl
        Vx1533YjU/yxMuDZwAgwkFiPu7m2ycEPkGY1i71+Mg==
X-Google-Smtp-Source: ACHHUZ5bsNQpTQNAQO7r1mc69mmCaFHlXIZd6vtnZ7v0XG3sWHlGWJIsko8TTb833lC9heTEu1Kke0gt//Jr7u8OZAQ=
X-Received: by 2002:a25:a349:0:b0:b9e:b9b4:bb12 with SMTP id
 d67-20020a25a349000000b00b9eb9b4bb12mr370346ybi.48.1686296960015; Fri, 09 Jun
 2023 00:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <1686249772-26231-1-git-send-email-manikanta.guntupalli@amd.com>
In-Reply-To: <1686249772-26231-1-git-send-email-manikanta.guntupalli@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:49:08 +0200
Message-ID: <CACRpkda7TrNckpS5rLadv=eYRCDDN1qTBUp=jr+KfgoaQy8z7g@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: zynq: fix zynqmp_gpio not an immutable chip warning
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com, git@amd.com,
        shubhrajyoti.datta@xilinx.com, srinivas.neeli@xilinx.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        srinivas.goud@amd.com, manion05gk@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 8, 2023 at 8:43=E2=80=AFPM Manikanta Guntupalli
<manikanta.guntupalli@amd.com> wrote:

> Make the struct irq_chip const and flag it as IRQCHIP_IMMUTABLE,
> call gpiochip_disable_irq() in the .irq_mask() callback and
> gpiochip_enable_irq() in the .irq_unmask() callback to fix
> "gpio gpiochip1: (zynqmp_gpio): not an immutable chip" warning.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

This v2 looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
