Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384136323FA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 14:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiKUNj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 08:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbiKUNja (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 08:39:30 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EE1B7382
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:39:08 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-381662c78a9so113500617b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fsujk+z8GOWqWHX+4ujaDdwgp0FHFB6Yy2WQ5Xv8zI=;
        b=NNymIeuUwmXGmojZ2pPdaYPi9evKPZ3tbZ6ZAFyDRDwtLKPC6FlLQoRm/oOv7VPu2+
         d5XydAbN1iZAX+S+H2LcPeT1Iyc8b3F7V49V5PxiaRz5b8iVqaDpi9zu2RJVMlUY7Rxv
         Y4CPE5tD3R1gptPMdCWEdhSRcVCyk6CwYTXVgOro8HPKC/qzKAFN2Q1BDKusBZhBpt61
         pH7YntStUFHzTj7Voc99gMLd8x3C0aXRcNVDsvIc/5L4S6hNcCEWlfhjXvN1xwWdHXDn
         lB2Y0q5V4tNGWdlr91U2uJQCj7/C2/jJUDdUqqg5b/Ldr87vmuKgk0CuZ1rQk0Ig2nJA
         NLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Fsujk+z8GOWqWHX+4ujaDdwgp0FHFB6Yy2WQ5Xv8zI=;
        b=KVcP61auMMtj8ejdKYhE34NKbQYDhCuuqB78AVyKNCmos0xsABj4tyIgmy6kDd9/oJ
         tFec2s02El77ZHpGLQFDiu5VFDU5lbff6+yYxtsCSlOuDEfp66FgqgjhBbDXmyr/AxBx
         4bWN+SL/LPf5KtExMv3h6xjeVgiwSZsWll5pniwYY5Mc2HfYoQGpfdHCAjkvIB1BL+gy
         laeUVuk88OBAtDbBgYyWLmOdFpoVuNWKhCFmsm5Cy/v73DUpSo9QQRLUSojigomhJ1YH
         624Ca4NDiEBHT0HDabJKrxGb2GlmKNKgabGktq9CQeeypJlG/UpLUk7bEc0ZZRaLC5AK
         d0Mw==
X-Gm-Message-State: ANoB5pnpzV6Vgim5jLDusNL2TNCUEDp+XHoSb/d4Wt0ckPmWB1gQxZ5g
        q4Ce//KELL9emu+P2g5H1OQ0EfccFs0Q8Z/AMNeGNRaUywc=
X-Google-Smtp-Source: AA0mqf6+aIVk8JJMyzd3/4pBc4UgSK1fbLvtiF4OKnsFjuz9Rl6wQ91IT+JCIKe8mi3q3pNo14OwHN/ZFXDncuDLpMk=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr1361030ywc.380.1669037947199; Mon, 21
 Nov 2022 05:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20221117123542.1154252-1-niyas.sait@linaro.org>
In-Reply-To: <20221117123542.1154252-1-niyas.sait@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 14:38:56 +0100
Message-ID: <CACRpkdbnx9TeGjUZBYYPvJASqCRWUd+3ZaVDkh4tHsqgy4yF+w@mail.gmail.com>
Subject: Re: [PATCH] pinconf-generic: fix style issues in pin_config_param doc
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 1:35 PM Niyas Sait <niyas.sait@linaro.org> wrote:

> Fixes following issues introduced in a  previous commit
> to clarify values for pin config pull up and down types.
>
> - replace spaces with tabs to be consistent with rest of the doc
> - use capitalization for unit (ohms -> Ohms)
>
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>

Patch applied!

Yours,
Linus Walleij
