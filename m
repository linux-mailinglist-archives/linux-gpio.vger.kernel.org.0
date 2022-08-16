Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345CE596173
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 19:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiHPRv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 13:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiHPRvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 13:51:25 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1E18274B
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 10:51:24 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x23so9872738pll.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc;
        bh=RbaNAykcpDOIPZgva/ajE5ZWlKgiZP6tEJa4cvIpQF8=;
        b=ENsHgIzwnhVx4DF7BUyVUTYnC5sCisdMBtHT5f6vp85q6GsrTlWC4qu71gLPyQ3cdT
         E+biDbOGRTQWwAvpio/9Zpf89uZvRkz6zlJLi+hG1uT3C4Ruka5y4Sq0rEU949YUqf8y
         uCqXfpQ2b7XhYaesQHf2Nigtyahhr4O6Aec3ABQWZdgC9sYIqghi1pwwYjRNSS2kfjTm
         rbLn/NWPT4MTAdZqzfxpLCRfGmo7uXwJwqQa7ol+E17GZYibN6HGrpuxyn0sgA/xvk2c
         1V/yauTMP7nIKIZ8QMzHcgoyuu0OI+0bxW7rYcpRq7NxdeokX7IdugxUSDkTB+ZILYks
         qY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc;
        bh=RbaNAykcpDOIPZgva/ajE5ZWlKgiZP6tEJa4cvIpQF8=;
        b=1ZX9gfo/dYJmLsADGzdFuXxZjkGKLXvItHGFZazJ52qKO27pMuURScK7x/odZ+2tjl
         omb3+SjfiISTettHrxLTs6U3RzspYgYh9D6EPT66B72uKl6EHUB1n9R2g8YOkBYfOTIB
         JExzJKEcgLOSiMBEw22PKA5Y4tP4cm3x7TS/9BIhGjqOs3N+DuAFby/JmqIrgvWGiylT
         LA/RlRWlcRllcDFcX84sU8v0gl3+WbmYbXG1X6g6zSUQe3AXkO5kue63bml6Y+bskqeR
         3kLJN4T70+OtXZUbq1Nf8dCy5Nb6WgQGIS6+Lrv4jFEtLVFVzRcI5RN0uPFf95ibZpFK
         33fg==
X-Gm-Message-State: ACgBeo3e5G4G6IrPKPdUYLk6uuaVFeOSnGjuuxdzkEJceNhK65VR2s7j
        o9oJbp9jVJeCm48HZApat0kglA==
X-Google-Smtp-Source: AA6agR7Z7IrnODEruM45JvKYV2xq2wMfkkPPligbGoaGMu92QHvSdg+WaCCHuMjP78wYWAC1V24YkA==
X-Received: by 2002:a17:90b:1d03:b0:1f4:f3f4:ffdb with SMTP id on3-20020a17090b1d0300b001f4f3f4ffdbmr23991906pjb.215.1660672283493;
        Tue, 16 Aug 2022 10:51:23 -0700 (PDT)
Received: from localhost ([76.146.1.42])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902e1ca00b0017297a6b39dsm46408pla.265.2022.08.16.10.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:51:22 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>,
        Matt Porter <mporter@konsulko.com>
Subject: Re: [PATCH] ARM: davinci: Delete DM644x board files
In-Reply-To: <CACRpkdZbBRGcf4bn5CYWZuKZDWjWwwB8_LKprOroiD-ni9_tYQ@mail.gmail.com>
References: <20220701120111.779348-1-linus.walleij@linaro.org>
 <CACRpkdZbBRGcf4bn5CYWZuKZDWjWwwB8_LKprOroiD-ni9_tYQ@mail.gmail.com>
Date:   Tue, 16 Aug 2022 10:51:22 -0700
Message-ID: <7hbkskvzz9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Fri, Jul 1, 2022 at 2:03 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> The interest of maintaining the DaVinci DM644x board files seems
>> very low. Patches to convert the EVM board to use GPIO descriptors
>> has not been reviewed, tested or merged for several merge
>> windows in a row, see link below.
>>
>> When I look in the logs for the board files I see nothing but
>> generic kernel maintenance and no testing on real hardware for
>> years.
>>
>> I conclude the DM644x board files are unused and can be deleted.
>>
>> Cc: Arnd Bergmann <arnd@kernel.org>
>> Cc: Matt Porter <mporter@konsulko.com>
>> Cc: Sekhar Nori <nsekhar@ti.com>
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Link: https://lore.kernel.org/linux-arm-kernel/20220507124536.171930-1-linus.walleij@linaro.org/
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> I realized Kevin Hilman wrote the original support code and might have
> this board in his test farm in the shed so paging Kevin too.

Acked-by: Kevin Hilman <khilman@baylibre.com>

Until a year or so ago, I was still boot testing some davinci platforms
in "legacy" mode via board files, but I stopped.  Since then my DM644x
died completely, so I don't even have this platform anymore for testing.

Kevin

P.S. Sorry for the lag, just catching up after taking some summer time off.

