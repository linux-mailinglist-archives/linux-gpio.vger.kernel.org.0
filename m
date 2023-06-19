Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C1A734CAD
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 09:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjFSHt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 03:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjFSHts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 03:49:48 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A4EE56
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:49:47 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-985b04c47c3so445394566b.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687160985; x=1689752985;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJtEvz7ga0nhIg3fQkVDODlEOy7GfRaOg9G9FjVdidM=;
        b=e7gwHDnGbHwLSY2OJJte86Vcmao9kpI4KNBLqfeb8w6+RAGYwszZW/6eEEGSdbq7tv
         CvUm8J4Ly2nGCvlUiibEpVyxB+FRyw7F3J66jeLrCEN/mna3qyjZ9D7TXmmbKxtPHg8g
         MPnM1kFjWi0NtqzhM64MX8xC6Ykq8HxB6EVU6RytSeNBnYUS5WM3VpsFaC+rNFS5zImc
         uM5D+1LA0hTk72Zrh3uLTiiptuw3Um/7UnNXK/ZSTaFjqfYdIdQ+bJiyQtCh0ZUxZnUg
         21iV//b90GcfD4Uwn4h9MXMeR37An5pjl1RfUWsNP9HwAn7FR6pz3CDbzUdPvdmj+bPm
         qxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687160985; x=1689752985;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJtEvz7ga0nhIg3fQkVDODlEOy7GfRaOg9G9FjVdidM=;
        b=C8eT8THymU14utfTgWBXyd6AYyT3k6zuyv0sQBhvfiDe+NPuSvbDNKhdMNTI1gxOaC
         /KNpnC4jsp27B0byvtIDukEtiZElDEiK4jV/vvv6uw5YV+2YRNtqmh4dcW9SqGTItCKf
         57txONyVIcvNzycM4v0KGoCeNrO1SrjwgDYqdFu4DwJB8G7+xvsBzKAznU5RD0sannpj
         g7qpTGxCrj4a8sBSelYdyQ+nNswq8bTlUZKoD8676nHd5y1scNJvnGRLiBQWVYbcF2UT
         25Tv9mm0lCH28aPGFXOvPEcJ/IFUTDhYtYJwMvDQ3RoWC4U9S02R3TmsqHZRKZx571D5
         p4Lw==
X-Gm-Message-State: AC+VfDy6HVozMA2KQLVzIRuq6mmF8Xj47rLJyNM2R1EaDi3wZGxvxfch
        oCN/eiKiC9RypL290ChBzgQQ7g==
X-Google-Smtp-Source: ACHHUZ5vQYmmne1iOzxfrFwVfkdabieyDCGjGl+M6tWjWu/bw5ALlf/qYtNV+QIcBjzzg58E+XCYMg==
X-Received: by 2002:a17:906:730c:b0:988:9ec1:a8c5 with SMTP id di12-20020a170906730c00b009889ec1a8c5mr2311195ejc.55.1687160985560;
        Mon, 19 Jun 2023 00:49:45 -0700 (PDT)
Received: from localhost (i5C740111.versanet.de. [92.116.1.17])
        by smtp.gmail.com with ESMTPSA id gv19-20020a170906f11300b00988a0765e29sm1229817ejb.104.2023.06.19.00.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 00:49:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 19 Jun 2023 09:49:44 +0200
Message-Id: <CTGGNKD88V9Z.1UEE90DHCCFXZ@fedora>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Cc:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
To:     "Erik Schilling" <erik.schilling@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora> <ZIl6X8YAUHS/n5s8@sol>
 <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
In-Reply-To: <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Note: One needs to fix a bug that cargo clippy --fix introduces since
> it replaces nth(0) with next() in event_buffers.rs and introduces a
> unconditional recursion.

This seems to be a known false-positive:
https://github.com/rust-lang/rust-clippy/issues/9820

- Erik
