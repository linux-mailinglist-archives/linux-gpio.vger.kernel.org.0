Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A638472F348
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 05:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbjFNDzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 23:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbjFNDyt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 23:54:49 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B158BC2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:54:47 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b3f66dda65so8574825ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714887; x=1689306887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzcyy/KdVEYMKkbc+dVqEReREnigZLt//nKy4h5Xn/U=;
        b=QWWO02wma2Ni5Ti8L0oY2iH/OKm5TSu1Qgyzyg0SSvoMJ92xc24LKU6bJFtjF+5bKN
         JRBIEMjMGcCNWo3kjfHB9TuJDZ5CXoCZ7FAZqHjqJgeX6XPOBcyACp38nU02tTZTfZNd
         qxyepHy1I+9TyqOLWfz9swJddw741ne9E5r4Y0mEvZKafuIidwp/MToGFXXC0UN/iq5W
         u8sU8qnyn2HAH9BQX8ZsSFEZ5Z4aHlmuM5xzXN390DY5IWgl5WCJkvH3YmKPF0JZpb97
         JeiYNxxjvqwov510ZSJeFaSyfs4debThTxLZQgNFnHsa1T6eq9S7c0fOiYqH++cEw/Dz
         BzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714887; x=1689306887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzcyy/KdVEYMKkbc+dVqEReREnigZLt//nKy4h5Xn/U=;
        b=A6pB9m/rUz4uGlGtbQzrUfIrZpnnftOJKL4R/p1BBSqy5nxxqslQstf17XcuuiWl8x
         khtjci796I4Y0ki+lTmA96JT71mTgqEQw/UkZfDRsmng6ZTCtF3xNJXXWDipuk8yjyKL
         t5VhdOSjMwxeyUuXyCHWqBcXdhcnOEz4XZEDa0fLGUJ48jS+R7CGROkM6LDfeJlGNMw8
         WqfS5OWFhZNpuwQkCq+t3kRJfC68DE5NAgA02FzUCdqrKSLopF3LYK8vpAnP2l/VP5zr
         zzMJCOnkmBkKZdme2A9nike06RqRih9BnNytsggxD4AzUkrn7qhoYX24StJd6lLuFmLV
         91Ng==
X-Gm-Message-State: AC+VfDwlMS6rleLpYIl48QaBtcPmEtOwUDg/K+hkOqcjybOsrymPia91
        DZYYgxV6Nz+Z1XuU6zSJ3+b54nPFqh8=
X-Google-Smtp-Source: ACHHUZ7CaDV0B2Bb2j1qWJoYwSzxpZfQ7NXciKp4Fe+lIHeXiVRy4GI5u/sWLjCvoxy8iPiSFKb6/w==
X-Received: by 2002:a17:902:ab5e:b0:1b5:1ba:aad6 with SMTP id ij30-20020a170902ab5e00b001b501baaad6mr163764plb.4.1686714886817;
        Tue, 13 Jun 2023 20:54:46 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001ae6fe84244sm10967412plh.243.2023.06.13.20.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:54:46 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/4] dedicated examples
Date:   Wed, 14 Jun 2023 11:54:22 +0800
Message-Id: <20230614035426.15097-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
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

This series forms the basis of a proposal to rework the libgpiod
examples.

IMHO, the examples have a number of issues including:
 - no C examples other than the tools - which have become too complicated
   to be fit for that purpose.
 - bindings examples focus on simplifications of the tools rather than
   demonstrating typical use cases.
 - being more complex than necessary to demonstrate a particular use case.
 - naming that does not help new users identify the example that
   demonstrates a particular use case.

To address these issues I propose adding a set of dedicated examples,
each of which demonstrates one primary use case with as little
additional fat as possible.  Each example should be named after the use
case it demonstrates.  Each examples should be implemented for all
supported languages, to provide examples for users considering
language choice and for developers to compare the APIs and identify
areas for improvement.

The examples are explicitly intended to answer "how do I use libgpiod to
do xxx" questions, with as few distractions as possible.

The examples may demonstrate ancillary features, as long as that is
relevant to the primary use case. e.g. the watch_line_value examples
set the line bias and debounce.

The examples should hard code input parameters, not pull them from the
command line or environment, as that is distracting and frequently more
complicated than the example itself.

The examples should be standalone - they should not share code.  Large
chunks of shared code are an indicator that libgpiod probably needs to
provide additional functionality to simplify use cases.

The examples are not intended to be distributed in binary form, but
could be incorporated into the documentation.

The set of examples provided is a starter set that answer the following
questions:
 - how do you get the value of a line?
 - how do you set the value of a line?
 - how do you watch for edge events on a line?
 - how do you watch for edge events asynchronously (e.g. using poll())?

I didn't add the latter in Rust as that should be done using one of the
many available async reactors and I didn't want to pick one or pull in
any dependencies.

I expect that this proposal may be contraversial, and that is one of the
reasons I've kept the starter set small.

Cheers,
Kent.

Kent Gibson (4):
  core: examples: add dedicated examples
  bindings: cxx: examples: add dedicated examples
  bindings: python: examples: add dedicated examples
  bindings: rust: examples: add dedicated examples

 Makefile.am                                   |   6 +
 bindings/cxx/examples/.gitignore              |   4 +
 bindings/cxx/examples/Makefile.am             |  14 +-
 .../cxx/examples/async_watch_line_value.cpp   |  78 ++++++++++
 bindings/cxx/examples/get_line_value.cpp      |  29 ++++
 bindings/cxx/examples/toggle_line_value.cpp   |  45 ++++++
 bindings/cxx/examples/watch_line_value.cpp    |  62 ++++++++
 .../python/examples/async_watch_line_value.py |  47 ++++++
 bindings/python/examples/get_line_value.py    |  26 ++++
 bindings/python/examples/toggle_line_value.py |  47 ++++++
 bindings/python/examples/watch_line_value.py  |  42 ++++++
 .../rust/libgpiod/examples/get_line_value.rs  |  28 ++++
 .../libgpiod/examples/toggle_line_value.rs    |  43 ++++++
 .../libgpiod/examples/watch_line_value.rs     |  50 +++++++
 configure.ac                                  |   1 +
 examples/.gitignore                           |   7 +
 examples/Makefile.am                          |  17 +++
 examples/async_watch_line_value.c             | 136 ++++++++++++++++++
 examples/get_line_value.c                     |  97 +++++++++++++
 examples/toggle_line_value.c                  | 106 ++++++++++++++
 examples/watch_line_value.c                   | 127 ++++++++++++++++
 21 files changed, 1011 insertions(+), 1 deletion(-)
 create mode 100644 bindings/cxx/examples/async_watch_line_value.cpp
 create mode 100644 bindings/cxx/examples/get_line_value.cpp
 create mode 100644 bindings/cxx/examples/toggle_line_value.cpp
 create mode 100644 bindings/cxx/examples/watch_line_value.cpp
 create mode 100755 bindings/python/examples/async_watch_line_value.py
 create mode 100755 bindings/python/examples/get_line_value.py
 create mode 100755 bindings/python/examples/toggle_line_value.py
 create mode 100755 bindings/python/examples/watch_line_value.py
 create mode 100644 bindings/rust/libgpiod/examples/get_line_value.rs
 create mode 100644 bindings/rust/libgpiod/examples/toggle_line_value.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_line_value.rs
 create mode 100644 examples/.gitignore
 create mode 100644 examples/Makefile.am
 create mode 100644 examples/async_watch_line_value.c
 create mode 100644 examples/get_line_value.c
 create mode 100644 examples/toggle_line_value.c
 create mode 100644 examples/watch_line_value.c

-- 
2.40.1

