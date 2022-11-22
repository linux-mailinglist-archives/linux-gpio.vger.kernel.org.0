Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1583E634066
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 16:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbiKVPiY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 10:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbiKVPiI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 10:38:08 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE2E9588
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 07:38:07 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id k67so14811431vsk.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S1a/cAWxIJjmePyzPOleXgC0O7e0WgNTX7V0lgeCZsQ=;
        b=ikXEb7mB1NF5ep7+3AKBD8iR5InEbHbBZD+rLEOmlGj6t3ZYK0Zss5OvW2FOVnibqZ
         IAijoTGn3s6TYoJEcgPjdKBqx05UP2O5tcaQzNS4J8cb1HQMpi0B8wK2UOc/9ePnQANP
         5XGEjbp/wsPp0AoI+cZ7KCpkCn2P7bzhKNSj3D8DhsL4EvAfxpvVwIogjHUgbGzvJN//
         1Nqz8D1ji1rq5lPk/nb6b0R1tE0JCPnbaniXWwysu/rrDBSTivF91OT93f1z5KG+XbZw
         jmNA2LHreaHqAsVG4P6expbBAxyLGOV16hkhhidkF9+ktNCNk/+zz2+rsJcZNiyXDNVr
         9uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1a/cAWxIJjmePyzPOleXgC0O7e0WgNTX7V0lgeCZsQ=;
        b=NA/yFIfzQN0zznY1IloyZ6V2bpUnvcJB1oV6OS6pjIgTnp4EMINg5nHTNZ4Aq+TraO
         OkxdR/lno1abvw4V+M0KfBOx0CRN8JHt3sNE/ZbKc33wYMedBxaNk46uYirA1+bEICl1
         GMlwsyM/fRts2V4j6DA0S1sLzpY2vJSCbr4fFE92yrmvg75LDM57fXJw6cERzALNAemH
         RJk47MoUKfSAnBMBa/A8CPxPIvCgRT9/j+oUlHPveXge3JsX2syDU+BviVEn8Wb2hPGH
         w6OuiBVylFSP1KeNZBoD+XiUAqam7Wa54UB+Z+TyWG9ot8NGGZSuy53jvmLQAiR3ynBR
         dxBw==
X-Gm-Message-State: ANoB5pk5OS2pmpDc/+GA4iNPR7eQnPH7/NobPCLzCJTLBeZz8BaMiEAC
        lwRrI6GKfXxWFuqCpn0T9iWezzssjtYjY9sFQ8zhNBxCxUsmhg==
X-Google-Smtp-Source: AA0mqf5Hbl34uHv376KZsBg2TqhU7h9/EgqaA246uH1vqPBjzTu7A8B/JcaEwijOkEBT5msZUcTNWbsn4msAN/Sdq8k=
X-Received: by 2002:a05:6102:829:b0:3b0:6449:baba with SMTP id
 k9-20020a056102082900b003b06449babamr1430170vsb.61.1669131486879; Tue, 22 Nov
 2022 07:38:06 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Nov 2022 16:37:56 +0100
Message-ID: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
Subject: libgpiod: rust bindings and bindgen issue with C enums
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

The rust bindings are now in the master branch and I started working
on some additional changes for v2. Among other: using C enum types
explicitly in the core library as suggested by Kent as even though the
C standard says:

---
The expression that defines the value of an enumeration constant shall
be an integer constant expression that has a value representable as an
int.
---

and virtually all compilers store enum variables as signed integers,
modern compilers can spot some errors when using explicit types and it
also benefits IDEs which can interpret them better than ints.

That however led to a problem I'm seeing with rust bindings: bindgen
seems to set the type of an enum constant to ::std::os::raw::c_uint
unless that enum has at least one value explicitly set to a negative
number, in which case the type is ::std::os::raw::c_int.

In order to allow gpiod_line_request_get_value() to still return an
error, I added an additional value to enum gpiod_line_value:
GPIOD_LINE_VALUE_INVALID = -1. Now this one enum in bindgen generated
code has become c_int while all others are still c_uint which - as you
can imagine - leads to all kinds of build-time errors due to strong
typing.

As enums are naturally signed integers in the C world - can we somehow
make bindgen default to c_int for all enum types?

Bartosz
