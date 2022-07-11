Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C64F56D786
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 10:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiGKIOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 04:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiGKIOa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 04:14:30 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7BA1DA4D
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:14:24 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id fd6so5260474edb.5
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KrQxX2gBzZZDVhE/CShD3Z/x258B1REM+4UC78XOk2s=;
        b=KXAmxk+0HNlzIi8DXKhRIRXjspRVhtV48M6fwP2cLApGSpYu170jcyzHJllf5wOsSI
         LT4T6Owan1XfawL3IYYWnhz0fB7CKhvXirocJa8hjlDUKkK5qVfK3ohDVoBuFgeqWSea
         Fb2JoOlLKQrBoOuvD1Wea3SeE11TM4VNzFLAPOOlndYDas7vghL2ojFbuwUmt2DzNCom
         KmsKSbcJurfnhnsQGs0ML1bUcumpZsLMTDDikNJfuX3v5PqEFfTI17+Jn+HS3Kddd5At
         nq5sXQ5xPmZgRtYwVQTFWcPLM6tVPjlM/BMwCh96hl+I7DwAWZq+g/QXWa3mnZsgw6lN
         218g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KrQxX2gBzZZDVhE/CShD3Z/x258B1REM+4UC78XOk2s=;
        b=fIauNmSNHI4vFOhyRZtkCXCqGUDxFU9elVfUKFEeJKObqz5rC9enJOGZdNyjbqjpE/
         iCSWRsCZXBaGLijBvMjxCVgNkWqD4431XRRCUZRL2RRVQeiwy/Sz7ybOIXbqTQnXLiBx
         xenjJ5E02P0IiT7LUzgI//v+6Oo4MjCd6Jlt/SjbPVaSVmantNHz31F4ViUwV00r3YC4
         5sfeUo+rIKSJ0//uMwrY3DXxKsIGKnc0Aw6ajmsUIwOTtS3nszjeZ5c6/C2jzOEYn+BR
         TdybwZi1DOuGCFq9V56OqMNakx4yije2/bnL5u2x729JCy1oRD7Cp9CUKGPM7TKXwA0x
         g0BQ==
X-Gm-Message-State: AJIora/xHZyosGO9g/8nF7Wj0qg+InESD7uAAxR9dJ2Q1Nl4fN4OBFpb
        5Ib9S+SI/cBFojP9BwTBqnKsb6mE8oVT4GVAwI7gOQ==
X-Google-Smtp-Source: AGRyM1scrRYWLqCYq5WRtEI1PajwTXnuQOKqExjsTLS3nzYMWx983yp80SN9DpgfmK8eabci7I//7Kq1QPljFamVWgM=
X-Received: by 2002:a05:6402:430f:b0:43a:d521:bda with SMTP id
 m15-20020a056402430f00b0043ad5210bdamr5417174edc.69.1657527262617; Mon, 11
 Jul 2022 01:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220711052935.2322-1-aakashsensharma@gmail.com>
In-Reply-To: <20220711052935.2322-1-aakashsensharma@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Jul 2022 10:14:11 +0200
Message-ID: <CAMRc=MefDXzawodvNYWS8h-fzdeUhmSCFjOFwfkALpB-a0PjCw@mail.gmail.com>
Subject: Re: [PATCH] gpio/gpio-lp3943: unsigned to unsigned int cleanup
To:     Shinyzenith <aakashsensharma@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 11, 2022 at 7:29 AM Shinyzenith <aakashsensharma@gmail.com> wrote:
>
> Getting rid of checkpatch findings. No functional changes.
>
> Signed-off-by: Shinyzenith <aakashsensharma@gmail.com>
> ---

Applied with a tweaked commit message.

Bart
