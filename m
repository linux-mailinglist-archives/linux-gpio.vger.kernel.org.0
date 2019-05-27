Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D3F2B8D5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 18:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfE0QRg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 12:17:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10662 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726207AbfE0QRg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 May 2019 12:17:36 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4RGGj9F003553;
        Mon, 27 May 2019 18:17:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=8ub46LPrPqf6PivEatMxnOo+wOKNgOZwMhOATPEAYDc=;
 b=syGD5pLwRFIXk0Tl+AIThayna8PwIFezSNCwIIZOt0mX9lodsFkGdt+orN5H+UZVnOSk
 qe/pkZrdWPB0m3JmrfOZ0cZ4/WmXpU29D0Xx3AVIy3ECUCR6CB1dXazEh7rq269VvKTQ
 PggH4NMGxYxUfGN3IwLSatIuGh1y3Gc8hb9ZgpwjaKmziaFV+q0KlsSD2KypkeodSsh5
 S6qqftIpJfpzRd2APAvp7H+/QmP+B6l0AfMacZkanppKGnmrReV9ihQSvjFySiBcZ9zj
 JtzbcdbzljWxPw3nhEFVBmfp45rzjj+1+lwEnCnOPvdBbQgqpoNt4WYrwPF+U5Aqzxj4 /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sptu9m574-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 27 May 2019 18:17:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF83534;
        Mon, 27 May 2019 16:17:21 +0000 (GMT)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E8334F30;
        Mon, 27 May 2019 16:17:21 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.50) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 May
 2019 18:17:20 +0200
Subject: Re: [PATCH 0/2] pinctrl: stm32: add suspend/resume management
To:     Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <7c83e2e1-d5bc-0190-4795-a324a000a5c3@st.com>
Date:   Mon, 27 May 2019 18:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-27_08:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus

On 5/24/19 1:24 PM, Linus Walleij wrote:
> On Fri, May 10, 2019 at 9:42 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> During power sequence, GPIO hardware registers could be lost if the power
>> supply is switched off. Each device using pinctrl API is in charge of
>> managing pins during suspend/resume sequences. But for pins used as gpio or
>> irq stm32 pinctrl driver has to save the hardware configuration.
>> Each register will be saved at runtime and restored during resume sequence.
> 
> Both patches applied.
> 
> On the same pinctrl devel branch is also Benjamin's patches to support
> the "link_consumers" property on the pin controller descriptor to
> enable links from pin control consumers back to their pin controller
> suppliers, especially important for STMFX.
> 
> Would you please check if it work fine if you turn on this feature
> for the SoC STM32 pin controller?

I just tested with Benjamin's patches and set "link_consumers" property 
for STM32 pinctrl. No changes on boot (except extra logs for each probe) 
and no changes on power tests too.

regards
alex

> 
> I am working a bit on refining the patches, so I want to enable testing
> with some SoC pin controllers as well and possibly make the
> behavior default.
> 
> Yours,
> Linus Walleij
> 
