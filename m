Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F38712258
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 10:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242654AbjEZIg6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 04:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242184AbjEZIg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 04:36:58 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431FC128
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 01:36:55 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so469507276.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685090214; x=1687682214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1C64FaXQ6aEmGUtiBS/hFy+QfIma73OPq7J1+gW4XBA=;
        b=WXlF+O3fpD7X9cBRml/9g1weY8jwSF1sUA5J+xv4zqgQVOdcFDwRqako9QDtex7iY7
         9StyxHDcBujUMX+5QLpuQ1Vpahhdu7dAcTlbm14PzLpyuGFaxcOnGH9LskmMWic8eG+g
         SfLgfCI0JydVl9nP2M6xGJacwQ6gb3x1v89ZnOii8sRKfFHUFJiN1TigoMDXt9s95Zww
         weAWTQ0bgWo6CO9wZxP4YeCirRBmuGtzFUOHd7a31itis3ENWpgKy26BkVb9j1Z53m2Y
         v6uXmtDwgjTftmX6BmpAi4RskOPWprcN31By+PWkN8YkHcUzehydtkHenSBHM+zMZnqv
         K9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685090214; x=1687682214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1C64FaXQ6aEmGUtiBS/hFy+QfIma73OPq7J1+gW4XBA=;
        b=L3Z78CVD5F3Z+amMsFJrsTxaSMGlUZYSsNgLkIuHdlVMXB1YnCD7gYMf7NL/iyxd4E
         SH+4O/qBTDGi/j+CDD8xgFfEdo8lPN2h1rEnxw7Gnd3xsxaeZXzdzjS2iXKYR4tmx1M+
         2AM0PxhplnvogMpBKSkCFLIcBXVyPiE86vLvOiP6h2xS5YWOLL717COHbHJBV0Xjzdjn
         3GifdhLXLai7AJeiuNXF4RKs2SJwWKTqtRhkMzbSv8Zhy8fwRfrYlGAaAqfUWqoPwoJp
         GuQ5XAO4dl/xkUpnQ7u3bIwtulGW7L3s1ywFK7e7aZQ3TDO9NC3/DSWdi1DruG8FlO0r
         RMUg==
X-Gm-Message-State: AC+VfDw5ASLzYHcW2/P65fzODNcfMXOhbnTT4sPE9c+nA2Z85nFnMiSa
        D5xURjqaGFBgTPo62YwhXxTj5QSnLbwGSZjnQTsvgw==
X-Google-Smtp-Source: ACHHUZ70z8hYPnV+J6j2+YPEcc0NPl5FoM+kVB0t3UMWX4pvEWyp8fzL3l9IEyAVDE9xdjftlyHTIfE7FTDZZccb8YA=
X-Received: by 2002:a25:361e:0:b0:ba8:364b:8f3c with SMTP id
 d30-20020a25361e000000b00ba8364b8f3cmr864903yba.53.1685090214404; Fri, 26 May
 2023 01:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7> <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
 <20230524081454.ztcywdhjgw6axvjw@vireshk-i7> <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
 <1b9968c1-77f3-6525-af57-a6c7808adb59@linaro.org>
In-Reply-To: <1b9968c1-77f3-6525-af57-a6c7808adb59@linaro.org>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Fri, 26 May 2023 10:36:43 +0200
Message-ID: <CACMJSevb+-eCe+PPaY-=bXx=5t7+sg8BT+9ZYO=t=OzC3hmwHQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of libgpiod-sys
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 26 May 2023 at 10:30, Erik Schilling <erik.schilling@linaro.org> wrote:
>
>
>
> >>> I am not exactly sure if I understood the above comment correctly. But
> >>> if we want to eventually be able to consume gpiosim-sys via crates.io
> >>> (or any packaging mechanism that relies on cargo package), then we will
> >>> need to decouple the header and .so file referencing in a similar way.
> >>> The easiest solution for me seems to be to just add a pkg-config file
> >>> for gpiosim and use the same mechanism that I sketched for libgpiod-sys
> >>> here.
> >>
> >> Yes we would like to get gpiosim via crates.io as well.
> >
> > Would simply adding a pkg-config for the gpiosim C lib be desirable?
> > Then we can use the same mechanism. There is none existing at the
> > moment. I am not sure whether that is intentional or just not done yet.
>
> @Bartosz: Viresh said on IRC that I should ask you about this :). Shall
> I just add a pkg-config for gpiosim? Or is that not desired for some reason?
>
> - Erik

libgpiosim was not meant to be installed for development, that's why
there's no pkg-config for it. We don't install the header and only
install the shared object if tests are enabled but with the
expectation that the tests were built in-tree.

I also don't quite get why we'd want to get gpiosim via crates.io - I
would prefer to use the one in the tree. Or am I not understanding
something here right?

Bart
