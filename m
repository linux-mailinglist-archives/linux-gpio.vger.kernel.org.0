Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666A37423CB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 12:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjF2KPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 06:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjF2KPO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 06:15:14 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7ED10F
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 03:15:12 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b8303cd32aso4328325ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 03:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688033711; x=1690625711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfzvLhGFR2gpzEGeSCGgmzy7SXc9XSjXyD4CdFPRIpM=;
        b=BptoxjldIipk40vmM/6b/ePeav2rHmReGrSoPjiNjEq+qa2IhI/yqNbl0yvOGRIe6Z
         j3xrIvrXl+ycRdTQ5QbsH7loXcVAMQSyqStSy5X8OegcJ4s4dnqgkVn/FCFo/l8pOi/3
         v4rgjNtD68BwRsn+uckbiGl3ISluS+h3VVE3JzaRTQej+/2CLfuItSewYlqG958qCZnu
         T7R0vwq4OGm238Klnoxm4ZGDILzMtAkK7bg3fbzYeNjrL91TGl3GBLR8PprA2vyLSbRD
         V13FLsSh+p/fgrR3b7XT9688Nb7C/snZ77IUF1cFmLFd3S+ZrFTOHf52NQ6jppDd6GcY
         xDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688033711; x=1690625711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfzvLhGFR2gpzEGeSCGgmzy7SXc9XSjXyD4CdFPRIpM=;
        b=ilKnrHY45LwkudyBJGWQ95/+jXMgXbwsUoHS91lExhIq3PZMt2PZThhL7M0p0Gt2rj
         3IOAIQ9oG8yIDt3RfduefGkvfEvPQNnEemsuo9sseR8pzYsKZcvbd/uW+lx9vd2RHSib
         30VD7CoB9VOExqMpxmxdKV9xIoCIOARANe0Arcmyn2/PORYj8c/thpZBIQBnw0fPsJPZ
         KUu4fsrjxhlIHzlDNcpCdouMPt7nlj4v4RjuZOQFG0MZCH6X07Pxf6rhkpCVs+vGkis2
         v9ZGsWnmmzALMlSXqnEw2bKXD0RC67ivRim2ayKQdzxsPw7mrVgNYhZNz5jT5w27LvJF
         Lb8g==
X-Gm-Message-State: AC+VfDyMITP5wtLTc2lraAx+cqhEAbLc2RhpZ/pnUG+AwrgBpgxMNkCa
        fVQNNbbZo4O4GjomKrZ7jSv4jJE9izU=
X-Google-Smtp-Source: ACHHUZ6Sy6OmRCKVEVs5M2GQobu8996nHdtkS00Tm02nJkQ8jrSimussRG1twSGZ4pvlkzQ2hO4vyQ==
X-Received: by 2002:a17:902:8ec3:b0:1b8:3e15:46a1 with SMTP id x3-20020a1709028ec300b001b83e1546a1mr3807157plo.67.1688033710924;
        Thu, 29 Jun 2023 03:15:10 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902a60d00b001b7f71ec608sm7394249plq.155.2023.06.29.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 03:15:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/2] minor build warning fixes
Date:   Thu, 29 Jun 2023 18:14:53 +0800
Message-ID: <20230629101455.127795-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes for a couple of minor warnings reported when building with a fresh
OS install.
The first fixes another typo in the examples makefile.
The second fixes another warning that is emitted by recent rust.

I note that with a fresh/minimal OS install the rust bindings still fail
to build due to a missing dependency on libclang and clang headers, but
that isn't tested for by configure - it fails during the build.

Kent Gibson (2):
  examples: fix typo in Makefile.am
  bindings: rust: fix unclear resolver warning

 bindings/rust/Cargo.toml | 2 ++
 examples/Makefile.am     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.41.0

