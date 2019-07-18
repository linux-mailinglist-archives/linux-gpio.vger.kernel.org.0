Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA80C6D20D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 18:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfGRQe1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 12:34:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37538 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRQe1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 12:34:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id z28so28057139ljn.4;
        Thu, 18 Jul 2019 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7sdnxABL2xPJ1BT3vVLYE3iU7uI16k3jZkqBzR97jTQ=;
        b=cen6g959dfojbGiV/QspDJOO6Gs7RLZFB+4O3ZKZEdQQqAOeYkmFUms3pB/eMgE5o8
         qBOvVSO5ot+qs3SQ4XU1ekimkokBiBMf2LRs2vKz4vYLN4L2iPiU+1ExPZCrYUdW57jF
         WBlp+XHehQx2GiI0KARR32em40ZrvUYkdolVRrUZRNKozjsAXmKRiDkAML0Rc+RVOSVm
         1yN/Q2wA4jG6U2j9YaOixzl7VZ48RP4+BRUfLlNMkqrbO5qnb1/MPtnkDVw8dedZcvwU
         x2Yowz9A5zSBEWyqoZuomdLFIh9P6PnfMRZyQNkiEmBW7bNqapLg0qooXhE8hZijYcLr
         nPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7sdnxABL2xPJ1BT3vVLYE3iU7uI16k3jZkqBzR97jTQ=;
        b=HbbxWgTMagJjmZ0XeMOk4997EyAo3wSPi/HAXNd2HwKhM53Y9ISAjGln3a6dq78Y6k
         JGbSFfAmTaelCq4cj+e8Z9fpA/xjlry9948s4YOVcsjOC0DLznVnJDeRj3GYniZBXnMp
         ivIgtLbhW/OX/OmwPVZcUuICJvOjPLrTeY9pdcdk2NgWgBAxJIIFEXGFYOuUfvCDMVwl
         Sfct2A4UVerLV1l1cFYP4a5+M+LENRwcdyOHpOhphnjr/Uqwj+k+f8/GimhoLjqUg7r+
         n2BG23Ho3YRr/ZSCsTQcvvuEdl0g/NV40o+g/ShpT+Aqvw9/fhrkEJ0lrYP0Bml8eTuK
         i7zg==
X-Gm-Message-State: APjAAAWPiN40nza+R0kFn0WEZBDe6b3DQ9MuanG46EgI3xGBXB8NWctq
        VezaQxwAdxO+B45AZm9/o8lnH3y7
X-Google-Smtp-Source: APXvYqx6/gY1TDM+kcuOEoQiqDcS4zflCNHE6TZ0pNO9Z6U02VdPHipI+OLScjYKudQpiC2NXBek0w==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr24928245lji.223.1563467664208;
        Thu, 18 Jul 2019 09:34:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id r68sm4070738lff.52.2019.07.18.09.34.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 09:34:23 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Sowjanya Komatineni <skomatineni@nvidia.com>, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pgaikwad@nvidia.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <093462f3-8c6d-d084-9822-ae4eff041c64@nvidia.com>
 <20190717093317.70fefb27@dimatab>
 <6e73dcee-6e24-b646-97a4-4b34aedd231d@nvidia.com>
 <16f8b146-2581-a842-4997-53ab05b62c70@gmail.com>
 <d7892bfc-2cbf-27af-518d-dc7e243815b8@nvidia.com>
 <71272e9a-0f2a-c20d-6532-7e9057ad985c@gmail.com>
 <78fd19b9-b652-8ac3-1f57-3b4adadee03f@nvidia.com>
 <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
 <c759d71b-1549-2562-f0cf-db5f9e51329e@nvidia.com>
 <ef7928ad-239d-eca8-41bf-f76e72a9841d@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4141181d-7162-0321-71b6-33abf11f631c@gmail.com>
Date:   Thu, 18 Jul 2019 19:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ef7928ad-239d-eca8-41bf-f76e72a9841d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

18.07.2019 4:15, Sowjanya Komatineni пишет:

[snip]

>>> Please try to fix all missing dependencies and orderings.
>>
>> Peter,
>>
>> dfllCPU_OUT is the first one to go thru restore when
>> clk_restore_context traverses thru the list.
>>
>> dfllCPU_OUT has dependency on DFLL_ref and DFLL_SOC but this
>> dependency is unknown to clock-tree.
>>
>> We can add DFLL_REF and DFLL_SOC as parents to dfllCPU_OUT during
>> register so dfllCPU_OUT save/restore happens after their parents are
>> restored.
>>
>> But DFLL needs both of these to be restored before DFLLCPU_Out and as
>> DFLL_SOC restore always happens after the REF, thinking to add
>> DFLL_SOC as parent to dfllCPU_OUT so save/restore follows after their
>> dependencies.
>>
>> Please comment.
>>
> Did quick try and I see by adding dfll-soc as parent to dfllCPU_OUT, its
> in proper order after all its dependencies.
> 
> Can now add dfll save/restore to do dfll reinit during restore..
> 

If dfllCPU_OUT can work properly with dfll-soc being disabled, then this
kind of dependency isn't very correct and just papers over the real
problem, which is that there should be a way for CCF to specify multiple
dependencies for the clock or the reverse ordering should be used for
the restoring.
