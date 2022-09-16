Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B075BB0ED
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 18:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiIPQMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 12:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiIPQMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 12:12:40 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA4DB5A43
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 09:12:39 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id e3so8051671uax.4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=Mo+piMWsiG3sKmnLlwDtlZKrz7eDaHcxnak2b5fFmPMV/K6dHcVKw9UR6/W0FBfDwh
         J2F3JtiwzNeE1s/Pu0ip8tZg53Lcix5i9jtZI2mIKiYJevUMt4oVPG/jBu2aUTYbJBMO
         WWUR32viY/mtbB/dx+tcrJtzqpPIjPlUYiDfxdBR7qcoPSYTrQeAU1+okKpGTbEYdx8o
         0Jaai4mnHnE43648VU1wXdjwYxwRoXBDLdWUwIeEc/CVg7UrHh4dpYc0ZpkAQ8QMAbfj
         ZaR9zS1nVXMgQfJ1dvWxRi3xrBPEARP6ekubjcVY7xNgK+n3bfeJDgEHkmMsAsEaK/Of
         IDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=rQxcfg5bBEhX8G1o9RBbfs8NHoudXdfksgWUFCUne1QJj6503cQcODzojiQch/MdgC
         UrTR2k36tEAKBu/PszXHB2yRBffLlvq/0q+MF6e6pb4qmkEhfMliVAH27tVC5PyicJTA
         6w6KAIR0cpC8hswFg+Cikk50wAOE7mXwdXAoYBpA4pWPDbeWgtUbVcrPjTpRMAycY5ZV
         vL1iDszE9CtmJcevBV7Ed8Eg1AGl7XK2D6cBZRoM3P35/aTP0VImchBF9z0xs7pKzBMP
         MnK5QCPlSIh6SlulF9vb6QkokU2Pi168xH810ZmlTao5eQcxorXdn5RNF1GiM2WMbBuf
         WX+g==
X-Gm-Message-State: ACrzQf1NwkrGhoib6cnyitl2WYTpC3Yscz6nTmvZjjPkNvcQuECjmpDU
        o0G16JOOXxOb0HyDGXE33kp3mDAm9sqkAtszg0UUj8gc
X-Google-Smtp-Source: AMsMyM40PtHrSYpaDFKLpXwDLj5IOTkWMhE3CWey2Nwc8KtlTTEUY7PzAV6ziUg/6KaCFBcIO0RVoqceQSZ0SRwO4Ew=
X-Received: by 2002:a05:6130:c13:b0:39f:58bb:d51c with SMTP id
 cg19-20020a0561300c1300b0039f58bbd51cmr2378788uab.104.1663344758991; Fri, 16
 Sep 2022 09:12:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:f6d9:0:0:0:0:0 with HTTP; Fri, 16 Sep 2022 09:12:38
 -0700 (PDT)
Reply-To: maryalbertt00045@gmail.com
From:   Mary Albert <alassisidemion@gmail.com>
Date:   Fri, 16 Sep 2022 17:12:38 +0100
Message-ID: <CAG8=QagrokadNhKPHeQzA+nhLvrnBLR15W6HGeeafsa352aOOA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Hello,
how are you?
