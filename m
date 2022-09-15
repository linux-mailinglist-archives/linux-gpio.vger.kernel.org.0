Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB1C5B965D
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 10:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiIOIaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 04:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiIOIaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 04:30:02 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F3A1A386
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:29:55 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z13so11855772edb.13
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TS6YrFcrJR4PovUykcbqJ+VFqwNuwN/qogyATPK5bVE=;
        b=t3K+kX/fmnVmzk5ULGSpEVPyDLpCB7iEFYH67N5BtCuR6b8hSe6wG6CQFqist1BeMb
         SqY0mP4qjA00fknOsk6TvJ8otNdN2v8hY5lff5ComqHops8VUzLFJzjE9E2ywCXA0Jvt
         TD9X6KFS2d1VRnGSdaUa/8L8HW/OtII1VlOfPcxAcr/jTQ69adDjzPmpXk7E2oOx8bVz
         wHnR7MQxFkMWUaoIZCc8VYoP+msbFfpiWzsPZCeZE/B6jxc7UwzIJ1iYXHjwwgKl1Vz/
         hjjN2Ad8FGPATUBnvVUQJcbVXMImtutOJT5Yltoe8Y95V1bwCQuQGuvr7xoF1P/EPDHZ
         Affw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TS6YrFcrJR4PovUykcbqJ+VFqwNuwN/qogyATPK5bVE=;
        b=KuIQEJsvcrF6Qe2h2qBFmoHnH1ToO5trI1e3mLlMhKOsEsewCOVjearlMUaCQuZJeO
         jgK1nIMHOgWtuNrzIJKm4uc+1CLWB41vYNLpDl+d/HjRc4b52cD4O6lX1q4ZhXIiujFW
         VcqGr2YdiHXybwPW6KO22+rbYUNrRCUc6QgPiQSruk4KViIJgyp9hygcNK+tJsSNpkwu
         CRYmZRovAWakrlNrcJmHY4ZsyKf3LO3hW/Jn76qey/UuuTdLvUI2OHkwBozRXgu2UkV3
         V8Yac1inQKK3FMuA9nIWOgMS3ujz9EY9C2L3Zho2yrhkCKdkxTda+pcB5583IZA+Od3P
         5z8Q==
X-Gm-Message-State: ACgBeo02gNvC8nRv2lvbni+FMIvhv1DCUm0YsYuRLTCAsiUsuDzXRdWw
        ifXDezOlmONLjCtZxlpLGlEEcaA7Vz9KLs3Uj9QYfQ==
X-Google-Smtp-Source: AA6agR5aEj6ODyYEz854uhZc2308xE6m3RIigEol2oZviVnxt8HGYPaDBCLY1LImUu5bfnEbFURzp6qV2SnBI07M9fo=
X-Received: by 2002:a05:6402:2073:b0:44e:3555:5fcd with SMTP id
 bd19-20020a056402207300b0044e35555fcdmr32780028edb.82.1663230594429; Thu, 15
 Sep 2022 01:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660839809.git.william.gray@linaro.org> <016c8d87cef87a1375e53f1c97c41d8b969f8d79.1660839809.git.william.gray@linaro.org>
 <Yw/meB0ACIPsU6Tw@ishi>
In-Reply-To: <Yw/meB0ACIPsU6Tw@ishi>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Sep 2022 10:29:43 +0200
Message-ID: <CAMRc=McKZuV8p-ubiqLFnbhn=G0z000sKvO40wLp5HW=SjbAzg@mail.gmail.com>
Subject: Re: [PATCH 1/6] isa: Introduce the module_isa_driver_with_irq helper macro
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2022 at 12:53 AM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> On Thu, Aug 18, 2022 at 12:28:10PM -0400, William Breathitt Gray wrote:
> > Several ISA drivers feature IRQ support that can configured via an "irq"
> > array module parameter. This array typically matches directly with the
> > respective "base" array module parameter. To reduce code repetition, a
> > module_isa_driver_with_irq helper macro is introduced to provide a check
> > ensuring that the number of "irq" passed to the module matches with the
> > respective number of "base".
> >
> > Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
>
> Acked-by: William Breathitt Gray <william.gray@linaro.org>

Series queued.

Bart
