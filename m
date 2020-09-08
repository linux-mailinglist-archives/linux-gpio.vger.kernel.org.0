Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1992260C56
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 09:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbgIHHqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 03:46:19 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57477 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbgIHHqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 03:46:11 -0400
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N2VKr-1kgOtC1sfn-013tco; Tue, 08 Sep 2020 09:46:09 +0200
Received: by mail-qv1-f48.google.com with SMTP id b13so7351788qvl.2;
        Tue, 08 Sep 2020 00:46:09 -0700 (PDT)
X-Gm-Message-State: AOAM531Vo6g73i+acpKioDGzJC5g35J2aNLAvhFJu986Bw6CqiZAuoaC
        sxrcIDflgnbeWKQoXStyVdjG2urKwHqygQGbwMk=
X-Google-Smtp-Source: ABdhPJxeUMqCctMEC+AYLorkfFHD1jWsFRFQrdZMhrt86JuWl8Xqf8uBNpnbi7bbgNurumDqIM25KE49sLc58JGfTUM=
X-Received: by 2002:ad4:56a6:: with SMTP id bd6mr7351qvb.29.1599551168089;
 Tue, 08 Sep 2020 00:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <1599549126-17413-1-git-send-email-Anson.Huang@nxp.com>
 <1599549126-17413-3-git-send-email-Anson.Huang@nxp.com> <CAK8P3a1NY07QmD+vzD3+5DsY69XYcwEz3vuwXUcsVG6jxwtTow@mail.gmail.com>
 <DB3PR0402MB3916716E9FC26ADF9161B4A4F5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916716E9FC26ADF9161B4A4F5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 8 Sep 2020 09:45:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2v9i+iT5_TKSjDwVpw_dQrhfRiVNm3YOL7W7YTAEdagg@mail.gmail.com>
Message-ID: <CAK8P3a2v9i+iT5_TKSjDwVpw_dQrhfRiVNm3YOL7W7YTAEdagg@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Yrf1UZZQeTAvI7jGEhdaZIv3A8GxRYnu6rIQvrSYFvNRthKa+Uk
 d/JaMjDVNK6TWgTnQSDVEgFL4w1ciiykW6XGVEe29XF6NGh9f42QtNQP6J7g6CXGIwtfV2d
 8cdVHawFoivkdZ4zf7AmKQYXMWC/tkXX67D0bKOYML/yHzDB9oq13msQ1tpnVbvsoPO+iMW
 qR/GKYdXf0HQ9v8ys1NtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8MBZiWdFlXg=:LAg01fFra0IpI7KjdlTsmJ
 SWpGDiJrz/z25vMBfMAB7ifxdlqB3YzhtwJcWX3DYYmaUo8ty7Kkb484PU5iS9SrHOOjK4if1
 SwRycQ8rQaD6rge62d+KYBDY4CRr0TIOg27kS71QsQ9LnnsVTx6Kvw7vUPN/PQ8nqhZaxmg9A
 rdhily6qOcrC41wRo2uvnk//ED8hkr+DscaD5r4KCCyzHNxdVSQ/vJ81loiNz8ZtgIF0xEaYW
 lRgvqrD0CIHhvq7i/+2gVSa1vBWgycIqCdPlD8L3YTQNBW/tcHcisv4lnhY9n27AULjmDs3+N
 gWqHyYEGgWtw2ovknt1XQ8uwj8LC6ArcGEUo+U+Ghk+NoCTqSVw4k1U2ukkxC/bohphWsC+b3
 PbZ93PENHgi9YaNnbYpoG7mr0WXA+aNfg1C/VkKi/fp54teVZhl+7wJQ/Q89zNqN2+RYVaYJv
 q6fF4J+p0epgVm8gx3d4BSQfE9HlbcAXP52EigV7JSGnsvFiGVBWHfZ29ecRljWWcUFkVkyQf
 SH9cSJBv08pSS40D24mAFpAjWqIl2yozDlnJg/UfOe9Z0k0v8Vt58bvjj95BsVz1q63sZFbWs
 9I58D61l0mAta2PzWpiNygt++xJxiENBapVsaxEHPnbxmfHoh/2avSlIcNnK6GQnjrP4x3X6n
 3Z5+ZYhEVPSWCh0jI6VdSV0fa+ikeBuRD1dOfdssWI7aU5hhqZzcNFAUk8ORVnBL4YuVuB0CL
 oh87Ec705hgPcsachqO1T2na/ji6f0t59ROXmh00C7jFvqmI79//idZ5AbDtDB3xHrhYpl1WX
 dQDwyjILIycN7ks/OMe6nHTkrXsnZGE4Dql4KcrmhEX8WJHr5Udx8x3VU/59Mv5y4H8ggnNUj
 b3lzzcKjejdam4FxLbS1PjbWHMexB4Jlp3ll86plKXqP6BJr03qldNlXzZ1MZ0Jrxmp58Ut1b
 jNugHWDPUxFkBwW7vj8hxB3+zqXwV7vyRKiaZYyhwowSjSktUrgXs
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 8, 2020 at 9:34 AM Anson Huang <anson.huang@nxp.com> wrote:
> > Subject: Re: [PATCH V3 3/3] pinctrl: imx: Support building i.MX pinctrl core
> > driver as module
> >
> > On Tue, Sep 8, 2020 at 9:20 AM Anson Huang <Anson.Huang@nxp.com>
> > wrote:
> >
> > >  # SPDX-License-Identifier: GPL-2.0-only  config PINCTRL_IMX
> > > -       bool
> > > +       tristate "IMX pinctrl core driver"
> > > +       depends on OF
> > >         select GENERIC_PINCTRL_GROUPS
> > >         select GENERIC_PINMUX_FUNCTIONS
> > >         select GENERIC_PINCONF
> >
> > I don't see why you need to make this option user-visible when it is already
> > selected by the drivers that need it. Wouldn't it be enough to change the 'bool'
> > to 'tristate' without adding a prompt?
>
> Make sense, so it is same for PINCTRL_IMX_SCU, right?

Yes, correct.

I wasn't on Cc on the other two patches, so I missed that.

     Arnd
