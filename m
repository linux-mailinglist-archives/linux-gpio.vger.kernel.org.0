Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE19B57801C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 12:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbiGRKse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 06:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbiGRKsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 06:48:33 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68F01F2DD
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:48:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id oy13so20425123ejb.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4oRak+C2KluI48BtBgPjPXk/AjJSdRg3YOHC7j1IJKc=;
        b=xCzpO+0vKd22GOhNS1gpEGBGfBEZxh6GUzkKqmPMQhJ67hvOqoR2/zJc88DP/6ChMG
         h2DJL9SJMDPhUNWDfpFIl9pl3RvditxQW06A8rSrycYLo0YuvzMnR9xSh0xrG7vjfuun
         3rZXgUni7hrSCJe8aTi2GnHOO6XrnwL4UGzXL53yMXrP+dEXJJlQyjnnvJ5D9tK6pwll
         9dPJJyMUPEFGC8rkIp6SYXmpqnaop/gDPaMNgf9I5prw1zQwY1JgKviM1xC5SkAx/gU3
         qzWgQ8fDM6CqpJopBJsI/g6wlk21hyiELyGfp79nJGDq8h5NxRsfZA24wEY7LZ74PYtO
         l3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4oRak+C2KluI48BtBgPjPXk/AjJSdRg3YOHC7j1IJKc=;
        b=Pxlp3FBYQLoNLvZNZAQwD65jBKW+7C+X4dqAZgPr/DTNNkxVc7lqc4EzUneGl43RuS
         8+Tog/sG6hZqqc4SyZc+tYz09h+iKYl5/mqe1Pm+Hq5xIAiwkG+z6gx8LVb77eDgFwMJ
         jFf/je2A0GP+qACiKbATvD2z/TAwolUDII9paELcHfr1Mc0r5XLn0I2SfubKavrBfWBR
         TGk03GWGVVctmtu57M9AX4flKl1RIHKwa23rus/ujXOc3h0hkiIA2znvS4OTAkjyhAOn
         pl42CFAyFVZaXOJ0LH7I6zhyloaqroJA4zUvjYD6yJywrj0XFgwuqfWbGyFCEjPban2Y
         +dUQ==
X-Gm-Message-State: AJIora95mPdnoILu/BTdR9hjW9MvuqZGByvl78KYzbh9Gtej32EAQnPl
        716iphoWHQVEeig+EJnCFNnYcaqY/SiwTOek4yKkeg==
X-Google-Smtp-Source: AGRyM1v58741g9YF1j3O3YhZhbaaALkEvMwjbuiSWX6eGAUC4RwB+foXNRxi9DundUhsUPDjhOqkyanAVMGdqiE8fM4=
X-Received: by 2002:a17:907:a053:b0:72b:3051:b79b with SMTP id
 gz19-20020a170907a05300b0072b3051b79bmr23902331ejc.690.1658141303429; Mon, 18
 Jul 2022 03:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220713175950.964-1-mario.limonciello@amd.com>
In-Reply-To: <20220713175950.964-1-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 12:48:11 +0200
Message-ID: <CACRpkdbcP32Bi51pHOJQM6d-0NgaHxSmxwvEsxmk4PoO1R0Fqg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Don't allow PINCTRL_AMD to be a module
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Basavaraj.Natikar@amd.com, madcatx@atlas.cz,
        jwrdegoede@fedoraproject.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 8:00 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> It was observed that by allowing pinctrl_amd to be loaded
> later in the boot process that interrupts sent to the GPIO
> controller early in the boot are not serviced.  The kernel treats
> these as a spurious IRQ and disables the IRQ.
>
> This problem was exacerbated because it happened on a system with
> an encrypted partition so the kernel object was not accesssible for
> an extended period of time while waiting for a passphrase.
>
> To avoid this situation from occurring, stop allowing pinctrl-amd
> from being built as a module and instead require it to be built-in
> or disabled.
>
> Reported-by: madcatx@atlas.cz
> Suggested-by: jwrdegoede@fedoraproject.org
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216230
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied for fixes!
Excellent root causing.

Yours,
Linus Walleij
