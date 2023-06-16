Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD22732A10
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 10:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244540AbjFPIk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 04:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343595AbjFPIko (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 04:40:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F6F30D3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 01:40:31 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso495196e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686904829; x=1689496829;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RkUbuu6JN+IQheraKdFa9t3lGNC7RI/9mWp/C9GI0I=;
        b=WN54qa7lUOUUoKCXnFM1H5QKFqNnVhFIUlENSlyDcyTadQ9dVeSgcyvY3b71pOpu2Z
         v1R+dTbm9Npt7SjWzqc/7dlv9B9E8JNCdgUbNzC87KT7OAxQRfPCEvONX1wHa/BeCL17
         /4elZ4Ojw3CjHkgn9wOJ77xFMNNsJ/VwxMFfDTS8R0FJeTEa8vEAidee40C53g3/aXPi
         wk3o5vyKXfWlIpJdF4dYMqdQAqqVk6GIxAAZDHPUNeyoa99FXEPwr65f7npnzQW7+YrX
         VXKfFhwcJulFMHmFBQJOpPaVSnl/BD+0wYaSGiXayWjla/vV9o0J1eGXnkisRuv19i+8
         5F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904829; x=1689496829;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RkUbuu6JN+IQheraKdFa9t3lGNC7RI/9mWp/C9GI0I=;
        b=cquGcw6dDmiqlRejGjVlxeDCCP5bg1XG15G1e1YoPUMTUnPOPmxrfkCRKaDTCQzeRr
         e0XWUBACtfDBs/FX+YkbC+gfM0/J/GCtPmb0gA3J5ipiODh6i3QIgdXDEg9QPZBgmNr5
         LDjFWBOMTRcDZ9nvmGpr8oJRR4ZYpFNgCwoErF4ukYv6GSAhxyxrJ1a3eU23pzLoz+SK
         RF9LMzOYfGYNUiw0QnUlJIZK/BBAwAOA+b830C9lWhcRvUo0H8ECy68dM5K2B8oiRCtk
         ZM9GS6JC215igetJBJgwpr6Iav36aiIch2/MiKgITmrq8raocGN+bFA9/pYmjI3p3Q32
         tPRA==
X-Gm-Message-State: AC+VfDznmLaOsyTdNborFnTVdXFrdCbaVMJqJy9QEJBwpX64BNQgmSbG
        apvxHh9MWzMwIV+As1zjZRSKng==
X-Google-Smtp-Source: ACHHUZ4rsBJj3t4xfGEpYdAfzuWmAW3WDHhjYS1FTMVchMN0yFuCqzEariDHXIdx7+c8R/8Io5ONhw==
X-Received: by 2002:a05:6512:288:b0:4f4:ecdf:115e with SMTP id j8-20020a056512028800b004f4ecdf115emr727703lfp.31.1686904829535;
        Fri, 16 Jun 2023 01:40:29 -0700 (PDT)
Received: from localhost (i5C740DE0.versanet.de. [92.116.13.224])
        by smtp.gmail.com with ESMTPSA id f19-20020a7bcc13000000b003f8d0308616sm1546031wmh.32.2023.06.16.01.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 01:40:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 16 Jun 2023 10:40:28 +0200
Message-Id: <CTDXURVSRYY4.A2QFUPZTSBW5@fedora>
Cc:     "Kent Gibson" <warthog618@gmail.com>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     "Erik Schilling" <erik.schilling@linaro.org>,
        "Linux-GPIO" <linux-gpio@vger.kernel.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH RESEND libgpiod] bindings: rust: bump MSRV to 1.60
X-Mailer: aerc 0.14.0
References: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
In-Reply-To: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Had to resend due to encoding woes with Alex name... Seems to be some
b4 bug.

Sorry for the noise.
