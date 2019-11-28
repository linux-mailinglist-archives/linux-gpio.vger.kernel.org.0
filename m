Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA28910C5F1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 10:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfK1JZn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 04:25:43 -0500
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:33234 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbfK1JZn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Nov 2019 04:25:43 -0500
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAS9OSpk003872
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 09:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=from : subject :
 to : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=9Y8T+PxqBgx0Mz5bt6qbT1VsKtSFDi93D/cNQxBH+SY=;
 b=CHZsdVkANygtkV1/H60h+7HHDOvr2yFqMMhcHufTla5Iy+SkoUMFiHIhperXNgJP3FX/
 a32TpX12tRzBViq7JrDGB4UU6uObFp5LhinC7RjSmvlIPSlXiVN+yrK8sCKFlVrU3Rcj
 QorVCbMHOxwpkDOmLjgsEdxWRcYodU8UD3Jd9/kSHvWzEhO3LZg++ZzYNRtuYAoq+7W9
 475nnRGTbpPcbiCU0JIDKB3fFQHOIsyypNzyUSC74PemZQVjeK2asNGl5CvSN5N0gX6D
 tJntrm2b2a0SirS/or8uk4XC+HZwURssTvlWuk792fWvpVGoN9z94VoDGyvSLtuCh+NO kw== 
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        by mx07-00252a01.pphosted.com with ESMTP id 2whd1tguc2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 09:25:41 +0000
Received: by mail-wr1-f71.google.com with SMTP id h7so13608634wrb.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 01:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9Y8T+PxqBgx0Mz5bt6qbT1VsKtSFDi93D/cNQxBH+SY=;
        b=DkrO/f4h6Cks/3NC1PHASb9cE2yKXtxUJNrTuFba+CiQzI3NFlEtCevpy9TbD8HT65
         Nrc+lHPF784fWLmUtG4IvP3yIaQKrwnrbo2kipRBv+uoLjjZBb0qmBoIhoaC1p5F01JQ
         Wly5jOEkf0EZNrz6uaNt9sBnaUEFSLJuhm6t8w2gmmWVomS5AQKruuxYYKcH+ElP3Vv9
         KSNp9qUA9otuLia7RDq8BrHZCXt33vgQBEtF7jImUZbboAjCWc53wT83oM8P9XFBictU
         X3PQvUnQTpqG4fMpyNuFsww0YOkk+5LlQS1gfM8KhMrhKbD9g+CA3lke+ZW6juj0n9LA
         rrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9Y8T+PxqBgx0Mz5bt6qbT1VsKtSFDi93D/cNQxBH+SY=;
        b=RxVCQvYj0oaJzpeNsSBAKOFQIkXAw6s8LfDALlpoi54kiWCQteKPqgoQYgzqjW/xHL
         C2PGA1tGV3v4UaMxiHJqIRXvAxyrH2vs3t4Jb+ZNvg4LzbHYhR12kg2yhylS4/jghJNS
         VvrV7yj8EPVgLYJniRD2dSVGW8ZJiBq+RZMNQB7AFiHEOliNd9W/n9J/DZC8mAIDoGoh
         NqwqdsfaaXJdHzFyf4k+RdhgKkptA9ltJib0+k9BfuH5EBbjrMR2tCeiuF/tWm14pMHR
         waYJRQzNU8OguESescg1kfz9QMoOHQLgyAkYa3i1If4lgFpyuYJXp2RICXi5WleGvQS6
         q+9Q==
X-Gm-Message-State: APjAAAUNqyS8SbXqQyHBnYrriQW6WaBFo/qpr2tWPsEbW6vV/MoukFOa
        aWYmDpYylNlJk2+TzCLi8IcqLRy3fXLMCMNlEZz3VbDOZLWYEFEQWX1gZpyIqOirq0Ts/3z1N4F
        g3JgZBXoWqcFBYdYklPEYow==
X-Received: by 2002:a1c:9c47:: with SMTP id f68mr7911014wme.147.1574933140260;
        Thu, 28 Nov 2019 01:25:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtlZ7ncrqF9OEZkKdLxGSTWBAJGSZDBqKT7yoqyoy7NWLOtc+/d4pjfDv6wCYyAy5sNkw18A==
X-Received: by 2002:a1c:9c47:: with SMTP id f68mr7910985wme.147.1574933139865;
        Thu, 28 Nov 2019 01:25:39 -0800 (PST)
Received: from ?IPv6:2a00:1098:3142:14:a0dd:3eea:2b80:debb? ([2a00:1098:3142:14:a0dd:3eea:2b80:debb])
        by smtp.gmail.com with ESMTPSA id k127sm3669434wmk.31.2019.11.28.01.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2019 01:25:38 -0800 (PST)
From:   Phil Elwell <phil@raspberrypi.org>
Subject: Re: Multiple SPI MCP23S17s sharing a CS line
To:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Reid <preid@electromag.com.au>,
        Jason Kridner <jkridner@gmail.com>,
        =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
 <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com>
Message-ID: <77b3a320-20a3-5993-b7cb-e3d6f171cd56@raspberrypi.org>
Date:   Thu, 28 Nov 2019 09:25:39 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_01:2019-11-28,2019-11-28 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Thank you for such a speedy reply.

On 27/11/2019 12:36, Linus Walleij wrote:
> Hi Phil,
> 
> I think the people I added to the To: line are better suited to answer
> this question, they have used the MCP23* chips in practice more
> than me and know how they work.
> 
> Some minor comments inline.
> 
> On Wed, Nov 27, 2019 at 12:20 PM Phil Elwell <phil@raspberrypi.org> wrote:
> 
>> We have a user asking for help to construct a Device Tree overlay to use
>> the GPIOs exported by multiple MCP23S17s sharing an SPI Chip Select
>> line. This is a special feature of the MCP devices whereby the SPI bus
>> is treated rather like an I2C bus with each device assigned a unique
>> address. His problem is in constructing gpiospecs to refer to all of the
>> GPIOs.
>>
>> The mcp23s08 driver claims to support this feature, and there is a DT
>> property ("microchip,spi-present-mask") to declare which addresses are
>> used buy the devices.
> 
> It's an interesting hack and I kind of see why they are doing it.
> 
>>   I've spent an hour or so looking at the driver
>> code and crawling through the kernel GPIO infrastructure, and I don't
>> think it's possible. Here's my logic:
>>
>> 1. Although all devices that are found are presented as a single SPI
>> device, they are each registered as independent gpio_chips.
> 
> So they are presented as a single SPI device, but they are
> different physical packages (right?) so it is actually correct to
> have several gpio_chips but incorrect that they are all
> represented in a single device tree node.
> 
> Interestingly there is not a single device tree in the entire
> kernel that uses the "*,spi-present-mask" attribute.
> 
> Could you provide an example?

I've asked the user if I may see his overlay, but they've not responded 
yet and I don't think you'll learn very much from it.

> I *THINK* the idea behind this attribute is just plain wrong
> and cannot be made to work.
> 
> Instead the device should be represented as one SPI node
> with subnodes for each separate physical device when this
> attribute would be used.
> 
> mcp {
>      compatible = "microchip,mcp23s08";
>      microchip,spi-present-mask = <0x03>;
>      mcp0: chip0 {
>          reg = <0>;
>        ....
>      }
>      mcp1: chip1 {
>          reg = <1>;
>        ....
>      }
> };
> 
> By introducing such child nodes it gets possible to reference
> these chips by phandle <&mcp1 ...>;
> 
> Notice use of reg attribute to address subchip.

I've not spent enough time in this area to know all of the rules and 
conventions, but it strikes me that if you treat the parent as a kind of 
bus and the "reg" properties as being the addresses (rather than 
indexes) then you no longer need the present mask.

Phil

> IIUC this needs to be figured out and both the DT bindings
> and the driver need to be fixed to support this peculiar addressing
> scheme.
> 
> Yours,
> Linus Walleij
> 
