Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B64728E18
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 04:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjFIChS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jun 2023 22:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjFIChR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 22:37:17 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18051A4
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 19:37:16 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6b29b9f5c40so271587a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 19:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686278236; x=1688870236;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm5w9dsxRUU7kbFAH18mUsMKvSM/S0EiHenMrkhHCAk=;
        b=a03T3GcFdFG0ZNDPARo8pOqCvdCZm1bcfeIVTd6zJvvpEF79VdY/y+LOqnLKPN+BYO
         QP6WkY3xBlFkYyv67MreHosfMsXT2zSZrXDunCiJSp6xCSdFFSZemHuDwLiYjCrCmrq9
         gp6F2wfioTiLKSrm+QBLlxasjpU6cDaKjZxXhz8oi32NksrnoQnG3qNkf98IhkhwpU5m
         s+Ys00XnGfiRdxrHDYid23e7VnllhF75hnX3RGWvaDc9IqxkBddB1FARlcmGm6tlMRaL
         30DIBCol6a/1Wu54XTqMVjq9U2c8q+Z6BIOHBpPDzWu2h6SrogzI0mzD/YePYSX2HFKN
         0lIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686278236; x=1688870236;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dm5w9dsxRUU7kbFAH18mUsMKvSM/S0EiHenMrkhHCAk=;
        b=Kk/DKGvkoITWYro83vA/0lScrWPJgyjudsx6Dx0InUztUF3P6m8BEZpPdubGX1iyEK
         4tZEj9Ac5kdgK6LnfESlo0FutL6pD9LGJytdqhYXoxNrcW60StFr5HmcSZbOucGdlfAM
         uGVyFPHS+KI+O4fUIg4bavH8c3tzrbdHV6UP7gq8F964/fLeeaOGOqz75/c5VjsjZzwC
         f3eVT9lhUkYl69sA7uzLc3BKNJ1XCdDdvlbfpbRRpM/m8sdTYr6mkHF4zF4iO8GgGi3A
         LGM3wN27tKId3PGpoCnrRN9/2ErAKNwhsPzpgW3boWGGdRLrpG9+IOpAbo6cwA/XZrNu
         Ew0g==
X-Gm-Message-State: AC+VfDyjtJZqHlSUbhBro1IakzS5UeCL5c4D5K5P7VBd+7WcnihaGZCC
        q2SE6wLV0Mp1j4qRxes9gh2RgE2sgX4=
X-Google-Smtp-Source: ACHHUZ7KzRrQdgngano5ejKUuC/oLR+sCuQkhMEGQMhPNfuCI9vmOH4mCWvzwklGCUs+8WCgIkGD/w==
X-Received: by 2002:a05:6358:9fa3:b0:129:cc43:2ebd with SMTP id fy35-20020a0563589fa300b00129cc432ebdmr130086rwb.23.1686278235672;
        Thu, 08 Jun 2023 19:37:15 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id k29-20020a63ba1d000000b0052c3f0ae381sm1704064pgf.78.2023.06.08.19.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 19:37:14 -0700 (PDT)
Date:   Fri, 9 Jun 2023 10:37:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [libgpiod][bug] building rust bindings requires clang headers
Message-ID: <ZIKQVol59uXI5PyI@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


When trying to build the libgpiod rust bindings on my Debian bullseye VM I get:

   Compiling gpiosim-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/gpiosim-sys)
error: failed to run custom build command for `gpiosim-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/gpiosim-sys)`

Caused by:
  process didn't exit successfully: `/home/dev/libgpiod/bindings/rust/target/release/build/gpiosim-sys-dfa257ecee3f0e2e/build-script-build` (exit status: 101)
  --- stdout
  cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.h

  --- stderr
  ../../../tests/gpiosim/gpiosim.h:7:10: fatal error: 'stdbool.h' file not found
  thread 'main' panicked at 'Unable to generate bindings: ClangDiagnostic("../../../tests/gpiosim/gpiosim.h:7:10: fatal error: 'stdbool.h' file not found\n")', gpiosim-sys/build.rs:27:10
  note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace

The source of the error appears to be bindgen using libclang to parse
the gpiosim header, and that failing if the requisite headers are not
installed.

If I install them:

apt install libclang-common-11-dev

the build passes.

Can a dependency be added to the autotools configuration to check for
the availability of those headers if building the rust bindings?
I would add it myself, but I'm not sure how - or if there is some better
solution.
The configure.ac already has a AC_HEADER_STDBOOL, but that checks for
the gcc headers, not clang.

Cheers,
Kent.
