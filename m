Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAD672DE41
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 11:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241519AbjFMJuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 05:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241751AbjFMJuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 05:50:11 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492D72708
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 02:49:35 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-78cbc37c5b1so311115241.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686649774; x=1689241774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHShPJI1ND84wlAQIXTdkKHqiP9kaIQnFJziQlEFXAg=;
        b=W6V4ONuGe+cz/0uk/uN5Iqq0aT/OfJ6B9RiOB0CdGwIzS6c6ziD2B5nKU9nEklZFod
         3ilSqxRl3pklQ5KRqx0j4ktIUbx25z2edb6WY294QkZsXfM2J/X+wug1aSX0NprsmZ5Y
         KCQEca4HhEkM6S9qJsUkogsPU+JJ4q8bRDoVZmhq4y8wvWneOf6rl2vcBOPIiVMxQqOL
         XklEO9/DYK6kBfs66OJ3+roaXwfEfqZi0331CzihEAbErEx9cXxlXmeWQFmqZzs2fJid
         EtvIZkBReT9vSeUMj828rvEBXQ4SzgEXomPbmotCE3YkNpAYtPIw/eY1iJhEJ+NPb4Cy
         ek7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686649774; x=1689241774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHShPJI1ND84wlAQIXTdkKHqiP9kaIQnFJziQlEFXAg=;
        b=kOdiGncxApxIX7CUxNJLYNDmtOaK8sbyCVHiWGSW8Gwyh9StFKprYEJWpsBnczdUEd
         1XruE3zK+/ti06UM5A7OOXQWvVZbUPACqQLDE/EnVOK2cdzp/QlvPid+4mIkqgUR2HOv
         FJqLy4VUTkP7YLNTPpo4P11BwPdgWVqtKv8YTYU2lPtcpBiCJBesWMMV9FzIaZcRxgn2
         5XqTuXVKNW0rMhoGf4IPSrqfg7uEEDfm5Wy+G4etF313gTe2hrvAYxVbZwhxVD4FO8h0
         oqY52s39UUfugHMiTGrZ2xPZ0jBqtbDQ21gNMzcqLEataN8vAnJOQS6c8YTT6Ch6Po7S
         Ob/w==
X-Gm-Message-State: AC+VfDyA+A56MSPCz/YAetmV0w686GR57gomFNQOReqM0Id/xWa5sWTG
        iVDZANsi4QZHA6Ny0Cs1VTTz7Cd5vjQqUrZlRosuJA==
X-Google-Smtp-Source: ACHHUZ6d07s72MWiYVxCx5UTb5HEFEm5bhKysx4M+2vQ5aEkZntWDPGMGEALVUWuh8IGKijZ+Q5f8rP5+9BSaUl6N9s=
X-Received: by 2002:a67:ff88:0:b0:439:3128:587d with SMTP id
 v8-20020a67ff88000000b004393128587dmr5259878vsq.28.1686649774444; Tue, 13 Jun
 2023 02:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <1686249772-26231-1-git-send-email-manikanta.guntupalli@amd.com>
In-Reply-To: <1686249772-26231-1-git-send-email-manikanta.guntupalli@amd.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 11:49:23 +0200
Message-ID: <CAMRc=Mdv0+o6BLZS779yyvZayHy+8iTD7Oy71GR4mvPbn=_A-A@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: zynq: fix zynqmp_gpio not an immutable chip warning
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com, git@amd.com,
        shubhrajyoti.datta@xilinx.com, srinivas.neeli@xilinx.com,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        srinivas.goud@amd.com, manion05gk@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 8, 2023 at 8:43=E2=80=AFPM Manikanta Guntupalli
<manikanta.guntupalli@amd.com> wrote:
>
> Make the struct irq_chip const and flag it as IRQCHIP_IMMUTABLE,
> call gpiochip_disable_irq() in the .irq_mask() callback and
> gpiochip_enable_irq() in the .irq_unmask() callback to fix
> "gpio gpiochip1: (zynqmp_gpio): not an immutable chip" warning.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---

Applied, thanks!

Bart
