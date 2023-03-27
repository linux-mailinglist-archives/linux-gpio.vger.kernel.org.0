Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17AC6CB0B2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 23:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjC0V34 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 17:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjC0V34 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 17:29:56 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB66199C
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:29:54 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p204so12528836ybc.12
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679952594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eokYh2mwVh/DTudd2slWImFM/8e0vGGOwJl1TyEBiI=;
        b=s+fdhFj7nY8IJZfGqI5yPc0aTlu42TpK0Tkfvv9Nxq2chjKmUi40y/NaJcZPOlDwI1
         MIvIp3i5sx/iKHu2/tTMGo15hbq6FFuvkoRMFU+pqIT9cRnuBj6RKKLoL8HFZYJaHqOw
         oBUZBHHqByBZEkiCm7zGY0WlhQ1DcuOn8oh7HEniue1TTc2c0N4gsHnJn+d3TkW/pGme
         auwzjg5qtGj2P5KaXoVRSCruxs6pXRL7Bak4P5XZawS6evZmWZ1h2XhZaqM/t7FJV0kr
         EhdpRvgN8eCpc2gVYQa2OHHeqTwrb38BYE1E9HtjwZVDtPVw8at4CYDSsOtRW4L1zY4V
         G1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eokYh2mwVh/DTudd2slWImFM/8e0vGGOwJl1TyEBiI=;
        b=gdsDSCIoFovaDRBUzPhUrmPvNzOVJU/3uAYCYJFvdzX/09qDmAZLawS5v1TOUqs5HJ
         zVKlGm8t7LHVXG0pDg9WYo6Y+d26HMCkGaryYeEamimrZX38ZwLnV4v0WwIFk+qje+kc
         hzBoTzfi+2XeioSnlRQy5NXhdFunOHew9G9KUhkvyutwIcVQjq3EGiBGvxsQbQM/H0DD
         mEniMdb/GbqMgsnK9Piqskv7hhyAdTY05gdhVlJkzH1UcfQODvtBq2J4/vkX0I+oTAtT
         986DS0OMrrQUkXjksIGiY481iWIDtBLc7ezMc0ASk1l/exlWsraQ931paRXF/uALhYKF
         rlGg==
X-Gm-Message-State: AAQBX9d2LX5ZYnuQ0q8kcPqvzDu584+vt+GiMG3djD5lB5gzm86ZxEEU
        T1YIW/bBQvpBULNLgHDp09mp33dZY9Vmdfzxu/8WOA==
X-Google-Smtp-Source: AKy350ZAKVAse0mC10rU5n8wZJQnHt3lpd51pDvlIGvq9OSoCcQ3+AoSryc4gyyFW9osAo5AJdwLqNfhU2xJTPyvKhs=
X-Received: by 2002:a25:8712:0:b0:b74:3236:2fac with SMTP id
 a18-20020a258712000000b00b7432362facmr8032860ybl.4.1679952593878; Mon, 27 Mar
 2023 14:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679907618.git.geert+renesas@glider.be>
In-Reply-To: <cover.1679907618.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:29:42 +0200
Message-ID: <CACRpkdbrQYd_hJ3CaQEBpuD0GwfR2eqQFQ2ZFLkLKREP3GFQ+w@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 27, 2023 at 11:03=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.4-tag1
>
> for you to fetch changes up to 9d7558ed8372c51cbed011cb1dc3eb1beee212cf:
>
>   pinctrl: renesas: Drop support for Renesas-specific properties (2023-03=
-16 16:55:27 +0100)

Pulled into my devel branch!

Thanks Geert!

Yours,
Linus Walleij
