Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426837424CA
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 13:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbjF2LKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 07:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbjF2LJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 07:09:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6080B2D4E
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:13 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3110ab7110aso588085f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036952; x=1690628952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4oCBhqPkRJg4uw3jm/pvDcqU3iJ2P+5ltcSO4A6rWgA=;
        b=W2dwsQYpbviLfBGgfS3BUTV+DN0How0i7VYDgmu/2nmi4N1qCZlws0M2dH9biulA7Y
         /zAMqhfHV1nFi4++MMSEYc4sXd1mp43gpIK15iOvupJHDMeWjnWbdNBiQHDlSDBUXpjk
         mw5a+tJF4nx9J3AgRB5vWmXZdmom4Dgm2VZEyc6GRRMr9DcH62/Hj3SydYk/c1N1m3w4
         97yntH9iidLukrfcqM9CfTkOMxlPyRo2wF15V6U/j88iFuh5sziOiSli5oaADjUx/P8H
         KXPTvqT8cdTowoH9BvcZCwBQWVlj+51QdpXQRTsEs8uHVBIw66JP2f1TKD4DySeSu6VR
         btSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036952; x=1690628952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oCBhqPkRJg4uw3jm/pvDcqU3iJ2P+5ltcSO4A6rWgA=;
        b=cKm4hKaVJHN8PKaLD3E5u4Bq76KQMe9QphD4/kxKKOi8po+HRFd1e/m99rzgFRPqcp
         LQyNc5TN0SUILK3A7xab4nnSbvJgpyOWFXwgJ1/uu1etz1gn1ZwyJxC4Bd4WEV5uKxYa
         aSRxAKJky6AI+L5RtNRhkK3RrayDHLvf09ZTvLadnBfSL8oI9XSuRx2Ty/wFEC7wmKAe
         TtZ2tA5kSKz3o1hAIpz0Hd66+/N75jx5okzOX5AOznMjm7k5ruqGXnOmU5LnFiVYSZHy
         yaMif5+x9ONEKiK26cU8Gmx7YFT6/Pr9RGMgexZugN3lpdnB0W+FsDJrPo+YzWpl+bH5
         cqJg==
X-Gm-Message-State: AC+VfDwJTqxjMPIF0E9zA8mjhexJcI90EB94/UBi7KNtu+8OpNFuiJqH
        x17KN0wGtJSTwzUt/JqJaFqv3g==
X-Google-Smtp-Source: ACHHUZ4bnnQmf7c6VJNssvQBfjwmBj/rluSp4Blwz7ztsOyCGWZB+ZAgZ+sk1nmA/4BIbwNt2RSfYQ==
X-Received: by 2002:a5d:4ac8:0:b0:314:f88:4fea with SMTP id y8-20020a5d4ac8000000b003140f884feamr2827913wrs.8.1688036951737;
        Thu, 29 Jun 2023 04:09:11 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438BA.versanet.de. [92.116.56.186])
        by smtp.gmail.com with ESMTPSA id cw13-20020a056000090d00b003112f836d4esm15571197wrb.85.2023.06.29.04.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:09:11 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH libgpiod 0/4] bindings: rust: clippy: fixed warnings
Date:   Thu, 29 Jun 2023 13:08:58 +0200
Message-Id: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpmnWQC/x3MTQqAIBBA4avErBPMfsiuEi1qnGogVBSiEO+et
 Pzg8RJECkwRpipBoJsjO1vQ1BXgudqDBJtiUFK1clBa4MXev2LUEvuuwcFIDSX2gXZ+/tEMF2+
 HZ2dgyfkDncRunmIAAAA=
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688036951; l=1822;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=+z+EhYScf6UR/IcsGLnW32XLCvQx90uRaH+/sCvwW9k=;
 b=2zE5Qp1CItepzR76XLtIp2KS8kaHHs/+ConiIL4uDWaayrdsD5G2AIc68Vig2s406cUmu3JA0
 jQEtW2Ig01+AmXVVWjdXh6Bx1dEdT7RNTGTFSOvQnYvH5jIC1+EAmFp
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This follows up on my promise on Kent's series [1] to look into whether
these casts are needed or not. Most are not, a few are false-positives.

I also explored some shunit2 based test-script to automate the testing,
but that became ugly with linking issue and needs me to revisit it
another time. So this only sends the fixes for now.

[1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (4):
      bindings: rust: clippy: drop unnecessary casts
      bindings: rust: clippy: silence false-positives on casts
      bindings: rust: clippy: drop unneeded conversions
      bindings: rust: clippy: silence false-positive on iterator

 bindings/rust/gpiosim-sys/src/lib.rs         | 2 +-
 bindings/rust/gpiosim-sys/src/sim.rs         | 4 ++--
 bindings/rust/libgpiod/src/chip.rs           | 2 +-
 bindings/rust/libgpiod/src/edge_event.rs     | 2 +-
 bindings/rust/libgpiod/src/event_buffer.rs   | 7 +++++--
 bindings/rust/libgpiod/src/info_event.rs     | 2 +-
 bindings/rust/libgpiod/src/lib.rs            | 2 +-
 bindings/rust/libgpiod/src/line_config.rs    | 4 ++--
 bindings/rust/libgpiod/src/line_info.rs      | 3 +++
 bindings/rust/libgpiod/src/line_request.rs   | 8 ++++----
 bindings/rust/libgpiod/src/line_settings.rs  | 5 ++++-
 bindings/rust/libgpiod/src/request_config.rs | 2 +-
 bindings/rust/libgpiod/tests/chip.rs         | 2 +-
 13 files changed, 27 insertions(+), 18 deletions(-)
---
base-commit: 4510231c95a087f58a155cf74164e403e1e0584f
change-id: 20230629-clippy-890c541c6d09

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

