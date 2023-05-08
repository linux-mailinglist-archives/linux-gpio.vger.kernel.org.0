Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 214C36FB0E7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 15:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjEHNKy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 8 May 2023 09:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 09:10:53 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7520886BF;
        Mon,  8 May 2023 06:10:52 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a214572e8so69184227b3.0;
        Mon, 08 May 2023 06:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551451; x=1686143451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykhKyFpjfaIdSOnZJ7Do2c8aQ+LekD86dDNRHHV96Ek=;
        b=gq5Wsh/Uc8cHwqeb11UAkKR2B/Hcu3LiXoNUIDsx0g5Y5EZ3Mc9Z2fPd+YldqaHcof
         gZtSzORRpTO5iJTdPccALiYNAP92rHu2OQVFZHupij5oTa1PfJFILJBad/495elTvxH1
         NILpfTkhceJzbdtVtjuZ+ckyBXcboSl8XRuvpuuBGdVuPe3GRdReoFUxt2BsPDLwGd6y
         8W1cMx62pRVrg7qmi/8Cokhx/e3CCLqU0kMPlTHxHKYhnZoUx6kf/orfzRkB66106D+s
         3FI6RMC/VBXurdaoeobJMPQ1sjh9DXjy+4mn8FCFiZgZEBE9/ZXeWAZxBipT8ce2OY+9
         rZ6w==
X-Gm-Message-State: AC+VfDyxEDgb2WcaVSmDlKB73+kXtpy0yoRFIMEs5yjvJrU72UQKw0wS
        BFBj0ibNFITyjGB1MKioEPF3iFc3gfDFLA==
X-Google-Smtp-Source: ACHHUZ4Trlv3+ZZ+EP31K7zBZjMz5Wlh+lpp4j7wlKwTftN7H3e9PvkNn4hVeWvfBYvpil99+tGxpg==
X-Received: by 2002:a0d:c206:0:b0:55a:3718:5270 with SMTP id e6-20020a0dc206000000b0055a37185270mr10644497ywd.14.1683551451341;
        Mon, 08 May 2023 06:10:51 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id z128-20020a816586000000b00545dc7c4a9esm2489835ywb.111.2023.05.08.06.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:10:50 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-b9d7659d89fso6053734276.1;
        Mon, 08 May 2023 06:10:50 -0700 (PDT)
X-Received: by 2002:a25:a4c5:0:b0:b9a:7a9c:98a1 with SMTP id
 g63-20020a25a4c5000000b00b9a7a9c98a1mr8749074ybi.33.1683551450368; Mon, 08
 May 2023 06:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230507130120.7587-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507130120.7587-1-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:10:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVd_8TBib2fgP=43mtd_wpV7Qkj1NpRTU-zqwQMvPFWvw@mail.gmail.com>
Message-ID: <CAMuHMdVd_8TBib2fgP=43mtd_wpV7Qkj1NpRTU-zqwQMvPFWvw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Fix spaces followed by tabs
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 7, 2023 at 3:01 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Perform 's@ \t@\t\t@g' so we wouldn't have spaces followed by tabs.
> No functional change.
>
> Picked from U-Boot commit 0cf207ec01c ("WS cleanup: remove SPACE(s) followed by TAB")
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. I'm honored to queue Wolfgang's legacy in renesas-pinctrl-for-v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
