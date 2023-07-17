Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 466B6756FB0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jul 2023 00:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjGQWSk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jul 2023 18:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjGQWSk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2023 18:18:40 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BB4B2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2023 15:18:38 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b8b2886364so29665605ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2023 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689632318; x=1692224318;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD4BjHPOaPvPr1/ZZH1VcvVcxozEk2rDCyg0WbaFdM0=;
        b=OnEaqeNtCg1y9PEkZToJx2qXKEpDTMIHfEjo9ryLGWce5Ez6iQkzNNaszSrdQltpTL
         JXSC+GLoy3jOttu57R7ZAIwbUehfwyNhFg1I+PDJekFzYWFxHQcUm0C1k9fC9r3kDjhC
         dTZYe0oQC5OSUyy7kJFaTWKZMzaoJPBSXJPMlaqHUOOt/0BGyucCnHTij+ME3iCdIs9A
         7OK9fU4EHjNokBTr/ZQz2q2lb2r+5OmZHkNGOS4DURfxmkrazoxq74f6bawmREa/HOKa
         49+qt/GXwpmhPz0tugsFR0D8hcOkHkBHIzFJTZ4GmTok+AJmrOEtKSbdLCMwZRTaQ289
         BPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689632318; x=1692224318;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD4BjHPOaPvPr1/ZZH1VcvVcxozEk2rDCyg0WbaFdM0=;
        b=YxgNInmtOVZMPkzY8BnP1uc5ZFnVDOk9HHsfzvd/Vm9L0LAYfjBITnWIvJP1b2ZzaM
         afCzY2MxB+XZz+CE+yYr5TNP60zhNOCCmNvsCyXkWzR4YLrb2WuzDOoW8a7Dj7lEwEH8
         aaHC0FxVScpGG/vyODugGNoNYsxMQZ2ey1+5xFuNO9YFWJTw04jxmpcHbaBE3ONN9a8x
         MXoH9vHEfB3Yz27dm3ZJxsUttMtOAhyElOxGhrB56K3f6I9GUOwI3pcXECCoBlsGAhHd
         VQR9IR2V9UECCMkTynzs4Rkf1sOoGd1RGKxObKrjc6pqopGzZJX5fKA04TfPoVpibC4k
         2Ehg==
X-Gm-Message-State: ABy/qLZ7NflXUaSLsxC/Y2m/ZfkN2KyjBBJ3ZM05ztJrhXkHaDp8Gho/
        1xxWY6iZQ3I/VpL2IFJ77xVNeg==
X-Google-Smtp-Source: APBJJlFCoJLDAUxqFw0dB+P8rAgMXcfpmuYuSibNfv2fY+vaqMAXJSMIot/x+H9QjSqYhbia0z9zzA==
X-Received: by 2002:a17:902:ab8e:b0:1b8:30d8:bc45 with SMTP id f14-20020a170902ab8e00b001b830d8bc45mr9837542plr.47.1689632318070;
        Mon, 17 Jul 2023 15:18:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:1b01:c1c0:7ab6:977d:bcfe])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c11100b001b80d411e5bsm329926pli.253.2023.07.17.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 15:18:37 -0700 (PDT)
Date:   Mon, 17 Jul 2023 15:18:37 -0700 (PDT)
X-Google-Original-Date: Mon, 17 Jul 2023 15:17:49 PDT (-0700)
Subject:     Re: [PATCH 0/2] gpio: sifive: Module support
In-Reply-To: <20230717205357.2779473-1-samuel.holland@sifive.com>
CC:     linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org,
        robh+dt@kernel.org, frowand.list@gmail.com,
        samuel.holland@sifive.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     samuel.holland@sifive.com
Message-ID: <mhng-af1916da-8846-4b63-a3c9-4bc3a50c0646@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 17 Jul 2023 13:53:55 PDT (-0700), samuel.holland@sifive.com wrote:
> With of_irq_count() exported, the SiFive GPIO driver can be built as a
> module. This helps to minimize the size of a multiplatform kernel, and
> is required by some downstream distributions (Android GKI).
>
>
> Samuel Holland (2):
>   of/irq: Export of_irq_count()
>   gpio: sifive: Allow building the driver as a module
>
>  drivers/gpio/Kconfig       | 2 +-
>  drivers/gpio/gpio-sifive.c | 4 +++-
>  drivers/of/irq.c           | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I guess we probably should have just done that the first time around?  
Either way it seems reasonable to me, aside from sorting out the OF 
stuff.
