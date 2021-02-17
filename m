Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D9631D50E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 06:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhBQFet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 00:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhBQFeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 00:34:07 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F8AC061574;
        Tue, 16 Feb 2021 21:33:26 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id r77so11737145qka.12;
        Tue, 16 Feb 2021 21:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G7oEC+eTJ+ELbOjqhGFXJgcF60fpnjm1ejAxDJwpCHM=;
        b=WlMKZ5hlrfOmRvznzBxnUU/mks2XIk1591CeNiGAyG5zeL4WBNFsz38hwwMfPeMXPY
         5JRNxB0k/Ox1Zso50f3VM9y+vARWP5F4fOTPwrlwt2BWJbu0+g4exxzS35XBvdCOxLu0
         b2H9Djtf6SVxN25cyTlbxSwYSHZnEh7Lz/jbKp+OaJMdj3R9x2pDzgBzv5xHN/sERL6R
         mxZl8PlZMqTg6rWiJIEMp3aTwkfZfweUU7BP3DPUryupczW8vt/FjJRwTj6bkYfz8zoq
         84p6jtMxlaO5WzIvanBIE+JBp2EXZ0lQzie44wsVXHGOd1SXzIjG0E2m0Ek0lp+TQooo
         ES2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G7oEC+eTJ+ELbOjqhGFXJgcF60fpnjm1ejAxDJwpCHM=;
        b=eiPT8Imn6QCnf5O05yJu5OdJYKrOwSfQd1n1qV4Xed8d8kQXYZk8NTBjw+erFLj+MS
         EyyxMiNYbgS5nqSfqp5TPo159rS6uUwW9DQK3+48pq7QfaQDefo6nnR6kk/ENIfR8nZj
         w0SlUtsaOlblEbOgog7tk30bZWY8KTNMp4si4euvwLJHJ+m+tDjfw+p35BZ1OvZOesdT
         TEjCs3NasdrbYmJQ3vd7ygQrkTjgrrQu+8dK/KyZ8inpPQFFRv6T4VDSAIDuIWmpdnl3
         W33qpKLK1fH79MkB6SCvNMKa9RFi0Cb+hA6iBfxP1Kydz2ub07bqepCwVcGF0WAMYRoC
         urjA==
X-Gm-Message-State: AOAM533YS4zbpSQOaLAh12mSmTB1EN5eBise9kZlLREEB4Pou7YuXkm7
        xEgU7XTi4G1ugWMe0qpzybs=
X-Google-Smtp-Source: ABdhPJxydVvaF0xz2a74Yr+1br9CohCN1SxZFBEJ6l+F7HF64UE3c6NLI+FJbN1HKUCcJEncTGjlPg==
X-Received: by 2002:ae9:f309:: with SMTP id p9mr19189000qkg.111.1613540005565;
        Tue, 16 Feb 2021 21:33:25 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id s14sm535960qtq.97.2021.02.16.21.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 21:33:25 -0800 (PST)
Subject: Re: DT overlay applied via pinctrl description
To:     Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <929190e9-1195-4381-ae18-b71d17444569@gmail.com>
Date:   Tue, 16 Feb 2021 23:33:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Frank, Rob, devicetree list

On 2/16/21 9:35 AM, Michal Simek wrote:
> Hi,
> 
> I have a question about expectations when pinctrl setting is applied. In
> DTS all nodes are described in the order available in DT.
> 
> uart-default {
> 	mux {
> 		...
> 	};
> 
> 	conf {
> 		...
> 	};
> };
> 
> I don't know if this standard description or not. I definitely see other
> pinctrl drivers which are using different structure.
> 
> Anyway when overlay is applied the order has changed to
> uart-default {
> 	conf {
> 		...
> 	};
> 
> 	mux {
> 		...
> 	};
> };
> 
> which is causing issue because pin is configured first via conf node
> before it is requested via mux. This is something what firmware is
> checking and error out.
> 
> That's why I want to check with you if this is issue with DT binding
> description we use in zynqmp pinctrl driver posted here
> https://lore.kernel.org/linux-arm-kernel/1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com/
> 
> I have also tried to use init and default configuration where init is
> called just with mux setting and then default is called just with config
> but the issue is there as well because in pinctrl_commit_state()
> previous state is checked and for MUXes pinmux_disable_setting() is
> called which release a pin. And then configuration in default is called
> but without requesting pin which fails for the same reason as above.
> 
> That's why my questions are:
> Are we using incorrect DT description?
> And is there a need sort subnodes in a way that mux should be called
> first by core before configuration?
> Or is there any different way how to do it?

Node ordering and property ordering within a node are not defined
in the Linux kernel.  If a subsystem or property is depending upon
a certain order, they must implement a method other than the
order as accessed by of_* functions.  And as you noted, use of an
overlay may also change ordering.

-Frank

> 
> Thanks,
> Michal
> 

