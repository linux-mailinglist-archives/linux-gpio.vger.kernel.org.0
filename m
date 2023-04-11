Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A668A6DDBD5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 15:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjDKNNr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 09:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjDKNNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 09:13:46 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2921A49EC
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 06:13:25 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id g13so7045657vsk.12
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 06:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218804;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zCQaZTyLCV+/nhJC9tdtIQLbpJtZD+39cB4GzP4NoSI=;
        b=5zy9HAXMzocuY1xVtNUdDhvLg3a+pxszvLa4C1Xyp4BEq3naKRGXvugB7RKLHQshd7
         Yies9QE01VOywvCJAPbpNemtHbecnc2FzzxbA/x/LcflHjn+sdmpmADbjCGXAi8TUHrn
         BqgEmI+frizu+85H2LPGMCzPJdSJyPU3KNdk29gNYlMVDspTK83PB3ipruHWNmjqxQeP
         uEBo0fFK+I+R8zLVsdIDjC3uP/rgV9H5lws5CyUKpYbM+KtyFq2siKIsRP42nYDjNB+L
         pxzfVVZcI1F03SGVE8r5p/nBpFkkA382QRHYCRNhtiGhs1rO67Nse18YPAute6zsQeVe
         AA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218804;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCQaZTyLCV+/nhJC9tdtIQLbpJtZD+39cB4GzP4NoSI=;
        b=i+vjpaqC7cic7/QUcHiXVgLyXGFOaeRbZpbU/kO4UiJNbigIzG2/aX7ZtSxpg1i5Dh
         zxMHWh3fw0A9enp53t6KRI+4U1e+41DGdYbiGTg7o8gO7b9cUVCokZghNYy4egAAPOiZ
         gfpts/8xEoQX3nTFBoU8eJhRItZeZl4o8xIfSqm0Md7SUkP/DxeAYUA0Zxc3sbiZkjCa
         tvW3J3UGJEwnP+L64UjUV+PNkZFx+e7xrsLl4nP1WVOr2NyRFKtjNWQq/jFNfwHgRTXY
         Rl2H/Lsb35WSnku2Oirv1r0FaYunRCNcHwuPQfVgvKY3avmU/JBylDvZHCq0eoBLtZfd
         12gw==
X-Gm-Message-State: AAQBX9fXQAIYKe3mnnk4ykn6gDWd0ZV2HaAw/QQcSBinBRZqBUoYQBT5
        JSNpkZvn36X8eE6ew7RDyMwJMh71/fV7MKqKIsVSSwA8Px679UAoof4=
X-Google-Smtp-Source: AKy350bdBKa/qqXQGidWY18rmtIG1JQu722bCYfKpCu6PSPQLPVor3W68xpfVzFeVUFMcohOY+LY/50KdxK7MpTLyhY=
X-Received: by 2002:a67:ca81:0:b0:426:7730:1b89 with SMTP id
 a1-20020a67ca81000000b0042677301b89mr1908027vsl.0.1681218803909; Tue, 11 Apr
 2023 06:13:23 -0700 (PDT)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 11 Apr 2023 15:13:13 +0200
Message-ID: <CAMRc=Mc13RiqSTHBqb304_HHetznRU9qCJAz69fWN47QvV4n3Q@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.0.1 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I've just tagged and released libgpiod v2.0.1. It's just a small bug-fix
release addressing some minor bugs found in v2.0.

The tarball and git tree are in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
