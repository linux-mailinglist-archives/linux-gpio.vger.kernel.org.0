Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E52AF5B7611
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 18:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbiIMQEK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 12:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236036AbiIMQDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 12:03:49 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29937FF8E
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 08:00:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h8so14259259wrf.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gnCEbK85nPUdTqot6uJVljdUh340dddAJ2lAv7W+llA=;
        b=C751DST1R57CIa3e7MM0NKSqdKpE7rkryEEqGyACIrNoP0DIzYuPDzsqEYlAPXeYDM
         Abeg4A05vgNiqLkU+9SAKI1YP3+baz5sKFvZ3rry3ihkPRFgHCJ76SkGsho2Emi6zDJ3
         UXG0hX449yCZ/qCsQ7nDaJ/mrRO2DTkYqQc5A6F9dspvxGMybkM+C1pFV/U3+91noXZU
         Pzo8aDHhjPkTMefKAkaPfkdOXmvRr4Wl0k5v7F5ZIBPNjI7UHt8SyYyv90fyhiz/NqFC
         ZUMBuZ/AQ/o6Ujv23CAgKSbVYm8RmZE7IfVAU8DvMYyBPlfmyLAalfUCRQn0Gk0UR7IU
         uFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gnCEbK85nPUdTqot6uJVljdUh340dddAJ2lAv7W+llA=;
        b=PWjjd6oJZ5JOz+qKRFlXOMqFLTuxmi4a179inSvVtUUyt//NfFOFKyLTduYxlJug6F
         mFYDW8i2z5yVnhZykw8dqBD9wKeChad4c9yM4NVqw1agqP0W8+hBRR+ecrfdIvHime9r
         YokhQLBx10m0f39A0WI5M7sC1aNM0cW3B49onQHudtRoUKGMvyfoW/GaJTzKBEInHFRK
         DJ2XvzDffOO7LSC009PvIB9uOvjvrRPwFzmkJVp/19woxRZTQc9zOVEyDJslOIT1bcXk
         Gv6YQWVPUiNYogbGyFMDiJ8BC5QtHM7Ua4HTvIiKGffwg2IWF6MoEoxUS7RB2Un2MKAn
         d3mA==
X-Gm-Message-State: ACgBeo2gqADC2+fMxDCUCX13JSEGGod0ltSq/R8kmcenJSzq4p5Q/Ilv
        Xz4hk7hXprDJjr+lPasQkihaO/lBmO0+wzVZqN00Sri9e5E=
X-Google-Smtp-Source: AA6agR5Yl0/0oAi1EVr3H3IrhkJ5Mf5cSwwCFBU/vyS8n1TiyWWfjJZrRYL+seZh+V+puJMOKFakf36DWnrIRjRAzl4=
X-Received: by 2002:a17:907:3e07:b0:774:53ba:6b27 with SMTP id
 hp7-20020a1709073e0700b0077453ba6b27mr17653820ejc.286.1663080448417; Tue, 13
 Sep 2022 07:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <e8bf314dd0edfd0709d71e85fb8d877c3722e33e.camel@gmail.com>
In-Reply-To: <e8bf314dd0edfd0709d71e85fb8d877c3722e33e.camel@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 16:47:17 +0200
Message-ID: <CAMRc=Md47VUkZ47qoBpxSiHb6y5V2LsSkkO1ogvyY2KY4w4qyg@mail.gmail.com>
Subject: Re: [PATCH] tools: Change asprintf return code check
To:     Catalin Petrescu <catalin.petrescu@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2022 at 4:03 PM Catalin Petrescu
<catalin.petrescu@gmail.com> wrote:
>
> Hi there,
>
> I found a small error (IMHO) in libgpiod.
> The issue is that asprintf may return -1 if it fails to allocate
> memory, and if that happens, chip_open_by_number will pass a NULL
> pointer to gpiod_chip_open.
>
> I hope this helps.
>
> Thanks,
>
> Catalin.

Hey Catalin,

Please next time send the patch inline using git's send-email command.

You're right about the error code check but it should actually be ret
< 0 as per asprintf's documentation.

Bart
