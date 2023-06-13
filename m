Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F9672EAB1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 20:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbjFMSSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 14:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjFMSSM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 14:18:12 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD101184
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 11:18:11 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-56ce6bbe274so42720947b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686680291; x=1689272291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3jeE7DVQL64/LAB0gEQ9aqldA64x4ArcQNWljKfFuo=;
        b=N9QOc3XQA+yTi24Iik91xssvIngenc6CeXLc050E5jJ8bxjxCGCB0d0NYgyixiqXjQ
         ZYkJjJAbX7djbP7DjNsdZFykL6Y291MLKoG86b0WyhxMEDVj7l6y0CyU6DSSW6VtQRRE
         a8cMZjgJgOyvGvfqN5WhHnkFgm1j+PkESZSErFspwfY8Q5jLciZrqDHp6Xsfhr1WLrqO
         O+RxfCFISy0qDCybu2afEro3HDy2+o9sOflLUsLdaOxUmxq4fAvbgzY4ZntKDUo+NSka
         /MfJ6GMKQDoLY+KIzRNm0SGvIklG5E6KY3oz874rOJok/6DvrVNcjExgINf7Z0TiJycF
         fTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686680291; x=1689272291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3jeE7DVQL64/LAB0gEQ9aqldA64x4ArcQNWljKfFuo=;
        b=FBsFuS2RMDHhyAILi432uXpgDqJOQOasfCx5p3dEOWOwn/rxDbVrN0H7ib97Iwu/vb
         iRrpos27c/FYV9tkatjvZtPs5+WCYPGLbk+tKKhA2x4vN8Q3YIi27IHgbL0pIMU+90lJ
         VsB9xGipEiS1E7yLA0oDlxNHVdIn673TRD9m/3N39LHuQynZFoq8/dSECTrf10ONrnRY
         8rp0bVH5bpV9OjcnoqMb/M/Gs+dBqZR4QhN4ouVdBiST0afeOHP62bAYkBomd5aW+Q5f
         uASCildXRgtdjhqhsiAfytEMXBb8LO0N4+SnOa2lmx7KAbrAVoVm4hIqv8Zny/1nUca6
         FXYw==
X-Gm-Message-State: AC+VfDwHu/ke2GodNLTLG/d6yddsrHRoDfpHUQtmy/+qL4CPGG/PcuIz
        oLwItSQ1xUKsNaolod8FlAmRGTDWLnJr+s0XmhZb6vGlRD4pTcFPmXk=
X-Google-Smtp-Source: ACHHUZ5G5FB19PgvEirbHYRzs9fEquyZsRcFyH6tJsNMJ+2W1QyRyp+YzqBDfGDlfE5K76MTRccXsXNPjDkNhDdH4uI=
X-Received: by 2002:a25:da8e:0:b0:bab:badc:41c6 with SMTP id
 n136-20020a25da8e000000b00babbadc41c6mr2079962ybf.24.1686680290957; Tue, 13
 Jun 2023 11:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230604131215.78847-2-andriy.shevchenko@linux.intel.com> <24d8898b-1e3b-8180-e96b-a3296de178a9@web.de>
In-Reply-To: <24d8898b-1e3b-8180-e96b-a3296de178a9@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Jun 2023 20:17:59 +0200
Message-ID: <CACRpkdbE8RArEZUnRw_wpHHJh8BgUXGkN+kWkdrpk+aNrUVUdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Relax user input size in pinmux_select()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 13, 2023 at 4:38=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> > This is debugfs and there is no much sense to strict the user from
> > sending as much data as they can. The memdup_user_nul() will anyway
> > fail if there is not enough memory.
> >
> > Relax the user input size by removing an artificial limitaion.
>
> How are the chances to avoid typos also in such a change description?

I don't care much about typos, and when a patch is coming from Andy
it's certainly not a blocker for anything since his patches are
of high technical value.

Yours,
Linus Walleij
