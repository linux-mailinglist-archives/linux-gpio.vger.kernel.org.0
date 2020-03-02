Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558731751CE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 03:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgCBCdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Mar 2020 21:33:20 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42608 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCBCdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Mar 2020 21:33:20 -0500
Received: by mail-qk1-f193.google.com with SMTP id o28so8678767qkj.9;
        Sun, 01 Mar 2020 18:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWIRxMDx4FAXaSe6wG94uvUpHfjWqjY0tqCRVPxKBzI=;
        b=iQMVAY2Ndh6lL0ADxF8SUuHgZM9LffAiUH9Jvo+D7d/ez5K2m+Xaq6zuA4Va/AQqpV
         4yIO1YhZtjdhB16NbDa+FGYPHncktlCZH9TI2o2TJd+0MrWrNFr8TYpNnC9Zv8PRmBz6
         nb0vIZN2EZjNqdK+AoHPFEZjSupAG+P+IP6xup6n+0p5tkkTgPOsoXgFVAC9UqGaZH5t
         x3mZmg7tOMLdkleO2q6pMA7krpmC0HGvpoWMZHheKpdGpVoGShjT8VdSTdvmuzwCL7Bh
         7g2Y0Dn1NlknZDnen2WoNzmnDOHrIMLrpBk36ojLpStVKvCxsTswk2UEE8EIMhaP99XC
         1BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWIRxMDx4FAXaSe6wG94uvUpHfjWqjY0tqCRVPxKBzI=;
        b=KO8LXoPI05mej1kczmiQx29UOwbitfFn9vD838sNi7LexBb3vHTa/GPnHfI7AioA4C
         hDpeuAOFQIizyyz3kE2a+8ESMOeOEz7uxVJ/kxvxiPRX3kxrJw7VLmCOLhXM1WHEKhNm
         AuTfRNEnhn6HAD3BvLGVIDgajD0DxKYbvuTehFgvNQUx6QXQLRnbbzBuawSwSpuUcHHO
         tHtosL9nownggvjxVnEftCRV9R6USS9AGGIv4D1KDOqZ0qE7U0LZMSWT69o4WnQdwKpQ
         bzSj7hOmEEkrg0b9aYzQiGBqPtqZs7rnyjouZ0hLZjoYza40oaK3uBF025DkF3pZF7/P
         MrgA==
X-Gm-Message-State: APjAAAXVMMB6UCJLH6xO9j4ZHDFswFoSRynv+uCk3fiCxb94p9G4NEl1
        0pPiwDUp2TK568T3GBTySI98M4WVPFjnLHFn7x54F7HP
X-Google-Smtp-Source: APXvYqxWCNUo+QCfgt2XoZOE8ooJt2tqa9zZ3mhTxXmdKAeQmDiToITnQJU/qN0uQKHKjwSjJ0PBZ4KYYvNyPiwzNug=
X-Received: by 2002:a37:6447:: with SMTP id y68mr14513354qkb.114.1583116399569;
 Sun, 01 Mar 2020 18:33:19 -0800 (PST)
MIME-Version: 1.0
References: <d7239f3c7379e402f665fc8927f635ac56691380.1582776447.git.baolin.wang7@gmail.com>
 <202002290858.UhNBgssD%lkp@intel.com>
In-Reply-To: <202002290858.UhNBgssD%lkp@intel.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Mon, 2 Mar 2020 10:33:08 +0800
Message-ID: <CADBw62pAtWkoSqX=d=3qvi+JLwb28OnMd2VHSaC130ScYpNJ1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sprd: Allow the SPRD pinctrl driver building
 into a module
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

On Sat, Feb 29, 2020 at 8:41 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Baolin,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on pinctrl/devel]
> [also build test ERROR on v5.6-rc3 next-20200228]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/pinctrl-Export-some-needed-symbols-at-module-load-time/20200227-121948
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: i386-randconfig-d003-20200229 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
> >> drivers/pinctrl/sprd/pinctrl-sprd.c:282:8: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
>      ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            pinconf_generic_dump_config
>    cc1: some warnings being treated as errors

I followed your attached configuration, but I can not reproduce your
building error. Did I miss anything else? Thanks.

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
