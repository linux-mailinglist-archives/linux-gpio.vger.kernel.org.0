Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F9C72F782
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 10:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242962AbjFNIOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 04:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243288AbjFNIOM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 04:14:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05871BD2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:14:10 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5186c90e3bbso3350991a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686730449; x=1689322449;
        h=in-reply-to:references:from:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY6G3LyuooZeOzwGzvg4/YgXjMFfA2vbI4gItYfKLPM=;
        b=HVriSE+0vLU0wfjolHoM9eGHERuaaNRoaGddvvqLsT6CNXEFH+SPMl8omoGjBf9d7J
         XbXQb1OrCtezUz6LFG+WGrJYEF9Emxwsi9WmVs0PSqPH5udP4hvlfxZfwRD6FiNfKPFC
         lTfUqGzj26j4hr8e7g1M6UPfxyoj+9ZhPBuEsCPoU2rsCpNtca0AYtHlTOqcKB5CH6F7
         KktCKcFMqHLRzU9qbLCscZ0JlUKSQSJFqcyiHRi/OIAQePU4TRlTvDLE5bmXD9zFAy91
         kUut807YMS1KE0al6jGe1L6AdDk+PDxjir5MBvMFgY2koJ081uOBMuharLiAhZeuV+Jz
         0tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686730449; x=1689322449;
        h=in-reply-to:references:from:to:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZY6G3LyuooZeOzwGzvg4/YgXjMFfA2vbI4gItYfKLPM=;
        b=mAEKe16OHFO+stLVlGimkflHWwiGXaUnTOcPFQkHzm6uWXdjZg1Bu2U2iswcR1o4/M
         aZDfULPzRbtxexIN3oonRAFg01yGBIKQT/Rau4IPIlB0ADcK/ggFRkAcQiWKSlogablC
         Rz77OAAjDdJFu9EoJSP8s6Od7KQ+5VG/xFu+gMHOvYlxTcsmILeAQOEyMDmUMHlwpYJP
         NB+06ULzw2p9sGD6hF0KRvHqP4Z0czwIquWEP2QOljTt/1RW58+Sv15k89pZEIbUwlhj
         KcZ26pW1fP/ostOcP2BaqRfzViF8Sa+iOMUm0DysYEBW2G3dTnjJxWhVUL4ccgHFAt4V
         Ab9w==
X-Gm-Message-State: AC+VfDwj2Qjdcrhg7czg2RWF0qXQo369Mzb+15aK3swzZnTjkSAv3G14
        OUx2yRKtIp7+pvOnJLOqQPCjhg==
X-Google-Smtp-Source: ACHHUZ4YXghJVfSP2q7av45bNV3GIXB39xUzSm1Sk6bWW2HxXcD4XXyPdO2ZG4gGnfAKNGIogr6oNQ==
X-Received: by 2002:a05:6402:34c:b0:50d:1e11:eb9 with SMTP id r12-20020a056402034c00b0050d1e110eb9mr9157751edw.1.1686730449090;
        Wed, 14 Jun 2023 01:14:09 -0700 (PDT)
Received: from localhost (i5C740811.versanet.de. [92.116.8.17])
        by smtp.gmail.com with ESMTPSA id d19-20020a50fe93000000b0051897e3b5efsm330630edt.42.2023.06.14.01.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 01:14:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 14 Jun 2023 10:14:08 +0200
Message-Id: <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
To:     "Kent Gibson" <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
In-Reply-To: <20230612154055.56556-1-warthog618@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Jun 12, 2023 at 5:40 PM CEST, Kent Gibson wrote:
> clippy from Rust 1.70 reports a host of warnings due to casting and type
> conversions across the FFI interface to libgpiod.
> These casts and conversions are required to support old versions of Rust
> that do not support recent Rust FFI extensions.

Could you elaborate which extensions are relevant here? Would it be
realistic to just update the minimum Rust version instead of needing
to include these suppression directives?

- Erik
