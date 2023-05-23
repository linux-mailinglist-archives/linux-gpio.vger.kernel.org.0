Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266DC70DB6F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 13:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbjEWL0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 07:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbjEWL01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 07:26:27 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272F5121
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:26 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so534501866b.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684841181; x=1687433181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=od3SP5ky8Y9LxP+1XQ7PmGRAgzgjOHbNgHLzMDz2k38=;
        b=QG7KYGcA8AkGBnh6XlZeaTUIhqOXn8GAd0e3E45FyvgOGgE4IwMIGdEEgRzOoVFqAz
         /1I1d7g31Y1qK724Fl/hphs8Q8F4kqmQQBRU7fv6ZPkMYhDmNBGc1RxaJYdc+/MNr6fe
         MgDVT4zzRFtflixbIPhYD75HIKj+ntdU5sx8SLDZJZYkauO4dFm1ZkEWI8oCX3SyD6cD
         t/6gx6zLuttMjo+ep282MXaFZNXOjLbi9aRKc1mZBkq9dOU5aj5oCoRWqyh9lBqTKkHm
         P8OpE91PAFege+909eeulbCLsy41bIdT/vt3udZoiKkmNLW6mg0+DUqe25D80kFmV8yE
         RppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841181; x=1687433181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=od3SP5ky8Y9LxP+1XQ7PmGRAgzgjOHbNgHLzMDz2k38=;
        b=cgOlRMigiTps1qGqSTUMIRjIEV+SS58XdDYla1HxnUkaIUKjsFM0563P9Fus0Ye1EQ
         FQr5/aPPTblMsMSIX7zoMGn/f72j3/3Zh/liXXvk3u/LHDB7nHwbUIwYip3ZG6zE2qxY
         XL8EllNWKtT0Q9BISS0LOxGSYzgn98YA0W7n8YMo3BIrhP2AV4PVyhNit4fbe+iALry9
         2gB7BWXpm/7KfpeW9oGR41midg6fFs2rtIhsHS8LYBnl1kJO1w/+nGLbDXwdtW5elXKP
         NyZbvibrYeKF2vF8fS8Nb2RxoKDUM8UdUOugUWfBJg5hq1LoVLGUDWc+XAERsr7PNqz6
         Xs8Q==
X-Gm-Message-State: AC+VfDwWcNXjy/zcJfe8siYR5WUOCUsV/lb9H1IsXlxB44UaJEtZ3+4x
        IFucfeixbzaBvdkRwMGKlD6s2CPTgbaRXyH3Kn0=
X-Google-Smtp-Source: ACHHUZ6+Sv5lckUHJ0RyTdvhH208cw5iZYv6gL7eOwgVMhg5dz+YG1L0xP75jZ/LFwHhzWOmlcK/XA==
X-Received: by 2002:a17:906:6a0d:b0:96a:928c:d391 with SMTP id qw13-20020a1709066a0d00b0096a928cd391mr14399139ejc.4.1684841181694;
        Tue, 23 May 2023 04:26:21 -0700 (PDT)
Received: from [192.168.1.149] (i5C7409D3.versanet.de. [92.116.9.211])
        by smtp.gmail.com with ESMTPSA id gv3-20020a1709072bc300b0094f3b18044bsm4342911ejc.218.2023.05.23.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:26:21 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Tue, 23 May 2023 13:25:47 +0200
Subject: [PATCH libgpiod RFC 2/3] bindings: rust: remove unneeded cc
 dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230522-crates-io-v1-2-42eeee775eb6@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
In-Reply-To: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684841179; l=663;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=mH7k+DOE/0trTqK7DJ7T4IJFhqsFAqGTsXPFyu/Zb+E=;
 b=CMCUWMImpYwF2ES0kAeWe9ab9V3euSKaJHKRVNVdYc1pfXFS7/4uguC4GhQKUnQ10N4SlfMOJ
 b/V+JM5d717Al/7AKmOkLbx7lTAWKYZUe5ApR2cW8vewBEs8jK8ifau
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It was never used in upstream. The use was dropped during review [1], but
this dependency did not get removed.

[1] https://lore.kernel.org/r/cover.1659442066.git.viresh.kumar@linaro.org/

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 3bc3525..cb8dc70 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -18,4 +18,3 @@ edition = "2021"
 
 [build-dependencies]
 bindgen = "0.63"
-cc = "1.0.46"

-- 
2.40.0

