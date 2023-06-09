Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1B5729EAB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 17:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240769AbjFIPgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 11:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjFIPgq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 11:36:46 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68FD26B3
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 08:36:45 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-656923b7c81so1579157b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686325005; x=1688917005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4gdY5eAeEAMcZcpE0/XkHyEn+nnmBJFSlt+DJlfOR0=;
        b=YHuDLq6JVRHWQiMHUyonVTfTRGfNLSfeghnV4H0hwUH+IQevLQiCU7UAXwilPpRKMy
         ritxCDHJPd4uUkeaIuuv1g++wVSsBPg7JAn4Q0Hxu33p4Qt4KYyPnlbmkHtR5v/LPIJQ
         RyaFTxWrs5iWKcQ5r0G6es9V5vOF5wkxzGHpc8h4fUlYqRia4lOkl6LYi9JADcIZxtWI
         yWYV07XcZzpsTBJz23HfBKyRthIoVikfbYWReia0bUP4FMPwUje+/KXUxHEVrBKpPJbR
         73H7hFogwNsd7sZMCuyupqS1xldssiub62sJipgNuEerAKhPAAkTQqL+9iLp7x/7rvvZ
         wRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686325005; x=1688917005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4gdY5eAeEAMcZcpE0/XkHyEn+nnmBJFSlt+DJlfOR0=;
        b=K7d2pMPLCX2mZej3AoIJza5jVXX5McT5K/cOKowwSLAn3QjYFPRZAS0al8n+zFwZKU
         SLIl15ju5JF9Wckute8g+6y8NuYqFrDbfSl1vMPW//KGfPd2P8aZJZI1EHRxlr/I/gM8
         zKtSgotPBcirz1Ex1czoBnM8OqFsTuqD91WlBnGVJL0H3BzWuLISUEA8YcXko1nissB0
         n0n9O/Kum2++c4MLzKRcHIL7MJ8FFB13w+6u/1vNq7kPGfizn6O2xsqv9eYwJZ3mu19r
         Dh+uOXrOSK7EN/I2R10GXdgtY0qWwGWJdNu+QeBdXtCIrfEw+kZecBQVR8mW8Fym5aag
         AR5g==
X-Gm-Message-State: AC+VfDxzHC6dG/L3yZssNc39ojH9q+8XiwDedgYsjP4R5TtB4BV0PsIa
        OCNMmbWK6CeAvKgPvhimzAzhS8QH1ps=
X-Google-Smtp-Source: ACHHUZ58ibqdG3kOfG2U8yiN2E6/8K9ZCAjYru8ImvjQOwXqCoLLM1xPerqvBBgYyx0vtIbz4e/xmQ==
X-Received: by 2002:a05:6a20:8f0b:b0:117:4cb3:157c with SMTP id b11-20020a056a208f0b00b001174cb3157cmr1483917pzk.21.1686325005014;
        Fri, 09 Jun 2023 08:36:45 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b0053051d50a48sm2850288pgp.79.2023.06.09.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:36:44 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/2] bindings: cxx: examples: fix potential glitch in gpiosetcxx
Date:   Fri,  9 Jun 2023 23:36:07 +0800
Message-Id: <20230609153607.133379-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609153607.133379-1-warthog618@gmail.com>
References: <20230609153607.133379-1-warthog618@gmail.com>
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

gpiosetcxx requests lines without setting their output value, and so
sets them all inactive, and subsequently sets them to their requested
value.  This can result in glitches on lines which were active and
are set active.

As this is example code, it is also important to demonstrate that the
output value can be set by the request itself.

Request the lines with the correct output values set in the request
itself.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/examples/gpiosetcxx.cpp | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index dde5379..ae35038 100644
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -16,8 +16,8 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::gpiod::line::offsets offsets;
-	::gpiod::line::values values;
+	auto builder = ::gpiod::chip(argv[1]).prepare_request();
+	builder.set_consumer("gpiosetcxx");
 
 	for (int i = 2; i < argc; i++) {
 		::std::string arg(argv[i]);
@@ -31,22 +31,17 @@ int main(int argc, char **argv)
 			throw ::std::invalid_argument("invalid offset=value mapping: " +
 						      ::std::string(argv[i]));
 
-		offsets.push_back(::std::stoul(offset));
-		values.push_back(::std::stoul(value) ? ::gpiod::line::value::ACTIVE :
-						       ::gpiod::line::value::INACTIVE);
-	}
-
-	auto request = ::gpiod::chip(argv[1])
-		.prepare_request()
-		.set_consumer("gpiosetcxx")
-		.add_line_settings(
-			offsets,
+		::gpiod::line::value v = ::std::stoul(value) ?
+						 ::gpiod::line::value::ACTIVE :
+						 ::gpiod::line::value::INACTIVE;
+		builder.add_line_settings(
+			::std::stoul(offset),
 			::gpiod::line_settings()
 				.set_direction(::gpiod::line::direction::OUTPUT)
-		)
-		.do_request();
+				.set_output_value(v));
+	}
 
-	request.set_values(values);
+	auto request = builder.do_request();
 
 	::std::cin.get();
 
-- 
2.40.1

