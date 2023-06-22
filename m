Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C277473A2B0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jun 2023 16:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjFVOKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jun 2023 10:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbjFVOKg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2023 10:10:36 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8ADE2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 07:10:35 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-471632450d1so2108303e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687443034; x=1690035034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqiYLvjtPwFt36rZVjOspclSGimmNPvS21LMJ1k1S3M=;
        b=w8T68vtmrB5jVdek6igETCSc78/YRLEYIKj5+rpWPkXXd0Zhu6DJtZo6QHDwVFtJY6
         ySXSCvJwb5+2QkJ4vihwV/sL88KVI/6St6IgFDayJOTOHte+EiLvujnUExSJCn4q0z5w
         XTwvhTDz5HjAwAs5SzLMLooScUEMusuK7pKjEx0KbWdd4L1L0kS8aHZLlOA19zaBHKSP
         nTujJoUW5TeJD9UdymOa/uocX3nXhFXPfAAbaTqF3EalxTgQoMZNwaxblVFGYaAz7kuY
         GsAsik8bidWe4TQWwwXcAefRs4Oq7Khis8zYX9AB/qpuBDRSWQCL/CvZwcHEF/oML0Et
         YeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443034; x=1690035034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqiYLvjtPwFt36rZVjOspclSGimmNPvS21LMJ1k1S3M=;
        b=ZbwIMk7i0j+d7mK5jHKsxh87XnsQYTyHI5y02RyGBW/XFy/JA6sN2k3P5eIVQq4jI7
         ZQYvDMHX1gd1PRntwyKmfwiY8nxHrgPZyRwqoNn4N7VRYP0MMvbIlkLB/tuyy20NBbqb
         X9Yk/soO0zkDPb2Abgk0uBRRBgyHC/xlRH7hY3+kdi4/4H2SAAopn9dArTRYE/hOpQgG
         i01US3eXIpF9X1vGxNMDDzSyk/wq0/SO1ZAas9nOtc9nL+aRljSXMWVMVU+6WsLMq3e2
         s3rNTcT06XFlZuAOtfslF8JjqFUgmZD8fYyv8KU2vOCExQcasChUiXAGEabueC1LM3Kz
         x3wg==
X-Gm-Message-State: AC+VfDyuyI3kNy1BVQY1xT1Rr//w4bzS50rfjIZ61N9FYUb7QzwoDuoq
        I2dmBhc93iyW3njYwfvv7w9rh3x1gGngTEjYhDU68ox2Lt9SJhCO
X-Google-Smtp-Source: ACHHUZ6EF52ITwHyTCl4pjqV6LCUj4gweTIrombSVK/ARCPFQz1Pae62aydzD3OrIG+AwDD51aWDHCgkr4JRMdcEvFM=
X-Received: by 2002:a1f:bdc4:0:b0:471:4d0a:6421 with SMTP id
 n187-20020a1fbdc4000000b004714d0a6421mr6157477vkf.9.1687443034529; Thu, 22
 Jun 2023 07:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124130.303427-1-brgl@bgdev.pl> <CTJ8KDK5038W.25ATPA3IS7C8R@fedora>
In-Reply-To: <CTJ8KDK5038W.25ATPA3IS7C8R@fedora>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Jun 2023 16:10:23 +0200
Message-ID: <CAMRc=MeF2yv1F=vAqDJkE7rNVBJDN6a_b77YjBkrC2p8xv8PqA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: tests: port tests to shunit2
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 22, 2023 at 4:07=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Just took a look at this since I am looking for ways to invoke the Rust
> binding tests...
>
> On Tue Jun 20, 2023 at 2:41 PM CEST, Bartosz Golaszewski wrote:
> > +# Check all required non-coreutils tools
> > +check_prog shunit2
> > [...]
> > +. shunit2
>
> Hm... How does this work for you? Under Fedora shunit2 seems to be
> packaged to install into /usr/share/shunit2. The installed examples of
> the package are sourcing that. So the check_prog check fails since there
> is no binary in $PATH and the . shunit2 fails since there is no shunit2
> in $PWD.
>
> Am I missing some necessary setup step?
>
> - Erik
>

On ubuntu and debian it's shipped in /usr/bin/shunit2 as it should.
Upstream docs suggest using it as an executable as one of two
supported ways (next to sourcing) so it should definitely go into
/usr/bin/. I think it's just a fedora quirk. Maybe suggest a change?

Bart
