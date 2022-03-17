Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CACEF4DCA82
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 16:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbiCQPv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Mar 2022 11:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbiCQPvW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2022 11:51:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394731B5386
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 08:50:05 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b15so7098589edn.4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wCipPbypc702Xmt9LwXfckArIZrUMU9K/w+99larauE=;
        b=Wg4ktieOmE4hJ/jbq2RwF8s5lq++KXNEkfE1i1b3aP0OdDDhPQkDl1xyJvFRDbtc8b
         UbGr8K1ctGgxozJR0peUG9SsKFnfRB/Tz6XUi20fVfRuCtCtvneyGsbJzl4BA6ljEuB6
         SxGdhSkW/hqKMyK6f2oe7RFhzDiWnFKwZt9xrcZAJ7iveeBzfohS/SBhQrgx8KXTQAOJ
         3dDJa165u6lyka1pf803s1VwwnnxULIszeLqFN/GCToaceB+eWdaeaqFf028kqb3Y7Lz
         evhMp0k3TdMH91k4Anh/b8guncOzdYCzVO/VEjt8+BbwJrgQi62pVGfRFy8eY3NIvUiI
         mC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCipPbypc702Xmt9LwXfckArIZrUMU9K/w+99larauE=;
        b=ZOe2cG1XgASEWoV16F61B3NDLxWAOaycCKa3hmdu/umaxjuOJu6e3X7qAGBYSQ28Cl
         AtMpTmfQ7mSqe2T/LCxnleofjP1002bWnWjQpfGfb11w+sKLd4Y5mcvDPGDbtFXja4A/
         guJW0zTsLc3vSAIcBIAtBJYp91OgmE5zj8hcvawD5hlBR80Vh+9vWPSboceHpsp1yt5x
         7XtJwfvu0jFx7/+6sfiExtoWVwXGtRhuw0XUEV9m1gJjjM1WFh+YeInyEhGdybWcUIgd
         Nm0W3p+9oJCLUZ0oLzL5bbTATbQCZ10lACYQkk/D3LSn3ZW1k6p4femhJSvZUFsA97+c
         5pKg==
X-Gm-Message-State: AOAM5329e2E5X2Zfccvu3iXclnHNCcy9hZ7WbV1szHe7SLSO3P5DZJcH
        GaycrF7oWbQorsq4H1S4PoSGwArLBuGYfF6DaqwvrabISzuTgA==
X-Google-Smtp-Source: ABdhPJytQUIOd5Ec74oyZL4e5S0YPdJXPg/yOnIbfk8jdn7bwINpebDqJGsEOI91LvKC+mG0OvBP7hXh/3AXIlhtHpw=
X-Received: by 2002:a05:6402:5cb:b0:415:e04a:5230 with SMTP id
 n11-20020a05640205cb00b00415e04a5230mr5155236edx.352.1647532203687; Thu, 17
 Mar 2022 08:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220316020441.30001-1-warthog618@gmail.com> <20220316020441.30001-2-warthog618@gmail.com>
In-Reply-To: <20220316020441.30001-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Mar 2022 16:49:52 +0100
Message-ID: <CAMRc=MfBKuDpzT5WNBR+2N2T3mFjLqeMusRqUNkjjap4kyT=+g@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 1/3] doc: API documentation tweaks corrections
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2022 at 3:05 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The corrections to the doc tweaks patch 6, allowing for the omission
> of patches 2 and 4.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Applied, thanks!

Bart
