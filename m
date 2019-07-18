Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFB36CBEC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 11:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfGRJaO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 05:30:14 -0400
Received: from ns.iliad.fr ([212.27.33.1]:41924 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727131AbfGRJaN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jul 2019 05:30:13 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 8CED0205CA;
        Thu, 18 Jul 2019 11:30:11 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 76BD5205BC;
        Thu, 18 Jul 2019 11:30:11 +0200 (CEST)
Subject: Re: [PATCH v2] pinctrl: msm8998: Squash TSIF pins together
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        gpio <linux-gpio@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <503b2ae8-ead6-70cd-7b21-ce5f5166a23a@free.fr>
 <20190704163527.GJ12249@tuxbook-pro>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <7431cf2d-4406-ff0c-331a-6ab82cf48b1f@free.fr>
Date:   Thu, 18 Jul 2019 11:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190704163527.GJ12249@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul 18 11:30:11 2019 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/07/2019 18:35, Bjorn Andersson wrote:

> On Thu 04 Jul 01:57 PDT 2019, Marc Gonzalez wrote:
> 
>> TSIF is the Transport Stream Interface.
>> First, rename tsif1 to tsif0, and tsif2 to tsif1.
>> Then squash all 5 tsif0 pins into a single function.
>> Same for tsif1.
>>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> Thanks for the respin Marc.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Can you or Andy pick it up for inclusion in linux-next?

Regards.
