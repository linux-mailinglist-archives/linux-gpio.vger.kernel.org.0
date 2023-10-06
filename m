Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0611A7BB218
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 09:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjJFHYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 03:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjJFHYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 03:24:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08B1E4
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 00:24:31 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9b95622c620so337267466b.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696577070; x=1697181870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOSlaaJB6X2WSoMd8+KnJy/fnhz6ELzyVEUEL3quGWE=;
        b=NhHkOH4m8PMhgrjS6P41MROXV8bJDa1OqeKeELAkRx88whPPqW7AooWImj3cKtXpes
         rZByM6B5Ankeg1aCT1Qc1QHKMKDyoRVvCY56msjTcTHeHyiZZpn0IzUtLIYdgWnNfCA8
         sTU8u4DBso+p0jsfwWhYeOTrExf45NXibMAlABq3MWXFey8rPWXaS+jyMF6Toke7YojU
         btC2HxsolsYvtCJnrFpSXLu1BH7tIFacr1vf9n3RqU/+2idKRkhWeuPjysi2n9JibOn3
         AWaPgo97R1tgrmb0Zb9SFmYm+tBSfOMD/1WvIinpdkMThb2cMt+XOrTQGss4F0t2o9Ct
         qJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696577070; x=1697181870;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOSlaaJB6X2WSoMd8+KnJy/fnhz6ELzyVEUEL3quGWE=;
        b=fFVwA9ZrOnt3FyIMWgooJZbH9I9p6xuAIhtVCNcpwnAD3v1jzqX3ndOCOrJikf4HQH
         NHz25H9a0SxFLdr9up3vrx731FV9C0bTn4DnoMwES+euPei1KKBPlFjWTvx51ciCOJON
         7wCO/4VPvXRoB2eGFx9X0edPTzAmaSwVhC8K2HdbeGun043LkGu1B8TqUmgdo5S+DO/I
         bqCMyFifmQ5Kv0HRpNna+a+GzoFzw7KrT4V+NcJ3KIaKnIMiI7dGL1hYfMFSMuFuIQbh
         v/pVYX9dTyNEqDnD+T2tWf7KoiuG36D/fbqF/LSGNWLB/Nw3Pv3Cl5h+CTpJm+DMOiDp
         WjYA==
X-Gm-Message-State: AOJu0YyYvOaXkfevy8hGumgR2ljVFeJh3IlB/4C7vKj4+2uOmKRBtVn7
        FPxyftZdMaRK3jEI4TTMSuU7cRCdFVNcDb42YTU=
X-Google-Smtp-Source: AGHT+IEX4FCPH2nCfqDY9NgjPUdIGFdx/hIcE0Py6K7yhvk0TMhkvzrJ9GJlzKAIi2SU76PaqkQCxQ==
X-Received: by 2002:a17:906:7485:b0:9ae:5fe1:ef03 with SMTP id e5-20020a170906748500b009ae5fe1ef03mr6188295ejl.67.1696577070165;
        Fri, 06 Oct 2023 00:24:30 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b009928b4e3b9fsm2394963eja.114.2023.10.06.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:24:29 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased
 features
Date:   Fri, 06 Oct 2023 09:24:25 +0200
Message-Id: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACm2H2UC/x2MwQqDMBAFf0X27EI0pav9FfFgmm18IIkkIIL47
 017nIGZi4pmaKFXc1HWAwUpVujaht7rEoMyfGXqTW87Y57sHuwQPWIonDbPh+Zfwx+cLMM4ihV
 jnQjVw5616v99og0u7Eie5vv+AogcSLN3AAAA
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696577069; l=2124;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=nz4SvDYEgbPxerKmOUiSsWeov9bEuAl+wbetNED3Llo=;
 b=aIeB56mj1IH1dbPVOth3OwMJx+7uLWfAnxdOhXroOuMU8WfEIoq7LKkUPDULdNQ5XK+w94741
 F2Cs47llkwcAOuvZnoxyHWIMtNmxZd/EC+qliixkLtqJtWKF/GIotk5
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When releasing the 0.2.0 version of the libgpiod crate, I did not
realize that there were C lib features that were not released yet.
Helpfully, vhost-device's CI went up in flames and revealed this [1].

This suggests a way to handle that and sketches how further updates can
be handled.

I acknowledge that this may be very strange to C developers...
Traditionally, one would just use whatever your distro provided and the
distro would make sure that dependencies update in lock-step.

However, in Rust the default way to consume libraries is to pull them
from crates.io. This is a balancing act for -sys crates which link to
distro-provided libraries on the system. Since crates.io does not wait
for distros to update their libraries, crates will need to support a
wider range of system libraries.

This sets up / sketches the infrastructure for that.

Only the first commit is intended to be merged. The second one just
sketches how a release will look like once it happens.

[1] https://buildkite.com/rust-vmm/vhost-device-ci/builds/1746#018b0110-b9d3-468a-973c-c3bbc27cd479

To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (2):
      bindings: rust: feature gate unreleased features
      DONOTMERGE: bindings: rust: simulate v2.1 release

 bindings/rust/libgpiod-sys/Cargo.toml        |  9 +++++++--
 bindings/rust/libgpiod/Cargo.toml            |  4 ++++
 bindings/rust/libgpiod/Makefile.am           |  2 +-
 bindings/rust/libgpiod/README.md             | 14 ++++++++++++++
 bindings/rust/libgpiod/src/line_request.rs   |  2 ++
 bindings/rust/libgpiod/tests/line_request.rs |  1 +
 6 files changed, 29 insertions(+), 3 deletions(-)
---
base-commit: e7b02c2259d97c77107c77b68e3bc1664e6703c1
change-id: 20231006-b4-bindings-old-version-fix-789973703b77

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

