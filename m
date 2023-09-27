Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6B47B0022
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjI0Jbi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjI0Jbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:31:35 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5072E6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:31:33 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3232be274a0so3669146f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695807092; x=1696411892; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ2t57TpTEDG7kZniyf+1JB6goLpPgUCAoMNgbbRdXM=;
        b=ODotIICxknry+jd9+4PbllGISNugej0Payb4UNHTAJ3ZUL+V6LnyKQoDbzo385SZet
         Bd0Y3tkZJ5/osBEN9r051VjLYpbAHC1S5KZDefsF7KvxWk6oEEOVFJMpaLD4Ap+QXng3
         k6/ulf4yUtmeQN1IFqBhiNSORwbrYDzyW6DwYAwSeEEzt6xTzMoNijsOV8DbJXYuzpga
         /kxYTlDiQ3dVcnLRcC40DenvKcl95El0xcGnOupe76+olQ9omou+boXME2ojn5H2dH/V
         F8Vbe7jNV8o/TcB/hA0RsLn3LnYK1imqRDflNLd3fIgWP4ejtair45sBn7qwDB/+p06P
         eCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695807092; x=1696411892;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQ2t57TpTEDG7kZniyf+1JB6goLpPgUCAoMNgbbRdXM=;
        b=wx08tUjAQCT3ivHmpV+3sQEiJtoCc18VVFsju7+SZYG42Wt2fTxp8S/jn/ZFMfHVQg
         gqyKKPdfuY4sAqwadFugH4GBQNDafM/LVBZfVv8y+04SbGusRyHQwSPGdf6uQVYv64JI
         NzhArp+Lc8v48iJRZVtfWPcIIwHRGXbXJnXaTZtnKtQax4Rpmtq437HLWe6csuX6avvB
         5OCyQrNKOViAnqQCO9YWq/a9w51oClSOYIKX/VbhIg85uRJN+BPtgJiLbI1Sz3HhmO7K
         +Ip6gVG/OZw74OdW8Dc6Wyjm62xLO9x8j7tLN6WL8DynPPQRh2rvlxZoJcZux8M/pUGV
         FKrA==
X-Gm-Message-State: AOJu0YxR97JSrmtAxFkrSvXUHirvZrQsX6I7fKmABwaO3ueMPxdeUiDW
        rDabEcV/4085t+b0hRtDg1X7Pg==
X-Google-Smtp-Source: AGHT+IG1kAUIZGGL2FpD8OfcoIDTFr1DeRbS+/IB0ZpZKzo9t/JoNnEsQOvMDaxxHpNPRFEt737ZtA==
X-Received: by 2002:adf:e481:0:b0:315:a235:8aa8 with SMTP id i1-20020adfe481000000b00315a2358aa8mr4162524wrm.2.1695807092126;
        Wed, 27 Sep 2023 02:31:32 -0700 (PDT)
Received: from localhost (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id g16-20020adfa490000000b003232380ffd5sm8638236wrb.106.2023.09.27.02.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 02:31:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 27 Sep 2023 11:31:31 +0200
Message-Id: <CVTLFYVADV33.3DM00E8O1IER4@ablu-work>
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Erik Schilling" <erik.schilling@linaro.org>,
        "Linux-GPIO" <linux-gpio@vger.kernel.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 0/2] rust: bindings: drop unneeded Arc within
 Chip
X-Mailer: aerc 0.15.2
References: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
In-Reply-To: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Got the prefixes inverted in the subject of the cover-letter... Correct
in the patches though. Will fix if I need a v2.

On Wed Sep 27, 2023 at 11:25 AM CEST, Erik Schilling wrote:
> While reviewing code for thread-safety. I realized that this structure
> was a bit more complex than it should be...
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (2):
>       bindings: rust: construct chip infos by reference
>       bindings: rust: drop unneeded Arc within Chip
>
>  bindings/rust/libgpiod/src/chip.rs | 83 +++++++++++++++-----------------=
------
>  1 file changed, 33 insertions(+), 50 deletions(-)
> ---
> base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
> change-id: 20230927-chip-drop-arc-57debbe1e52a
>
> Best regards,

