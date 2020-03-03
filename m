Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58184176F9F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 07:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgCCGtL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 01:49:11 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43521 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgCCGtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 01:49:11 -0500
Received: by mail-qt1-f194.google.com with SMTP id v22so2013827qtp.10;
        Mon, 02 Mar 2020 22:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQ7+Ef/3tVnwWmKN5BTMdijO3IVFIc6ME1MwlKqUcZU=;
        b=L38YK67bV0n3eydzwXR5khhw+tDh2beuqoeaMGhMYIOfYvnYJ97k7oHDPvEg4AUfts
         C958CfObeXA65i+SX6PAsgsHLSF67UNUAkpJUL9dHVe14CNKx2mCk/Kvr8w1LneAhpX0
         ZuEEZGnxyK0LLulkVzQaHEUBD/jf42ixwCaR3dyB4ytufkN+vjXmfPxdSxRuLv6/rJT+
         7Q7tfHRvg9eWW8lI/lhWr905QqrGmPw0aWW2xwSa2uFaINdhikWK0DyA+Sp0ZCuT8OQ3
         ZD1WxSRWmeKRetxj8aSSKNiTLPIhijzu9j3SlRqTi5eRI/2waj7tM5bhHK4kETaEG9w2
         1vZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQ7+Ef/3tVnwWmKN5BTMdijO3IVFIc6ME1MwlKqUcZU=;
        b=Dd56v+jmD4C2qPLDRRiml7o2S5ArLPq4HvMSNFaMBKa3cWFLGVKV72EyjE5Q8CUxmI
         3Ka9oIMj05UHidfQj0i59yyE0tGiFfBr8WbUqytwi2r5neBSyynEabW1Pf5nFqKbFpp4
         RrEYZ3heWErXsSEAmtM05m1qvSMdcyevH52TdUKfiQXPIPexmpUZBkTI45b0Saxu2ydd
         fC44SmzpHVnHMaUPGsiTj0tGtsZ3pBzBk7jS+Ii/9vqWL2631P5Yp7ggL98OWSberOST
         zN6tDQKxVuh0t6ySLDgMyLQUsqR1WgiD9W/oYvWnTrr2wbKaABpuxVxZGs2+ZvCFSZUA
         ftRg==
X-Gm-Message-State: ANhLgQ2ULOxv0pbuHYOgr2tdgpaS4y9BqnvJsVjS4LlRhFEzmLcsrmJW
        QA/G8SEo5Zl+9f+hWxD+1yr4YDaqkMggftPHo0VzO9j5
X-Google-Smtp-Source: ADFU+vs4R8qEKRNY1/lZafw5dUr172u+Evb/NOh748tQmYp5cP0msuGg8tZjIX/zixgCsh2nB8cC2fQr5vW4zn5Ag7g=
X-Received: by 2002:ac8:4408:: with SMTP id j8mr3106825qtn.3.1583218150151;
 Mon, 02 Mar 2020 22:49:10 -0800 (PST)
MIME-Version: 1.0
References: <d7239f3c7379e402f665fc8927f635ac56691380.1582776447.git.baolin.wang7@gmail.com>
 <202002290858.UhNBgssD%lkp@intel.com> <CADBw62pAtWkoSqX=d=3qvi+JLwb28OnMd2VHSaC130ScYpNJ1g@mail.gmail.com>
 <89d9811d-9c6d-6e53-4da7-60026c1b0ced@intel.com>
In-Reply-To: <89d9811d-9c6d-6e53-4da7-60026c1b0ced@intel.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Tue, 3 Mar 2020 14:48:58 +0800
Message-ID: <CADBw62og=tuq1E695ujUM_PsFHySOymmevB2o1XaYGXZe8y3Dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sprd: Allow the SPRD pinctrl driver building
 into a module
To:     Rong Chen <rong.a.chen@intel.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rong,

On Tue, Mar 3, 2020 at 2:43 PM Rong Chen <rong.a.chen@intel.com> wrote:
>
>
>
> On 3/2/20 10:33 AM, Baolin Wang wrote:
> > Hi
> >
> > On Sat, Feb 29, 2020 at 8:41 AM kbuild test robot <lkp@intel.com> wrote:
> >> Hi Baolin,
> >>
> >> I love your patch! Yet something to improve:
> >>
> >> [auto build test ERROR on pinctrl/devel]
> >> [also build test ERROR on v5.6-rc3 next-20200228]
> >> [if your patch is applied to the wrong git tree, please drop us a note to help
> >> improve the system. BTW, we also suggest to use '--base' option to specify the
> >> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >>
> >> url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/pinctrl-Export-some-needed-symbols-at-module-load-time/20200227-121948
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> >> config: i386-randconfig-d003-20200229 (attached as .config)
> >> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> >> reproduce:
> >>          # save the attached .config to linux build tree
> >>          make ARCH=i386
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>     drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
> >>>> drivers/pinctrl/sprd/pinctrl-sprd.c:282:8: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
> >>       ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
> >>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>             pinconf_generic_dump_config
> >>     cc1: some warnings being treated as errors
> > I followed your attached configuration, but I can not reproduce your
> > building error. Did I miss anything else? Thanks.
> >
> > CONFIG_PINCTRL=y
> > CONFIG_PINMUX=y
> > CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> > CONFIG_PINCONF=y
> > CONFIG_GENERIC_PINCONF=y
> > CONFIG_PINCTRL_SPRD=y
> > CONFIG_PINCTRL_SPRD_SC9860=y
> >
>
> Hi Baolin,
>
> We can reproduce this error with attached config and our branch
> "https://github.com/0day-ci/linux/commits/Baolin-Wang/pinctrl-Export-some-needed-symbols-at-module-load-time/20200227-121948",
> could you try again?

I can reproduce the warning on X86 platform now, and I've already sent
out a patch to fix it. Thanks
https://lkml.org/lkml/2020/3/2/1551

-- 
Baolin Wang
