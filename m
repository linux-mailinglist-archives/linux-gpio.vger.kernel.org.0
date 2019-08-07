Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 014B3844D1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 08:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfHGGu4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 02:50:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46566 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfHGGu4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 02:50:56 -0400
Received: by mail-ot1-f67.google.com with SMTP id z23so71838454ote.13
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 23:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=metaGQYxtbfHx6hnQ4u/VJc4vYnoAVxonHKzEk5WlPQ=;
        b=cKLXTA4Pr959YKG0rnT21yW1LjlEMi/MpW920MIV+RzOl8IboD/2kngIbwA+UI31fz
         1W0bs32ZwTaWvAUTC7yAISWdWJzZ0JpLWW0FjEPwNLwXmB71EdPz4norq0MLndCgAIid
         JEx7PEUuGvj9l+HbNTjKukj9Wg3218PdmLW7NCzt1wHtVteVqAoH7QQI+YLNqJg6GrcE
         cPsFCcCPjvrktlC5NeAgDEQ7SghwaiM2+RpMzSjMWU/F6gWz3TuxXPYh70XGpP9WkICy
         nG6JknM8voQco+j7zvOlY2AF/PjQhGsFG5665DUyuxFnBF1reOqDYxfER3KBiAjHaDDU
         qObg==
X-Gm-Message-State: APjAAAWhF0wtfI0RN6APCrNo3+KE1KVZurU9XrsNiXWG7NOP7R6Ai3L+
        fFp4x2ddps10EnxUY3/WMIAhu342Q87EnL72XZI=
X-Google-Smtp-Source: APXvYqxzfJGbT21PlWUVKPXToWF9HFbsRwBuBxGE2uAzTZu5t3ddNIoEzpfZGpmVuUbQeHqWy/s/BDVyyNDojbRIowY=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr5222731oie.102.1565160654776;
 Tue, 06 Aug 2019 23:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <201908061021.pQY2TnEK%lkp@intel.com> <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
 <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com>
In-Reply-To: <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Aug 2019 08:50:43 +0200
Message-ID: <CAMuHMdWZzZWzmXUt9SdVh_fviWQ_kqDzo20qRAOQhwu=qw484A@mail.gmail.com>
Subject: Re: [pinctrl:devel 16/46] drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10:
 error: incompatible types when assigning to type 'volatile struct SHIFTER'
 from type 'unsigned int'
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     kbuild test robot <lkp@intel.com>,
        Stefan Wahren <wahrenst@gmx.net>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On Wed, Aug 7, 2019 at 12:41 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> could be renamed shifter_st, I suppose. Only used in
> arch/m68k/atari/config.c and drivers/video/fbdev/atafb.c.

Yeah, exactly my thought.

> On 6/08/19 7:33 PM, Geert Uytterhoeven wrote:
> > CC linux-m68k (shifter too generic a name?)
> >
> > On Tue, Aug 6, 2019 at 5:00 AM kbuild test robot <lkp@intel.com> wrote:
> >> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> >> head:   d55b7fdd58ac12e76ef65979af4a13b9c15fc00d
> >> commit: e38a9a437fb93ddafab5030165e4c6a3a5021669 [16/46] pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
> >> config: m68k-allmodconfig (attached as .config)
> >> compiler: m68k-linux-gcc (GCC) 7.4.0
> >> reproduce:
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          git checkout e38a9a437fb93ddafab5030165e4c6a3a5021669
> >>          # save the attached .config to linux build tree
> >>          GCC_VERSION=7.4.0 make.cross ARCH=m68k
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >>
> >> All error/warnings (new ones prefixed by >>):
> >>
> >>     In file included from arch/m68k/include/asm/io_mm.h:32:0,
> >>                      from arch/m68k/include/asm/io.h:8,
> >>                      from include/linux/io.h:13,
> >>                      from include/linux/irq.h:20,
> >>                      from include/linux/gpio/driver.h:7,
> >>                      from drivers/pinctrl/bcm/pinctrl-bcm2835.c:17:
> >>     drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
> >>>> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
> >>      # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
> >>                           ^
> >>>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
> >>       u32 shifter;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
