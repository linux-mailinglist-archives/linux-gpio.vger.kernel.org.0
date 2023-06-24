Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4C673C6E5
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jun 2023 07:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjFXFVG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jun 2023 01:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjFXFVF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Jun 2023 01:21:05 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D232703
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:04 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-630019ff99bso12260746d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584063; x=1690176063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XpfuJPuaZ8bmPJlPUPHw+N4b0Bq9YKnaKm8vkrN114I=;
        b=qzk8K4plLNooZaX8Y1A1GzL3f43knn8sY/d+rMBdPcry7bEw4lOa6bCCQj+1CnRU1F
         1coh+vBbCfEMONyFEhSm04BlB8uaJS41QQ/0EvLcarMpqL7V6K+f5/DsvOBD/5//epny
         BRsbqdA5gz+g1laxSXbQ5TTcuEQLJxb9IJvOUogfFDxwfrA/cfb8JRztj4nPf1DczCfs
         yylpYVjnzjZgdbY9jvIzJJBCuUuBVOJna4GfooyBitAc3xTIXofJ2Eiyv8vW7rTCNdeS
         8N3yZiqBz79a2f1Z/j1rxnseWFBqu38prLXZF70LYkmFrLD4ZT5DD4YF1jhvAWSY0wtY
         WTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584063; x=1690176063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpfuJPuaZ8bmPJlPUPHw+N4b0Bq9YKnaKm8vkrN114I=;
        b=Gm2KIlfGAq2giWvoBEtMdtDSYxQAUkMdYLzmdATARUoOQ/6ZECEdCZrgBhcycevesZ
         6MwEZumbVHC9zLlxw/stwUQQdK7klAS5MSIHXJQSKZ6GTRH7kJFNfVauSdvTx+dkPGfU
         htl+iu0JMBQStsT01Xi2yRAqyG2cQWPT0zSOXNVACgEA2phuW+NSuiFIZpt9QCS8x3Uq
         mAekWbmlp5zTdDKCM5y2IkDhAPtmVh3AZ20JfJUPUMcehZa0FuvhJtBwLY89gm9Gbi0p
         42+JjK8ZKv5R9Zj2N2bfYQIZ0kLjE3Qh4qr84/aJsMOzF6VQcV1pPGpGWAoGfrAnVhjc
         TJiA==
X-Gm-Message-State: AC+VfDzsmyAfKeqoBmywDAM9Vk2XWoTxvEpJ//iKRH11GcRgjGqJjHWA
        T3eh+02DkPqgDjOnb6BWZg4kutINGAQ=
X-Google-Smtp-Source: ACHHUZ66I0Y7mocV0hB2eZIMWP+txw3a1NztnCZ+ruTjnFMo213szHNqRXgsxW0VEaItE7lHGnXYsg==
X-Received: by 2002:a05:6214:f29:b0:625:aa1a:b6d9 with SMTP id iw9-20020a0562140f2900b00625aa1ab6d9mr29408512qvb.59.1687584063044;
        Fri, 23 Jun 2023 22:21:03 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00256dff5f8e3sm487103pjb.49.2023.06.23.22.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:21:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/4] python examples and comment corrections
Date:   Sat, 24 Jun 2023 13:20:50 +0800
Message-ID: <20230624052054.13206-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The first patch is the updated 6/8 patch from my recent series.
The updates are as per the review comments, except for renaming gpio_chips()
to generate_gpio_chips(), rather than get_gpio_chips(), to indicate the paths
are being generated not returned as a list.
Changes:
  - rename gpio_chips()
  - shorten reconfigure_input_to_output file comment
  - use format style prints

The other patches are updates to the file comments to make them consistent
with the updated python and to fix some cut-and-paste errors I noticed
along the way.

Cheers,
Kent.

Kent Gibson (4):
  bindings: python: examples: replace tools examples with use case
    examples
  core: examples: fix file comments
  cxx: examples: file comment consistency
  rust: examples: file comment consistency

 .../examples/reconfigure_input_to_output.cpp  |  4 +-
 bindings/python/examples/Makefile.am          | 18 +++----
 bindings/python/examples/find_line_by_name.py | 37 +++++++++++++++
 bindings/python/examples/get_chip_info.py     | 20 ++++++++
 bindings/python/examples/get_line_info.py     | 29 ++++++++++++
 .../examples/get_multiple_line_values.py      | 29 ++++++++++++
 bindings/python/examples/gpiodetect.py        | 15 ------
 bindings/python/examples/gpiofind.py          | 20 --------
 bindings/python/examples/gpioget.py           | 29 ------------
 bindings/python/examples/gpioinfo.py          | 28 -----------
 bindings/python/examples/gpiomon.py           | 26 ----------
 bindings/python/examples/gpionotify.py        | 21 ---------
 bindings/python/examples/gpioset.py           | 36 --------------
 bindings/python/examples/helpers.py           | 15 ------
 .../examples/reconfigure_input_to_output.py   | 39 +++++++++++++++
 .../examples/toggle_multiple_line_values.py   | 47 +++++++++++++++++++
 bindings/python/examples/watch_line_info.py   | 23 +++++++++
 bindings/python/examples/watch_line_rising.py | 31 ++++++++++++
 .../examples/watch_multiple_line_values.py    | 42 +++++++++++++++++
 .../examples/reconfigure_input_to_output.rs   |  2 +-
 examples/async_watch_line_value.c             |  2 +-
 examples/get_multiple_line_values.c           |  2 +-
 examples/reconfigure_input_to_output.c        |  5 +-
 examples/watch_multiple_line_values.c         |  2 +-
 24 files changed, 317 insertions(+), 205 deletions(-)
 create mode 100755 bindings/python/examples/find_line_by_name.py
 create mode 100755 bindings/python/examples/get_chip_info.py
 create mode 100755 bindings/python/examples/get_line_info.py
 create mode 100755 bindings/python/examples/get_multiple_line_values.py
 delete mode 100755 bindings/python/examples/gpiodetect.py
 delete mode 100755 bindings/python/examples/gpiofind.py
 delete mode 100755 bindings/python/examples/gpioget.py
 delete mode 100755 bindings/python/examples/gpioinfo.py
 delete mode 100755 bindings/python/examples/gpiomon.py
 delete mode 100755 bindings/python/examples/gpionotify.py
 delete mode 100755 bindings/python/examples/gpioset.py
 delete mode 100644 bindings/python/examples/helpers.py
 create mode 100755 bindings/python/examples/reconfigure_input_to_output.py
 create mode 100755 bindings/python/examples/toggle_multiple_line_values.py
 create mode 100755 bindings/python/examples/watch_line_info.py
 create mode 100755 bindings/python/examples/watch_line_rising.py
 create mode 100755 bindings/python/examples/watch_multiple_line_values.py

-- 
2.41.0

