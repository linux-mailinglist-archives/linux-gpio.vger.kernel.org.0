Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749107B1FD2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 16:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjI1Ohi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 10:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjI1Ohg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 10:37:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3483919D
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-533c4d20b33so21406515a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695911852; x=1696516652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTcCbcS8jKM6FMelEG5+49Wgb0diReoG4fV9tn+RplA=;
        b=kqvFtUEp6sCbJsFkG4D2/hmNxNjNeBQ7mRMH5NiXf3fEt5i6wtNRznYT6TFgzPX1a6
         G2UvTv5rI5FWx6ZmlZZ3OQHfnLFwLx6spulNhLsxJpFpx0FGCQhRTienqqrM8V3+R5WG
         ovIag9SsWH4HJebOCAmkOUDDebQWrAbjM2+85/kn+8CnEENRP8Wc8SR5fpNe/zuSZQTw
         Fdk0ZlINEH977SHCKUTqRESKaQZCk2nN249WlLrF80XKRmfQzdlLiKZ/Ly7NUnvcNjKO
         qe3uHxYReByOx+DDCU3T3MtKnDD5wHCIzvD+l9y7n1jpOdatByYLWyTYeQk5yRxp3lJy
         MjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911852; x=1696516652;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTcCbcS8jKM6FMelEG5+49Wgb0diReoG4fV9tn+RplA=;
        b=aiMz5wmEUUHmC9U8pijdQJJ28JKaeTnV0exyCjXrCnCCDGCUboP4mNDZqmuQi6WmFj
         Iz5mBt3bF1xEWlALxgxn8qzEnxj9r0vIAkgL26mExUaGzW5ldSl975HZayyOKQVdyxeC
         jwkb3zMoqy3BEd3WRZ1fEqIaQ/gcyYomYxaYCSMsfJasHKEtXHd+N6ypgkoNaxmTqMNc
         EYVtJ8pP+o2Ddf1qJWIzwVDMkWtYkBSo/Te82eUaV+/HE0CFcVhWsFLEsuYbQ+j7fqFZ
         CiPvK+yiq99OZT9cEYWLftkT6g5B+WTTxlpDfCc2j2cJivLOkrN/F06RtuuyhH/Vbt/d
         gZSw==
X-Gm-Message-State: AOJu0YwTyE3KUXInb20RoT7nVn724pd1whGvZtRN/4+gZuHmXs2aJKYH
        hrfPvpmTO1wi0ge1xrQxOls+8Ky8+gW18KndKR0=
X-Google-Smtp-Source: AGHT+IFRsp1liik1fTQrquPw8LOvsyMHHEjj/8xAWWep39TH2FCZWJklWlnyn2yslUjhrrjbGpvjJQ==
X-Received: by 2002:a05:6402:11d2:b0:525:4d74:be8c with SMTP id j18-20020a05640211d200b005254d74be8cmr1623205edw.14.1695911852640;
        Thu, 28 Sep 2023 07:37:32 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005333922efb0sm9789688edr.78.2023.09.28.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 07:37:32 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 0/3] thread-safety doc + Rust modeling
Date:   Thu, 28 Sep 2023 16:37:27 +0200
Message-Id: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKePFWUC/x3MQQqEMAxA0atI1gZsC456FXHRTqMTkCpJlQHx7
 haXb/H/BUrCpDBUFwidrLylAlNX8P35tBByLAbbWNf0tkM5NKNSipjFc0ZnWt/NzoTQf6BUu9D
 M//c4wsph2XmLMN33A3xUHbJrAAAA
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695911851; l=1267;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=eb7O0xvqfzH0geH+xjxItks+3rKk2J+e6xboFejKVsk=;
 b=/EKxlZYty6KORDm23BYMTaDZ9bcVT2n0jzGB4cDW+wNcam7UCPBZLnGrTyIto2uZt6aqrnXo9
 heFrxM1HkQ2ATxYBMdTIcx0y+ePj2eCmEaQjXzWxrA+i87hCY/SlNNP
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This updates the docs with what was discussed in the linked thread.
Then, the Rust bindings are adjusted to match in behaviour.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (3):
      doc: drop unneeded <p> tags
      doc: document thread safety guarantees
      bindings: rust: mark all owning types as `Send`

 bindings/rust/libgpiod/src/edge_event.rs     |  4 ++++
 bindings/rust/libgpiod/src/event_buffer.rs   |  8 ++++++++
 bindings/rust/libgpiod/src/info_event.rs     |  4 ++++
 bindings/rust/libgpiod/src/line_config.rs    |  4 ++++
 bindings/rust/libgpiod/src/line_request.rs   |  4 ++++
 bindings/rust/libgpiod/src/line_settings.rs  |  4 ++++
 bindings/rust/libgpiod/src/request_config.rs |  4 ++++
 include/gpiod.h                              | 26 +++++++++++++++++++++++---
 8 files changed, 55 insertions(+), 3 deletions(-)
---
base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
change-id: 20230928-rust-send-trait-316a8f31bb97

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

