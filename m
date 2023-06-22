Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC1D73A323
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jun 2023 16:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjFVOfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jun 2023 10:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjFVOfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2023 10:35:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF50A10F6
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 07:35:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3112d202363so5663126f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687444529; x=1690036529;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeioJMPTiL6kWuYvV4gVPIrtV+bALvW4WOZRhbtpqvg=;
        b=Pl/HvX/yFw6f045iUiNhLpwh4dccF7dx/Hh6cWDbwBOvjZwu8Jt8RK1Z/Ct2ViHC2Y
         CiPgZMRt2x/0uUCpEn17MxCNCXJVqfol0wLF7WVz7l3ym3lkffa+guJ3li3dt6yS1QlW
         E7DoVoMqJblMVkjLj/qx+JBMXip1y5TynIS4wZHMuKAy0QBPKVkmoGT+jvIMbww+qCXE
         6cmwcGXlnyzeKQM1Xb4Ydbh8eucQXHA9xpSXsHnaaOZajjkXs/EGoJ+xU8ED0cf49v2O
         aDQGxGX/3pkPbcf5tnjr3I56g36ETSNdsyZM+N7nYnBrBnfqjojYfkGoLZaJCdtHrcD9
         P00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444529; x=1690036529;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VeioJMPTiL6kWuYvV4gVPIrtV+bALvW4WOZRhbtpqvg=;
        b=OjaGMOWVzE2k8lNuIySHy0YTB/neZ4wK15C58KuJntlfucXLBkzmEdteR+9tPNWVAy
         lgHzszaQnpYTa/scTwmKTPkv8r5gnYuPcPXrQ7gyHXj7EJgCY9w7J4egtlFce2MAABFV
         ud7R0GgamezbRDdZ7tdSasqoAiFpwcfKNQh7fYjeQzlmYewtIHpOc2KafGRDK2iPd43s
         r6GTUEG1L1PK37U/yNJo1buSkUOCcBNuyEIUUZdPeuV7qydfOFRyqo1oj9uZBvIFaBnq
         Xc40iVU8tmFRCfkl0IDVR8Gc2dJ67kO8/VFyaFv7q7UHd/NMX849Z04jXWAwbZdFbhIu
         f89A==
X-Gm-Message-State: AC+VfDz3N6tsdtbfmduQ+jO6N74hem4CEvcAiIyEQanUep4PEBFe00GD
        sjchI5pJaiPG2hriszUpHBHjUEcUQULwI3jW0Uk=
X-Google-Smtp-Source: ACHHUZ5b6fC+iwy/FX+FITpn1EkFRVL1euXsRdaReo0h0mTNpUn/sHgt2rbSOVMYxDBcqk5B2tp6tQ==
X-Received: by 2002:adf:fe8f:0:b0:30f:c2a3:627c with SMTP id l15-20020adffe8f000000b0030fc2a3627cmr1791706wrr.68.1687444529280;
        Thu, 22 Jun 2023 07:35:29 -0700 (PDT)
Received: from localhost (i5C7405EF.versanet.de. [92.116.5.239])
        by smtp.gmail.com with ESMTPSA id z2-20020adfd0c2000000b003062ad45243sm7243512wrh.14.2023.06.22.07.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 07:35:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 22 Jun 2023 16:35:28 +0200
Message-Id: <CTJ95UFCTP75.AAR2V3ULQOE9@fedora>
Subject: Re: [libgpiod][PATCH] tools: tests: port tests to shunit2
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Joe Slater" <joe.slater@windriver.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230620124130.303427-1-brgl@bgdev.pl>
 <CTJ8KDK5038W.25ATPA3IS7C8R@fedora>
 <CAMRc=MeF2yv1F=vAqDJkE7rNVBJDN6a_b77YjBkrC2p8xv8PqA@mail.gmail.com>
In-Reply-To: <CAMRc=MeF2yv1F=vAqDJkE7rNVBJDN6a_b77YjBkrC2p8xv8PqA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu Jun 22, 2023 at 4:10 PM CEST, Bartosz Golaszewski wrote:
> On Thu, Jun 22, 2023 at 4:07=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > Just took a look at this since I am looking for ways to invoke the Rust
> > binding tests...
> >
> > On Tue Jun 20, 2023 at 2:41 PM CEST, Bartosz Golaszewski wrote:
> > > +# Check all required non-coreutils tools
> > > +check_prog shunit2
> > > [...]
> > > +. shunit2
> >
> > Hm... How does this work for you? Under Fedora shunit2 seems to be
> > packaged to install into /usr/share/shunit2. The installed examples of
> > the package are sourcing that. So the check_prog check fails since ther=
e
> > is no binary in $PATH and the . shunit2 fails since there is no shunit2
> > in $PWD.
> >
> > Am I missing some necessary setup step?
> >
> > - Erik
> >
>
> On ubuntu and debian it's shipped in /usr/bin/shunit2 as it should.
> Upstream docs suggest using it as an executable as one of two
> supported ways (next to sourcing) so it should definitely go into
> /usr/bin/. I think it's just a fedora quirk. Maybe suggest a change?

Done: https://bugzilla.redhat.com/show_bug.cgi?id=3D2216783

- Erik
