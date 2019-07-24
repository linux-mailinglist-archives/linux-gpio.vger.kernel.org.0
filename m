Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D00773C69
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 22:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405479AbfGXUCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 16:02:19 -0400
Received: from mout.gmx.net ([212.227.15.19]:52617 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405457AbfGXUCR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jul 2019 16:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563998512;
        bh=T4e1UQqbbH+oLV6dGah83Ww22Wm0bVK786RxGVpsfXw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Dg1Hk0cm41ei3P6pSvfw3oxZDzRYlpXNWXaD5BBcvXAv4NSBR9N5axC6u14HzCZTi
         agfCrvDGvU4ykWndU/aBwXbobQJSkab+g/krIvbZjjOvYGbwmx1PCp0CpO9SdPmer3
         XlKIAAU9UdLaeiYbNtw3p63OWQlbD0eciHpHJix8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.139]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dsV-1iVEWb1kof-015biz; Wed, 24
 Jul 2019 22:01:52 +0200
Subject: Re: [PATCH 01/18] ARM: bcm283x: Reduce register ranges for UART, SPI
 and I2C
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <1563774880-8061-2-git-send-email-wahrenst@gmx.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <983aa783-03e0-e6a5-5771-810d4753036e@gmx.net>
Date:   Wed, 24 Jul 2019 22:01:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563774880-8061-2-git-send-email-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:M55CLQbFJEJ0iH0ZaHgnggnyElHCISHtPbBQesSsTn+oCnunpQg
 ffT1724/dsdrFgXB3EHrpsCW5Ufqj25i+zgSoFhCfW7nJrihX4tvURjizcU4hZTqo6KsWWG
 M9NvWXlUgsgwBP66Y9bgde9aD+cxpR7LWPVvp81VSq4cnJ0H1blAYoZAnqHR1Jy1DgzVm0X
 z1qdAiWxxUC8WfJOtJH4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6eXC6oFQKRo=:bhwdn/zpwjzsfK5rQgPHfB
 u5rO3lBjRr4oLDU7FnPDFWz8SZM/l3BB7YeZAtR3dFfON52Rm087/Fbq2P7wEaLbzbpVAhzWj
 kuTwXRKhGCj9U0GJmKdsHAHkXkn1mkTkKEDGKF9UMlaQNxkMNJrM0UOTRyZ3qShliM35Zn9k3
 /gLUV+L9DM7d/ZO6l4JaCKT0q5toDef43CDeDZZlalC9YYmiOcqYnyq5dsToBiC+pgr/vwhkD
 3+RaydJV9WYmUXsmJi8Ag7iu1QjWk+MK/YuAJOSRvWQ0mezqBfZoMpqmOVUmcatrDU074LPQ5
 Ja/TFITpwtByIlmQWWlx/p2KeeruZknMBFlw5k2QhkL5NlMuBRD9BLCbM4isJ9mL6PyPgI8lC
 sngk1bvUvfXd96gxK1v3IwE9W5m98B36nX5LyXXxU4hw46h4mMeg1zz+0JXDmOj8eQmdIvYvY
 3Xaml8lP4kPs1D3+26HSWYoh8G6U/Pbopz4zY8zwYrZawFwBl0ixRnFQWrDapqJGaxACIwvbg
 Pxilahwx6538Aswt6C0f/oVQEJ/+QVGH2SZBvwzyuxUBz5cE5rXS/Cm2DgvCwoa2/iKsTwPIT
 HI3VsT+k3l40FLw2M5o9mYNDLvDt79aG39bATtjhceD1T6p+ab6JIQ2y0FfpxkxlqL7OFXmQB
 YpW93Fo4q0nExE0YXnST+SahWvtBvl6wLcr5xtDqInXR7jtqilfqrelRKbw5k/5cgZo66gGEc
 Gen/LJ/ZzHDOm1EAu7AxEHuoPorgZrWyn1azw3buwLyRSsf7fH7MsYt9ctBfNehLkK2Oecy9a
 MV8U6cjUtERyB5MnWoJ02br1rsZBD/A4ppu9aH1dj2T5O1MEwyaI0hKILZneRcmlgRFrjMheB
 qWnSs7az8Yi93K4etS1I0hH9dYWIokz6BkTIjPsnSUyw8Yk7jI4MKdqey559hPTRwxJZLlIdS
 Gno9aUyc+GmObIAdubccYwvnsiQYZmEEBfdoiLz+s6+uYQ06za00GO29f0vsQkH0lIw2UXeqt
 VicXKFwZlZAK2Wm7/85X/JpOz/peCQHxjf8KgiZK7Xp6dBkW5xdykkdlgrc3K5isNOOSx3rjv
 1v28Ty4PJS1c2Y=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 22.07.19 um 07:54 schrieb Stefan Wahren:
> The assigned register ranges for UART, SPI and I2C were too wasteful.
> In order to avoid overlapping with the new functions on BCM2711
> reduce the ranges.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Applied to bcm2835-dt-next including Eric's Ack
