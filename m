Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A89D6FFB4A
	for <lists+linux-gpio@lfdr.de>; Thu, 11 May 2023 22:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjEKU2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 May 2023 16:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239233AbjEKU2j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2023 16:28:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D736EBD
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 13:28:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30786c6082dso4588763f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683836915; x=1686428915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMd5xR53GNb+x9w6wY02eLBsxHW43rKgLD8CcsFceWQ=;
        b=CTcD29CFdUg0qSUXsoNexSGIkb8XZpk00GdD9Njwg7hHjGscjJK7JhiNcayMDFDHcV
         2djNWTGQrYQkm1N7n3N7n+Nt7wTVPWo8zqC7aa//vuWKryopGLjEFplhwvR9WkLRV4lZ
         4VaOzKKAL4jWqYqoPOGGwfy0TmUdJne6gW2El/+U82bkWdf1hyaHeD9R1iIplEh5BsuH
         xdbmZ9UHtARN3WcSX65XnYPjlpTs5J6YPgrv1tBB8XXEe8Pvt8LaNNwpiRDHGJ3TCWkj
         k6gul9CwH2P4PrO2QPB5gI6fFqi6jvIM3DG4j3E4iXXyNSridgpxKu2YkKXxI2f2c7P+
         TAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683836915; x=1686428915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMd5xR53GNb+x9w6wY02eLBsxHW43rKgLD8CcsFceWQ=;
        b=TiLAYsyLbEdAw0LtozijP5SF5IcKfRyYaaGR2bNSJp7d0Z6EWmqbNI3cj0M1MQqG5W
         Lzq+2YvwWI8uS0m/+LHzWceJLxTYpJjSeVebT0r3NCR3gz+yrgwYuob0jtzbDXprilJP
         sSH0PmcHyEV+XB0tCQ/74F80qCASYYJ90xihJk69X+9F5+FTNuMmmMV7J3PCrT0WHyOw
         4X9tAQZOataTflG5rr5PbjM6jm3LaEw5E8aCDauM94/wrhnsIfEKLlys1SjZ9onR11W+
         Hr/Mv1CPL8nCo2lOED5diYaJiPk9AEY/kdkl37kTPkgz19nfCzvI7UMWRj0xqYDqs5HL
         LhIw==
X-Gm-Message-State: AC+VfDzGUG9pY7UoX//qPjKC+j9lafCmszb7h/tTDC5nrdS9OvsEfcuy
        RjVSHsnvhrzZhZUMnWKV6rdBO4/DcjA=
X-Google-Smtp-Source: ACHHUZ7vAeOWenffOwO8saIwe6wnZJpvRFhMBAsUzph6g/eN1G1nzoYki0h/RR5jA8xpjKA0x7zwvA==
X-Received: by 2002:adf:e48b:0:b0:2f5:8e8b:572c with SMTP id i11-20020adfe48b000000b002f58e8b572cmr14754550wrm.49.1683836915602;
        Thu, 11 May 2023 13:28:35 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d558e000000b003079f2c2de7sm10006368wrv.112.2023.05.11.13.28.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 13:28:35 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod] Python bindings don't allow to wait on events indefinitely
Date:   Thu, 11 May 2023 22:28:34 +0200
Message-ID: <3545766.4eto28bQOc@archbook>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
as passed to ppoll could ever be NULL. This means waiting indefinitely
was impossible.

I thought hey, maybe the new Python bindings in libgpiod 2.x fixed this,
but no, it has made it worse by explicitly setting timeout to 0 seconds
if it's None[1]. Obviously, this behaviour can't be changed now, because
people depend on this API to return immediately now with None as the
parameter, and changing it to wait indefinitely would no doubt break
actual programs.

So I'm left wondering if there's a particular reason users of these
bindings shouldn't wait on events indefinitely or if that same mistake
was just made twice in a row.

Is there some way the API could be enhanced to support waiting for
events indefinitely without having to slap a While True with
an arbitrarily high timeout around every single invocation?

Regards,
Nicolas Frattaroli

[1]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/gpiod/internal.py#n11


