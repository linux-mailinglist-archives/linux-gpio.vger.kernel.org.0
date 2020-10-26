Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F712992D6
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 17:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781097AbgJZQs3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 12:48:29 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:33426 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1786372AbgJZQqz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 12:46:55 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 12:46:55 EDT
Received: from localhost (ip-94-112-194-201.net.upcbroadband.cz [94.112.194.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id C817240006B;
        Mon, 26 Oct 2020 17:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1603730413;
        bh=wXv9z5SOllwXrTsHAvLgDIFoVqheECdezujlAfhDQ54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=j++p1DKt862gSu237c1C/A1vQ8XXUJMa5OnpstoiQSoWHAiZpMoqfxztcPKtLSMrB
         suRUmif731gvRGXJdeKK9/KJL4ulFf4WFFeyscwZNWS+tvyBfI/X4VA0W5d4BXqc3Q
         EOq3fhK5rCI3DSrdd6pKHQE8HtTmzIZ+vH808dKlj5E7+voQ2tjCadxGwIRi8DK8TJ
         j+YP0wSrtrDzzLUyzpDa9L2BBQi2R/PDlOk3KrEbPY5Ab3+tWR1C/2eYl7Hvn8Pjsc
         zWxHxurDn/b4MlP6fksrSv3HOilmZL9PW7QZZmDpJ9I1WcSs8qzTHn7nH8gwu5J3yS
         /ciDnti83QBOg==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?iso-8859-1?Q?Martin_Hundeb=F8ll?= <martin@geanix.com>
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Use full chunk of memory for =?iso-8859-1?Q?regmap_configuration?=
Date:   Mon, 26 Oct 2020 17:40:12 +0100
MIME-Version: 1.0
Message-ID: <2f13a7e2-75b7-4269-8079-2fd85c36bb68@cesnet.cz>
In-Reply-To: <CACRpkdYaOnxunieAGTvr5HVvf2BhTgzMFECpSVj5urjtUorj2w@mail.gmail.com>
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaOnxunieAGTvr5HVvf2BhTgzMFECpSVj5urjtUorj2w@mail.gmail.com>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.14.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Patches applied, fixed the extra typos in the process,
> thanks!

Hi Linus,
are these patches already pushed? I've checked the gpio and pinctrl trees,=20=

and I don't think you've pushed them.

Anyway, they fix a boot-time oops with 5.9.0 for me, so:

Tested-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

With kind regards,
Jan


