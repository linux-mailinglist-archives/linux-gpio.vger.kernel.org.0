Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B292C9EAF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 11:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgLAKEm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 05:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLAKEl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 05:04:41 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACCAC0617A6
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 02:03:55 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e7so1713890wrv.6
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 02:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SZblI69noqCIxbxUnirHkw2+VUSbNBwoSxJOwnbJg6k=;
        b=e7/v6+d484mwVp6LE6Gy5b3szpQToRlhfo6Ls5Upj5t1DHTtyx8wLxFzJ/cxS1rGo3
         UP+Bk1ImIIRpO7Fw8te4Bj6bR/lJFsYW+h7+2EB4BXuO/Qskaq3JZFVnd0u78pCCGEcS
         DvB7R9KSICxd8BPQDhU8/awQVSe7w/FmxwcbzjK2Su4hcvF2cC9kbd7RBE1Q5GNbsyzD
         zJYIkYH8lERdAwfnsWPjKGO1NAUtQBa2EhuoI3Fh7wyLtVvjyqvQo1XTPp/60WoqFUn1
         tQqrY5bds4lCYEyqDqGuKP/32PyiJZ2NkFjpq2wVSdIoGQ3DPway9fzjGe+f/k1NLORK
         HKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SZblI69noqCIxbxUnirHkw2+VUSbNBwoSxJOwnbJg6k=;
        b=mLTMKao0+gegi0Y8u9bJ272ZI0ttl9JfHJkVfK/tNUe7NYvLdp9IuyHnIiuYwPpCpd
         E5ioTUaFPTWH2X3+YWnb2Uf9rl4Vgax2Rf8sJcfRQRGhUyGUExxhyjJBCowy+j8cIHVa
         2mSJrbppG3nvXS0VZF3kQM5ecOmFwgYX1KlPVQhTjg+Q9Hln6L5GiqJnFb4+zeGlQnQx
         jf7as2+M7uGuloJN7HKmnESKBGql4//qmSDbaGuM8Qo1KOselw3Zc/um6wbHrprHXsEb
         tFvwIQIBwZwz88evBSqYPcRmO+d15yB1Jgpk9AIu05DbyWjPCunvLPDkDa30+HdGNcZO
         +vcA==
X-Gm-Message-State: AOAM530EWms7R4b1HEwoYGIKxvZcGEFcygYNLZH40iB1iTlH4J9ogCsW
        7+iX5B4IrD03AkdVie8+1cEGOA==
X-Google-Smtp-Source: ABdhPJx6qbSJTb/eqIvCBhGL1M4EOUWs6PmV2s+4lMnl09dGnBpNV4YrmfnC3wK0UEVe4l95dDyTSw==
X-Received: by 2002:adf:f542:: with SMTP id j2mr2823739wrp.32.1606817034117;
        Tue, 01 Dec 2020 02:03:54 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id f17sm1937825wmh.10.2020.12.01.02.03.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:03:53 -0800 (PST)
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi
 pinctrl bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
 <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
 <X8WUi++JFLVvbXqj@builder.lan>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <07c87714-ccd1-fa87-d55c-a9827e71a77a@linaro.org>
Date:   Tue, 1 Dec 2020 10:03:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8WUi++JFLVvbXqj@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 01/12/2020 00:55, Bjorn Andersson wrote:
>> +        reg = <0x33c0000 0x20000>,
>> +              <0x355a000 0x1000>;
> We shouldn't reference parts of blocks, so this should be 16KB at

yes, makes sense! Will change the example accordingly!

> 0x35500000 and if we have multiple drivers that needs to poke in that
> region we'd need to abstract that somehow (e.g. though a syscon).Yes!
> 
> Regards,
> Bjorn
> 
