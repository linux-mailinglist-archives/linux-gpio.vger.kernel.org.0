Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BD93934D7
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 19:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbhE0Rb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 13:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbhE0Rb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 13:31:58 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC8BC061760
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 10:30:25 -0700 (PDT)
Received: from [192.168.1.49] (bband-dyn9.178-41-130.t-com.sk [178.41.130.9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C9C0E1F969;
        Thu, 27 May 2021 19:30:22 +0200 (CEST)
Date:   Thu, 27 May 2021 19:30:16 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: qcom: sm6125: Document
 SM6125 pinctrl driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>
Message-Id: <GM0STQ.7UKZA16NEMPI1@somainline.org>
In-Reply-To: <CACRpkdbPvxN2-VTm+n-j6JiWZnraCviZ2JDFe=A7Z=z93-seVQ@mail.gmail.com>
References: <20210524193012.592210-1-martin.botka@somainline.org>
        <CACRpkdbPvxN2-VTm+n-j6JiWZnraCviZ2JDFe=A7Z=z93-seVQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I did run the checks but i have forgoten to do a make clean before 
hand. Thats probably why i didnt get that before.
Will send V4 as soon as i can :)

Best regards,
Martin Botka

On Thu, May 27 2021 at 05:05:32 PM +0200, Linus Walleij 
<linus.walleij@linaro.org> wrote:
> Hi Martin,
> 
> overall this looks good but the bot warned because of this:
> 
> On Mon, May 24, 2021 at 9:30 PM Martin Botka
> <martin.botka@somainline.org> wrote:
>> 
>>  Document the newly added SM6125 pinctrl driver
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
> (...)
>>  +properties:
>>  +  compatible:
>>  +    const: qcom,sm6125-tlmm
> (...)
>>  +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  +        pinctrl@500000 {
>>  +                compatible = "qcom,sm6125-pinctrl";
> 
> So it seems like you didn't run the checks?
> 
> Yours,
> Linus Walleij


