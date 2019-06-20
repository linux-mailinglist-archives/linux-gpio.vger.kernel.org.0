Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B99C14CC86
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 13:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfFTLDO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 07:03:14 -0400
Received: from ns.iliad.fr ([212.27.33.1]:33118 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730730AbfFTLCr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Jun 2019 07:02:47 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id B20532067B;
        Thu, 20 Jun 2019 13:02:45 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 9A63B20600;
        Thu, 20 Jun 2019 13:02:45 +0200 (CEST)
Subject: Re: How to write "modern" pinctrl DT node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
 <20190611180516.GO4814@minitux>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <be298c01-53b8-a954-5de0-3f302265f1cb@free.fr>
Date:   Thu, 20 Jun 2019 13:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611180516.GO4814@minitux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun 20 13:02:45 2019 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/06/2019 20:05, Bjorn Andersson wrote:

> Also, what's up with tsif0 vs tsif1?

Some people count from 0; other people count from 1.

The HW programming guide mentions TSIF_0 and TSIF_1.
The pinctrl driver defines tsif1 and tsif2.

I propose we use 0 and 1 consistently everywhere.

> PS. I would suggest that you send a patch to the MSM8998 pinctrl driver
> (and binding) where you squash tsifN_* to tsifN. It would break
> backwards compatibility, but I think we can take that risk now before
> someone starts to use it... And after that you can go with your proposed
> squashed node.

Here's what I have right now:

$ git ls --stat 85c02fb4dfd1..HEAD
5ed38c44a92a (HEAD -> tsif-fixup) Fixup qcom,msm8998-pinctrl.txt example
 Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
823402af81a6 Fixup qcom,msm8998-pinctrl.txt binding
 Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
afb686b8b3e7 Squash all 5 tsif1 pins together
 drivers/pinctrl/qcom/pinctrl-msm8998.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)
8e4d31c8d455 Squash all 5 tsif0 pins together
 drivers/pinctrl/qcom/pinctrl-msm8998.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)
ee850fa510a6 sed -i 's/tsif2/tsif1/g' drivers/pinctrl/qcom/pinctrl-msm8998.c
 drivers/pinctrl/qcom/pinctrl-msm8998.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)
c7ffe4075623 sed -i 's/tsif1/tsif0/g' drivers/pinctrl/qcom/pinctrl-msm8998.c
 drivers/pinctrl/qcom/pinctrl-msm8998.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

I'm wondering if the series needs to be split up (as it is) or squashed
into a single patch (might be harder to review for mistakes).

What do you think?

Regards.
